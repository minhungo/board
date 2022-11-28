package com.demo.minhun.dao;


import java.util.List;

import com.demo.minhun.dto.CoinDTO;
import com.demo.minhun.dto.getSignupDataDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.minhun.dto.SearchCriteria;
import com.demo.minhun.dto.signupDTO;


@Mapper
public interface SignupDAO {

	

	public int signup(String signup_id, String signup_pw, String signup_pw_check, String signup_name, String signup_nickname,
			String signup_email, String signup_adr, String signup_adr_point, String signup_data,String signup_profle_img);
	

	public signupDTO login(String signup_id, String signup_pw);

	public int idcheck(String signup_id);

	// �땳�꽕�엫 泥댄겕
	public int NickNameCheck(String nick);
	
	
	public int signup_replyselect(String nickname);
	public int signup_ReplyPointDown(String nickname);
	
	
	public List<signupDTO> signuplist(SearchCriteria scri) throws Exception;
	public signupDTO signupview(String signup_num);
	public int  signupCount(SearchCriteria scri) throws Exception;
	public int deleteSignup(String signup_num);
	
	

	public int imgload(String signup_profle_img, String signup_id);

	public signupDTO origin_img_return(String signup_id);

	public List<signupDTO> userReportlist(SearchCriteria scri) throws Exception;
	

	public int userReportDTO(String user_reportcheck,int signup_num);
	
	
	public int sanctionsDTO(String str_sanctions,String true_sanctions,String and_sanctions,String signup_num);
	

	public int sanctionsOnlock(String str_sanctions, String and_sanctions , String ture_sanctions ,String signup_num);
	

	public int signup_gradeUpdate(String nickname);
	
	public List<signupDTO> sanctionslist(SearchCriteria scri) throws Exception;
	
	public int MyPage_UpDate(String input_pw,String input_nickname,String input_email,String input_adr,String input_adr_point, String signup_id);

	//신고먹은 횟수 찾기
		public signupDTO reportreportcheckcoundView(String board_name);
		
    
    //제재 카운터	
    	public int signupCount2(SearchCriteria scri) throws Exception;
   
    	//리폿된 녀석 카운터 
    public int userReportcount(String user_reportcheck ,String signup_nickname);

//	public int UpdateCoin(Long signup_coin, String signup_id, String payImpUid, String payMerchantUid);
//	public int UpdateCoinByNickname(Long signup_coin, String signup_nickname);
//	public signupDTO getMyInfo(String signup_id);
//	public String getMyCoin(String signup_id);
	// 가입 경로 통계 가져오기
	public List<getSignupDataDTO> getSingupData();


	// 이메일 , 이름 매칭 유효성 검사
	public signupDTO email_and_name(String input_id);
	
	// 비밀번호 변경
	public int PwChange(String pw1,String pw2,String id);
	
	// 아이디 찾기
	public signupDTO IDSearch(String name,String email);
	
	
	
	
	
}
