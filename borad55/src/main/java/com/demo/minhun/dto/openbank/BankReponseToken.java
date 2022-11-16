package com.demo.minhun.dto.openbank;

import lombok.Data;

@Data
public class BankReponseToken {

    // 오픈뱅킹에서 발행된 Access Token
    private String access_token;

    // Access Token 유형 고정값: Bearer
    private String token_type;

    // Access Token 만료 기간(초)
    private int expires_in;

    //Access Token 갱신 시 사용하는
    //Refresh Token
    private String refresh_token;

    // Access Token 권한 범위
    // (사용자인증 시 요청했던 권한 범위와 동일)
    // [login|inquiry|transfer] 로그인 조회 이체
    private String scope;

    // 사용자일련번호
    private String user_seq_no;
}
