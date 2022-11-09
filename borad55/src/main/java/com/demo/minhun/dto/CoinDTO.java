package com.demo.minhun.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class CoinDTO {

    // 직접적으로 db와 연결하지 않음
    // Coin 테이블 구조를 설명하기 위한 객체

    // 결제된 금액
    private Long payAmount;

    // 결제일
    private LocalDate payChargeDate;

    // 결제자 아이디
    private String signupId;

    // 아임포트에서 구분하는 pk
    private String payImpUid;

    // 환불하기 위해서 클라이언트로부터 전달받은 주문번호
    private String payMerchantUid;

    // 환불 가능한지 판단용 number 가능 : 1 , 불가 : 그 외 숫자
    private Long possibleRefund;

}
