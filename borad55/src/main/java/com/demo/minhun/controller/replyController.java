package com.demo.minhun.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.demo.minhun.dao.CoinDAO;
import com.demo.minhun.dto.ChargeNRefundDTO;
import com.demo.minhun.dto.ReplyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.convert.threeten.Jsr310JpaConverters;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

	@Autowired
	CoinDAO coinDAO;
	
	
	public static List<signupDTO> userList=new ArrayList<signupDTO>(); 
	
	
	
	
		@RequestMapping("/writeReplyAction") 
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
				return "<script>alert('로그인 후 이용하세요.'); location.href='/signin'; </script>";
			}

			int result = IReplyDAO.reply_write(reply_name, reply_content, reply_board_index, reply_signup_id,reply_profle_img);

			if (result == 1) {
				
				IBoardDAO.board_reply_plus(reply_board_index);
				
				return "<script>location.href='/readForm?board_idx=" + reply_board_index + "'; </script>";
				
			} else {
				
				return "<script>alert('댓글 작성 실패'); location.href='/readForm?board_idx=" + reply_board_index
						+ "'; </script>";
			}
		}
		

		
		
		
		
		
		@RequestMapping("/deleteReplyAction") 
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
				return "<script>location.href='/readForm?board_idx=" + board_idx + "'; </script>";
			}
		}
		
		
		
		
		
		
		 
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

					LocalDateTime localDateTime = LocalDateTime.now();

					ChargeNRefundDTO minusCnrDTO = coinDAO.getMyIdByNickname(board_name);
					minusCnrDTO.setSignupId(minusCnrDTO.getSignup_id());
					minusCnrDTO.setPayAmount(-500l);
					minusCnrDTO.setPayImpUid("�떟蹂�梨꾪깮�궗�슜");
					minusCnrDTO.setPayMerchantUid("merchant " + localDateTime.getNano());
					minusCnrDTO.setPossibleRefund(5l);
					System.out.println(minusCnrDTO);
					coinDAO.ChargeCoin(minusCnrDTO);


					ChargeNRefundDTO plusCnrDTO = coinDAO.getMyIdByNickname(reply_name);
					plusCnrDTO.setSignupId(plusCnrDTO.getSignup_id());
					plusCnrDTO.setPayAmount(500l);
					plusCnrDTO.setPayImpUid("�떟蹂�梨꾪깮蹂댁긽");
					plusCnrDTO.setPayMerchantUid("merchant " + localDateTime.getNano());
					plusCnrDTO.setPossibleRefund(5l);
					System.out.println(plusCnrDTO);
					coinDAO.ChargeCoin(plusCnrDTO);

		         }else {
		            return "<script>alert('占쌜쇽옙占쌘곤옙 占싣댐옙占쏙옙占쏙옙 채占쏙옙占쌀쇽옙 占쏙옙占쏙옙占싹댐옙.'); location.href='/readForm?board_idx=" + board_idx + "'; </script>";
		         }
		              
		       
		       int result = IReplyDAO.reply_selectDTO(reply_idx);
		      if(result==1) {
		         
		    	  	sigupDAO.signup_gradeUpdate(board_name);
		            sigupDAO.signup_gradeUpdate(reply_name);
		            
		         return "<script>alert('채占쏙옙 占싹뤄옙'); location.href='/readForm?board_idx=" + board_idx + "'; </script>";
		      }
		      else {
		         System.out.println("채占쏙옙 占쏙옙占쏙옙");
		         return "<script>alert('채占쏙옙 占쏙옙占쏙옙'); location.href='/readForm?board_idx=" + board_idx + "'; </script>";
		      }
		            
		   }


	@PostMapping("/checkSelect")
	@ResponseBody
	public int checkSelect(@RequestBody ReplyDTO replyDTO){
		int result = IReplyDAO.checkSelect(String.valueOf(replyDTO.getReply_idx()));
		return result;
	}
}
