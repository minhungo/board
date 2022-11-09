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

//ȸ������ ��Ʈ�ѷ�
@Controller
public class signupController {

	@Autowired
	SignupDAO sigupDAO;
	
	signupDTO user;

	@Autowired
	CoinDAO coinDAO;
	
	
	
	@GetMapping("/signup")
	public String t1() {
		return "signup";
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
			return "<script>alert('ȸ������ ����!!'); location.href='/board'; </script>";

		} else {

			System.out.println("ȸ������ ����!");
			return "<script>alert('ȸ������ ����!'); location.href='/signup'; </script>";

		}

	}
	
	
	
	
}
