package com.demo.minhun.dto.openbank;

import lombok.Data;

@Data
public class BankReponseTokenTwoLeg {

    // 오픈뱅킹에서 발행된 Access Token
    private String access_token;

    // Access Token 유형 고정값: Bearer
    private String token_type;

    // Access Token 만료 기간(초)
    private Long expires_in;

    //Access Token 갱신 시 사용하는
    //Refresh Token
    private String refresh_token;

    // Access Token 권한 범위
    private String scope;

    // 이용기관코드
    private String client_use_code;
}
