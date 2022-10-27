package com.demo.minhun;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.minhun.dao.SignupDAO;
import com.demo.minhun.dto.signupDTO;

//회원가입 컨트롤러
@Controller
public class signupController {

	@Autowired
	SignupDAO sigupDAO;
	
	signupDTO user;
	
	
	
	@GetMapping("/signup")
	public String t1() {
		return "signup";
	}
	
	
	@RequestMapping("/signupAction") // 회원가입 
	@ResponseBody
	public String 
			signup(@RequestParam("input_id") String signup_id, 
			@RequestParam("input_pw") String signup_pw,
			@RequestParam("input_pw2") String signup_pw_check, 
			@RequestParam("input_name") String signup_name,
			@RequestParam("input_nickname") String signup_nickname,
			@RequestParam("input_email") String signup_email, 
			@RequestParam("input_adr") String signup_adr,
			@RequestParam("input_adr2") String signup_adr_point, 
			@RequestParam("select_data") String signup_data,
			@RequestParam("signup_profle_img") String signup_profle_img,
			HttpServletRequest request) {

		int result = sigupDAO.signup(signup_id, signup_pw, signup_pw_check, signup_name, signup_nickname, signup_email, signup_adr,
				signup_adr_point, signup_data,signup_profle_img);

		if (result == 1) {
			System.out.println("회원가입 성공!!");
			return "<script>alert('회원가입 성공!!'); location.href='/board'; </script>";

		} else {
			System.out.println("회원가입 실패!");
			return "<script>alert('회원가입 실패!'); location.href='/signup'; </script>";
		}

	}
	
	
	
	
}
