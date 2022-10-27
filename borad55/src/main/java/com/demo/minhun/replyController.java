package com.demo.minhun;

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
	
	
	//유저 리스트
	public static List<signupDTO> userList=new ArrayList<signupDTO>(); 
	
	
	
	
          // 댓글 쓰기 폼
		@RequestMapping("/writeReplyAction") // 댓글 쓰기
		@ResponseBody
		public String writeReplyAction(
				@RequestParam("reply_content") String reply_content,
				@RequestParam("reply_name") String reply_name, 
				@RequestParam("reply_board_idx") String reply_board_index,
				@RequestParam("reply_signup_id") String reply_signup_id,
				@RequestParam("reply_profle_img") String reply_profle_img,
				HttpSession session) {
                
			
			//유저가 로그인인지 아닌지 체크
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
		

		
		
		
		
		
		//댓글삭제
		@RequestMapping("/deleteReplyAction") // 댓글삭제
		@ResponseBody
		public String deleteReplyAction(
				@RequestParam("reply_idx") String reply_idx,
				@RequestParam("board_idx") String board_idx,
				HttpServletRequest sr,
				HttpSession session) {
			
			//유저가 로그인인지 아닌지 체크
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
		
		
		
		
		
		
		 
		   //댓글 채택  
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
		   

}
