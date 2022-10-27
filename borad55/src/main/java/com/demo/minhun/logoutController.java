package com.demo.minhun;

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


//�α׾ƿ� ��Ʈ�ѷ�
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
	
	

	   @RequestMapping("/logout_action")// �α׾ƿ� �׼�
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
			         //return "<script>alert('�α׾ƿ�!!'); location.href='/signin'; </script>";
			         return "<script>location.href='/signin';</script>";
			      }else {
			         return "<script>alert('�α��� ���°� �ƴմϴ�.'); location.href='/signin'; </script>";
			      }
		} catch (Exception e) {
			return "<script>alert('������ ����Ǿ����ϴ�.�ٽ� �α��� �ϼ���'); location.href='/signin'; </script>";
		}
	
	   }// logout_action
	
}
