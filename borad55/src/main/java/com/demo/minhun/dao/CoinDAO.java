package com.demo.minhun.dao;

import com.demo.minhun.dto.CoinDTO;
import com.demo.minhun.dto.RefundDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CoinDAO {

    //  코인 충전
    public int ChargeCoin(CoinDTO coinDTO);

    // 나중에라도 내 코인 사용기록을 볼때 대비해서 만들어 둠
    public List<RefundDTO> getMyCoinRecord(String signup_id);
}
