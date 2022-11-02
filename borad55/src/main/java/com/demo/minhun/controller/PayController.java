package com.demo.minhun.controller;

import com.demo.minhun.dao.CoinDAO;
import com.demo.minhun.dao.SignupDAO;
import com.demo.minhun.dto.CoinDTO;
import com.demo.minhun.dto.signupDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
public class PayController {

    @Autowired
    CoinDAO coinDAO;

    @Autowired
    SignupDAO signupDAO;

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
