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
}
