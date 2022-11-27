<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
   crossorigin="anonymous">
<script
   src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
   integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
   integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
   crossorigin="anonymous"></script>

<style>
a {
   color: blue;
}

a:visited {
   color: blue;
}

a:hover {
   color: red;
}

a:active {
   color: green
}

th {
   text-align: center;
   font-size: 18px;
   color: #FFFFFF;
   border-radius: 4px;
   border-style: hidden;
   box-shadow: 0 0 0 1px #743FCF;
}

th, td {
   padding: 4px;
   border-radius: 4px;
   border-style: hidden;
   box-shadow: 0 0 0 1px #CCCCCC;
}

.user {
   height: 100%;
   background-image: url('resources/image/css pattern.png');
   background-repeat: no-repeat;
   background-size: cover;
   height: 190px;
}

</style>
</head>



<body>

   <div>
   
      <div class="user" style="text-align:right;">
         <input type="text" value="${signup.signup_nickname }" style="aligin:bottom; border: none; background: transparent; margin-top:155px; color:#FFFFFF; font-size:20px; width:160px;  font-weight: 800;">&nbsp;<img src="resources/image/user4.png" width="100" height="100" style="margin-top:50px; color:white;">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              
         
      </div>
      
      <br>
      <br>
      
      <table class="ms-3 mt-3" style="margin-left: 15px; width: 620px; border-collapse: separate; border-spacing: 10px;">
         <tr>
            <th style="background-color: #84C3CC; width: 80px;">아이디</th>
            <td>${signup.signup_id }</td>

         </tr>
         <tr>
            <th style="background-color: #84C3CC;">등급</th>
            <td><img src="resources/image/${signup.signup_grade }.png" width="20" height="20">${signup.signup_grade }</td>

         </tr>

         <tr>
            <th style="background-color: #84C3CC;">이름</th>
            <td>${signup.signup_name }</td>

         </tr>
         <tr>
            <th style="background-color: #84C3CC;">포인트</th>
            <td><input type="text" value="${profile.signup_point }" style="border: none;"></td>
         </tr>
         <tr>
            <th style="background-color: #84C3CC;">코인</th>
            <td><input type="text" value="${curCoin} Coin" style="border: none;"></td>
         </tr>
         <tr>
            <th style="background-color: #84C3CC; vertical-align: middle;">이메일</th>
            <td>${signup.signup_email }</td>
         </tr>
         <tr>
            <th style="background-color: #84C3CC;">주소</th>
            <td>${signup.signup_adr }</td>
         </tr>
         <tr>
            <th style="background-color: #84C3CC; vertical-align: middle;">상세주소</th>
            <td>${signup.signup_adr_point }</td>
         </tr>
      
      <tr>
      <th style="background-color: #84C3CC;">가입경로</th>
      <td>${signup.signup_data }</td>
      </tr>
      
         <tr>
            <th style="background-color: #84C3CC;">가입일자</th>
            
            <td><c:set var="dateVar" value="${signup.signup_date }" />
               <fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd HH:MM"/></td>
         </tr>
      </table>
      <br>
      
     
      <div class="d-grid gap-2 col-4 mx-auto" style="margin-top: 35px;">
        
        &nbsp;&nbsp;<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="deleteSignupaction?signup_num=${signup.signup_num }"><input
                 type="button"  class="btn btn-outline-danger btn-lg"   value="회원탈퇴"></a></div>&nbsp;&nbsp;
      </div>
     
      
   </div>


</body>
</html>