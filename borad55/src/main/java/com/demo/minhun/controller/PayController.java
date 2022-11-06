package com.demo.minhun.controller;

import com.demo.minhun.dao.CoinDAO;
import com.demo.minhun.dao.SignupDAO;
import com.demo.minhun.dto.ChargeNRefundDTO;
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

    /** 프론트에서 받은 PG사 결괏값을 통해 아임포트 토큰 발행 **/
    @PostMapping("/verifyIamport/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(@PathVariable String imp_uid) throws IamportResponseException, IOException {
        // 아임포트 결제 검증용 생성자에 토큰 발급 및 정상결제검증을 위해 apikey와 apisecret 를 매개변수로해서 생성자 생성
        iamportClient = new IamportClient("1460706830363650","4oao8E1KszL9M6nNMEIHzvcq636SMGz41zVlv3JsmJrfdvHeZOuHVWH1QaMjKKyb7Yl9uTwrdYOUEqYZ");
        // 결제고유번호(imp_uid)를 이용해서 결제창에서 입력된 금액과 실제 결제된 금액을 비교하기위해 paymentByImpUid 함수 사용
        // 아임포트에서 결제후 응답 객체(rsp)와 paymentByImpUid로 받아온 객체 값을 비교하는 구조(data)
        return iamportClient.paymentByImpUid(imp_uid);
    }

    // 로그인 후 소지한 코인 갯수 확인
    @PostMapping("/MyCoin")
    public String getCurrentCoin(@RequestBody ChargeNRefundDTO CNRDTO){
        ChargeNRefundDTO cnrDTO = coinDAO.getMyCurrentCoinById(CNRDTO.getSignup_id());
        String MyCoin = String.valueOf(cnrDTO.getCurrentCoin());
        return MyCoin;
    }

    @PostMapping("/charge/coin")
    public void chargeCoin(@RequestBody ChargeNRefundDTO chargeNRefundDTO){

        // js 로 보내준 dto 값 확인
        System.out.println(chargeNRefundDTO);

//        폼에서 DTO를 못 가져와서 변수를 하나씩 가져와서 DTO를 생성하려 했던 흔적
//        System.out.println(payAmount);
//        System.out.println(signupId);
//        CoinDTO coinDTO = new CoinDTO();
//        coinDTO.setPayAmount(payAmount);
//        coinDTO.setSignupId(signupId);
//        Long currentCoin = coinDTO.getCurrentCoin();
//        coinDTO.setCurrentCoin(currentCoin);

        // 전체 유저 코인 충전 기록
        coinDAO.ChargeCoin(chargeNRefundDTO);

    }

    @PostMapping("/getMyCoin")
    public String getMyCoin(@RequestBody ChargeNRefundDTO cnrDTO){
        // 내 코인 갯수 확인
        ChargeNRefundDTO getCoin = coinDAO.getMyCurrentCoinById(cnrDTO.getSignup_id());
        // int로 변환
        String myCoin = getCoin.getCurrentCoin().toString();
        // 갯수 반환
        return myCoin;
    }

}
