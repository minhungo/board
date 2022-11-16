package com.demo.minhun.dto;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;

@Data
public class getAllUserRecordDTO {

    // 결제자 아이디
    private String signupId;

    // 결제된 금액을 저장
    private Long payAmount;

    // 아임포트에서 구분하는 pk
    private String payImpUid;
    
    // 그룹별로 묶은 값 가져오기
    private int cnt;

}
