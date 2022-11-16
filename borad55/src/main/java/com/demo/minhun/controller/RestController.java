package com.demo.minhun.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.minhun.dao.SignupDAO;
import com.demo.minhun.dao.IReplyDAO;
import com.demo.minhun.dao.LikeDAO;

@Controller // ajax 비동기 방식은 일반 controller랑 다른 구조라 따로 옮김
public class RestController {

	@Autowired
	SignupDAO sigupDAO;

	@Autowired
	LikeDAO LikeDAO;

	@Autowired
	IReplyDAO IReplyDAO;

	
	
	
	@RequestMapping("/idcheck") // 아이디 중복체크
	public @ResponseBody int idcheck(String aa) {
		int result = sigupDAO.idcheck(aa);
		return result;
	}

	
	
	
	@RequestMapping("/LikeAction") // 좋아요 Up, Down
	public @ResponseBody int LikeAction(String board_idx, String signup_id) {

		
		int likeCheck = LikeDAO.LikeCheck(board_idx, signup_id);
		if (likeCheck == 0) {

			LikeDAO.LikeUp(board_idx, signup_id);
			LikeDAO.BoardUpLike(board_idx);
			return likeCheck;

		} else if (likeCheck == 1) {

			LikeDAO.LikeDown(board_idx, signup_id);
			LikeDAO.BoardDownLike(board_idx);
			return likeCheck;

		}
		return likeCheck;
	}

	
	
	
	
	@RequestMapping("/NickNameCheck") // 닉네임 중복체크
	public @ResponseBody int NickNameCheck(String nick) {
		int result = sigupDAO.NickNameCheck(nick);
		return result;
	}
	
	
	
	
	@RequestMapping("/Reply_Update_Action") // 댓글 수정
	public @ResponseBody int Reply_Update_Action(
			String reply_idx, 
			String reply_content) {
		
		System.out.println(reply_idx+"@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(reply_content+"@@@@@@@@@@@@@@@@@@@@@@");
		
		
		int result = IReplyDAO.Reply_Update_Action(reply_content,reply_idx );
				
		return result;
	}

	
	
	
	
}
