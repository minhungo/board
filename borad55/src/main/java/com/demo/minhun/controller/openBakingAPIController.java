package com.demo.minhun.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.demo.minhun.dao.CoinDAO;
import com.demo.minhun.dto.ChargeNRefundDTO;
import com.demo.minhun.dto.openbank.BankReponseTokenTwoLeg;
import com.demo.minhun.dto.openbank.BankRequestTokenTwoLeg;
import com.demo.minhun.dto.openbank.MailDTO;
import com.demo.minhun.dto.openbank.checkMyAccountRequestDTO;
import com.demo.minhun.dto.openbank.checkMyAccountResponseDTO;
import com.demo.minhun.service.OpenBankService;
import com.demo.minhun.service.SendMailService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class openBakingAPIController {

    @Autowired
    CoinDAO coinDAO;

    @Autowired
    private SendMailService sendMailService;

    private final HttpSession session;

    /**
     * clientID = 	318b30f8-87cc-4e10-aff2-027ebd3e3b3a
     * http://localhost:8080/auth/openbank/callback
     * Client Secret = 5081186a-2d57-49cb-ab45-03dc853079b8
     *
     * 토큰 발급 요청 주소(POST)
     * https://testapi.openbanking.or.kr/oauth/2.0/token
     * code <authorization_code> Y 사용자인증 성공 후 획득한 Authorization Code
     *
     * client_id <client_id> (Max: 40 bytes) Y 오픈뱅킹에서 발급한 이용기관 앱의 Client ID
     *
     * client_secret <client_secret> (Max: 40 bytes) Y 오픈뱅킹에서 발급한 이용기관 앱의 Client Secret
     *redirect_uri <callback_uri> Y
     *
     * Access Token을 전달받을 Callback URL
     *
     * (Authorization Code 획득 시 요청했던 Callback URL)
     * grant_type
     */

    private String useCode = "M202202192"; // 이용기관번호+U+랜덤9자리 -> 거래고유번호 생성기
    private String clientId = "1edae6d3-8b2c-485c-be9c-8782bb64fd74";
    private String client_secret = "0b3f2d48-e48e-4033-8de0-a952d3dbcdac";

    private String redirect_uri = "http://localhost:8888/callback";
    private String base_url = "https://testapi.openbanking.or.kr/v2.0";

    private final OpenBankService openBankService;
    
    private final Map<String, String> map = Map.of("산업은행","002", "기업은행", "003", "국민은행", "004", "우리은행", "020", "우체국", "071", "하나은행", "081"
    		, "신한은행", "088", "케이은행", "089", "카카오은행", "090", "오픈은행", "097");


    // 토큰요청 및 전체계좌 조회
//    @GetMapping("/callback")
//    public String getToken(BankRequestToken bankRequestToken, Model model){
//        BankReponseToken token = openBankService.requestToken(bankRequestToken);
//        System.out.println("access token : "+token.getAccess_token());
//
//        AccountSearchRequestDto asrDTO = new AccountSearchRequestDto();
//        asrDTO.setAccess_token(token.getAccess_token());
//        asrDTO.setUser_seq_no(token.getUser_seq_no());
//        asrDTO.setInclude_cancel_yn("N");
//        asrDTO.setSort_order("D");
//
//        Random r = new Random();
//        int num = r.nextInt(999999999);
//        String Code = useCode + "U" + num;
//
//        BankAcountSearchResponseDto account = openBankService.findAccount(asrDTO);
//
//        model.addAttribute("bankAccounts",account);
//        model.addAttribute("access_token",token.getAccess_token());
//        model.addAttribute("useCode",Code);
//
//        return "Pay/getMyBankAccount";
//    }

    // 토큰요청 및 실명 계좌 조회
    @PostMapping("/callback")
    public checkMyAccountResponseDTO getToken(@RequestBody BankRequestTokenTwoLeg bankRequestTokenTwoLeg){
        System.out.println(bankRequestTokenTwoLeg);

        BankReponseTokenTwoLeg token = openBankService.requestTokenTwoLeg(bankRequestTokenTwoLeg);
        System.out.println("access token : "+token.getAccess_token());

        Random r = new Random();
        String num = "";
        for (int ranI=0; ranI<9; ranI++){
            num += r.nextInt(9);
        }
        String Code = useCode + "U" + num;

        checkMyAccountRequestDTO checkMyAccountRequestDTO = new checkMyAccountRequestDTO();
        checkMyAccountRequestDTO.setAccess_token(token.getAccess_token());
        checkMyAccountRequestDTO.setBank_tran_id(Code);
        checkMyAccountRequestDTO.setBank_code_std(map.get(bankRequestTokenTwoLeg.getBank_name())); // 은행 이름으로 map 에서 value 값을 가져옴
        checkMyAccountRequestDTO.setAccount_holder_info_type(bankRequestTokenTwoLeg.getAccount_holder_info_type());
        checkMyAccountRequestDTO.setAccount_holder_info(bankRequestTokenTwoLeg.getAccount_holder_info());

        Date today = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String now = simpleDateFormat.format(today);
        checkMyAccountRequestDTO.setTran_dtime(now);

        checkMyAccountResponseDTO account = openBankService.checkMyAccount(checkMyAccountRequestDTO);
        if(
                (account.getAccount_holder_info().equals(bankRequestTokenTwoLeg.getAccount_holder_info()))
                &&(account.getAccount_holder_name().equals(bankRequestTokenTwoLeg.getAccount_name()))
                &&(account.getAccount_num().equals(bankRequestTokenTwoLeg.getAccount_num()))
                &&(account.getBank_name().equals(bankRequestTokenTwoLeg.getBank_name()))
        ){
            // 환전 신청한 기록 coin 테이블에 입력
            ChargeNRefundDTO chargeNRefundDTO = new ChargeNRefundDTO();
            chargeNRefundDTO.setPossibleRefund(9l); // 환전

            Long coin = -Long.parseLong(bankRequestTokenTwoLeg.getCoinAmount());
            chargeNRefundDTO.setPayAmount(coin * 100l);

            chargeNRefundDTO.setSignupId(bankRequestTokenTwoLeg.getSignupID());
            chargeNRefundDTO.setPayImpUid("환전신청");
            LocalDateTime localDateTime = LocalDateTime.now();
            chargeNRefundDTO.setPayMerchantUid("merchant " + localDateTime.getNano());
            coinDAO.ChargeCoin(chargeNRefundDTO);
            
            // email로 내용 받기
            String ApplicationForExchange = "";
            ApplicationForExchange += "환전신청코인 : " + bankRequestTokenTwoLeg.getCoinAmount();
            ApplicationForExchange += "\n입금은행 : " + bankRequestTokenTwoLeg.getBank_name();
            ApplicationForExchange += "\n입금계좌번호 : " + bankRequestTokenTwoLeg.getAccount_num();

            MailDTO mailTO = new MailDTO();

            mailTO.setAddress("knuk1101@naver.com");
            mailTO.setTitle(bankRequestTokenTwoLeg.getSignupID()+"님이 환전신청하였습니다.");
            mailTO.setMessage(ApplicationForExchange);
            mailTO.setSend("knuk1101@naver.com");

            
            sendMailService.sendMail(mailTO);
            
        }

        return account;
    }

}
