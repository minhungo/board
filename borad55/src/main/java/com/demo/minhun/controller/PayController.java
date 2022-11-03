package com.demo.minhun.controller;

import com.demo.minhun.dao.CoinDAO;
import com.demo.minhun.dao.SignupDAO;
import com.demo.minhun.dto.CoinDTO;
import com.demo.minhun.dto.signupDTO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RestController
public class PayController {

    private IamportClient iamportClient;

    @Autowired
    CoinDAO coinDAO;

    @Autowired
    SignupDAO signupDAO;

    /** 프론트에서 받은 PG사 결괏값을 통해 아임포트 토큰 발행 **/
    @PostMapping("/verifyIamport/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(@PathVariable String imp_uid) throws IamportResponseException, IOException {
        iamportClient = new IamportClient("1460706830363650","4oao8E1KszL9M6nNMEIHzvcq636SMGz41zVlv3JsmJrfdvHeZOuHVWH1QaMjKKyb7Yl9uTwrdYOUEqYZ");
        return iamportClient.paymentByImpUid(imp_uid);
    }

    @PostMapping("/charge/coin")
    public void chargeCoin(@RequestBody CoinDTO coinDTO, HttpServletRequest request){

        System.out.println(coinDTO);
//        System.out.println(payAmount);
//        System.out.println(signupId);
//
//        CoinDTO coinDTO = new CoinDTO();
//        coinDTO.setPayAmount(payAmount);
//        coinDTO.setSignupId(signupId);

        // 전체 유저 코인 충전 기록
        coinDAO.ChargeCoin(coinDTO);
        Long signup_coin = coinDTO.getPayAmount();
        String signup_id = coinDTO.getSignupId();
        // 충전한 유저 정보 업데이트
        signupDAO.UpdateCoin(signup_coin, signup_id);

        HttpSession session = request.getSession(false);
        if(session == null){
            signupDTO user = signupDAO.getMyInfo(signup_id);
            session.setAttribute("profile", user);
        }
    }

}
