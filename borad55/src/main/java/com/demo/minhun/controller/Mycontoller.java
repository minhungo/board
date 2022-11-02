
package com.demo.minhun.controller;
/*
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.demo.minhun.config.LoginImpl;
import com.demo.minhun.dao.IBoardDAO;
import com.demo.minhun.dao.IReplyDAO;
import com.demo.minhun.dao.LikeDAO;
import com.demo.minhun.dao.SignupDAO;
import com.demo.minhun.dao.fileUtil;
import com.demo.minhun.dto.BoardDTO;
import com.demo.minhun.dto.PageMaker;
import com.demo.minhun.dto.ReplyDTO;
import com.demo.minhun.dto.SearchCriteria;
import com.demo.minhun.dto.signupDTO;



@Controller
public class Mycontoller {

	
	@Autowired
	LikeDAO LikeDAO;

	@Autowired
	SignupDAO sigupDAO;
	
	@Autowired 
	IBoardDAO IBoardDAO;
	
	@Autowired
	IReplyDAO IReplyDAO;
	
	
	signupDTO user;
	
	public static List<signupDTO> userList=new ArrayList<signupDTO>();    
	
	
	@GetMapping("/signup")
	public String t1() {
		return "signup";
	}
	
	@GetMapping("/signin")
	public String t2() {
		return "signin";
	}
	
	@RequestMapping("/contact2")
	public String contact2() {
		return "contact2";
	}
	
	@GetMapping("/userInformation2")
	public String userInformation2() {
		return "userInformation2";
	}
	

	
	@RequestMapping("/")
	   public String main(Model model,
	            @RequestParam(value = "page", defaultValue = "1") String page ,@RequestParam(value = "bgno" ,defaultValue = "1")int bgno  ) throws Exception {
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

	
	
	
	@RequestMapping("/writeForm")
	public String writeForm() {	
		return "writeForm";
	}


	
	
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

	
	//댓글 --

	@RequestMapping("/writeReplyAction") // 댓글 쓰기
	@ResponseBody
	public String writeReplyAction(
			@RequestParam("reply_content") String reply_content,
			@RequestParam("reply_name") String reply_name, 
			@RequestParam("reply_board_idx") String reply_board_index,
			@RequestParam("reply_signup_id") String reply_signup_id,
			@RequestParam("reply_profle_img") String reply_profle_img,
			HttpSession session) {

		Object usercheck = session.getAttribute("profile");
		if (usercheck == null) {
			return "<script>alert('로그인 후 이용하세요'); location.href='/signin'; </script>";
		}

		int result = IReplyDAO.reply_write(reply_name, reply_content, reply_board_index, reply_signup_id,reply_profle_img);

		if (result == 1) {
			
			IBoardDAO.board_reply_plus(reply_board_index);
			
			return "<script>location.href='/readForm?board_idx=" + reply_board_index + "'; </script>";
			
		} else {
			
			return "<script>alert('댓글 달기 실패'); location.href='/readForm?board_idx=" + reply_board_index
					+ "'; </script>";
		}
	}
	

	
	
	

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
	
	
	
	
	//댓글삭제 ----------------------
	@RequestMapping("/deleteReplyAction") // 댓글삭제
	@ResponseBody
	public String deleteReplyAction(
			@RequestParam("reply_idx") String reply_idx,
			@RequestParam("board_idx") String board_idx,
			HttpServletRequest sr,
			HttpSession session) {
		
		Object usercheck = session.getAttribute("profile");
	      if(usercheck==null) {
	         return "<script>alert('로그인 후 이용하세요'); location.href='/signin'; </script>";
	      }
		
		int result = IReplyDAO.reply_deleteDTO(reply_idx);
		
		
		if (result == 1) {
			IBoardDAO.board_reply_minus(board_idx);
			return "<script> location.href='/readForm?board_idx=" + board_idx + "'; </script>";
			
		} else {
			return "<script>alert('댓글 삭제 실패'); location.href='/readForm?board_idx=" + board_idx + "'; </script>";
		}
	}
	
	
	@GetMapping("/main")
	public String main() {
		return "main";
	}
	
	
	
	

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
	

    
	
	
    // CKEditor
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
    
    
    
    
    
    
    
    
	//불러오는 값 (게시판들)	
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

	
	

	
	
	@RequestMapping("/update") // 글 수정
	public String update(
			@RequestParam("board_idx") String board_idx, 
			Model model, 
			HttpServletRequest request,
			@ModelAttribute("scri") SearchCriteria scri, 
			@RequestParam(value = "page", defaultValue = "1") String page,
			@RequestParam("board_name") String board_name,HttpSession session)
			throws Exception {
	
	
		IBoardDAO.hit(board_idx);
		model.addAttribute("page", page);
		
		BoardDTO dto = IBoardDAO.viewDTO(board_idx);
		model.addAttribute("dto", dto);
		
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
	
	
	
	
	
	@RequestMapping("/signupAction") // 회원가입 
	@ResponseBody
	public String 
			signup(@RequestParam("input_id") String signup_id, 
			@RequestParam("input_pw") String signup_pw,
			@RequestParam("input_pw2") String signup_pw_check, 
			@RequestParam("input_name") String signup_name,
			@RequestParam("input_nickname") String signup_nickname,
			@RequestParam("input_email") String signup_email, 
			@RequestParam("input_adr") String signup_adr,
			@RequestParam("input_adr2") String signup_adr_point, 
			@RequestParam("select_data") String signup_data,
			@RequestParam("signup_profle_img") String signup_profle_img,
			HttpServletRequest request) {

		int result = sigupDAO.signup(signup_id, signup_pw, signup_pw_check, signup_name, signup_nickname, signup_email, signup_adr,
				signup_adr_point, signup_data,signup_profle_img);

		if (result == 1) {
			System.out.println("회원가입 성공!!");
			return "<script>alert('회원가입 성공!!'); location.href='/board'; </script>";

		} else {
			System.out.println("회원가입 실패!");
			return "<script>alert('회원가입 실패!'); location.href='/signup'; </script>";
		}

	}
	
	
	
	
	
	@RequestMapping("/log_action") // 로그인 액션
    @ResponseBody
    public String 
             signin(
             @RequestParam("login_id") String signup_id, 
             @RequestParam("login_pw") String signup_pw,
             HttpServletRequest request,
             HttpServletResponse response ,
             HttpSession httpSession,
             String and_sanction, 
             String str_sanctions, 
             String ture_sanction, 
             String signup_num) {
		
      response.setContentType("text/html; charset=UTF-8");
      
          HttpSession session=request.getSession();
    
          user = sigupDAO.login(signup_id, signup_pw); // 모든 데이터 값을 가져옴 user는 singupDTO 타입 
               
         LocalDate localDate = LocalDate.now();
       
        System.out.println(localDate+"현재시간");
    
       try {
          
          if ("admin".equals(user.getSignup_id())) {
             
             user.setUserLogin(true);
          
             session.setMaxInactiveInterval(6000);
             session.setAttribute("profile", user);
             return "<script>let t = confirm(\"반갑습니다 관리자님!! 관리자 페이지로 이동하시겠습니까?\");" + 
                   "   if (t) {" + 
                   "      location.href='/admin';" + 
                   "   }else{"
                   + " location.href='/';}</script>";
          } 
                    
          
           if(user != null) {
        	   
        	 
        	   for(int i=0; i<userList.size(); i++) {                      
                   if(userList.get(i).getSignup_id().equals(user.getSignup_id())) {
                       userList.remove(i);                              
                   }  
               }
        	   
        	   
              session.setAttribute("profile", user);
              
               signupDTO usercheck = (signupDTO) session.getAttribute("profile");
               

                //계정 정지 마지막날
                LocalDate and = usercheck.getAnd_sanctions();
                
                //계정 정지 당한 날
                LocalDate str = usercheck.getStr_sanctions();
    
                
                System.out.println(and+""+"정지날짜");
                

                 if (localDate.isBefore(and)) {
                    
                     
                     request.setAttribute("msg_str", str);
                     request.setAttribute("msg_and", and);
                    request.setAttribute("url", "/signin");
   
            return "<script> location.href='/alert'; </script>";
                
                } 

           //시간이 지나면 계정이 자동 정지 해제 밑 접속자가 접속할때마다 현재시간으로 디폴트 업데이트
                 
           sigupDAO.sanctionsOnlock(str_sanctions,and_sanction,ture_sanction,signup_num);
 
            user.setUserLogin(true);
            session.setAttribute("profile", user);
            session.setMaxInactiveInterval(1200);
            userList.add(user);     
            
            for(int i=0; i<userList.size();i++) {
            	signupDTO a;
                for(int j=0; j<userList.size();j++) {
                   if(userList.get(i).getSignup_point()>userList.get(j).getSignup_point()) {
                      a=userList.get(i);   
                      userList.set(i,userList.get(j));
                      userList.set(j, a);
                   }   
                }
             }
            
            
            session.setAttribute("connectUser", userList);
                
             return "<script>alert('로그인 성공'); location.href='/board'; </script>";
             
           	}
        
          
             }catch(Exception e){
                e.printStackTrace();
             }
       			return "<script>alert('로그인 실패'); location.href='/signin'; </script>";
          	 }
          // log_action    
	
	
	
	
	
	   @RequestMapping("/logout_action")// 로그아웃 액션
	   @ResponseBody
	   public String signout(HttpSession session) {
		  
			
			try {
			  if (true == user.isUserLogin()) {
			         user.setUserLogin(false);
			         
			         signupDTO usercheck = (signupDTO) session.getAttribute("profile");               
	                  for(int i=0; i<userList.size(); i++) {                      
	                          if(userList.get(i).getSignup_id().equals(usercheck.getSignup_id())) {
	                              userList.remove(i);                              
	                          }
	                      }
			         
			         session.invalidate();
			         //return "<script>alert('로그아웃!!'); location.href='/signin'; </script>";
			         return "<script>location.href='/signin';</script>";
			      }else {
			         return "<script>alert('로그인 상태가 아닙니다.'); location.href='/signin'; </script>";
			      }
		} catch (Exception e) {
			return "<script>alert('세션이 만료되었습니다.다시 로그인 하세요'); location.href='/signin'; </script>";
		}
	
	   }// logout_action
	

	
	   
	   
	//------------------------얼라창   
	   
	   			//alert
	      @RequestMapping("alert")
	      
	      public String alert (HttpSession httpSession, HttpServletRequest request) {
	         
	         HttpSession session=request.getSession();
	         session.setAttribute("profile", user);
	          
	          
	           signupDTO usercheck = (signupDTO) session.getAttribute("profile");
	         

	             //계정 정지 마지막날
	           LocalDate and = usercheck.getAnd_sanctions();
	           
	           //계정 정지 당한 날
	           LocalDate str = usercheck.getStr_sanctions();
	           
	           //정지 사유
	              String true_san =usercheck.getTrue_sanctions();
	           
	           System.out.println(and+""+"정지날짜");
	           
	         
	          request.setAttribute("msg_str", str);
	          request.setAttribute("msg_and", and);
	          request.setAttribute("msg_san",true_san);
	         request.setAttribute("url", "/signin");
	         
	         return "alert";
	      }
	   
	   
	   
	   
	   
	   
	   
	   
	   @RequestMapping("/reply_selectAction") // 댓글채택
	   @ResponseBody
	   public String reply_SelectAction(@RequestParam("reply_idx") String reply_idx,
	                            @RequestParam("board_name") String board_name,
	                            @RequestParam("board_idx") String board_idx,
	                            @RequestParam("reply_name") String reply_name,
	                            HttpSession session
	         ) {
		   
	      signupDTO usercheck = (signupDTO) session.getAttribute("profile");
	      
	      System.out.println(usercheck.getSignup_nickname());
	      
	         if(usercheck.getSignup_nickname().equals(board_name)) {
	            sigupDAO.signup_replyselect(reply_name);
	            sigupDAO.signup_ReplyPointDown(board_name);            
	         }else {
	            return "<script>alert('작성자가 아님으로 채택할수 없습니다.'); location.href='/readForm?board_idx=" + board_idx + "'; </script>";
	         }
	              
	       
	       int result = IReplyDAO.reply_selectDTO(reply_idx);
	      if(result==1) {
	         
	    	  	sigupDAO.signup_gradeUpdate(board_name);
	            sigupDAO.signup_gradeUpdate(reply_name);
	            
	         return "<script>alert('채택 완료'); location.href='/readForm?board_idx=" + board_idx + "'; </script>";
	      }
	      else {
	         System.out.println("채택 실패");
	         return "<script>alert('채택 실패'); location.href='/readForm?board_idx=" + board_idx + "'; </script>";
	      }
	            
	   }
	   
	   
	   
	   
	   
		 @RequestMapping(value = "/admin", method = RequestMethod.GET)
		   public String admin (Model model, @ModelAttribute("scri") SearchCriteria scri,
		   @RequestParam(value = "page", defaultValue = "1") String page ,@RequestParam(value = "bgno" ,defaultValue = "1")int bgno) throws Exception {
		      
		      List<BoardDTO> list = IBoardDAO.list(scri);
		      
		      model.addAttribute("list", IBoardDAO.list(scri));
		      PageMaker pageMaker = new PageMaker();
		      pageMaker.setCri(scri);
		      pageMaker.setTotalCount(IBoardDAO.listCount(scri));

		      model.addAttribute("pageMaker", pageMaker);
		      
		      return "admin";
		   }
		   
	   
		 
		 
		 
		 
         @RequestMapping(value = "/adminpro", method = RequestMethod.GET)
         public String adminpro (Model model, @ModelAttribute("scri") SearchCriteria scri,
         @RequestParam(value = "page", defaultValue = "1") String page) throws Exception {
            
            List<signupDTO> list = sigupDAO.signuplist(scri);
            
            model.addAttribute("signuplist", list);
            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(scri);
            pageMaker.setTotalCount(sigupDAO.signupCount(scri));
            model.addAttribute("pageMaker", pageMaker);
            
            return "adminpro";
         }
    
		 
		 
		 
		 
		 
	// 유저 정보 보기
	@RequestMapping(value = "/userInformation", method = RequestMethod.GET)
	public String userInformation(@RequestParam("signup_num") String signup_num, Model model,
			HttpServletRequest request, @RequestParam(value = "page", defaultValue = "1") String page,
			@ModelAttribute("scri") SearchCriteria scri) {

		scri.getKeyword();
		model.addAttribute("page", page);

		signupDTO signup = sigupDAO.signupview(signup_num);
		model.addAttribute("signup", signup);

		return "userInformation";
	}
		 
		 

	
	
	
	
	@RequestMapping("/deleteSignupaction")
	@ResponseBody
	public String deleteSignupaction(@RequestParam("signup_num") String signup_num, HttpServletRequest request,
			Model model, @ModelAttribute("scri") SearchCriteria scri,
			@RequestParam(value = "page", defaultValue = "1") String page) {

		sigupDAO.deleteSignup(signup_num);

		return "<script>alert('회원이 탈퇴 되었습니다'); location.href='/adminpro'; opener.parent.location=\"adminpro\"; window.close();</script>";
	}
		 
	
	
		 
	 
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
	     

	 
	
	
	
	   
	 //----------------------여기서 부터 어드민 계정 컨트롤
	 
	 @RequestMapping(value = "/adminreport", method = RequestMethod.GET)
     public String adminreport (Model model, @ModelAttribute("scri") SearchCriteria scri,
     @RequestParam(value = "page", defaultValue = "1") String page,@RequestParam(value = "bgno" ,defaultValue = "0")int bgno) throws Exception {
        
        List<BoardDTO> list = IBoardDAO.reportlist(scri);
        model.addAttribute("list", list);
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(scri);
        pageMaker.setTotalCount(IBoardDAO.reportCount(scri));
        model.addAttribute("pageMaker", pageMaker);
        return "adminreport";
	 }
	 
	 
	 

	 
	 
	@RequestMapping(value = "/imgloadaction", method = RequestMethod.POST)
	 @ResponseBody
	 public String imgloadaction (
			String signup_id,
			 MultipartHttpServletRequest mpRequest,
			 HttpSession session
			 
			 ) throws Exception  {
		 
		 try { 
		 
		 signupDTO originimg = sigupDAO.origin_img_return(signup_id);
		 	
		 	File delfile = new File("C:\\workspace-sts-3.9.11.RELEASE\\borad55\\src\\main\\webapp\\resources\\img" + "\\" +  originimg.getSignup_profle_img());
		 	
		 	if(delfile.exists() && !originimg.getSignup_profle_img().equals("human1.png")) {
		 		delfile.delete(); 
	            System.out.println("파일을 삭제하였습니다.");
	        } else {
	            System.out.println("파일이 존재하지 않습니다.");
	        }
		 
		 
		 	String memberImg = fileUtil.updateImg(mpRequest); 
		 	user = (signupDTO) session.getAttribute("profile");
			
		 	
		 	System.out.println("memberImg : " + memberImg);
		 	
		 	
		 	sigupDAO.imgload(memberImg, signup_id);
		 	user.setSignup_profle_img(memberImg);
		 	
		 	
		 	
		 		if(user.getSignup_profle_img().contains(".")) {
			 		
			 		session.setAttribute("profile", user);
			 		
			 		// 각 게시판, 댓글에 id 값을 비교해서 바뀐 프로필로 업로드
			 		IBoardDAO.board_profle_update(memberImg, signup_id);
			 		IReplyDAO.reply_profle_update(memberImg, signup_id);
			 		
			 		System.out.println("memberImg : " + memberImg);
			 		System.out.println("signup_id : " + signup_id);
			 		
			 		return "<script>alert('프로필 저장 성공!'); location.href='/board'; </script>";
			 		
			 	}else if(user.getSignup_profle_img()==null){	
			 		return "<script>alert('첨부파일이 비어있습니다.'); location.href='/board'; </script>";
			 	}
			 	
			} catch (Exception e) {
				e.printStackTrace();
				return "<script>alert('로그인 세션이 만료되었거나 파일이 비어있습니다.'); location.href='/board'; </script>";
			}
		 return "<script>alert('로그인 세션이 만료되었거나 파일이 비어있습니다.'); location.href='/board'; </script>";
	 }
	 
	 
	 
	 
	 
	 
	 // 신고자 명단 불러오기
	 @RequestMapping(value = "/userReportlist", method = RequestMethod.GET)
	 public String userReportlist(
			 		 Model model, 
			 		 @ModelAttribute("scri") SearchCriteria scri,
	                 @RequestParam(value = "page", defaultValue = "1") String page)throws Exception {
	      
	       	List<signupDTO> list = sigupDAO.userReportlist(scri);
	        model.addAttribute("list", list);
	        PageMaker pageMaker = new PageMaker();
	        pageMaker.setCri(scri);
	        pageMaker.setTotalCount(IBoardDAO.reportCount(scri));
	        model.addAttribute("pageMaker", pageMaker);
	     
	      return "userReportlist";
	   }
	 
	 
	 
	 
	 
	 
	 // 유저 신고 창 userReport
	 @RequestMapping(value = "/userReport", method = RequestMethod.GET)
     public String userReport() {
      System.out.println("유저신고창 호출");
     
     return "userReport";
	 }

	 
	 
	 
	 // 유저 신고 기능
	 @RequestMapping(value = "/userReportaction", method = RequestMethod.POST)
	 @ResponseBody
	    public String userReportaction(@RequestParam("user_reportcheck") String user_reportcheck,
	          @RequestParam("signup_num") int signup_num) {
	      
	      System.out.println("userReportDTO : "+user_reportcheck);
	      System.out.println("userReportDTO : "+signup_num);
	      
	      sigupDAO.userReportDTO(user_reportcheck,signup_num);
	      
	   
	      return "<script>alert('신고 되었습니다');window.close();</script>";
	   }
	   
	 
	 
	 
	 
	 
	 
	 @RequestMapping(value = "sanctions" ,method = RequestMethod.GET)
	   public String sanctions(Model model, @RequestParam("signup_num")int signup_num) {
	      //현재 시간
	      
	      Calendar cal = Calendar.getInstance();
	      cal.setTime(new Date());
	   
	   
	      Calendar cal3 = Calendar.getInstance();
	      Calendar cal7 = Calendar.getInstance();
	      Calendar cal30 = Calendar.getInstance();
	      
	      
	      cal.add(Calendar.DATE, 0);
	      cal3.add(Calendar.DATE, 3);
	      cal7.add(Calendar.DATE, 7);
	      cal30.add(Calendar.DATE, 30);
	      
	      DateFormat df0 = new SimpleDateFormat("yyyy/MM/dd");
	      DateFormat df3 = new SimpleDateFormat("yyyy/MM/dd");
	      DateFormat df7 = new SimpleDateFormat("yyyy/MM/dd");
	      DateFormat df30 = new SimpleDateFormat("yyyy/MM/dd");
	      
	      String strDate0 = df0.format(cal.getTime());
	      String strDate3 = df3.format(cal3.getTime());   
	      String strDate7 = df7.format(cal7.getTime());
	      String strDate30 = df30.format(cal30.getTime());
	   
	   
	      model.addAttribute("strDate3",strDate3);
	      model.addAttribute("strDate7",strDate7);
	      model.addAttribute("strDate30",strDate30);
	      System.err.println(strDate3);
	      System.err.println(strDate7);
	      System.err.println(strDate30);
	   
	      model.addAttribute("signup_num",signup_num);

	      return "sanctions";
	   }

	 
	 
	 // 제제되었습니다.
	  @RequestMapping(value = "sanctionsAction",method = RequestMethod.POST)
	  @ResponseBody
	   public String sanctionsAction(
			   @RequestParam("str_sanctions") String str_sanctions,
			   @RequestParam("and_sanctions")String and_sanctions,
			   @RequestParam("signup_num") String signup_num,
			   @RequestParam("true_sanctions")String true_sanctions) {
	      
	      System.out.println(signup_num);
	      System.out.println(str_sanctions);
	      System.out.println(and_sanctions);
	      System.out.println(true_sanctions);

	      sigupDAO.sanctionsDTO(str_sanctions,and_sanctions,true_sanctions,signup_num);

	      return "<script>alert('제재 되었습니다');window.close();</script>";
	   }
	 


	 
	  @RequestMapping(value = "/sanctionslist", method = RequestMethod.GET)
	     public String sanctionslist (Model model, @ModelAttribute("scri") SearchCriteria scri,
	     @RequestParam(value = "page", defaultValue = "1") String page) throws Exception {
	        
	        List<signupDTO> list = sigupDAO.sanctionslist(scri);
	        model.addAttribute("list", list);
	        PageMaker pageMaker = new PageMaker();
	        pageMaker.setCri(scri);
	        pageMaker.setTotalCount(sigupDAO.signupCount(scri));
	        model.addAttribute("pageMaker", pageMaker);
	        return "sanctionslist";
	    }
	    
	 
	 
	 
	  //-------------------뭔지몰라서남욱씨한테 물어봐야함
	  	@PostMapping("/test1")
	     @ResponseBody
	     public signupDTO test(@RequestParam String test, Model model,signupDTO sdto) {
	        
	        for(int i=0; i<userList.size();i++) {
	           if(userList.get(i).getSignup_nickname().equals(test)) {
	              sdto=userList.get(i);
	              System.out.println(user);
	           }
	        }
	        System.out.println(sdto.getSignup_grade());
	        return sdto;
	     }
	 
	 
	 
	  	
	 
	 
	  	@RequestMapping("/MyPage_UpDate")
	  	@ResponseBody
	     public String MyPage_UpDate (
	    		 @RequestParam("input_pw") String input_pw,
	             @RequestParam("input_nickname") String input_nickname,
	             @RequestParam("input_email") String input_email,
	             @RequestParam("input_adr") String input_adr,
	             @RequestParam("input_adr_point") String input_adr_point,
	             @RequestParam("signup_id") String signup_id,
	             HttpSession session
	             ) throws Exception {
	        
	  		
	  		sigupDAO.MyPage_UpDate(input_pw, input_nickname, input_email, input_adr, input_adr_point, signup_id);
	  		
	  		session.setAttribute("profile", user);
	  	
	  		return "<script>alert('정보수정완료'); window.close();</script>";
	    }
	    
	 
	  	
	  	
	  	
	  	
	  	
	  	
	  	
	  	
	 
	 
	 
	 
}
*/
