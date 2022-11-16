<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device=width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<meta charset="UTF-8">
   <title>changeCoin</title>
<style>
    *{ margin:0px; padding:0px; font-family:Helvetica, Arial, sans-serif;}
    ul{
    list-style:none;
    margin:0;
    padding:0;
    }

    ul li {
    display:inline-block;
    clear:both;
    padding:10px;
    border-radius:20px;
    margin-bottom:2px;
    }

    .him{

    float:left;
    margin-left:10px;
    position: relative;
    word-break:break-all;
    background: #dedede;

    }
    .him:after {
       right: 100%;
       top: 50%;
       border: solid transparent;
       content: "";
       height: 0;
       width: 0;
       position: absolute;
       pointer-events: none;
       border-color: rgba(222, 222, 222, 0);
       border-right-color: #dedede;
       border-width: 5px;
       margin-top: -5px;
       border-left: 0;
    }

    .him:before {
       border-color: rgba(194, 225, 245, 0);
       border-right-color: #c2e1f5;
       border-width: 9px;
       margin-top: -9px;
    }




    .me{
    float:right;
    margin-right:10px;

    position: relative;
    background: #685140;
    word-break:break-all;
     color: #ffffff;
    <!--

    }
      .me:after {
    left: 100%;
       top: 50%;
       border: solid transparent;
       content: "";
       height: 0;
       width: 0;
       position: absolute;
       pointer-events: none;
       border-color: rgba(136, 183, 213, 0);
       border-left-color: #604c3e;
       border-width: 5px;
       margin-top: -5px;
    }
    .me:before {
       border-color: rgba(194, 225, 245, 0);
       border-right-color: #c2e1f5;
       border-width: 9px;
       margin-top: -9px;
    }




    .him + .me{
    border-bottom-right-radius:5px;

    }
    .me + .me{
    border-top-right-radius:5px;
    border_bottom-right-radius:5px;
    }

    .me:last-of-type{
    border-bottom-right-radius:20px;
    }

    .wrapper::-webkit-scrollbar {
        width: 10px;
      }
      .wrapper::-webkit-scrollbar-thumb {
        background-color: #0084ff;
        border-radius: 10px;
        background-clip: padding-box;
        border: 2px solid transparent;
      }
      .wrapper::-webkit-scrollbar-track {
        background-color: white;
        border-radius: 10px;
        box-shadow: inset 0px 0px 5px white;
      }

    .pstyle1 {
        color: #ac2925;
        margin: 30px 0 30px 10px;
    }
    </style>


</head>
<body>
     <div class="card-body bg-white mt-0 shadow">
        <h2>코인환전</h2>
        <div class="pstyle1">
            <p>코인 1개당 100원이며 환전시 수수료 10%를 제외한 금액을 환전합니다.</p>
            <p>회원가입 선물로 받으신 코인 100개는 환전할 수 없습니다.</p>
        </div>

        <table class="table table-hover">
            <thead class="table-light">
                <tr>
                    <th scope="col"><h4><b><i>현재 환전가능한 코인</i></b></h4></th>
                    <th><h4><b><i>${curCoin} </i> Coin</b></h4></th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <th scope="row">환전할 코인</th>
                    <td><input type="number" min="0" max="${curCoin}" id="changeCoin" placeholder="0"/> Coin</td>
                </tr>
                <tr>
                    <th scope="row">입금 은행</th>
                    <td>
                        <select name="bank_name" id="bank_name">
                             <option value="">선택</option>
                             <option value="오픈은행">오픈은행</option>
                             <option value="오픈은행">금결원api는</option>
                             <option value="오픈은행">테스트할때</option>
                             <option value="오픈은행">오픈은행만</option>
                             <option value="오픈은행">지원합니다</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th scope="row">입금계좌번호</th>
                    <td><input type="number" id="account_num" placeholder="'-'를 제외하고 입력해주세요."/></td>
                </tr>
                <tr>
                    <th scope="row">성명</th>
                    <td><input type="text" id="account_name" placeholder="홍길동"/></td>
                </tr>
                <tr>
                    <th scope="row">주민등록번호 앞 6자리</th>
                    <td><input type="number" id="account_holder_info" placeholder="880101"/></td>
                </tr>
                <input type="hidden" id="scope" value="oob"/>
                <input type="hidden" id="account_holder_info_type" value=" "/>
            </tbody>

        </table>

        <button type="button"
          class="btn btn-primary"
          style="display:inline-block; width:80px; height:30px; border:0px solid white; border-radius:20px; font-size:14px;"
          id="refund">

            환전하기

        </button>

        <button type="button"
            class="btn btn-primary"
            style="display:inline-block; width:80px; height:30px; border:0px solid white; border-radius:20px; background-color:#c1c1c1; font-size:14px;"
            id="cancel">

            닫기

        </button>
     </div>

<script type="text/javascript">
    // 환불하기
    $('#refund').click(function () {
        let coin = $('#changeCoin').val();
        let Scope = $('#scope').val();
        let accountHolderInfoType = $('#account_holder_info_type').val();
        let accountName = $('#account_name').val();
        let accountHolderInfo = $('#account_holder_info').val();
        let bankName = $('#bank_name').val();
        let accountNum = $('#account_num').val();

        if(coin == ''){
            alert('환전할 코인 갯수를 입력해주세요');
            $('#changeCoin').focus();
            return false;
        }else if(coin > ${curCoin}){
            alert('환전할 코인의 갯수가 가지고 계신 코인보다 많습니다.');
            $('#changeCoin').focus();
            return false;
        }else if(coin == 0){
            alert('환전할 코인의 갯수는 0개보다 많아야합니다.');
            $('#changeCoin').focus();
            return false;
        }

        if(bankName == ''){
            alert("은행을 선택해주세요.");
            return false;
        }
        if(accountNum == ''){
            alert("계좌번호를 입력해주세요.");
            return false;
        }
        if(accountName == ''){
            alert("성명을 입력해주세요.");
            return false;
        }
        if(accountHolderInfo == ''){
            alert("주민등록번호 앞 6자리를 입력해주세요.");
            return false;
        }


        $.ajax({
            url : "/callback",
            type : 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data : JSON.stringify({
                scope : Scope,
                account_holder_info_type : accountHolderInfoType,
                account_name : accountName,
                account_holder_info : accountHolderInfo,
                bank_name : bankName,
                account_num : accountNum,
                coinAmount : coin,
                signupID : "${profile.signup_id}"
            }),
            success : function(data) {
                var accountInfo = data;
                console.log(accountInfo);
                if(
                    (accountInfo.account_holder_name == accountName)
                    &&(accountInfo.bank_name == bankName)
                    &&(accountInfo.account_num == accountNum)
                    &&(accountInfo.account_holder_info == accountHolderInfo)
                ) {
                    alert('환전 신청 완료되었습니다.\n소요기간은 약 2주입니다.');
                    window.close();
                }else{
                    alert('입력하신 정보와 계좌 정보가 다릅니다.');
                }

            },
            error : function(err) {
                alert('네트워크 통신에 실패하였습니다.\n 잠시후에 다시 시도해주세요.');
            }
        }); // end ajax
    });
    $('#cancel').click(function () {
        window.close();
    });
</script>
</body>
</html>