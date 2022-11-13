$('#charge_kakao').click(function () {
    // getter
    var IMP = window.IMP;
    IMP.init('imp30545876');
    var money = $('input[name="cp_item"]:checked').val();
    console.log(money);

    IMP.request_pay({
                pg: 'kakaopay',
                merchant_uid: 'merchant_' + new Date().getTime(),
                pay_method : 'card',
                name: '카카오페이결제',
                amount: money,
                buyer_id: ${profile.signup_id},
                buyer_email: ${profile.signup_email},
                buyer_name: ${profile.signup_nickname},
                buyer_addr: ${profile.signup_adr},
                buyer_tel : ${profile.signup_email},
                buyer_postcode: ${profile.signup_adr_point}
            }, function (rsp) {
                console.log(rsp);
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    $.ajax({
                        type: "POST",
                        url: "/charge/coin", //충전 금액값을 보낼 url 설정
                        dataType: 'json',
                        contentType: 'application/json',
                        data: JSON.stringigy({
                            "payAmount" : rsp.paid_amount / 100,
                            "signupId" : buyer_id
                        }),
                    });
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
                window.close();
            });
        });