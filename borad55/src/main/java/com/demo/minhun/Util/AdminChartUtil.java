package com.demo.minhun.Util;

import com.demo.minhun.dto.getAllUserRecordDTO;
import lombok.Data;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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

}
