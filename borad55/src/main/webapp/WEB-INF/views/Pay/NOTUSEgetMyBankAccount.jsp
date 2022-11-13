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
     계좌조회성공
     <div class="container">
     <table class="table">
         <thead>
         <tr>
             <th scope="col">계좌번호</th>
             <th scope="col">은행</th>
             <th scope="col">소유주</th>
         </tr>
         </thead>
         <tbody>
         <c:forEach var="account" items="${bankAccounts.res_list}">
         <tr>
             <th>${account.account_num_masked}</th>
             <td>${account.bank_name}</td>
             <td>${account.account_holder_name}</td>
             <td>
                 <form method="get" action="/balance">
                     <input type="hidden" id="access_token"
                            name="access_token" value="${access_token}"></input>
                     <input type="hidden" name="bank_tran_id" value="${useCode}"></input>
                     <input type="hidden" id="fintech_use_num"
                            name="fintech_use_num" value="${account.fintech_use_num}"></input>
                     <button type="submit">잔액조회</button>
                 </form>
             </td>
             <td>
                 <form method="get" action="/transfer">
                     <input type="hidden" name="access_token" value="${access_token}"></input>
                     <input type="hidden" name="fintech_use_num" value="${account.fintech_use_num}"></input>
                     <input type="hidden" name="account_num" value="${account.account_num_masked}"></input>
                     <input type="hidden" name="bank_tran_id" value="${useCode}"></input>
                     <input type="hidden" name="req_client_name" value="${account.account_holder_name}"></input>
                     <button type="submit">간편송금</button>
                 </form>
             </td>
         </tr>
         </c:forEach>
         </tbody>
     </table>
         <a type="button" href="/">뒤로가기</a>
     </div>
</body>
</html>