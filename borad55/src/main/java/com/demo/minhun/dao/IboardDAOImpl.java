package com.demo.minhun.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.demo.minhun.dto.BoardDTO;
import com.demo.minhun.dto.SearchCriteria;




public class IboardDAOImpl  implements IBoardDAO{
	
	
	@Autowired
	IBoardDAO dao;
	@Autowired
    SqlSession sql;




	@Override
	public BoardDTO viewDTO(String board_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateDTO(String board_idx, String board_name, String board_title, String board_content) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDTO(String board_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int hit(String board_idx) {
		// TODO Auto-generated method stub
		return 0;
	}





	@Override
	public List<BoardDTO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("BoardDAO.list",scri);
	}


	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("BoardDAO.listCount",scri);
	}

	@Override
	public List<BoardDTO> mini() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> mini2() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> mini3() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> mini4() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int board_reply_plus(String board_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int board_reply_minus(String board_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int reportDTO(String board_reportcheck, String board_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardDTO> reportlist(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int reportCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardDTO report_view(String board_idx) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int board_profle_update(String board_profle_img, String board_name) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int write(String board_name, String board_title, String board_content, int bgno, String board_profle_img,
			String board_writer_id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
