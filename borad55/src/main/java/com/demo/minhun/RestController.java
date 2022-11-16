package com.demo.minhun;

import java.util.List;
import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.minhun.dao.SignupDAO;
import com.demo.minhun.dto.signupDTO;
import com.demo.minhun.dao.IReplyDAO;
import com.demo.minhun.dao.LikeDAO;

@Controller // ajax 비동기 방식은 일반 controller랑 다른 구조라 따로 옮김
public class RestController {

	@Autowired
	SignupDAO signupDAO;

	@Autowired
	LikeDAO LikeDAO;

	@Autowired
	IReplyDAO IReplyDAO;

	@Autowired
	JavaMailSender mailSender; // mailsend 주입
	
	
	
	
	
	@RequestMapping("/idcheck") // 아이디 중복체크
	public @ResponseBody int idcheck(
			String aa, HttpSession session) {
		
		int result = signupDAO.idcheck(aa);
		
		
		// 적용 아이디 값 받아요기 (이메일 인증용)
		signupDTO result2 = signupDAO.email_and_name(aa);
		session.setAttribute("input_id", result2);
		session.setMaxInactiveInterval(6600);
		
		
		
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
	public @ResponseBody int NickNameCheck(
			String nick) {
		int result = signupDAO.NickNameCheck(nick);
	
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
	
	
	
	
	@RequestMapping("/emailAuth") // 이메일 보내기
	@ResponseBody 
	public String emailAuth(
			String email, String name, HttpSession session) {
		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		
		signupDTO input_id =  (signupDTO)session.getAttribute("input_id");
		String setFrom = "knuk1101@naver.com";
        String toMail = email;
        String title = "비밀번호 찾기 인증 이메일 입니다.";
        String content = 
                "SLOW 홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
        	
        	if(input_id.getSignup_email().equals(email) && input_id.getSignup_name().equals(name)) {
        		 MimeMessage message = mailSender.createMimeMessage();
                 MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
                 helper.setFrom(setFrom);
                 helper.setTo(toMail);
                 helper.setSubject(title);
                 helper.setText(content,true);
                 mailSender.send(message);
                 
                 return Integer.toString(checkNum);
        	}
        	else {
        		checkNum=0;
                return Integer.toString(checkNum);
        	}
            
        }catch(Exception e) {
            e.printStackTrace();
            checkNum=0;
            return Integer.toString(checkNum);
        }
	}

	
	
	
	
	@RequestMapping("/PwChange") // PwChange
	public @ResponseBody int PwChange(
			String pw1, 
			String pw2,
			String id) {
		
		int result = signupDAO.PwChange(pw1,pw2,id);
				
		return result;
	}
	
	
	
	
	
	@RequestMapping("/IDSearch") // sheach ID
	@ResponseBody 
	public String IDSearch(
			String name, String email, HttpSession session) {
		
		System.out.println(name);
		System.out.println(email);
		
		signupDTO result3 = signupDAO.IDSearch(name, email);
		session.setAttribute("IDSearch", result3);
		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		System.out.println(result3);
		
		String setFrom = "knuk1101@naver.com";
        String toMail = email;
        String title = "아이디 찾기 인증 이메일 입니다.";
        String content = 
                "SLOW 홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
        	if(email.equals(result3.getSignup_email()) && name.equals(result3.getSignup_name())) {
        		 MimeMessage message = mailSender.createMimeMessage();
                 MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
                 helper.setFrom(setFrom);
                 helper.setTo(toMail);
                 helper.setSubject(title);
                 helper.setText(content,true);
                 mailSender.send(message);
                 return Integer.toString(checkNum);
        	}
        }catch(Exception e) {
            e.printStackTrace();
            checkNum = 0;
            return Integer.toString(checkNum);
        }
        checkNum = 0;
        return Integer.toString(checkNum);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
