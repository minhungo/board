package com.demo.minhun.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class CoinDTO {

    private Long payAmount;
    private LocalDate payChargeDate;
    private String signupId;

}
