package com.demo.minhun.dto;

import lombok.Data;

import java.util.Random;

@Data
public class ExchangeDTO {

    private Long payAmount;
    private Long payImpUid;


    // 거래 고유 번호 생성
    public String getRandomNumber(String bank_trans_id){

        Random rand = new Random();
        String randInt = Integer.toString(rand.nextInt(8) + 1);
        for(int i=0; i < 8; i++){
            randInt += Integer.toString(rand.nextInt(9));
        }
        return bank_trans_id+randInt;
    }



}
