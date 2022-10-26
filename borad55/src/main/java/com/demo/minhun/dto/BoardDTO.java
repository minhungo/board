package com.demo.minhun.dto;

import java.util.Date;

import lombok.Data;



@Data
public class BoardDTO {

	private int board_idx;
	private String board_name;
	private String board_title;
	private Date board_date;
	private int board_hit;
	private String board_content;
	private int bgno;
	private int board_like_cnt;
	private int board_reply_cnt;
	private String board_reportcheck;
	private String board_profle_img;
	
	

	public BoardDTO(){}

	
	
	public BoardDTO(int board_idx, String board_name, String board_title, String board_content, Date board_date,
			int board_hit, int bgno, int board_like_cnt, int board_reply_cnt, String board_reportcheck,String board_profle_img) {
		super();
		this.board_idx = board_idx;
		this.board_name = board_name;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_hit = board_hit;
		this.bgno = bgno;
		this.board_like_cnt = board_like_cnt;
		this.board_reply_cnt = board_reply_cnt;
		this.board_reportcheck = board_reportcheck;
		this.board_profle_img = board_profle_img;
	}

}
