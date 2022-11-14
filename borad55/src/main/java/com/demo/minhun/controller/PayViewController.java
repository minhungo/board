package com.demo.minhun.controller;

import com.demo.minhun.dao.CoinDAO;
import com.demo.minhun.dto.ChargeNRefundDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Controller
public class PayViewController {

    @Autowired
    CoinDAO coinDAO;

//  @RequestMapping("/getToken")
//	public ModelAndView getToken() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("/Pay/getToken");
//		mv.addObject("clientId","1edae6d3-8b2c-485c-be9c-8782bb64fd74");
//		return mv;
//	}

//	@RequestMapping("/getTokenTwoLeg")
//	public ModelAndView getToken() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("/Pay/getTokenTwoLeg");
//		mv.addObject("clientId","1edae6d3-8b2c-485c-be9c-8782bb64fd74");
//		mv.addObject("clientSecret","0b3f2d48-e48e-4033-8de0-a952d3dbcdac");
//		return mv;
//	}

    // 코인 충전 창
    @RequestMapping("/PayCoin")
    public ModelAndView chargeCoin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/Pay/PayCoin");
        return mv;
    }

    @GetMapping("/change")
    public ModelAndView change(@RequestParam String signup_id){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/Pay/change");

        int curCoin = (coinDAO.getMyPossibleRefundCoinById(signup_id)/100);
        mv.addObject("curCoin",curCoin);

        return mv;
    }

    @GetMapping("/refund")
    public ModelAndView refundCoin(@RequestParam String signup_id) {
        System.out.println(signup_id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/Pay/RefundCoin");
        int curCoin = (coinDAO.getMyCurrentCoinById(signup_id)/100);
        List<ChargeNRefundDTO> record = coinDAO.getMyCoinRecordById(signup_id);

        LocalDateTime now = LocalDateTime.now();
        LocalDateTime seven = now.minusDays(7);

        for(ChargeNRefundDTO i : record){
            // 환불페이지에서 T는 지우고 초(s)까지만 보여주도록 하기위한 format
            Date date = java.sql.Timestamp.valueOf(i.getPayChargeDate());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd a HH:mm");
            i.setLocalDateTimeToDate(simpleDateFormat.format(date));

            LocalDateTime chargeDate = i.getPayChargeDate();

            // 충전일이 7일전보다 이전일이라면 환불 불가
            int resultDate = seven.compareTo(chargeDate);
            // 현재 소지한 코인보다 환불해야하는 코인의 갯수가 더 많다면 환불 불가
            boolean resultCoinSum = Long.valueOf(curCoin) >= (i.getPayAmount()/100l);
            // 충전 주문을 통한 지불인지 확인
            boolean resultIsCharge = i.getPayImpUid().substring(0,3).equals("imp");

            if((i.getPossibleRefund() == 5l) || (i.getPossibleRefund() == 4l) || (i.getPossibleRefund() == 9l)){
                continue; // 답변,회원가입,환전신청 걸러내기
            }
            if(!resultIsCharge) {
                i.setPossibleRefund(4l); // 환불대상이 아닙니다
            }
            if(resultDate == 1) {
                i.setPossibleRefund(3l); // 환불이 가능한 기간이 지났습니다
            }
            if(!resultCoinSum) {
                i.setPossibleRefund(2l); // 환불가능한 코인의 갯수가 부족합니다
            }
        }

        mv.addObject("myRecord",record);
        mv.addObject("curCoin",curCoin);

        return mv;
    }

    @GetMapping("/record")
    public ModelAndView recordCoin(@RequestParam String signup_id) {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/Pay/RecordCoin");

        int curCoin = (coinDAO.getMyCurrentCoinById(signup_id)/100);
        List<ChargeNRefundDTO> record = coinDAO.getMyCoinRecordById(signup_id);

        for(ChargeNRefundDTO i : record){
            
            Date date = java.sql.Timestamp.valueOf(i.getPayChargeDate());
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd a HH:mm");
            i.setLocalDateTimeToDate(simpleDateFormat.format(date));

            // 충전 주문을 통한 지불인지 확인
            boolean resultIsCharge = i.getPayImpUid().substring(0,3).equals("imp");

            if(resultIsCharge) {
                i.setPayImpUid("코인 충전"); // 코인 충전기록이라고 알려줌
            }
        }

        mv.addObject("myRecord",record);
        mv.addObject("curCoin",curCoin);

        return mv;
    }
}
