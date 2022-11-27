package com.demo.minhun.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.demo.minhun.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

	@Autowired
	CoinDAO coinDAO;

	signupDTO user;
	
	
	@GetMapping("/userInformation4")
	public String userInformation4() {
		return "userInformation4";
	}
	
	
	public static List<signupDTO> userList=new ArrayList<signupDTO>(); 
	
	@GetMapping("userInformation3")
	public String userInformation3() {
	    return "userInformation3";
	 }
	
	
	 
	 @RequestMapping(value = "/userReport", method = RequestMethod.GET)
    public String userReport() {
    
    return "userReport";
	 }

	 
	
	 
	 @RequestMapping(value = "/userReportaction", method = RequestMethod.POST)
	 @ResponseBody
	    public String userReportaction(@RequestParam("user_reportcheck") String user_reportcheck,
	          @RequestParam("signup_num") int signup_num) {
	      
	      System.out.println("userReportDTO : "+user_reportcheck);
	      System.out.println("userReportDTO : "+signup_num);
	      
	      sigupDAO.userReportDTO(user_reportcheck,signup_num);
	      
	   
	      return "<script>alert('�Ű� �Ǿ����ϴ�');window.close();</script>";
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
		        } 
			 
			 
			 	String memberImg = fileUtil.updateImg(mpRequest); 
			 	user = (signupDTO) session.getAttribute("profile");
				
			 	
			 	System.out.println("memberImg : " + memberImg);
			 	
			 	
			 	sigupDAO.imgload(memberImg, signup_id);
			 	user.setSignup_profle_img(memberImg);
			 	
			 	
			 	
			 		if(user.getSignup_profle_img().contains(".")) {
				 		
				 		session.setAttribute("profile", user);
				 		
				 		IBoardDAO.board_profle_update(memberImg, signup_id);
				 		IReplyDAO.reply_profle_update(memberImg, signup_id);
				 		
				 		System.out.println("memberImg : " + memberImg);
				 		System.out.println("signup_id : " + signup_id);
				 		
				 		return "<script>alert('수정완료!');window.close();</script>";
				 		
				 	}
				} catch (Exception e) {
					e.printStackTrace();
				}
			 return "<script>alert('파일이 비어있거나 세션이 만료되었습니다!'); location.href='/board'; </script>";
		 }
		
		
	
		
		@RequestMapping("/MyPage_UpDate")
	  	@ResponseBody
	     public String MyPage_UpDate (
	    		 @RequestParam("signup_pw") String input_pw,
	             @RequestParam("input_nickname") String input_nickname,
	             @RequestParam("input_email") String input_email,
	             @RequestParam("input_adr") String input_adr,
	             @RequestParam("input_adr_point") String input_adr_point,
	             @RequestParam("signup_id") String signup_id,
	             HttpSession session
	             ) throws Exception {
	        
	  		
			System.out.println(input_pw);
			System.out.println(input_nickname);
			System.out.println(input_email);
			System.out.println(input_adr);
			System.out.println(input_adr_point);
			System.out.println(signup_id);
			
	  		sigupDAO.MyPage_UpDate(input_pw, input_nickname, input_email, input_adr, input_adr_point, signup_id);
	  		
	  		session.setAttribute("profile", user);
	  	
	  		return "<script> alert('수정완료! 다시 로그인 해주세요!');window.close();</script>";
	    }
	 
		
		
		@RequestMapping("/contact2")
		public String contact2() {
			return "contact2";
		}
		
		
		
		
		@GetMapping("/userInformation2")
		public String userInformation2(@RequestParam("signup_id") String signup_id, Model model) {

			String curCoin = String.valueOf((coinDAO.getMyCurrentCoinById(signup_id)/100));
			model.addAttribute("curCoin",curCoin);

		 return "userInformation2";
		}

		

}
