package com.demo.minhun.service;

import com.demo.minhun.dto.openbank.*;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;


@RequiredArgsConstructor
@Service
public class OpenBankApiClient {
    private final HttpHeaders httpHeaders;
    private final RestTemplate restTemplate;

    private String useCode = "nCrqD44EQ27rDPSGKQOVSIrGfP7nJ4"; // 핀테크번호+U -> 거래고유번호 생성기
    private String clientId = "1edae6d3-8b2c-485c-be9c-8782bb64fd74";
    private String client_secret = "0b3f2d48-e48e-4033-8de0-a952d3dbcdac";

    private String redirect_uri = "http://localhost:8888/callback";
    private String base_url = "https://testapi.openbanking.or.kr/v2.0";

    private String real_url = "https://openapi.openbanking.or.kr/v2.0";

    /**
     * 헤더에 엑세스 토큰넣기 3-leg
     */
    public HttpHeaders setHeader(String access_token){
        httpHeaders.add("Authorization", "Bearer "+access_token);
        return httpHeaders;
    }

    /**
     * 헤더에 엑세스 토큰넣기 2-leg
     */
    public HttpHeaders setHeaderTwoLeg(String access_token){
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        httpHeaders.add("Authorization", "Bearer "+access_token);
        return httpHeaders;
    }

    /**
     * 이용기관 토큰발급 API (3-legged)
     */
    public BankReponseToken requestTokenThreeleg(BankRequestToken bankRequestToken){
        //post 방식으로 key=vale 데이터 요청 (금결원)
        //http 헤더 오브젝트 생성
        httpHeaders.add("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
        //httpBody 오브젝트 생성
        bankRequestToken.setBankRequestToken(clientId,client_secret,redirect_uri,"authorization_code");
        //헤더의 컨텐트 타입이 application/x-www-form-urlencoded;charset=UTF-8이므로 객체를 집어넣을수 없음.. 그러므로 MultiValueMap 사용 해야함
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("code",bankRequestToken.getCode());
        parameters.add("client_id",bankRequestToken.getClient_id());
        parameters.add("client_secret",bankRequestToken.getClient_secret());
        parameters.add("redirect_uri",bankRequestToken.getRedirect_uri());
        parameters.add("grant_type",bankRequestToken.getGrant_type());
        // HttpHeader 와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String,String>> param =
                new HttpEntity<>(parameters,httpHeaders);
        //Http 요청하기 - post 방식으로
        return restTemplate.exchange("https://testapi.openbanking.or.kr/oauth/2.0/token", HttpMethod.POST, param, BankReponseToken.class).getBody();
    }

    /**
     * 이용기관 토큰발급 API (2-legged)
     */
    public BankReponseTokenTwoLeg requestTokenTowleg(BankRequestTokenTwoLeg bankRequestTokenTwoLeg){
        //post 방식으로 key=vale 데이터 요청 (금결원)
        //http 헤더 오브젝트 생성
        httpHeaders.add("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
        //httpBody 오브젝트 생성
        bankRequestTokenTwoLeg.setBankRequestToken(clientId,client_secret,bankRequestTokenTwoLeg.getScope(),"client_credentials");
        //헤더의 컨텐트 타입이 application/x-www-form-urlencoded;charset=UTF-8이므로 객체를 집어넣을수 없음.. 그러므로 MultiValueMap 사용 해야함
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("client_id",bankRequestTokenTwoLeg.getClient_id());
        parameters.add("client_secret",bankRequestTokenTwoLeg.getClient_secret());
        parameters.add("scope",bankRequestTokenTwoLeg.getScope());
        parameters.add("grant_type",bankRequestTokenTwoLeg.getGrant_type());
        // HttpHeader 와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String,String>> param =
                new HttpEntity<>(parameters,httpHeaders);
        //Http 요청하기 - post 방식으로
        return restTemplate.exchange("https://testapi.openbanking.or.kr/oauth/2.0/token", HttpMethod.POST, param, BankReponseTokenTwoLeg.class).getBody();
    }

    /**
     * 내계좌조회
     */
    public BankAcountSearchResponseDto requestAccountList(AccountSearchRequestDto accountSearchRequestDto){
        String url = base_url+"/account/list";
        HttpEntity<String> openBankAcountSerchRequest = new HttpEntity<>(setHeader(accountSearchRequestDto.getAccess_token()));
        UriComponents builder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("user_seq_no", accountSearchRequestDto.getUser_seq_no())
                .queryParam("include_cancel_yn", accountSearchRequestDto.getInclude_cancel_yn())
                .queryParam("sort_order", accountSearchRequestDto.getSort_order())
                .build();

        return restTemplate.exchange(builder.toUriString(), HttpMethod.GET, openBankAcountSerchRequest, BankAcountSearchResponseDto.class).getBody();
    }

    /**
     * 실명계좌조회
     */
    public checkMyAccountResponseDTO checkMyAccount(checkMyAccountRequestDTO checkMyAccountRequestDTO){
        String url = base_url+"/inquiry/real_name";

        HttpHeaders header = setHeaderTwoLeg(checkMyAccountRequestDTO.getAccess_token());

        JSONObject bodyParam = new JSONObject();
        bodyParam.put("bank_tran_id", checkMyAccountRequestDTO.getBank_tran_id());
        bodyParam.put("bank_code_std", checkMyAccountRequestDTO.getBank_code_std());
        bodyParam.put("account_num", checkMyAccountRequestDTO.getAccount_num());
        bodyParam.put("account_holder_info_type",checkMyAccountRequestDTO.getAccount_holder_info_type());
        bodyParam.put("account_holder_info",checkMyAccountRequestDTO.getAccount_holder_info());
        bodyParam.put("tran_dtime",checkMyAccountRequestDTO.getTran_dtime());

        HttpEntity <?> checkMyAcountRequest = new HttpEntity <>(bodyParam, header);

        UriComponents builder = UriComponentsBuilder.fromHttpUrl(url).build();

        return restTemplate.exchange(builder.toUriString(), HttpMethod.POST, checkMyAcountRequest, checkMyAccountResponseDTO.class).getBody();

    }
}
