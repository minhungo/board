package com.demo.minhun.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.minhun.dao.IBoardDAO;
import com.demo.minhun.dao.IReplyDAO;
import com.demo.minhun.dao.LikeDAO;
import com.demo.minhun.dao.SignupDAO;
import com.demo.minhun.dto.signupDTO;


@Controller
public class logoutController {

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
	
	

	   @RequestMapping("/logout_action")
	   @ResponseBody
	   public String signout(HttpSession session) {
		   session.invalidate();
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
			         return "<script>location.href='/signin';</script>";
			      }else {
			    	 session.invalidate();
			         return "<script> location.href='/'; </script>";
			      }
		} catch (Exception e) {
			return "<script>alert('로그아웃!!'); location.href='/signin'; </script>";
		}
	
	   }// logout_action
	
}
