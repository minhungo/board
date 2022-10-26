package com.demo.minhun.dao;




import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.demo.minhun.dto.BoardDTO;
import com.demo.minhun.dto.SearchCriteria;




//싱글톤 사용을 위한 인터페이스
//@Mapper : mybatis와 인터페이스 함수 연결 어노테이션

@Mapper 
public interface IBoardDAO {
	
	public List<BoardDTO> list(SearchCriteria scri) throws Exception;
	public int listCount(SearchCriteria scri) throws Exception;
	public int write(String board_name, String board_title, String board_content ,int bgno, String board_profle_img, String board_writer_id);
	public BoardDTO viewDTO(String board_idx);
	public int updateDTO(String board_idx, String board_name,String board_title, String board_content);
	public int deleteDTO(String board_idx);
    public int hit(String board_idx);
    
    //메인 미니 질문 게시판
    public List<BoardDTO> mini();
    //메인 미니 자유게시판
    public List<BoardDTO> mini2();
    //메인 조회수 게시판
    public List<BoardDTO> mini3();
    //메인 추천수 게시판 
    public List<BoardDTO>mini4();
    
    //board table 댓글 수 카운터 함수 +
  	public int board_reply_plus(String board_idx);
  	
  	//board table 댓글 수 카운터 함수 -
  	public int board_reply_minus(String board_idx);
    
  	
    //신고 액션
    public int reportDTO(String board_reportcheck, String board_idx);
    
    //신고게시판 리스트
    public List<BoardDTO> reportlist(SearchCriteria scri) throws Exception;
    
    //신고 게시판 총 개수
    public int reportCount(SearchCriteria scri);
 
    //신고 페이지
    public BoardDTO report_view(String board_idx);
    
    // 프로필 변경 시 게시판에 자신의 프로필 값도 변경
    public int board_profle_update(String board_profle_img, String board_name);
    
    

    
}

