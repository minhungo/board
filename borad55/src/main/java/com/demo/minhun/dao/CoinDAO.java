package com.demo.minhun.dao;

import com.demo.minhun.dto.CoinDTO;
import com.demo.minhun.dto.ChargeNRefundDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CoinDAO {

    //  코인 충전
    public int ChargeCoin(ChargeNRefundDTO coinDTO);

    // 코인 기록 가져오기
    public List<ChargeNRefundDTO> getMyCoinRecordById(String signup_id);
    public ChargeNRefundDTO getMyCurrentCoinById(String signup_id);
    public List<ChargeNRefundDTO> getMyCoinRecordByNickname(String signup_nickname);
    public ChargeNRefundDTO getMyCurrentCoinByNickname(String signup_nickname);
}
