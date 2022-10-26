package com.demo.minhun.dto;


import java.util.Date;

import lombok.Data;

@Data
public class LikeDTO {
	
	   private int like_no;
	   private int board_idx;
	   private String signup_id;
	   private int rno; 
	   private Date like_date;
}
