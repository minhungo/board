package com.demo.minhun.Util;

import com.demo.minhun.dto.getAllUserRecordDTO;
import com.demo.minhun.dto.getCountDTO;
import lombok.Data;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
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
        ArrayList<String> payAmount
                = new ArrayList<>(Arrays.asList("5000", "10000", "15000", "20000", "25000", "30000", "35000", "40000", "45000", "50000", "100000"));
        ArrayList<Integer> record = null;
        List<getCountDTO> getSingupData = null;
        getCountDTO getRatio = null;
        List<getCountDTO> getBoardCount = null;
        List<getCountDTO> getReplyCount = null;

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
        String mkCSVFilename = str + "LSReport.csv";
        BufferedWriter bw = null;

        try {
            File saveFile = new File(uploadPath, mkCSVFilename);
            bw = new BufferedWriter(new FileWriter(saveFile));
            if(!map.isEmpty()){
                for(Map.Entry<String, Object> pair : map.entrySet()){
                    if(pair.getKey().equals("polarArea")){
                        record = (ArrayList<Integer>) map.get("polarArea");
                        bw.write("payAmount, cnt");
                        bw.write("\n");
                        for(int i=0; i<record.size();i++){
                            bw.write(payAmount.get(i));
                            bw.write(",");
                            bw.write(String.valueOf(record.get(i)));
                            bw.write("\n");
                        }
                    }else if(pair.getKey().equals("SingupData")){
                        getSingupData = (List<getCountDTO>) map.get("SingupData");
                        bw.write("recentdate, signup_data, cnt");
                        bw.write("\n");
                        for(int i=0; i<getSingupData.size();i++){
                            bw.write(String.valueOf(getSingupData.get(i).getRecentdate()));
                            bw.write(",");
                            bw.write(String.valueOf(getSingupData.get(i).getSignup_data()));
                            bw.write(",");
                            bw.write(String.valueOf(getSingupData.get(i).getCnt()));
                            bw.write("\n");
                        }
                    }else if(pair.getKey().equals("getRatio")){
                        getRatio = (getCountDTO) map.get("getRatio");
                        bw.write("cntsignup, cntboth, cntboard, cntreply");
                        bw.write("\n");
                        bw.write(String.valueOf(getRatio.getCntsignup()));
                        bw.write(",");
                        bw.write(String.valueOf(getRatio.getCntboth()));
                        bw.write(",");
                        bw.write(String.valueOf(getRatio.getCntboard()));
                        bw.write(",");
                        bw.write(String.valueOf(getRatio.getCntreply()));
                        bw.write("\n");
                    }else if(pair.getKey().equals("getBoardCount")){
                        getBoardCount = (List<getCountDTO>) map.get("getBoardCount");
                        bw.write("boarddate, boardcnt");
                        bw.write("\n");
                        for(int i=0; i<getBoardCount.size();i++){
                            bw.write(String.valueOf(getBoardCount.get(i).getCurdate()));
                            bw.write(",");
                            bw.write(String.valueOf(getBoardCount.get(i).getCnt()));
                            bw.write("\n");
                        }
                    }else{
                        getReplyCount = (List<getCountDTO>) map.get("getReplyCount");
                        bw.write("replydate, replycnt");
                        bw.write("\n");
                        for(int i=0; i<getReplyCount.size();i++){
                            bw.write(String.valueOf(getReplyCount.get(i).getCurdate()));
                            bw.write(",");
                            bw.write(String.valueOf(getReplyCount.get(i).getCnt()));
                            bw.write("\n");
                        }
                    }
                }
            }else{
                bw.write("null");
            }

            bw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
