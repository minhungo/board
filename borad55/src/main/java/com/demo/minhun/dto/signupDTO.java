package com.demo.minhun.dto;

import java.time.LocalDate;
import java.util.Date;

import lombok.Data;

@Data
public class signupDTO {

	private String signup_id;
	private String signup_pw;
	private String signup_pw_check;
	private String signup_name;
	private String signup_nickname;
	private String signup_email;
	private String signup_adr;
	private String signup_adr_point;
	private String signup_data;
	private int signup_num;
	private int signup_point;
	private Date signup_date;
	private String signup_grade;

	/*
	 * private int signup_coin;
	 *
	 * 기존에 코인 갯수를 보여주던 열값 signup 테이블에서 삭제함
	 * Coin 테이블에서 currentCoin 열을 추가해서 대신함
	 *
	 */
	
	// 이미지 파일
	private String signup_profle_img;
	
	
	// 신고기능
	private LocalDate str_sanctions;
	private LocalDate and_sanctions;
	private String user_reportcheck;
	private String true_sanctions;
	
	
	
	private boolean userLogin;
	
	public void setUserLogin(boolean userLogin) {
	      this.userLogin = userLogin;
	   }


}
