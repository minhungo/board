package com.demo.minhun.dto.openbank;

import lombok.Data;

@Data
public class checkMyAccountRequestDTO {

    //조회서비스 계좌등록 시
    //오픈뱅킹으로부터 전송받은
    //access _token을
    //HTTP Header에 추가
    //[scope = oob]
    private String access_token;

    // 은행거래고유번호 AN(20)
    private String bank_tran_id;

    // 개설기관.표준코드 AN(3)
    private String bank_code_std;

    // 계좌번호 AN(16)
    private String account_num;

    // 회차번호 AN(3) 필수아님
    private String accoun_seq;

    // 예금주 실명번호 구분코드 AN(1) 주민등록번호6자리 입력은 코드를 " "(SPACE)으로 입력함
    private String account_holder_info_type;

    // 예금주 인증정보 AN(13) 필수아님(법적근거가 있는 이용기관에게만 허용, 다른기관은 필수) 주민등록번호6자리
    private String account_holder_info;

    // 요청일시 N(14)
    private String tran_dtime;

}
