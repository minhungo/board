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
        <h2>????????????</h2>
        <div class="pstyle1">
            <p>?????? 1?????? 100????????? ????????? ????????? 10%??? ????????? ????????? ???????????????.</p>
            <p>???????????? ????????? ????????? ?????? 100?????? ????????? ??? ????????????.</p>
        </div>

        <table class="table table-hover">
            <thead class="table-light">
                <tr>
                    <th scope="col"><h4><b><i>?????? ??????????????? ??????</i></b></h4></th>
                    <th><h4><b><i>${curCoin} </i> Coin</b></h4></th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <th scope="row">????????? ??????</th>
                    <td><input type="number" min="0" max="${curCoin}" id="changeCoin" placeholder="0"/> Coin</td>
                </tr>
                <tr>
                    <th scope="row">?????? ??????</th>
                    <td>
                        <select name="bank_name" id="bank_name">
                             <option value="">??????</option>
                             <option value="????????????">????????????</option>
                             <option value="????????????">????????????</option>
                             <option value="????????????">????????????</option>
                             <option value="????????????">????????????</option>
                             <option value="????????????">????????????</option>
                             <option value="?????????">?????????</option>
                             <option value="????????????">????????????</option>
                             <option value="????????????">????????????</option>
                             <option value="????????????">????????????</option>
                             <option value="???????????????">???????????????</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th scope="row">??????????????????</th>
                    <td><input type="number" id="account_num" placeholder="'-'??? ???????????? ??????????????????."/></td>
                </tr>
                <tr>
                    <th scope="row">??????</th>
                    <td><input type="text" id="account_name" placeholder="?????????"/></td>
                </tr>
                <tr>
                    <th scope="row">?????????????????? ??? 6??????</th>
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

            ????????????

        </button>

        <button type="button"
            class="btn btn-primary"
            style="display:inline-block; width:80px; height:30px; border:0px solid white; border-radius:20px; background-color:#c1c1c1; font-size:14px;"
            id="cancel">

            ??????

        </button>
     </div>

<script type="text/javascript">
    // ????????????
    $('#refund').click(function () {
        let coin = $('#changeCoin').val();
        let Scope = $('#scope').val();
        let accountHolderInfoType = $('#account_holder_info_type').val();
        let accountName = $('#account_name').val();
        let accountHolderInfo = $('#account_holder_info').val();
        let bankName = $('#bank_name').val();
        let accountNum = $('#account_num').val();

        if(coin == ''){
            alert('????????? ?????? ????????? ??????????????????');
            $('#changeCoin').focus();
            return false;
        }else if(coin > ${curCoin}){
            alert('????????? ????????? ????????? ????????? ?????? ???????????? ????????????.');
            $('#changeCoin').focus();
            return false;
        }else if(coin == 0){
            alert('????????? ????????? ????????? 0????????? ??????????????????.');
            $('#changeCoin').focus();
            return false;
        }	

        if(bankName == ''){
            alert("????????? ??????????????????.");
            return false;
        }
        if(accountNum == ''){
            alert("??????????????? ??????????????????.");
            return false;
        }
        if(accountName == ''){
            alert("????????? ??????????????????.");
            return false;
        }
        if(accountHolderInfo == ''){
            alert("?????????????????? ??? 6????????? ??????????????????.");
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
                    alert('?????? ?????? ?????????????????????.\n??????????????? ??? 2????????????.');
                    window.close();
                }else{
                    alert('???????????? ????????? ?????? ????????? ????????????.');
                }
            },
            error : function(err) {
                alert('???????????? ????????? ?????????????????????.\n ???????????? ?????? ??????????????????.');
            } , beforeSend: function () {
                   var width = 0;
                   var height = 0;
                   var left = 0;
                   var top = 0;

                   width = 50;
                   height = 50;


                   top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
                   left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();



                   if($("#div_ajax_load_image").length != 0) {
                          $("#div_ajax_load_image").css({
                                 "top": top+"px",
                                 "left": left+"px"
                          });
                          $("#div_ajax_load_image").show();
                   }
                   else {
                          $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="${path}/resources/img/loading.gif" style="width:50px; height:50px;"></div>');
                   }

            }
            , complete: function () {
                          $("#div_ajax_load_image").hide();
            }
        }); // end ajax
    });
    
    $('#cancel').click(function () {
        window.close();
    });
</script>
</body>
</html>