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

    // 아임포트 결제 검증용 생성자
    private IamportClient iamportClient;

    @Autowired
    CoinDAO coinDAO;

    @Autowired
    SignupDAO signupDAO;

    /** 프론트에서 받은 PG사 결괏값을 통해 아임포트 토큰 발행 **/
    @PostMapping("/verifyIamport/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(@PathVariable String imp_uid) throws IamportResponseException, IOException {
        // 아임포트 결제 검증용 생성자에 토큰 발급 및 정상결제검증을 위해 apikey와 apisecret 를 매개변수로해서 생성자 생성
        iamportClient = new IamportClient("1460706830363650","4oao8E1KszL9M6nNMEIHzvcq636SMGz41zVlv3JsmJrfdvHeZOuHVWH1QaMjKKyb7Yl9uTwrdYOUEqYZ");
        // 결제고유번호(imp_uid)를 이용해서 결제창에서 입력된 금액과 실제 결제된 금액을 비교하기위해 paymentByImpUid 함수 사용
        // 아임포트에서 결제후 응답 객체(rsp)와 paymentByImpUid로 받아온 객체 값을 비교하는 구조(data)
        return iamportClient.paymentByImpUid(imp_uid);
    }

    @PostMapping("/charge/coin")
    public void chargeCoin(@RequestBody CoinDTO coinDTO, HttpServletRequest request){

        // js 로 보내준 dto 값 확인
        System.out.println(coinDTO);

//        폼에서 DTO를 못 가져와서 변수를 하나씩 가져와서 DTO를 생성하려 했던 흔적
//        System.out.println(payAmount);
//        System.out.println(signupId);
//        CoinDTO coinDTO = new CoinDTO();
//        coinDTO.setPayAmount(payAmount);
//        coinDTO.setSignupId(signupId);

        // 전체 유저 코인 충전 기록
        coinDAO.ChargeCoin(coinDTO);
        Long signup_coin = coinDTO.getPayAmount();
        String signup_id = coinDTO.getSignupId();
        // 충전한 유저 정보 업데이트
        signupDAO.UpdateCoin(signup_coin, signup_id);

        // 세션 업데이트 부분 현재는 적용안됨 업데이트된 유저정보를 적용하고 싶은데 어떻게 하는지 모르겠음
        HttpSession session = request.getSession(false);
        if(session == null){
            signupDTO user = signupDAO.getMyInfo(signup_id);
            session.setAttribute("profile", user);
        }
    }

}
