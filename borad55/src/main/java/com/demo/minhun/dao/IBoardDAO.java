package com.demo.minhun.dao;




import java.util.List;

import com.demo.minhun.dto.getCountDTO;
import org.apache.ibatis.annotations.Mapper;

import com.demo.minhun.dto.BoardDTO;
import com.demo.minhun.dto.SearchCriteria;




//�떛湲��넠 �궗�슜�쓣 �쐞�븳 �씤�꽣�럹�씠�뒪
//@Mapper : mybatis�� �씤�꽣�럹�씠�뒪 �븿�닔 �뿰寃� �뼱�끂�뀒�씠�뀡

@Mapper 
public interface IBoardDAO {
	
	public List<BoardDTO> list(SearchCriteria scri) throws Exception;
	public int listCount(SearchCriteria scri) throws Exception;
	public int write(String board_name, String board_title, String board_content ,int bgno, String board_profle_img, String board_writer_id);
	public BoardDTO viewDTO(String board_idx);
	public int updateDTO(String board_idx, String board_name,String board_title, String board_content);
	public int deleteDTO(String board_idx);
    public int hit(String board_idx);
    
    //硫붿씤 誘몃땲 吏덈Ц 寃뚯떆�뙋
    public List<BoardDTO> mini();
    //硫붿씤 誘몃땲 �옄�쑀寃뚯떆�뙋
    public List<BoardDTO> mini2();
    //硫붿씤 議고쉶�닔 寃뚯떆�뙋
    public List<BoardDTO> mini3();
    //硫붿씤 異붿쿇�닔 寃뚯떆�뙋 
    public List<BoardDTO>mini4();
    
    //board table �뙎湲� �닔 移댁슫�꽣 �븿�닔 +
  	public int board_reply_plus(String board_idx);
  	
  	//board table �뙎湲� �닔 移댁슫�꽣 �븿�닔 -
  	public int board_reply_minus(String board_idx);
    
  	
    //�떊怨� �븸�뀡
    public int reportDTO(String board_reportcheck, String board_idx);
    
    //�떊怨좉쾶�떆�뙋 由ъ뒪�듃
    public List<BoardDTO> reportlist(SearchCriteria scri) throws Exception;
    
    //�떊怨� 寃뚯떆�뙋 珥� 媛쒖닔
    public int reportCount(SearchCriteria scri);
 
    //�떊怨� �럹�씠吏�
    public BoardDTO report_view(String board_idx);
    
    // �봽濡쒗븘 蹂�寃� �떆 寃뚯떆�뙋�뿉 �옄�떊�쓽 �봽濡쒗븘 媛믩룄 蹂�寃�
    public int board_profle_update(String board_profle_img, String board_name);
    
    public int userReportcount(String user_reportcheck ,String signup_nickname);

    
}

