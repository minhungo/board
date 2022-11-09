
function refund(item) {

    $.ajax({
        url : '/verifyIamport/' + item,
        type : 'POST',
        contentType: 'application/json',
        dataType: 'json',
        data : JSON.stringify({
            reply_idx : item
        }),
        success : function(result) {
            console.log(result.response.impUid);
            const impUid = result.response.impUid;
            const amount = result.response.amount;
            const nine = result.response.amount * 0.9;
            console.log(impUid);
            console.log(amount);
            console.log(nine);
            $.ajax({
                url : '/cancelIamport',
                type : 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data : JSON.stringify({
                    reason : "단순변심환불", // 가맹점 클라이언트로부터 받은 환불사유
                    imp_uid : impUid, // imp_uid를 환불 `unique key`로 입력
                    amount: amount, // 가맹점 클라이언트로부터 받은 환불금액
                    checksum: nine, // [권장] 환불 가능 금액 입력
                }),
                success : function(res){
                    console.log(res);
                },
                error : function() {
                    alert("네트워크 통신 오류가 발생하였습니다.\n잠시 후에 다시 시도해주세요");
                }
            });
        },
        error : function() {
            alert("네트워크 통신 오류가 발생하였습니다.\n잠시 후에 다시 시도해주세요");
        }
    });

};

// 환불하기
$('#refund').click(function () {
    var radioVal = $('input[name="refundImpUid"]:checked').val();
    console.log(radioVal);
    refund(radioVal);
});

$('#cancel').click(function () {
    window.close();
});