<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   <title>Charge</title>
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

    table{
        text-align: center;
        margin: 0 auto;
        width: 500px;
    }
    thead tr th{
        padding-top: 20px;
    }
    thead tr th img{
        padding-bottom: 10px;
    }
    tbody tr td{
        width: 120px;
        padding: 10px;
    }
    label{
        width: 100px;
    }
    tfoot tr td{
        color: #ac2925;
        padding-top: 30px;
    }
    </style>


</head>
<body>
     <div class="card-body bg-white mt-0 shadow">
        <input type="hidden" id="hiddenMyCoin" value=""/>
        <table>

            <thead>

                <tr>
                    <th colspan="3">
                        <img src="resources/image/payment_icon_yellow_small.png">
                        <p style="font-weight: bold">?????? ????????????????????? ?????????????????? ???????????????.</p>
                        <p style="font-weight: bold">?????? ???????????? ?????????????????? ??????????????? ???????????????.</p>
                        <p style="font-weight: bold">?????? ??????????????? ?????? ?????? ??????????????????.</p>
                    </th>
                </tr>

            </thead>

            <tbody>

                <tr>
                    <td>
                        <input type="radio" value="5000" class="btn-check" id="success-outlined1" name="options-outlined" autocomplete="off">
                        <label class="btn btn-outline-success" for="success-outlined1"><span>5,000???</span></label>
                    </td>

                    <td>
                        <input type="radio" class="btn-check" id="success-outlined2" name="options-outlined" autocomplete="off" value="10000">
                        <label class="btn btn-outline-success" for="success-outlined2"><span>10,000???</span></label>
                    </td>

                    <td>
                        <input type="radio" class="btn-check" id="success-outlined3" name="options-outlined" autocomplete="off" value="15000">
                        <label class="btn btn-outline-success" for="success-outlined3"><span>15,000???</span></label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <input type="radio" class="btn-check" id="success-outlined4" name="options-outlined" autocomplete="off" value="20000">
                        <label class="btn btn-outline-success" for="success-outlined4"><span>20,000???</span></label>
                    </td>

                    <td>
                        <input type="radio" class="btn-check" id="success-outlined5" name="options-outlined" autocomplete="off" value="25000">
                        <label class="btn btn-outline-success" for="success-outlined5"><span>25,000???</span></label>
                    </td>

                    <td>
                        <input type="radio" class="btn-check" id="success-outlined6" name="options-outlined" autocomplete="off" value="30000">
                        <label class="btn btn-outline-success" for="success-outlined6"><span>30,000???</span></label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <input type="radio" class="btn-check" id="success-outlined7" name="options-outlined" autocomplete="off" value="35000">
                        <label class="btn btn-outline-success" for="success-outlined7"><span>35,000???</span></label>
                    </td>

                    <td>
                        <input type="radio" class="btn-check" id="success-outlined8" name="options-outlined" autocomplete="off" value="40000">
                        <label class="btn btn-outline-success" for="success-outlined8"><span>40,000???</span></label>
                    </td>

                    <td>
                        <input type="radio" class="btn-check" id="success-outlined9" name="options-outlined" autocomplete="off" value="45000">
                        <label class="btn btn-outline-success" for="success-outlined9"><span>45,000???</span></label>
                    </td>
                </tr>

                <tr>
                    <td colspan="3" style="text-align: center;">
                        <input type="radio" class="btn-check" id="success-outlined10" name="options-outlined" autocomplete="off" value="50000">
                        <label class="btn btn-outline-success" for="success-outlined10" style="margin-right: 60px;"><span>50,000???</span></label>

                        <input type="radio" class="btn-check" id="success-outlined11" name="options-outlined" autocomplete="off" value="100000">
                        <label class="btn btn-outline-success" for="success-outlined11"><span>100,000???</span></label>
                    </td>

                </tr>

            </tbody>

            <tfoot>

                <tr>
                    <td colspan="3">
                        <p>
                            ????????? 1?????? 100?????????, ?????? 5000?????????
                        </p>
                        <p>
                            ?????? 100,000????????? ?????? ???????????????.
                        </p>
                    </td>
                </tr>

            </tfoot>

        </table>

        <br>
        <button type="button"
          class="btn btn-primary"
          style="display:inline-block; width:80px; height:30px; border:0px solid white; border-radius:20px; font-size:14px;" id="charge_kakao">

            ????????????

        </button>

        <button type="button"
          class="btn btn-primary"
          style="display:inline-block; width:80px; height:30px; border:0px solid white; border-radius:20px; font-size:14px;" id="exchange">

            ????????????

        </button>

        <button type="button"
            class="btn btn-primary"
            style="display:inline-block; width:80px; height:30px; border:0px solid white; border-radius:20px; background-color:red; font-size:14px;"
            id="refund_coin">

            ????????????

        </button>

        <button type="button"
            class="btn btn-primary"
            style="display:inline-block; width:80px; height:30px; border:0px solid white; border-radius:20px; font-size:14px;"
            id="record_coin">

            ????????????

        </button>

        <button type="button"
            class="btn btn-primary"
            style="display:inline-block; width:80px; height:30px; border:0px solid white; border-radius:20px; background-color:#c1c1c1; font-size:14px; float:right"
            id="cancel_kakao">

            ??????

        </button>

     </div>

