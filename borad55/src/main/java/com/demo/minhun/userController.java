package com.demo.minhun;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.demo.minhun.dao.IBoardDAO;
import com.demo.minhun.dao.IReplyDAO;
import com.demo.minhun.dao.LikeDAO;
import com.demo.minhun.dao.SignupDAO;
import com.demo.minhun.dao.fileUtil;
import com.demo.minhun.dto.signupDTO;



//유저가 신고하거나,수정하거나 하는 유저 컨트롤
@Controller
public class userController {
	
	
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
	 
	 
	 
	 
	 
	 
	   
	 //유저 프로필 변경
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
		
		
	
		
		//유저 자기정보 수정 컨트롤러
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
	 
		//컨텍트 어스  (지도 전화번호)
		@RequestMapping("/contact2")
		public String contact2() {
			return "contact2";
		}
		
		
		
		//유저 마이페이지
		@GetMapping("/userInformation2")
		public String userInformation2() {
			return "userInformation2";
		}
		

}
