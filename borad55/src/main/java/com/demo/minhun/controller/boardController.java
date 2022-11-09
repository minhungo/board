package com.demo.minhun.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.minhun.dao.CoinDAO;
import com.demo.minhun.dao.SignupDAO;
import com.demo.minhun.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.demo.minhun.dao.IBoardDAO;
import com.demo.minhun.dao.IReplyDAO;
import org.springframework.web.servlet.ModelAndView;


//�Ϲ� ȸ���� ���� �Խ��� ������ ��Ʈ�ѷ�


@Controller
public class boardController {

	@Autowired 
	IBoardDAO IBoardDAO;

	@Autowired
	SignupDAO signupDAO;
	
	signupDTO user;

	@Autowired
	CoinDAO coinDAO;
	
	@Autowired
	IReplyDAO IReplyDAO;
	
	//���� ����Ʈ
	public static List<signupDTO> userList=new ArrayList<signupDTO>();


	// 코인 충전 창
	@RequestMapping("/PayCoin")
	public ModelAndView chargeCoin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/Pay/PayCoin");
		return mv;
	}

	@GetMapping("/refund")
	public ModelAndView refundCoin(@RequestParam String signup_id) {
		System.out.println(signup_id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/Pay/RefundCoin");
		int curCoin = (coinDAO.getMyCurrentCoinById(signup_id)/100);
		List<ChargeNRefundDTO> record = coinDAO.getMyCoinRecordById(signup_id);
// db에서 아이디기준으로 충전기록 가져오는 거 확인함 사용기록도 추가 해야할지 고민해야함
//		for(RefundDTO i : record){
//			System.out.println(i);
//		}

		LocalDateTime now = LocalDateTime.now();

		int sevenDaysAgo = now.minusDays(7).getDayOfYear();
		for(ChargeNRefundDTO i : record){
			// 환불페이지에서 T는 지우고 초(s)까지만 보여주도록 하기위한 format
			Date date = java.sql.Timestamp.valueOf(i.getPayChargeDate());
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd a HH:mm:ss");
			i.setLocalDateTimeToDate(simpleDateFormat.format(date));

			int chargeDate = i.getPayChargeDate().getDayOfYear();
			// 충전일이 7일전보다 이전일이라면 환불 불가
			boolean resultDate = chargeDate > sevenDaysAgo;
			// 현재 소지한 코인보다 환불해야하는 코인의 갯수가 더 많다면 환불 불가
			boolean resultCoinSum = Long.valueOf(curCoin) >= (i.getPayAmount()/100l);
			// 충전 주문을 통한 지불인지 확인
			boolean resultIsCharge = i.getPayImpUid().substring(0,3).equals("imp");

			if(!resultIsCharge) {
				i.setPossibleRefund(4l); // 환불대상이 아닙니다
			}
			if(!resultDate) {
				i.setPossibleRefund(3l); // 환불이 가능한 기간이 지났습니다
			}
			if(!resultCoinSum) {
				i.setPossibleRefund(2l); // 환불가능한 코인의 갯수가 부족합니다
			}
			System.out.println(i.getPossibleRefund());
		}

		mv.addObject("myRecord",record);
		mv.addObject("curCoin",curCoin);
//		System.out.println(record);
//		System.out.println(curCoin);

		return mv;
	}
	
	
	//���� ��Ʈ�ѷ� 
	@RequestMapping("/")
	   public String main(Model model,
	            @RequestParam(value = "page", defaultValue = "1") String page ,@RequestParam(value = "bgno" ,defaultValue = "1")int bgno  ) throws Exception {
		
		  //���ο� �ִ� ī�� ���� �Խ��� ����Ʈ �Լ�
	         List<BoardDTO> list = IBoardDAO.mini();
	         model.addAttribute("list", list);
	         
	         List<BoardDTO> list2 = IBoardDAO.mini2();
	         model.addAttribute("list2", list2);
	         
	         List<BoardDTO> list3 = IBoardDAO.mini3();
	         model.addAttribute("list3", list3);
	         
	         List<BoardDTO> list4 = IBoardDAO.mini4();
	         model.addAttribute("list4", list4);
	         
	         System.out.println("minilist ȣ��");
	         System.out.println("���������� ȣ��");
	         
	         return "main2";
	   }
	
	
	
	
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(Model model, @ModelAttribute("scri") SearchCriteria scri,
			@RequestParam(value = "page", defaultValue = "1") 
	String page ,
	@RequestParam(value = "bgno" ,defaultValue = "1")int bgno,
	HttpSession session) throws Exception {
		
		session.setAttribute("connectUser", userList);
		
		List<BoardDTO> list = IBoardDAO.list(scri);
		
		System.out.println("����Ʈ �Լ�ȣ�⼺��");
		
		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(IBoardDAO.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "board";
	}

	
	
	
	
	
	//�Խ��� �۾��� ��
	@RequestMapping("/writeForm")
	public String writeForm() {	
		return "writeForm";
	}

	
	//�۾��� ������ ���̿ö󰡴� ��Ʈ�ѷ�
	@RequestMapping("/writeAction")
	@ResponseBody
	public String writeAction(
			@RequestParam("board_name") String board_name,
			@RequestParam("board_title") String board_title, 
			@RequestParam("board_content") String board_content,
			@RequestParam("bgno") int bgno, 
			@RequestParam("board_profle_img") String board_profle_img, 
			@RequestParam("board_writer_id") String board_writer_id, 
			HttpServletRequest request) {

		int result = IBoardDAO.write(board_name, board_title, board_content, bgno, board_profle_img,board_writer_id);

		if (result == 1) {
			return "<script>alert('���ۼ� ����!'); location.href='/board';</script>";
		} else {
			return "<script> alert('���ۼ� ����'); location.href='/writeForm';</script>";
		}
		
	}
	
	
	
	
	
	//�� ����â ���� ��Ʈ�ѷ� 
	
	@RequestMapping("/update") // �� ����
	public String update(
			@RequestParam("board_idx") String board_idx, 
			Model model, 
			HttpServletRequest request,
			@ModelAttribute("scri") SearchCriteria scri, 
			@RequestParam(value = "page", defaultValue = "1") String page,
			@RequestParam("board_name") String board_name,HttpSession session)
			throws Exception {
	
	
		//��ȸ�� �������
		IBoardDAO.hit(board_idx);
		//����¡ó�� 
		model.addAttribute("page", page);
		//IDX�������� �Խ��� ������� ������ �Լ�
		BoardDTO dto = IBoardDAO.viewDTO(board_idx);
		model.addAttribute("dto", dto);
		
		//���� üũ �α��� ���ϸ� ����
		signupDTO usercheck = (signupDTO)session.getAttribute("profile");
	      if(usercheck==null) {
	         return "<script>alert('�α��� �� �̿��ϼ���'); location.href='/signin'; </script>";
	      }
	      else if(usercheck.getSignup_nickname().equals(board_name)) {
	    	  return "contentForm";
	      }else {
	    	  return "<script>alert('������ �����ϴ�.'); location.href='/readForm?board_idx=" + board_idx + "';</script>";
	      }
	}
	
	
	
	
	
	
	//�� ���� �ϴ� ��
	@RequestMapping(value = "/updateAction",  method = RequestMethod.POST)
	@ResponseBody
	public String updateAction(
			@RequestParam("board_idx") String board_idx,
			@RequestParam("board_name") String board_name, 
			@RequestParam("board_title") String board_title,
			@RequestParam("board_content") String board_content, 
			@RequestParam("page") String page,
			@ModelAttribute("scri") SearchCriteria scri, 
			HttpServletRequest request,HttpSession session
			) {

		Object usercheck = session.getAttribute("profile");
		if (usercheck == null) {
			return "<script>alert('�α��� �� �̿��ϼ���'); location.href='/signin';</script>";
		}

		int result = IBoardDAO.updateDTO(board_idx, board_name, board_title, board_content);

		if (result == 1) {

			return "<script>alert('�����Ϸ�!'); location.href='/board?page=" + page + "&bgnopage=" + scri.getBgnopage()
					+ "&searchType=" + scri.getsearchType() + "&keyword=" + scri.getKeyword() + "';</script>";
		} else {

			return "<script>alert('��������!'); location.href='/contentForm?board_idx=" + board_idx + "';</script>";
		}
	}
	
	
	
	
	
	
	
     //�� ���� ��Ʈ�ѷ�
	
	@RequestMapping("/deleteAction")
	@ResponseBody
	public String deleteAction(
			@RequestParam("board_idx") String board_idx,
			@RequestParam("board_name") String board_name,
								HttpSession session) {
		
		signupDTO usercheck = (signupDTO)session.getAttribute("profile");
	      if(usercheck==null) {
	         return "<script>alert('�α��� �� �̿��ϼ���'); location.href='/signin'; </script>";
	      }
	      else if(usercheck.getSignup_nickname().equals(board_name)) {
	    	   IBoardDAO.deleteDTO(board_idx);
	    	  return "<script>alert('�� ���� ����'); location.href='/board';</script>";
	      }else {
	    	  return "<script>alert('������ �����ϴ�.'); location.href='/readForm?board_idx=" + board_idx + "';</script>";
	      }
	}
	
	
	
	
	
	
	   // CKEditor ���ۼ�,���� ���õ� api
    @RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	public void uploadimg(HttpServletRequest request,HttpServletResponse response, MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
 
        String fileName=upload.getOriginalFilename();
 
        byte[] bytes=upload.getBytes();
 
		String uploadPath = "C:\\workspace-sts-3.9.11.RELEASE\\borad55\\bin\\main\\static\\" + "ckEimg\\";	//  ��미�  경로  �� ��( �� ��  �� ��  �� ��)
        OutputStream out=new FileOutputStream(new File(uploadPath+fileName));
 
        out.write(bytes);
        
        String callback=request.getParameter("CKEditorFuncNum");
        
        PrintWriter printWriter=response.getWriter();
 
        String fileUrl= request.getContextPath()+"/ckEimg/"+fileName;

        printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"',' �̹����� ���ε� �Ǿ����ϴ�.')"+"</script>");

        printWriter.flush();
	}
    
    
    
    
    
    
    
   	//�� ���� �� 	
   	@GetMapping("/readForm")
   	public String readForm(
   			@RequestParam("board_idx") String board_idx, 
   			Model model, 
   			HttpServletRequest request,
   			@ModelAttribute("scri") SearchCriteria scri,
   			@RequestParam(value = "page", defaultValue = "1") String page ) {

   		// ��ȸ�� ���� , ����¡
   		IBoardDAO.hit(board_idx);
   		scri.getKeyword();
   		model.addAttribute("page", page);
   		
   		
   		BoardDTO dto = IBoardDAO.viewDTO(board_idx);
   		model.addAttribute("dto", dto);
   		
   		// ��� 
   		List<ReplyDTO> reply_list = IReplyDAO.reply_list(board_idx);
   		model.addAttribute("reply_list", reply_list);

   		return "readForm";
   	}
   	
   	
   	
   	
   	
   	
   	//�Խñ� �Ű� ȭ�� ���� ��Ʈ�ѷ�
    @RequestMapping(value = "/report", method = RequestMethod.GET)
	   public String report(@RequestParam("board_idx") String board_idx, Model model,
	         @ModelAttribute("scri") SearchCriteria scri,
	         @RequestParam(value = "page", defaultValue = "1") int page) {

	      System.out.println("���� �Լ� ȣ�� ����");

	      BoardDTO dto = IBoardDAO.report_view(board_idx);

	      System.out.println(board_idx);
	      scri.getKeyword();
	      model.addAttribute("page", page);
	      model.addAttribute("dto", dto);
	      System.out.println(dto);

	      return "report";
	   }
	   

    
    
    
    
   	
    //�Խñ� �Ű� �׼�
	   @RequestMapping(value = "/reportaction", method = RequestMethod.GET)
	   @ResponseBody
	   public String reportaction(@RequestParam("board_idx") String board_idx, Model model,
	         @RequestParam("board_reportcheck") String board_reportcheck, @ModelAttribute("scri") SearchCriteria scri,
	         @RequestParam(value = "page", defaultValue = "1") String page) {

	      scri.getKeyword();
	      model.addAttribute("page", page);

	      IBoardDAO.reportDTO(board_reportcheck, board_idx);

	      return "<script>alert('�Ű� �Ǿ����ϴ�');window.close();</script>";
	      
	   }
	     

	 
	

	

	
	
}
