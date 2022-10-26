package com.demo.minhun.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LikeDAO {
	// board 테이블  좋아요 +1
	   public int BoardUpLike(String board_idx);
	   
	   // Like 테이블에 id, idx insert
	   public int LikeUp(String board_idx, String signup_id);
	   
	   // 동일 id, board_idx를 조사해서 이미 누른 이력이 있는지 확인
	   public int LikeCheck(String board_idx, String signup_id);
	   
	   // board 테이블  좋아요 -1
	   public int BoardDownLike(String board_idx);

	   // Like 테이블  delete
	   public int LikeDown(String board_idx, String signup_id);
}
