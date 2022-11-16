package com.demo.minhun.dao;

import com.demo.minhun.dto.ChargeNRefundDTO;
import com.demo.minhun.dto.getAllUserRecordDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CoinDAO {

    public List<getAllUserRecordDTO> AllUserChargeRecord();
    //  코인 충전
    public int ChargeCoin(ChargeNRefundDTO coinDTO);
    // 코인 환불
    public int refundCoin(ChargeNRefundDTO coinDTO);
    // 코인 기록 가져오기
    public List<ChargeNRefundDTO> getMyCoinRecordById(String signup_id);
    public int getMyCurrentCoinById(String signup_id);
    public int getMyPossibleRefundCoinById(String signup_id);
    public List<ChargeNRefundDTO> getMyCoinRecordByNickname(String signup_nickname);
    public ChargeNRefundDTO getMyCurrentCoinByNickname(String signup_nickname);

    public ChargeNRefundDTO getMyIdByNickname(String signup_id);

}
