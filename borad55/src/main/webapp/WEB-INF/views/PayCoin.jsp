<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   <title>PayCoin</title>
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
     <div class="card-body bg-white mt-0 shadow">
        <p style="font-weight: bold">카카오페이를 통한 코인 충전</p>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="15000"><span>15,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="20000"><span>20,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="25000"><span>25,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="30000"><span>30,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="35000"><span>35,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="40000"><span>40,000원</span></label>
        <label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
        <p style="color: #ac2925; margin-top: 30px">코인은 1개당 100원이며 최소 5000원부터 최대 50,000원까지 충전 가능합니다</p>
        <button type="button"
          class="btn btn-primary"
          style="display:inline-block; width:80px;
          height:30px; border:0px solid white; border-radius:20px;
          background-color:#c1c1c1; font-size:11px;" id="charge_kakao">충 전 하 기</button>
     </div>
   
</body>

<script type="text/javascript" src="${path}/resources/js/IMportJS.js"></script>

</html>