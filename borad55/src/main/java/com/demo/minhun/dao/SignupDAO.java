package com.demo.minhun.dao;


import java.util.List;

import com.demo.minhun.dto.CoinDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.minhun.dto.SearchCriteria;
import com.demo.minhun.dto.signupDTO;


@Mapper
public interface SignupDAO {

	
	// 회원가입
	public int signup(String signup_id, String signup_pw, String signup_pw_check, String signup_name, String signup_nickname,
			String signup_email, String signup_adr, String signup_adr_point, String signup_data,String signup_profle_img);
	
	// 로그인 재구현 예정
	public signupDTO login(String signup_id, String signup_pw);
	
	// 중복체크 재구현 예정
	public int idcheck(String signup_id);

	// 닉네임 체크
	public int NickNameCheck(String nick);
	
	
	public int signup_replyselect(String nickname);
	public int signup_ReplyPointDown(String nickname);
	
	
	
	public List<signupDTO> signuplist(SearchCriteria scri) throws Exception;
	public signupDTO signupview(String signup_num);
	public int  signupCount(SearchCriteria scri) throws Exception;
	public int deleteSignup(String signup_num);
	
	
	
	// 이미지 업로드
	public int imgload(String signup_profle_img, String signup_id);
	
	//적용 프로필 DB값 리턴
	public signupDTO origin_img_return(String signup_id);
	
	// 글 신고자 목록 불러오기
	public List<signupDTO> userReportlist(SearchCriteria scri) throws Exception;
	
	// 유저 신고
	public int userReportDTO(String user_reportcheck,int signup_num);
	
	// 관리자 페이지 제제하기
	public int sanctionsDTO(String str_sanctions,String true_sanctions,String and_sanctions,String signup_num);
	
	// 제재당한 사람 기간 지나면 풀림
	public int sanctionsOnlock(String str_sanctions, String and_sanctions , String ture_sanctions ,String signup_num);
	
	//계급 
	public int signup_gradeUpdate(String nickname);
	
	//제제자 리스트
	public List<signupDTO> sanctionslist(SearchCriteria scri) throws Exception;
	
	//마이 페이지 정보 수정 
	public int MyPage_UpDate(String input_pw,String input_nickname,String input_email,String input_adr,String input_adr_point, String signup_id);

	
	//코인 충전 또는 사용 적용
	public int UpdateCoin(Long signup_coin, String signup_id);

	public signupDTO getMyInfo(String signup_id);
	
	
	
}