<script type="text/javascript">
    // ?????? ???????????? ???????????? ???????????? js????????? resource?????? ?????????????????????
    // ?????????????????? ???????????? ???????????? ??????????????? ????????? ??????????????? /body ?????? ?????? ?????? ?????????
    var buyerId = "${profile.signup_id}";
    var currentCoin;
    $(function (){
        var select_usercoin = "${profile.signup_id}";

        $.ajax({
            url : '/MyCoin',
            type : 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data : JSON.stringify({
                signup_id : select_usercoin
            }),
            success : function(result) {
                $("#hiddenMyCoin").val(result);
                currentCoin = result;

                $('#charge_kakao').click(function () {
                    var money = $('input[name="options-outlined"]:checked').val();

                    // if radio ???????????? ????????? alert ??? ?????? ?????? ??????????????? ????????????
                    if(money == undefined){
                        alert("??????????????? ??????????????????.");
                        return false;
                    }

                    // ?????? ??????
                    var IMP = window.IMP;
                    IMP.init('imp30545876');

                    IMP.request_pay({
                                pg: 'kakaopay',
                                merchant_uid: 'merchant_' + new Date().getTime(),
                                pay_method : 'card',
                                name: '?????????????????????',
                                amount: money,
                                buyer_id: buyerId,
                                buyer_email: "${profile.signup_email}",
                                buyer_name: "${profile.signup_nickname}",
                                buyer_addr: "${profile.signup_adr}",
                                buyer_tel : "${profile.signup_email}",
                                buyer_postcode: "${profile.signup_adr_point}",
                            }, function (rsp) { // callback
                            	if ( rsp.success ) {
                                // console.log(rsp); ??????????????????
            	                    $.ajax({
            	                        type: "post",
            	                        url: "/verifyIamport/" + rsp.imp_uid ,
            	                    }).done(function(data){
            	                        console.log(data); //??????????????????
            	                        if(money == data.response.amount){
            	                        	var coin = money / 100;
            	                        	// var total = parseInt(currentCoin) + coin;
            	                            $.ajax({
            	                                type: "POST",
            	                                url: "/charge/coin", //?????? ???????????? ?????? url ??????
            	                                dataType: 'json',
            	                                contentType: 'application/json',
            	                                data: JSON.stringify({
            	                                    "payAmount" : data.response.amount,
            	                                    "signupId" : buyerId,
            	                                    "payImpUid" : data.response.impUid,
            	                                    "payMerchantUid" : data.response.merchantUid,
            	                                    "possibleRefund" : 1
            	                                })
            	                            });
            	                            var msg = '????????? ?????????????????????.';
            	                            msg += '\n?????? ?????? : ' + rsp.paid_amount + ' ???';
            	                            msg += '\n????????? ?????? ??????: ' + money / 100 + ' Coin';
            	                            
            	                            alert(msg);
            	                            
            	                         	// ?????? ??? ??? ????????? ???????????? ????????? ????????????
            	            		        // opener.parent.location.reload();
            	            		        window.opener.location.href = window.opener.document.URL;
            	            		
            	            		        // ?????? ??? ??????
            	            		        window.close();
            	            		        
            	                        }else{
            	                            var msg = '????????? ?????????????????????.';
            	                            msg += '\n????????? ????????? ????????? ????????? ?????? ????????? ?????????????????????????????????.';
            	                            
            	                            alert(msg);
            	                            
            	                         	// ?????? ??? ??? ????????? ???????????? ????????? ????????????
            	            		        // opener.parent.location.reload();
            	            		        window.opener.location.href = window.opener.document.URL;
            	            		
            	            		        // ?????? ??? ??????
            	            		        window.close();
            	                        }
            	                    });
                            	} else {
                            	    var err = rsp.error_msg;
                            	    if(err == "[????????????] ???????????? ????????? ?????????????????????"){
                                        var msg = '????????? ?????????????????????.';
                                        alert(msg);
                                        window.opener.location.href = window.opener.document.URL;

                                        // ?????? ??? ??????
                                        window.close();
                            	    }else{
                                        var msg = '????????? ?????????????????????.';
                                        msg += '\n?????? ?????? ?????? ??????????????????.';

                                        alert(msg);

                                        // ?????? ??? ??? ????????? ???????????? ????????? ????????????
                                        // opener.parent.location.reload();
                                        window.opener.location.href = window.opener.document.URL;

                                        // ?????? ??? ??????
                                        window.close();
                                    }
                            	}
                            });
                    
                        });
            },
            error : function() {
                alert("???????????? ?????? ????????? ?????????????????????.\n????????? ????????? ????????? ??? ????????????.");
            }
        });
    });

    $('#cancel_kakao').click(function () {
        window.close();
    });
    $('#refund_coin').click(function () {
        window.location.href = '/refund?signup_id='+buyerId;
    });
    $('#record_coin').click(function () {
        window.location.href = '/record?signup_id='+buyerId;
    });
    $('#exchange').click(function () {
        window.location.href = '/change?signup_id='+buyerId;
    });

</script>
</body>
</html>