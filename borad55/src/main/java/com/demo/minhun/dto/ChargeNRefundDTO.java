package com.demo.minhun.dto;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;
@Data
public class ChargeNRefundDTO {

    private String signup_id;
    private String signup_name;
    private String signup_nickname;
    private String signup_email;
    private String signup_adr;
    private String signup_adr_point;
    private String signup_data;
    private int signup_num;
    private int signup_point;
    private Date signup_date;
    private String signup_grade;

    /*
    * private int signup_coin;
    *
    * 湲곗〈�뿉 肄붿씤 媛��닔瑜� 蹂댁뿬二쇰뜕 �뿴媛� signup �뀒�씠釉붿뿉�꽌 �궘�젣�븿
    * Coin �뀒�씠釉붿뿉�꽌 currentCoin �뿴�쓣 異붽��빐�꽌 ���떊�븿
    *
    */

    // �씠誘몄� �뙆�씪
    private String signup_profle_img;

    // 寃곗젣�맂 湲덉븸�쓣 ���옣
    private Long payAmount;

    // 寃곗젣�씪
    private LocalDateTime payChargeDate;

    // 寃곗젣�옄 �븘�씠�뵒
    private String signupId;

    // �븘�엫�룷�듃�뿉�꽌 援щ텇�븯�뒗 pk
    private String payImpUid;

    // �솚遺덊븯湲� �쐞�빐 �겢�씪�씠�뼵�듃濡쒕��꽣 �쟾�떖諛쏆� 二쇰Ц踰덊샇
    private String payMerchantUid;

    // �쁽�옱 肄붿씤 媛��닔
    // 而⑦듃濡ㅻ윭瑜� �넻�빐�꽌 媛��졇�삩 媛�(湲곕줉) 以� 寃곗젣湲덉븸�쓣 �겢�씪�씠�뼵�듃�뿉�꽌 蹂닿린 �렪�븳 �삎�깭濡� 媛�怨듯빐�꽌 �솚遺덊럹�씠吏�濡� �꽆湲몃븣 �븘�슂�븳 蹂��닔
    private Long currentCoin;

    // �솚遺� 媛��뒫�븳吏� �뙋�떒�슜 number 媛��뒫 : 1 , 遺덇� : 洹� �쇅 �닽�옄
    private Long possibleRefund;

    // 而⑦듃濡ㅻ윭瑜� �넻�빐�꽌 媛��졇�삩 媛�(湲곕줉) 以� �떆媛꾩쓣 �겢�씪�씠�뼵�듃�뿉�꽌 蹂닿린 �렪�븳 �삎�깭濡� 媛�怨듯빐�꽌 �솚遺덊럹�씠吏�濡� �꽆湲몃븣 �븘�슂�븳 蹂��닔
    private String localDateTimeToDate;

}
