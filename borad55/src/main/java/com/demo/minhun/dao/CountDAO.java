package com.demo.minhun.dao;

import com.demo.minhun.dto.getCountDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CountDAO {

    // 최근 일주일 생성된 글 수
    public List<getCountDTO> getSevenDaysBoardCount();

    // 최근 일주일 생성된 댓글 수
    public List<getCountDTO> getSevenDaysReplyCount();

    // 가입 경로 통계 가져오기
    public List<getCountDTO> getSingupData();

    public getCountDTO RatioCalculator();

}
