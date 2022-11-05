package com.demo.minhun.dto;

import lombok.Data;

import java.time.LocalDate;
import java.util.Date;
@Data
public class ChargeNRefundDTO {

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

    /*
    * private int signup_coin;
    *
    * 기존에 코인 갯수를 보여주던 열값 signup 테이블에서 삭제함
    * Coin 테이블에서 currentCoin 열을 추가해서 대신함
    *
    */

    // 이미지 파일
    private String signup_profle_img;

    // 결제된 금액을 저장
    private Long payAmount;

    // 결제일
    private LocalDate payChargeDate;

    // 결제자 아이디
    private String signupId;

    // 아임포트에서 구분하는 pk
    private String payImpUid;

    // 환불하기 위해 클라이언트로부터 전달받은 주문번호
    private String payMerchantUid;

    // 현재 코인 갯수
    private Long currentCoin;
}
