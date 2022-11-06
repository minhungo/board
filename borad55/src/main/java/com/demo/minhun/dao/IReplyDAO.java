package com.demo.minhun.dao;




import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.demo.minhun.dto.ReplyDTO;

//싱글톤 사용을 위한 인터페이스
//@Mapper : mybatis와 인터페이스 함수 연결 어노테이션

@Mapper 
public interface IReplyDAO {
	

	public List<ReplyDTO> reply_list(String reply_board_index);
	
	public int reply_write(String reply_name, String reply_content, String reply_board_index, String reply_signup_id, String reply_profle_img);
	
	public int reply_deleteDTO(String reply_idx);
	
	// 댓글 수정
	public int reply_update(String reply_content, String reply_idx, String reply_board_idx);
	
	// 채택
	public int reply_selectDTO(String reply_idx);

	public int checkSelect(String reply_idx);
	
	// 댓글 프로필 업데이트 
	public int reply_profle_update(String board_profle_img, String signup_id);
	
	public int Reply_Update_Action(String reply_idx, String reply_content);
	
   
}

