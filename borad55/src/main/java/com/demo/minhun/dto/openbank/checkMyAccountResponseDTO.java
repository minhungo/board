package com.demo.minhun.dto.openbank;

import lombok.Data;

@Data
public class checkMyAccountResponseDTO {

    // 거래고유번호(API) aNS(40)
    private String api_tran_id;

    // 거래일시(밀리세컨드) N(17)
    private Long api_tran_dtm;

    // 응답코드(API) AN(5)
    private String rsp_code;

    // 응답메시지(API) AH(300)
    private String rsp_message;

    // 거래고유번호(참가은행) AN(20)
    private String bank_tran_id;

    // 거래일자(참가은행) N(8)
    private String bank_tran_date;

    // 응답코드를 부여한 참가은행.표준코드 AN(3)
    private String bank_code_tran;

    // 응답코드(참가은행) AN(3)
    private String bank_rsp_code;

    // 응답메시지(참가은행) AH(100)
    private String bank_rsp_message;

    // 개설기관.표준코드 AN(3)
    private String bank_code_std;

    // 개설기관.점별코드 AN(7)
    private String bank_code_sub;

    // 개설기관명 AH(20)
    private String bank_name;

    // 개별저축은행명 AH(20)
    private String savings_bank_name;

    // 계좌번호 AN(16)
    private String account_num;

    // 회차번호 AN(3)
    private String account_seq;

    // 예금주 실명번호 구분코드 AN(1)
    private String account_holder_info_type;

    // 예금주 실명번호 AN(13)
    private String account_holder_info;

    // 예금주성명 AH(20)
    private String account_holder_name;

    // 계좌종류 1:수시입출금, 2:예적금 6:수익증권, T:종합계좌  AN(1)
    private String account_type;
}
