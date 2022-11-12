package com.demo.minhun.service;

import com.demo.minhun.dto.openbank.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class OpenBankService {
    private final OpenBankApiClient openBankApiClient;

    // 3-leg 인증
    public BankReponseToken requestToken(BankRequestToken bankRequestToken){
        return openBankApiClient.requestTokenThreeleg(bankRequestToken);
    }

    // 2-leg 인증
    public BankReponseTokenTwoLeg requestTokenTwoLeg(BankRequestTokenTwoLeg bankRequestTokenTwoLeg){
        return openBankApiClient.requestTokenTowleg(bankRequestTokenTwoLeg);
    }

    // 내 계좌 조회
    public BankAcountSearchResponseDto findAccount(AccountSearchRequestDto accountSearchRequestDto){
        return openBankApiClient.requestAccountList(accountSearchRequestDto);
    }

    // 실명 계좌 조회
    public checkMyAccountResponseDTO checkMyAccount(checkMyAccountRequestDTO checkMyAccountRequestDTO){
        return openBankApiClient.checkMyAccount(checkMyAccountRequestDTO);
    }
}
