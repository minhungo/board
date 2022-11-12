package com.demo.minhun.controller;

import com.demo.minhun.dto.openbank.*;
import com.demo.minhun.service.OpenBankService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@RequiredArgsConstructor
@Controller
public class openBakingAPIController {

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

    private String useCode = "0900401111"; // 핀테크번호+U -> 거래고유번호 생성기
    private String clientId = "1edae6d3-8b2c-485c-be9c-8782bb64fd74";
    private String client_secret = "0b3f2d48-e48e-4033-8de0-a952d3dbcdac";
    private String access_token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDE1OTY4Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2NzU5MjI4ODMsImp0aSI6IjI0YjUzNTE4LTA2ZmQtNDI2Ny05YTdjLWMyODAwYTg4Yjk4MCJ9.sh7LwrLuq4ltnaud-CKkEoHckEkbrY_rjbSidfU7n8M";

    private String redirect_uri = "http://localhost:8888/callback";
    private String base_url = "https://testapi.openbanking.or.kr/v2.0";

    private final OpenBankService openBankService;

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
    @GetMapping("/callback")
    public String getToken(BankRequestTokenTwoLeg bankRequestTokenTwoLeg, Model model){
        System.out.println(bankRequestTokenTwoLeg);

        BankReponseTokenTwoLeg token = openBankService.requestTokenTwoLeg(bankRequestTokenTwoLeg);
        System.out.println("access token : "+token.getAccess_token());

        Random r = new Random();
        int num = r.nextInt(999999999);
        String Code = useCode + "U" + num;

        checkMyAccountRequestDTO cmarDTO = new checkMyAccountRequestDTO();
        cmarDTO.setAccess_token(token.getAccess_token());
        cmarDTO.setBank_tran_id(Code);
        cmarDTO.setBank_code_std("090");
        cmarDTO.setAccount_num(bankRequestTokenTwoLeg.getAccount_num());
        cmarDTO.setAccount_holder_info_type(bankRequestTokenTwoLeg.getAccount_holder_info_type());
        cmarDTO.setAccount_holder_info(bankRequestTokenTwoLeg.getAccount_holder_info());

        Date today = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String now = simpleDateFormat.format(today);
        cmarDTO.setTran_dtime(now);

        checkMyAccountResponseDTO account = openBankService.checkMyAccount(cmarDTO);
        model.addAttribute("account", account);

        System.out.println(account);

        return "Pay/checkMyAccount";
    }


//    /**
//     * 계좌이체
//     * 계좌이체 처리 테스트에 등록된 값만 계좌이체가능!!
//     */
//    @GetMapping("/transfer")
//    public String openTransfer(Model model, String bank_tran_id,String access_token, String fintech_use_num, String account_num, String req_client_name){
//        /**
//         * 20000, 100000원만 등록되어있음
//         */
//        //계좌번호 마스킹된값 제거(계좌번호 보여주는건 계약된 사용자만가능(그래서 마스킹된 3자리 잘라서 보내주고 클라이언트에서 3자리 더해줌
//        model.addAttribute("token", access_token);
//        model.addAttribute("transferForm",new AccountTransferRequestDto(openBankutil.getRandomNumber(bank_tran_id),fintech_use_num,req_client_name,openBankutil.trimAccountNum(account_num, account_num.length()),openBankutil.trimAccountNum(account_num, account_num.length())));
//        return "v1/transferForm";
//    }
//
//    @PostMapping("/transfer")
//    public @ResponseBody AccountTransferResponseDto transfer(String access_token, AccountTransferRequestDto accountTransferRequestDto){
//        return openBankService.accountTransfer(access_token,accountTransferRequestDto);
//    }

}
