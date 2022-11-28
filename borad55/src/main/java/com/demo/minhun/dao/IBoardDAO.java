package com.demo.minhun.dao;




import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.demo.minhun.dto.BoardDTO;
import com.demo.minhun.dto.SearchCriteria;




//@Mapper : mybatis

@Mapper 
public interface IBoardDAO {
	
	public List<BoardDTO> list(SearchCriteria scri) throws Exception;
	public int listCount(SearchCriteria scri) throws Exception;
	public int write(String board_name, String board_title, String board_content ,int bgno, String board_profle_img, String board_writer_id);
	public BoardDTO viewDTO(String board_idx);
	public int updateDTO(String board_idx, String board_name,String board_title, String board_content);
	public int deleteDTO(String board_idx);
    public int hit(String board_idx);
    
   
    public List<BoardDTO> mini();

    public List<BoardDTO> mini2();

    public List<BoardDTO> mini3();
 
    public List<BoardDTO>mini4();

  	public int board_reply_plus(String board_idx);
  	

  	public int board_reply_minus(String board_idx);
    
  	
 
    public int reportDTO(String board_reportcheck, String board_idx);
    

    public List<BoardDTO> reportlist(SearchCriteria scri) throws Exception;
    
 
    public int reportCount(SearchCriteria scri);
 

    public BoardDTO report_view(String board_idx);
    
  
    public int board_profle_update(String board_profle_img, String board_name);
    
    public int userReportcount(String user_reportcheck ,String signup_nickname);

    
}

