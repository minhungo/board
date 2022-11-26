package com.demo.minhun.Util;

import com.demo.minhun.dto.getAllUserRecordDTO;
import com.demo.minhun.dto.getCountDTO;
import lombok.Data;

import java.io.*;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class AdminChartUtil {

    public ArrayList<Integer> getRecord(List<getAllUserRecordDTO> allUserChargeRecord){
        ArrayList<Integer> record = new ArrayList<>(Arrays.asList(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
        for (int i = 0; i < allUserChargeRecord.size(); i++) {
            switch (String.valueOf(allUserChargeRecord.get(i).getPayAmount())) {
                case "5000" : record.set(0, allUserChargeRecord.get(i).getCnt());
                    break;
                case "10000" : record.set(1, allUserChargeRecord.get(i).getCnt());
                    break;
                case "15000" : record.set(2, allUserChargeRecord.get(i).getCnt());
                    break;
                case "20000" : record.set(3, allUserChargeRecord.get(i).getCnt());
                    break;
                case "25000" : record.set(4, allUserChargeRecord.get(i).getCnt());
                    break;
                case "30000" : record.set(5, allUserChargeRecord.get(i).getCnt());
                    break;
                case "35000" : record.set(6, allUserChargeRecord.get(i).getCnt());
                    break;
                case "40000" : record.set(7, allUserChargeRecord.get(i).getCnt());
                    break;
                case "45000" : record.set(8, allUserChargeRecord.get(i).getCnt());
                    break;
                case "50000" : record.set(9, allUserChargeRecord.get(i).getCnt());
                    break;
                case "100000" : record.set(10, allUserChargeRecord.get(i).getCnt());
                    break;
            }
        }

        return record;
    }

    public void createCSV(Map<String, Object> map){

        getCountDTO getTotalCount = null;
        List<getCountDTO> getSignupDataCnt = null;
        List<getCountDTO> getSignupGradeCnt = null;
        List<getCountDTO> getViewCntOrderByHit = null;

        String uploadFolder = "C:\\upload";
        Date date = new Date();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String str = sdf.format(date);

        String datePath = str.replace("-", File.separator);
        File uploadPath = new File(uploadFolder, datePath);

        if(uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }

        // csv 파일 생성후 저장
        String mkCSVFilename_score = str + "LSReport_score.csv";
        String mkCSVFilename_list = str + "LSReport_list.csv";
        String mkCSVFilename_circle1 = str + "LSReport_circle1.csv";
        String mkCSVFilename_circle2 = str + "LSReport_circle2.csv";
        String[] CsvFileArr = {mkCSVFilename_score, mkCSVFilename_list, mkCSVFilename_circle1, mkCSVFilename_circle2};

        OutputStreamWriter ow = null;
        BufferedWriter bw_score = null; // 전체 페이지 조회 수 합, 게시글 수, 댓글 수 - 스코어
        BufferedWriter bw_list = null; // 글 조회수
        BufferedWriter bw_circle1 = null; // 유입 경로
        BufferedWriter bw_circle2 = null; // 계급 분포

        try {

            if (!map.isEmpty()) {
                // bw_circle1
                getSignupDataCnt = (List<getCountDTO>) map.get("getSignupDataCnt");

                bw_circle1 = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(uploadPath, CsvFileArr[2])), Charset.forName("UTF-8")));

                bw_circle1.write("Signup_data, cnt");
                bw_circle1.write("\n");
                for (int i = 0; i < getSignupDataCnt.size(); i++) {
                    bw_circle1.write(getSignupDataCnt.get(i).getSignup_data());
                    bw_circle1.write(",");
                    bw_circle1.write(String.valueOf(getSignupDataCnt.get(i).getCnt()));
                    bw_circle1.write("\n");
                }

                // bw_circle2
                getSignupGradeCnt = (List<getCountDTO>) map.get("getSignupGradeCnt");

                bw_circle2 = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(uploadPath, CsvFileArr[3])), Charset.forName("UTF-8")));

                bw_circle2.write("Signup_grade, cnt");
                bw_circle2.write("\n");
                for (int i = 0; i < getSignupGradeCnt.size(); i++) {
                    bw_circle2.write(getSignupGradeCnt.get(i).getSignup_grade());
                    bw_circle2.write(",");
                    bw_circle2.write(String.valueOf(getSignupGradeCnt.get(i).getCnt()));
                    bw_circle2.write("\n");
                }

                // bw_score
                getTotalCount = (getCountDTO) map.get("getTotalCount");

                bw_score = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(uploadPath, CsvFileArr[0])), Charset.forName("UTF-8")));

                bw_score.write("Total View, Board, Reply");
                bw_score.write("\n");
                bw_score.write(String.valueOf(getTotalCount.getCnttotalview()));
                bw_score.write(",");
                bw_score.write(String.valueOf(getTotalCount.getCntboard()));
                bw_score.write(",");
                bw_score.write(String.valueOf(getTotalCount.getCntreply()));
                bw_score.write("\n");

                // bw_list
                getViewCntOrderByHit = (List<getCountDTO>) map.get("getViewCntOrderByHit");

                bw_list = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(uploadPath, CsvFileArr[1])), Charset.forName("UTF-8")));

                bw_list.write("rownum, title, hit");
                bw_list.write("\n");
                for (int i = 0; i < getViewCntOrderByHit.size(); i++) {
                    bw_list.write(String.valueOf(getViewCntOrderByHit.get(i).getRownum()));
                    bw_list.write(",");
                    bw_list.write(String.valueOf(getViewCntOrderByHit.get(i).getBoard_title()));
                    bw_list.write(",");
                    bw_list.write(String.valueOf(getViewCntOrderByHit.get(i).getBoard_hit()));
                    bw_list.write("\n");
                }

            } else {
                bw_score.write("null");
                bw_list.write("null");
                bw_circle1.write("null");
                bw_circle2.write("null");
            }

            bw_score.close();
            bw_list.close();
            bw_circle1.close();
            bw_circle2.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
    }

}
