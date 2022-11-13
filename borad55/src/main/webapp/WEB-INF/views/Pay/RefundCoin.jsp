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
   <title>Refund</title>
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
        <h2>코인환불</h2>
        <p style="color: #ac2925; margin-top: 30px">결제 후 7일이 지난 주문은 환불이 불가합니다.</p>
        <p style="color: #ac2925;">환불은 각각의 주문건마다 1건씩 처리됩니다.</p>
        <p style="color: #ac2925;">환불시 전체금액 중 결제수수료 10%를 제외한 금액만 환불됩니다.</p>

        <table class="table table-hover">
            <thead class="table-light">
                <tr>
                    <th scope="col" colspan="3" style="text-align:center;"><h4><b><i>현재 소지한 코인</i></b></h4></th>
                    <th><h4><b><i>${curCoin}</i></b></h4></th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <th scope="row">결제일</th>
                    <th>결제금액</th>
                    <th>주문번호</th>
                    <th>비 고</th>
                </tr>

                <c:forEach var="myRecord" items="${myRecord}">
                <c:if test="${myRecord.possibleRefund ne 5 && myRecord.possibleRefund ne 9}">
                <tr>
                    <td scope="row"><c:out value='${myRecord.localDateTimeToDate}'/></td>
                    <c:if test="${myRecord.possibleRefund eq 4}">
                        <td>100개</td>
                    </c:if>
                    <c:if test="${myRecord.possibleRefund ne 4}">
                        <td><c:out value='${myRecord.payAmount}'/></td>
                    </c:if>
                    <td><c:out value='${myRecord.payMerchantUid}'/></td>

                    <c:if test="${myRecord.possibleRefund eq 0}">
                        <td>환불완료</td>
                    </c:if>
                    <c:if test="${myRecord.possibleRefund eq 1}">
                        <td><label><input type="radio" name="refundImpUid" value="${myRecord.payImpUid}"> 환불가능</label></td>
                    </c:if>
                    <c:if test="${myRecord.possibleRefund eq 2}">
                        <td>환불가능한 코인의 갯수가 부족합니다</td>
                    </c:if>
                    <c:if test="${myRecord.possibleRefund eq 3}">
                        <td>환불이 가능한 기간이 지났습니다</td>
                    </c:if>
                    <c:if test="${myRecord.possibleRefund eq 4}">
                        <td>환불대상이 아닙니다</td>
                    </c:if>
                </tr>
                </c:if>
                </c:forEach>

            </tbody>

        </table>

        <button type="button"
          class="btn btn-primary"
          style="display:inline-block; width:80px; height:30px; border:0px solid white; border-radius:20px; font-size:14px;" id="refund">

            환불하기

          </button>

        <button type="button"
            class="btn btn-primary"
            style="display:inline-block; width:80px; height:30px; border:0px solid white; border-radius:20px; background-color:#c1c1c1; font-size:14px;"
            id="cancel">

            닫기

        </button>
     </div>

<script type="text/javascript" src="${path}/resources/js/refund.js"></script>
</body>
</html>