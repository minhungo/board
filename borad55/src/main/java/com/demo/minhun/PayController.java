package com.demo.minhun;

import com.demo.minhun.dao.CoinDAO;
import com.demo.minhun.dao.SignupDAO;
import com.demo.minhun.dto.CoinDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PayController {

    @Autowired
    CoinDAO coinDAO;

    @Autowired
    SignupDAO signupDAO;

    @PostMapping("/charge/coin")
    public void chargeCoin(@RequestParam("payAmount")Long payAmount, @RequestParam("signupId")String signupId){

        System.out.println(payAmount);
        System.out.println(signupId);

        CoinDTO coinDTO = new CoinDTO();
        coinDTO.setPayAmount(payAmount);
        coinDTO.setSignupId(signupId);

        // 전체 유저 코인 충전 기록
        coinDAO.ChargeCoin(coinDTO);
        // 충전한 유저 정보 업데이트
        signupDAO.UpdateCoin(coinDTO);
    }

}
