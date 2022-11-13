package com.demo.minhun.dto.openbank;

import lombok.Data;

@Data
public class BankRequestTokenTwoLeg {

    // 사용자의 개입이 없는 2-legged 인증의 경우에는 scope=oob로 정의되며, 사용자인증 API의 호출이 없다
    // 따라서 사용자인증 성공 시 반환되는 코드 사용 안함
    // private String code;

    // 오픈뱅킹에서 발급한 이용기관 앱의 Client ID
    private String client_id;

    // 오픈뱅킹에서 발급한 이용기관 앱의 Client Secret
    private String client_secret;

    // Access Token을 전달받을 Callback URL 사용안함
    // private String redirect_uri;

    // Access Token 권한 범위 고정값: oob
    private String scope;

    // 3-legged 인증을 위한 권한부여 방식 지정
    // 고정값: authorization_code
    private String grant_type;


    // 실명계좌조회를 위해 환전신청페이지에서 값을 담아오기위해 임의로 만든 부분
    private String account_holder_info_type;
    private String account_num;
    private String account_holder_info;
    private String account_name;
    private String bank_code_std;
    private String bank_tran_id;
    private String tran_dtime;
    private String bank_name;
    private String coinAmount;
    private String signupID;


    public void setBankRequestToken(String client_id,String client_secret, String scope, String grant_type){
        this.client_id= client_id;
        this.client_secret = client_secret;
        this.scope = scope;
        this.grant_type = grant_type;
    }

}
