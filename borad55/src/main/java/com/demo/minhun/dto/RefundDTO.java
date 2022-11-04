package com.demo.minhun.dto;

import lombok.Data;

import java.time.LocalDate;
import java.util.Date;
@Data
public class RefundDTO {

    private String signup_id;
    private String signup_name;
    private String signup_nickname;
    private String signup_email;
    private String signup_adr;
    private String signup_adr_point;
    private String signup_data;
    private int signup_num;
    private int signup_point;
    private Date signup_date;
    private String signup_grade;
    private int signup_coin;

    // 이미지 파일
    private String signup_profle_img;

    // 결제된 금액
    private Long payAmount;

    // 결제일
    private LocalDate payChargeDate;

    // 결제자 아이디
    private String signupId;
}
