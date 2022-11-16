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


//占싹뱄옙 회占쏙옙占쏙옙 占쏙옙占쏙옙 占쌉쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙트占싼뤄옙


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
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙트
	public static List<signupDTO> userList=new ArrayList<signupDTO>();

//	@RequestMapping("/getToken")
//	public ModelAndView getToken() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("/Pay/getToken");
//		mv.addObject("clientId","1edae6d3-8b2c-485c-be9c-8782bb64fd74");
//		return mv;
//	}

//	@RequestMapping("/getTokenTwoLeg")
//	public ModelAndView getToken() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("/Pay/getTokenTwoLeg");
//		mv.addObject("clientId","1edae6d3-8b2c-485c-be9c-8782bb64fd74");
//		mv.addObject("clientSecret","0b3f2d48-e48e-4033-8de0-a952d3dbcdac");
//		return mv;
//	}

	// 肄붿씤 異⑹쟾 李�
	@RequestMapping("/PayCoin")
	public ModelAndView chargeCoin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/Pay/PayCoin");
		return mv;
	}

	@GetMapping("/change")
	public ModelAndView change(@RequestParam String signup_id){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/Pay/change");

		int curCoin = (coinDAO.getMyCurrentCoinById(signup_id)/100);
		mv.addObject("curCoin",curCoin);

		return mv;
	}

	@GetMapping("/refund")
	public ModelAndView refundCoin(@RequestParam String signup_id) {
		System.out.println(signup_id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/Pay/RefundCoin");
		int curCoin = (coinDAO.getMyCurrentCoinById(signup_id)/100);
		List<ChargeNRefundDTO> record = coinDAO.getMyCoinRecordById(signup_id);

		LocalDateTime now = LocalDateTime.now();

		int sevenDaysAgo = now.minusDays(7).getDayOfYear();
		for(ChargeNRefundDTO i : record){
			// �솚遺덊럹�씠吏��뿉�꽌 T�뒗 吏��슦怨� 珥�(s)源뚯�留� 蹂댁뿬二쇰룄濡� �븯湲곗쐞�븳 format
			Date date = java.sql.Timestamp.valueOf(i.getPayChargeDate());
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd a HH:mm:ss");
			i.setLocalDateTimeToDate(simpleDateFormat.format(date));

			int chargeDate = i.getPayChargeDate().getDayOfYear();
			// 異⑹쟾�씪�씠 7�씪�쟾蹂대떎 �씠�쟾�씪�씠�씪硫� �솚遺� 遺덇�
			boolean resultDate = chargeDate > sevenDaysAgo;
			// �쁽�옱 �냼吏��븳 肄붿씤蹂대떎 �솚遺덊빐�빞�븯�뒗 肄붿씤�쓽 媛��닔媛� �뜑 留롫떎硫� �솚遺� 遺덇�
			boolean resultCoinSum = Long.valueOf(curCoin) >= (i.getPayAmount()/100l);
			// 異⑹쟾 二쇰Ц�쓣 �넻�븳 吏�遺덉씤吏� �솗�씤
			boolean resultIsCharge = i.getPayImpUid().substring(0,3).equals("imp");
			if((i.getPossibleRefund() == 5l) || (i.getPossibleRefund() == 4l) || (i.getPossibleRefund() == 9l)){
				continue; // �떟蹂�,�쉶�썝媛��엯,�솚�쟾�떊泥� 嫄몃윭�궡湲�
			}
			if(!resultIsCharge) {
				i.setPossibleRefund(4l); // �솚遺덈��긽�씠 �븘�떃�땲�떎
			}
			if(!resultDate) {
				i.setPossibleRefund(3l); // �솚遺덉씠 媛��뒫�븳 湲곌컙�씠 吏��궗�뒿�땲�떎
			}
			if(!resultCoinSum) {
				i.setPossibleRefund(2l); // �솚遺덇��뒫�븳 肄붿씤�쓽 媛��닔媛� 遺�議깊빀�땲�떎
			}
			System.out.println(i.getPossibleRefund());
		}

		mv.addObject("myRecord",record);
		mv.addObject("curCoin",curCoin);
//		System.out.println(record);
//		System.out.println(curCoin);

		return mv;
	}
	
	
	//占쏙옙占쏙옙 占쏙옙트占싼뤄옙 
	@RequestMapping("/")
	   public String main(Model model,
	            @RequestParam(value = "page", defaultValue = "1") String page ,@RequestParam(value = "bgno" ,defaultValue = "1")int bgno  ) throws Exception {
		
		  //占쏙옙占싸울옙 占쌍댐옙 카占쏙옙 占쏙옙占쏙옙 占쌉쏙옙占쏙옙 占쏙옙占쏙옙트 占쌉쇽옙
	         List<BoardDTO> list = IBoardDAO.mini();
	         model.addAttribute("list", list);
	         
	         List<BoardDTO> list2 = IBoardDAO.mini2();
	         model.addAttribute("list2", list2);
	         
	         List<BoardDTO> list3 = IBoardDAO.mini3();
	         model.addAttribute("list3", list3);
	         
	         List<BoardDTO> list4 = IBoardDAO.mini4();
	         model.addAttribute("list4", list4);
	         
	         System.out.println("minilist 호占쏙옙");
	         System.out.println("占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 호占쏙옙");
	         
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
		
		System.out.println("占쏙옙占쏙옙트 占쌉쇽옙호占썩성占쏙옙");
		
		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(IBoardDAO.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "board";
	}

	
	
	
	
	
	//占쌉쏙옙占쏙옙 占쌜억옙占쏙옙 占쏙옙
	@RequestMapping("/writeForm")
	public String writeForm() {	
		return "writeForm";
	}

	
	//占쌜억옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占싱올라가댐옙 占쏙옙트占싼뤄옙
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
			return "<script>alert('占쏙옙占쌜쇽옙 占쏙옙占쏙옙!'); location.href='/board';</script>";
		} else {
			return "<script> alert('占쏙옙占쌜쇽옙 占쏙옙占쏙옙'); location.href='/writeForm';</script>";
		}
		
	}
	
	
	
	
	
	//占쏙옙 占쏙옙占쏙옙창 占쏙옙占쏙옙 占쏙옙트占싼뤄옙 
	
	@RequestMapping("/update") // 占쏙옙 占쏙옙占쏙옙
	public String update(
			@RequestParam("board_idx") String board_idx, 
			Model model, 
			HttpServletRequest request,
			@ModelAttribute("scri") SearchCriteria scri, 
			@RequestParam(value = "page", defaultValue = "1") String page,
			@RequestParam("board_name") String board_name,HttpSession session)
			throws Exception {
	
	
		//占쏙옙회占쏙옙 占쏙옙占쏙옙占쏙옙占�
		IBoardDAO.hit(board_idx);
		//占쏙옙占쏙옙징처占쏙옙 
		model.addAttribute("page", page);
		//IDX占쏙옙占쏙옙占쏙옙占쏙옙 占쌉쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쌉쇽옙
		BoardDTO dto = IBoardDAO.viewDTO(board_idx);
		model.addAttribute("dto", dto);
		
		//占쏙옙占쏙옙 체크 占싸깍옙占쏙옙 占쏙옙占싹몌옙 占쏙옙占쏙옙
		signupDTO usercheck = (signupDTO)session.getAttribute("profile");
	      if(usercheck==null) {
	         return "<script>alert('占싸깍옙占쏙옙 占쏙옙 占싱울옙占싹쇽옙占쏙옙'); location.href='/signin'; </script>";
	      }
	      else if(usercheck.getSignup_nickname().equals(board_name)) {
	    	  return "contentForm";
	      }else {
	    	  return "<script>alert('占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙.'); location.href='/readForm?board_idx=" + board_idx + "';</script>";
	      }
	}
	
	
	
	
	
	
	//占쏙옙 占쏙옙占쏙옙 占싹댐옙 占쏙옙
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
			return "<script>alert('占싸깍옙占쏙옙 占쏙옙 占싱울옙占싹쇽옙占쏙옙'); location.href='/signin';</script>";
		}

		int result = IBoardDAO.updateDTO(board_idx, board_name, board_title, board_content);

		if (result == 1) {

			return "<script>alert('占쏙옙占쏙옙占싹뤄옙!'); location.href='/board?page=" + page + "&bgnopage=" + scri.getBgnopage()
					+ "&searchType=" + scri.getsearchType() + "&keyword=" + scri.getKeyword() + "';</script>";
		} else {

			return "<script>alert('占쏙옙占쏙옙占쏙옙占쏙옙!'); location.href='/contentForm?board_idx=" + board_idx + "';</script>";
		}
	}
	
	
	
	
	
	
	
     //占쏙옙 占쏙옙占쏙옙 占쏙옙트占싼뤄옙
	
	@RequestMapping("/deleteAction")
	@ResponseBody
	public String deleteAction(
			@RequestParam("board_idx") String board_idx,
			@RequestParam("board_name") String board_name,
								HttpSession session) {
		
		signupDTO usercheck = (signupDTO)session.getAttribute("profile");
	      if(usercheck==null) {
	         return "<script>alert('占싸깍옙占쏙옙 占쏙옙 占싱울옙占싹쇽옙占쏙옙'); location.href='/signin'; </script>";
	      }
	      else if(usercheck.getSignup_nickname().equals(board_name)) {
	    	   IBoardDAO.deleteDTO(board_idx);
	    	  return "<script>alert('占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙'); location.href='/board';</script>";
	      }else {
	    	  return "<script>alert('占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙.'); location.href='/readForm?board_idx=" + board_idx + "';</script>";
	      }
	}
	
	
	
	
	   // CKEditor 占쏙옙占쌜쇽옙,占쏙옙占쏙옙 占쏙옙占시듸옙 api
    @RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	public void uploadimg(HttpServletRequest request,HttpServletResponse response, MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
 
        String fileName=upload.getOriginalFilename();
 
        byte[] bytes=upload.getBytes();
 
		String uploadPath = "C:\\workspace-sts-3.9.11.RELEASE\\borad55\\bin\\main\\static\\" + "ckEimg\\";	//  占쏙옙誘몌옙  寃쎈줈  占쏙옙 占쏙옙( 占쏙옙 占쏙옙  占쏙옙 占쏙옙  占쏙옙 占쏙옙)
        OutputStream out=new FileOutputStream(new File(uploadPath+fileName));
 
        out.write(bytes);
        
        String callback=request.getParameter("CKEditorFuncNum");
        
        PrintWriter printWriter=response.getWriter();
 
        String fileUrl= request.getContextPath()+"/ckEimg/"+fileName;

        printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"',' 占싱뱄옙占쏙옙占쏙옙 占쏙옙占싸듸옙 占실억옙占쏙옙占싹댐옙.')"+"</script>");

        printWriter.flush();
	}
    
    
    
    
    
    
    
   	//占쏙옙 占쏙옙占쏙옙 占쏙옙 
   	@GetMapping("/readForm")
   	public String readForm(
   			@RequestParam("board_idx") String board_idx, 
   			Model model, 
   			HttpServletRequest request,
   			@ModelAttribute("scri") SearchCriteria scri,
   			@RequestParam(value = "page", defaultValue = "1") String page ) {

   		// 占쏙옙회占쏙옙 占쏙옙占쏙옙 , 占쏙옙占쏙옙징
   		IBoardDAO.hit(board_idx);
   		scri.getKeyword();
   		model.addAttribute("page", page);
   		
   		
   		BoardDTO dto = IBoardDAO.viewDTO(board_idx);
   		model.addAttribute("dto", dto);
   		
   		// 占쏙옙占� 
   		List<ReplyDTO> reply_list = IReplyDAO.reply_list(board_idx);
   		model.addAttribute("reply_list", reply_list);

   		return "readForm";
   	}
   	
   	
   	
   	
   	
   	
  //게시글 신고 화면 띄우기 컨트롤러
    @RequestMapping(value = "/report", method = RequestMethod.GET)
    
	   public String report(@RequestParam("board_idx") String board_idx, Model model,@RequestParam("board_name")String board_name,
	      @ModelAttribute("scri") SearchCriteria scri,
	      
	      

	      @RequestParam(value = "page", defaultValue = "1") int page) {

	      System.out.println("리폿 함수 호출 성공");
	      
	      BoardDTO dto = IBoardDAO.report_view(board_idx);
	      
	      signupDTO dto2 = signupDAO.reportreportcheckcoundView(board_name);
	      
	      
	      System.out.println(board_idx);
	      scri.getKeyword();
	      model.addAttribute("page", page);
	      model.addAttribute("dto", dto);
	      model.addAttribute("dto2", dto2);
	      System.out.println(dto);
	      
	      System.out.println("유저찾기"+dto2);

	      return "report";
	   }

    
    
    
    
   	
    //게시글 신고 액션
	   @RequestMapping(value = "/reportaction", method = RequestMethod.GET)
	   @ResponseBody
	   public String reportaction(@RequestParam("board_idx") String board_idx, Model model,
	         @ModelAttribute("scri") SearchCriteria scri,
	         @RequestParam("user_reportcheck")String user_reportcheck,
	         @RequestParam("signup_nickname") String signup_nickname,
	         @RequestParam("board_reportcheck") String board_reportcheck,
	         @RequestParam(value = "page", defaultValue = "1") String page) {

		  System.out.println(user_reportcheck+"신고 횟수");
		  System.out.println("확인!!!!!!!!!!"+signup_nickname);
		
		  int dto = signupDAO.userReportcount(user_reportcheck , signup_nickname);
		  IBoardDAO.reportDTO(board_reportcheck, board_idx);
		  
	      scri.getKeyword();
	      model.addAttribute("page", page);
	      
	      
	

	      return "<script>alert('신고 되었습니다');window.close();</script>";
	      
	   }
	     
	     

	 
	

	

	
	
}
