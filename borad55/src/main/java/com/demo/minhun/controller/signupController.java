package com.demo.minhun.controller;

import javax.servlet.http.HttpServletRequest;

import com.demo.minhun.dao.CoinDAO;
import com.demo.minhun.dto.ChargeNRefundDTO;
import com.demo.minhun.dto.CoinDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.minhun.dao.SignupDAO;
import com.demo.minhun.dto.signupDTO;

@Controller
public class signupController {

	@Autowired
	SignupDAO sigupDAO;
	
	signupDTO user;

	@Autowired
	CoinDAO coinDAO;
	
	
	
	@GetMapping("/IDFind")
	public String IDFind() {
		return "IDFind";
	}
	
	@GetMapping("/IDFind2")
	public String IDFind2() {
		return "IDFind2";
	}
	
	
	
	
	@GetMapping("/PWFind")
	public String PWFind() {
		return "PWFind";
	}
	@GetMapping("/PWFind2")
	public String PWFind2() {
		return "PWFind2";
	}
	@GetMapping("/PWFind3")
	public String PWFind3() {
		return "PWFind3";
	}
	
	
	@RequestMapping("/signupAction") // ȸ������ 
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
			System.out.println("ȸ������ ����!!");
			ChargeNRefundDTO cnrDTO = new ChargeNRefundDTO();
			cnrDTO.setSignupId(signup_id);
			cnrDTO.setPayAmount(10000l);
			cnrDTO.setPayImpUid("회원가입");
			cnrDTO.setPayMerchantUid("회원가입 축하선물");
			cnrDTO.setPossibleRefund(4l);
			coinDAO.ChargeCoin(cnrDTO);
			return "<script>alert('회원가입 성공!!'); location.href='/board'; </script>";

		} else {

			return "<script>alert('회원가입 실패!'); location.href='/signup'; </script>";

		}

	}
	
	
	
	
}
