package com.demo.minhun.dto;

import lombok.Data;

@Data
public class getCountDTO {

    private String curdate;
    private int cnt;

    private String signup_data;
    private String recentdate;

    private int cntsignup;
    private int cntboth;
    private int cntboard;
    private int cntreply;

    private int cnttotalview;

    private int rownum;
    private String board_title;
    private int board_hit;

    private String signup_grade;
}
