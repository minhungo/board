package com.demo.minhun.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.minhun.dao.IBoardDAO;
import com.demo.minhun.dao.IReplyDAO;
import com.demo.minhun.dao.SignupDAO;
import com.demo.minhun.dto.signupDTO;

@Controller
public class replyController {
	
	@Autowired 
	IBoardDAO IBoardDAO;
	

	signupDTO user;
	
	@Autowired
	IReplyDAO IReplyDAO;

	@Autowired
	SignupDAO sigupDAO;
	
	
	//���� ����Ʈ
	public static List<signupDTO> userList=new ArrayList<signupDTO>(); 
	
	
	
	
          // ��� ���� ��
		@RequestMapping("/writeReplyAction") // ��� ����
		@ResponseBody
		public String writeReplyAction(
				@RequestParam("reply_content") String reply_content,
				@RequestParam("reply_name") String reply_name, 
				@RequestParam("reply_board_idx") String reply_board_index,
				@RequestParam("reply_signup_id") String reply_signup_id,
				@RequestParam("reply_profle_img") String reply_profle_img,
				HttpSession session) {
                
			
			//������ �α������� �ƴ��� üũ
			Object usercheck = session.getAttribute("profile");
			if (usercheck == null) {
				return "<script>alert('�α��� �� �̿��ϼ���'); location.href='/signin'; </script>";
			}

			int result = IReplyDAO.reply_write(reply_name, reply_content, reply_board_index, reply_signup_id,reply_profle_img);

			if (result == 1) {
				
				IBoardDAO.board_reply_plus(reply_board_index);
				
				return "<script>location.href='/readForm?board_idx=" + reply_board_index + "'; </script>";
				
			} else {
				
				return "<script>alert('��� �ޱ� ����'); location.href='/readForm?board_idx=" + reply_board_index
						+ "'; </script>";
			}
		}
		

		
		
		
		
		
		//��ۻ���
		@RequestMapping("/deleteReplyAction") // ��ۻ���
		@ResponseBody
		public String deleteReplyAction(
				@RequestParam("reply_idx") String reply_idx,
				@RequestParam("board_idx") String board_idx,
				HttpServletRequest sr,
				HttpSession session) {
			
			//������ �α������� �ƴ��� üũ
			Object usercheck = session.getAttribute("profile");
		      if(usercheck==null) {
		         return "<script>alert('�α��� �� �̿��ϼ���'); location.href='/signin'; </script>";
		      }
			
			int result = IReplyDAO.reply_deleteDTO(reply_idx);
			
			
			if (result == 1) {
				IBoardDAO.board_reply_minus(board_idx);
				return "<script> location.href='/readForm?board_idx=" + board_idx + "'; </script>";
				
			} else {
				return "<script>alert('��� ���� ����'); location.href='/readForm?board_idx=" + board_idx + "'; </script>";
			}
		}
		
		
		
		
		
		
		 
		   //��� ä��  
		   @RequestMapping("/reply_selectAction") 
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
		            return "<script>alert('�ۼ��ڰ� �ƴ����� ä���Ҽ� �����ϴ�.'); location.href='/readForm?board_idx=" + board_idx + "'; </script>";
		         }
		              
		       
		       int result = IReplyDAO.reply_selectDTO(reply_idx);
		      if(result==1) {
		         
		    	  	sigupDAO.signup_gradeUpdate(board_name);
		            sigupDAO.signup_gradeUpdate(reply_name);
		            
		         return "<script>alert('ä�� �Ϸ�'); location.href='/readForm?board_idx=" + board_idx + "'; </script>";
		      }
		      else {
		         System.out.println("ä�� ����");
		         return "<script>alert('ä�� ����'); location.href='/readForm?board_idx=" + board_idx + "'; </script>";
		      }
		            
		   }
		   

}
