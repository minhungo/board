
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
            $.ajax({
                url : '/cancelIamport',
                type : 'POST',
                contentType: 'application/json',
                dataType: 'json',
                data : JSON.stringify({
                    reason : "단순변심환불", // 가맹점 클라이언트로부터 받은 환불사유
                    imp_uid : impUid, // imp_uid를 환불 `unique key`로 입력
                    amount: nine, // 가맹점 클라이언트로부터 받은 환불금액
                    checksum: amount, // [권장] 환불 가능 금액 입력
                }),
                success : function(res){
                    alert("환불처리 되었습니다.");
                    window.opener.location.href = window.opener.document.URL;
                    window.close();
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
    if(radioVal == undefined){
        alert("환불할 결제건을 지정해주세요. \n환불 가능한 결제건이 없다면 환불할 수 없습니다.");
        return false;
    }
    if(confirm("해당 결제건을 환불하시겠습니까?")){
        refund(radioVal);
    }else{
        return false;
    }
});

$('#cancel').click(function () {
    window.close();
});