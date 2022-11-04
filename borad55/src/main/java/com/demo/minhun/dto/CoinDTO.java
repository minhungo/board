package com.demo.minhun.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class CoinDTO {

    // 결제된 금액
    private Long payAmount;

    // 결제일
    private LocalDate payChargeDate;

    // 결제자 아이디
    private String signupId;

}
