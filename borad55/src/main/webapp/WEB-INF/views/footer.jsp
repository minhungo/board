<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/resources/css/spcss.css" rel="stylesheet"/> 		
</head>
<footer>
    <ul class="footer_ul">
      <img src="resources/image/soldesk.jpg" alt="" width="10%" style="margin-right:20px;">
      <li style="margin:0px 10px;  margin: 10px;">팀명 : 북극곰   </li>
      <li style="margin:0px 10px;  margin: 10px;">주소 : 서울 종로구 종로12길 15 코아빌딩1  </li>
      <li style="margin:0px 10px;  margin: 10px;">연락처 : 1544-0714  </li>
      <li style="margin:0px 10px;  margin: 10px;">홈페이지 : https://soldesk.com  </li>
    </ul>
</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<c:if test="${!empty profile.signup_id}">
    <c:if test="${profile.signup_id ne 'admin'}">
    <script>
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
                    $("#MyCoin").html("My Coin "+result);
                    $("#hiddenMyCoin").val(result);
                },
                error : function() {
                    alert("네트워크 통신 오류가 발생하였습니다.\n소지한 코인을 확인할 수 없습니다.");
                }
            });

        });
    </script>
    </c:if>

</c:if>
<c:if test="${empty profile.signup_id}">
    <script>
        $(function (){
            $(".noSignupId").click(function(){
                alert("로그인 후 이용할 수 있습니다.");
                console.log("로그인 후 이용할 수 있습니다.");
            });
        });
    </script>
</c:if>
</html>