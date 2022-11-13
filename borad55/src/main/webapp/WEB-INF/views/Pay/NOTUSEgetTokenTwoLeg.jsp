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
   <title>getToken</title>
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
    </style>


</head>
<body>
     <input type="hidden" id="scope" value="oob"/>

     <input type="hidden" id="account_holder_info_type" value=" "/>
     성명<input type="text" id="account_name"/><br>
     주민등록번호 앞 6자리<input type="number" id="account_holder_info"/><br>
     은행명<select name="bank_name" id="bank_name">
             <option value="">선택</option>
             <option value="오픈은행">오픈은행</option>
           </select><br>
     계좌번호<input type="number" id="account_num"/><br>
     <button type="button" onclick="return checkMyAccount()">계좌실명조회</button>

     <script>
        function checkMyAccount() {
            var Scope = $('#scope').val();
            var accountHolderInfoType = $('#account_holder_info_type').val();
            var accountName = $('#account_name').val();
            var accountHolderInfo = $('#account_holder_info').val();
            var bankName = $('#bank_name').val();
            var accountNum = $('#account_num').val();

            if(accountName == ''){
                alert("성명을 입력해주세요.");
                return false;
            }
            if(accountHolderInfo == ''){
                alert("주민등록번호 앞 6자리를 입력해주세요.");
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
                    account_num : accountNum
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
                        alert('환전 신청 완료되었습니다.');
                        window.close();
                    }else{
                        alert('입력하신 정보와 계좌 정보가 다릅니다.');
                    }

                },
                error : function(err) {
                    alert('네트워크 통신에 실패하였습니다.\n 잠시후에 다시 시도해주세요.');
                }
            }); // end ajax

        } // end Function
     </script>
</body>
</html>