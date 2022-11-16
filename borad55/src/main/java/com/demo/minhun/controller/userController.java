package com.demo.minhun.controller;

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



//占쏙옙占쏙옙占쏙옙 占신곤옙占싹거놂옙,占쏙옙占쏙옙占싹거놂옙 占싹댐옙 占쏙옙占쏙옙 占쏙옙트占쏙옙
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
	
 
	 
	   
	 //占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
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
		            System.out.println("占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹울옙占쏙옙占싹댐옙.");
		        } else {
		            System.out.println("占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占십쏙옙占싹댐옙.");
		        }
			 
			 
			 	String memberImg = fileUtil.updateImg(mpRequest); 
			 	user = (signupDTO) session.getAttribute("profile");
				
			 	
			 	System.out.println("memberImg : " + memberImg);
			 	
			 	
			 	sigupDAO.imgload(memberImg, signup_id);
			 	user.setSignup_profle_img(memberImg);
			 	
			 	
			 	
			 		if(user.getSignup_profle_img().contains(".")) {
				 		
				 		session.setAttribute("profile", user);
				 		
				 		// 占쏙옙 占쌉쏙옙占쏙옙, 占쏙옙謗占� id 占쏙옙占쏙옙 占쏙옙占쌔쇽옙 占쌕뀐옙 占쏙옙占쏙옙占십뤄옙 占쏙옙占싸듸옙
				 		IBoardDAO.board_profle_update(memberImg, signup_id);
				 		IReplyDAO.reply_profle_update(memberImg, signup_id);
				 		
				 		System.out.println("memberImg : " + memberImg);
				 		System.out.println("signup_id : " + signup_id);
				 		
				 		return "<script>alert('占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙!'); location.href='/board'; </script>";
				 		
				 	}else if(user.getSignup_profle_img()==null){	
				 		return "<script>alert('첨占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙笭占쏙옙求占�.'); location.href='/board'; </script>";
				 	}
				 	
				} catch (Exception e) {
					e.printStackTrace();
					return "<script>alert('占싸깍옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙퓸占쏙옙킬占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙笭占쏙옙求占�.'); location.href='/board'; </script>";
				}
			 return "<script>alert('占싸깍옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙퓸占쏙옙킬占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙笭占쏙옙求占�.'); location.href='/board'; </script>";
		 }
		
		
	
		
		//占쏙옙占쏙옙 占쌘깍옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙트占싼뤄옙
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
	  	
	  		return "<script>alert('占쏙옙占쏙옙占쏙옙占쏙옙占싹뤄옙'); window.close();</script>";
	    }
	 
		//占쏙옙占쏙옙트 占쏘스  (占쏙옙占쏙옙 占쏙옙화占쏙옙호)
		@RequestMapping("/contact2")
		public String contact2() {
			return "contact2";
		}
		
		
		
		//占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙
		@GetMapping("/userInformation2")
		public String userInformation2() {
			return "userInformation2";
		}

		

}
