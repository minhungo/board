package com.demo.minhun.dto.openbank;

import lombok.Data;

import java.util.Random;

@Data
public class BankRequestToken {

    // 사용자인증 성공 시 반환되는 코드
    private String code;

    // 오픈뱅킹에서 발급한 이용기관 앱의 Client ID
    private String client_id;

    // 오픈뱅킹에서 발급한 이용기관 앱의 Client Secret
    private String client_secret;

    // Access Token을 전달받을 Callback URL
    private String redirect_uri;

    // 3-legged 인증을 위한 권한부여 방식 지정
    // 고정값: authorization_code
    private String grant_type;



    // https://testapi.openbanking.or.kr/oauth/2.0/authorize 주소로 사용자인증을 하며
    // 응답값으로 code 가 자동으로 세팅됨 따라서 token을 발급 받기 위해서 나머지 4개의 값만 세팅하면됨
    public void setBankRequestToken(String client_id,String client_secret, String redirect_uri, String grant_type){
        this.client_id= client_id;
        this.client_secret = client_secret;
        this.redirect_uri = redirect_uri;
        this.grant_type = grant_type;
    }



}
