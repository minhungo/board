package com.demo.minhun;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.demo.minhun.dao.IBoardDAO;
import com.demo.minhun.dao.IReplyDAO;
import com.demo.minhun.dto.BoardDTO;
import com.demo.minhun.dto.PageMaker;
import com.demo.minhun.dto.ReplyDTO;
import com.demo.minhun.dto.SearchCriteria;
import com.demo.minhun.dto.signupDTO;


//일반 회원이 쓰는 게시판 페이지 컨트롤러


@Controller
public class boardController {

	@Autowired 
	IBoardDAO IBoardDAO;
	
	
	signupDTO user;
	
	@Autowired
	IReplyDAO IReplyDAO;
	
	
	


	
	
	//유저 리스트
	public static List<signupDTO> userList=new ArrayList<signupDTO>(); 
	
	
	//메인 컨트롤러 
	@RequestMapping("/")
	   public String main(Model model,
	            @RequestParam(value = "page", defaultValue = "1") String page ,@RequestParam(value = "bgno" ,defaultValue = "1")int bgno  ) throws Exception {
		
		  //메인에 있는 카테 고리별 게시판 리스트 함수
	         List<BoardDTO> list = IBoardDAO.mini();
	         model.addAttribute("list", list);
	         
	         List<BoardDTO> list2 = IBoardDAO.mini2();
	         model.addAttribute("list2", list2);
	         
	         List<BoardDTO> list3 = IBoardDAO.mini3();
	         model.addAttribute("list3", list3);
	         
	         List<BoardDTO> list4 = IBoardDAO.mini4();
	         model.addAttribute("list4", list4);
	         
	         System.out.println("minilist 호출");
	         System.out.println("메인페이지 호출");
	         
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
		
		System.out.println("리스트 함수호출성공");
		
		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(IBoardDAO.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "board";
	}

	
	
	
	
	
	//게시판 글쓰기 폼
	@RequestMapping("/writeForm")
	public String writeForm() {	
		return "writeForm";
	}

	
	//글쓰기 누를시 글이올라가는 컨트롤러
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
			return "<script>alert('글작성 성공!'); location.href='/board';</script>";
		} else {
			return "<script> alert('글작성 실패'); location.href='/writeForm';</script>";
		}
		
	}
	
	
	
	
	
	//글 수정창 띄우는 컨트롤러 
	
	@RequestMapping("/update") // 글 수정
	public String update(
			@RequestParam("board_idx") String board_idx, 
			Model model, 
			HttpServletRequest request,
			@ModelAttribute("scri") SearchCriteria scri, 
			@RequestParam(value = "page", defaultValue = "1") String page,
			@RequestParam("board_name") String board_name,HttpSession session)
			throws Exception {
	
	
		//조회수 끌고오기
		IBoardDAO.hit(board_idx);
		//페이징처리 
		model.addAttribute("page", page);
		//IDX기준으로 게시판 끌고오기 쿼리문 함수
		BoardDTO dto = IBoardDAO.viewDTO(board_idx);
		model.addAttribute("dto", dto);
		
		//유저 체크 로그인 안하면 못씀
		signupDTO usercheck = (signupDTO)session.getAttribute("profile");
	      if(usercheck==null) {
	         return "<script>alert('로그인 후 이용하세요'); location.href='/signin'; </script>";
	      }
	      else if(usercheck.getSignup_nickname().equals(board_name)) {
	    	  return "contentForm";
	      }else {
	    	  return "<script>alert('권한이 없습니다.'); location.href='/readForm?board_idx=" + board_idx + "';</script>";
	      }
	}
	
	
	
	
	
	
	//글 수정 하는 폼
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
			return "<script>alert('로그인 후 이용하세요'); location.href='/signin';</script>";
		}

		int result = IBoardDAO.updateDTO(board_idx, board_name, board_title, board_content);

		if (result == 1) {

			return "<script>alert('수정완료!'); location.href='/board?page=" + page + "&bgnopage=" + scri.getBgnopage()
					+ "&searchType=" + scri.getsearchType() + "&keyword=" + scri.getKeyword() + "';</script>";
		} else {

			return "<script>alert('수정실패!'); location.href='/contentForm?board_idx=" + board_idx + "';</script>";
		}
	}
	
	
	
	
	
	
	
     //글 삭제 컨트롤러
	
	@RequestMapping("/deleteAction")
	@ResponseBody
	public String deleteAction(
			@RequestParam("board_idx") String board_idx,
			@RequestParam("board_name") String board_name,
								HttpSession session) {
		
		signupDTO usercheck = (signupDTO)session.getAttribute("profile");
	      if(usercheck==null) {
	         return "<script>alert('로그인 후 이용하세요'); location.href='/signin'; </script>";
	      }
	      else if(usercheck.getSignup_nickname().equals(board_name)) {
	    	   IBoardDAO.deleteDTO(board_idx);
	    	  return "<script>alert('글 삭제 성공'); location.href='/board';</script>";
	      }else {
	    	  return "<script>alert('권한이 없습니다.'); location.href='/readForm?board_idx=" + board_idx + "';</script>";
	      }
	}
	
	
	
	
	
	
	   // CKEditor 글작성,수정 관련된 api
    @RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	public void uploadimg(HttpServletRequest request,HttpServletResponse response, MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
 
        String fileName=upload.getOriginalFilename();
 
        byte[] bytes=upload.getBytes();
 
		String uploadPath = "C:\\workspace-sts-3.9.11.RELEASE\\borad55\\bin\\main\\static\\" + "ckEimg\\";	//  씠誘몄  寃쎈줈  꽕 젙( 뤃 뜑  옄 룞  깮 꽦)
        OutputStream out=new FileOutputStream(new File(uploadPath+fileName));
 
        out.write(bytes);
        
        String callback=request.getParameter("CKEditorFuncNum");
        
        PrintWriter printWriter=response.getWriter();
 
        String fileUrl= request.getContextPath()+"/ckEimg/"+fileName;

        printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"',' 이미지가 업로드 되었습니다.')"+"</script>");

        printWriter.flush();
	}
    
    
    
    
    
    
    
   	//글 보기 폼 	
   	@GetMapping("/readForm")
   	public String readForm(
   			@RequestParam("board_idx") String board_idx, 
   			Model model, 
   			HttpServletRequest request,
   			@ModelAttribute("scri") SearchCriteria scri,
   			@RequestParam(value = "page", defaultValue = "1") String page ) {

   		// 조회수 증가 , 페이징
   		IBoardDAO.hit(board_idx);
   		scri.getKeyword();
   		model.addAttribute("page", page);
   		
   		
   		BoardDTO dto = IBoardDAO.viewDTO(board_idx);
   		model.addAttribute("dto", dto);
   		
   		// 댓글 
   		List<ReplyDTO> reply_list = IReplyDAO.reply_list(board_idx);
   		model.addAttribute("reply_list", reply_list);

   		return "readForm";
   	}
   	
   	
   	
   	
   	
   	
   	//게시글 신고 화면 띄우기 컨트롤러
    @RequestMapping(value = "/report", method = RequestMethod.GET)
	   public String report(@RequestParam("board_idx") String board_idx, Model model,
	         @ModelAttribute("scri") SearchCriteria scri,
	         @RequestParam(value = "page", defaultValue = "1") int page) {

	      System.out.println("리폿 함수 호출 성공");

	      BoardDTO dto = IBoardDAO.report_view(board_idx);

	      System.out.println(board_idx);
	      scri.getKeyword();
	      model.addAttribute("page", page);
	      model.addAttribute("dto", dto);
	      System.out.println(dto);

	      return "report";
	   }
	   

    
    
    
    
   	
    //게시글 신고 액션
	   @RequestMapping(value = "/reportaction", method = RequestMethod.GET)
	   @ResponseBody
	   public String reportaction(@RequestParam("board_idx") String board_idx, Model model,
	         @RequestParam("board_reportcheck") String board_reportcheck, @ModelAttribute("scri") SearchCriteria scri,
	         @RequestParam(value = "page", defaultValue = "1") String page) {

	      scri.getKeyword();
	      model.addAttribute("page", page);

	      IBoardDAO.reportDTO(board_reportcheck, board_idx);

	      return "<script>alert('신고 되었습니다');window.close();</script>";
	      
	   }
	     

	 
	

	

	
	
}
