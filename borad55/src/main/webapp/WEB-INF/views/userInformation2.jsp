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


td{
width:300px;
}

input{
width:295px;
border:none;
}


.user {
   height: 100%;
   background-image: url('resources/image/css pattern.png');
   background-repeat: no-repeat;
   background-size: cover;
   height: 190px;
}
</style>



<!-- 회원 정보 수정 부분 js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function Update_User() {
	
	var name_id1 = document.getElementById("name_id1"); 
	var name_id2 = document.getElementById("name_id2"); 
	
	var email_id1 = document.getElementById("email_id1"); 
	var email_id2 = document.getElementById("email_id2"); 

	var adr_id1 = document.getElementById("adr_id1"); 
	var adr_id2 = document.getElementById("adr_id2"); 

	var adr_point_id1 = document.getElementById("adr_point_id1"); 
	var adr_point_id2 = document.getElementById("adr_point_id2"); 
	
	var btn1 = document.getElementById("btn1"); 
	var btn2 = document.getElementById("btn2"); 
	
	if (name_id2.style.display == 'none') {
		
		name_id2.style.display = 'block';
		name_id1.style.display = 'none';
		
		email_id2.style.display = 'block';
		email_id1.style.display = 'none';

		adr_id2.style.display = 'block';
		adr_id1.style.display = 'none';

		adr_point_id2.style.display = 'block';
		adr_point_id1.style.display = 'none';

		btn2.style.display = 'block';
		btn1.style.display = 'none';
	
		Update_User2();
	}		
		
}
</script>


<script type="text/javascript">
function Update_User2() {
	
	var form_mate = document.form_mate;
	
	var name_id2 = form_mate.name_id2.value;
	
	var email_id2 =form_mate.email_id2.value;
	
	var adr_id2 = form_mate.adr_id2.value;
	
	var adr_point_id2 = form_mate.adr_point_id2.value;
	
	
	
	if(!name_id2){
  	 	alert("수정할 닉네임을 입력하세요.");
  	 	return false;
  	 }else if(!email_id2){
  	 	alert("수정할 이메일을 입력하세요.");
  	 	return false;
  	 }else if(!adr_id2){
  	 	alert("수정할 주소를 입력하세요.");
  	 	return false;
  	 }else if(!adr_point_id2){
  	 	alert("수정할 상세주소를 입력하세요.");
  	 	return false;
  	 }
}
</script>
    
</head>



<body>



<form action="MyPage_UpDate" method="post" name="form_mate">

 <input type="hidden" name="signup_id" value="${profile.signup_id}">
 <input type="hidden" name="signup_pw" value="${profile.signup_pw}">
 
   <div>
      <div class="user" style="text-align:right;">
         
         <input type="text" value="${profile.signup_nickname }" 
         style="aligin:bottom; border: none; background: transparent; margin-top:155px; color:#FFFFFF; 
         font-size:20px; width:160px;  font-weight: 800;">&nbsp;
         <img src="resources/img/${profile.signup_profle_img}" width="100" height="100" style="margin-top:50px; color:white;">
        
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         
      </div>
      
      <br>
      <br>
      
      <table class="mt-3" style=" width: 420px; border-collapse: separate; border-spacing: 10px;">
         
         
         <tr>
            <th style="background-color: #84C3CC; width: 80px;">아이디</th>
            <td style="width: 200px;">${profile.signup_id }</td>
         </tr>
         
         
         
          <tr>
            <th style="background-color: #84C3CC;">비밀번호</th>
            <td type="password" ">*****</td>
            
         </tr>
         
         
         
         <tr>
            <th style="background-color: #84C3CC;">등급</th>
            <td><img src="resources/image/${profile.signup_grade }.png" width="20" height="20">&nbsp;${profile.signup_grade }</td>
         </tr>



         <tr>
            <th style="background-color: #84C3CC;">닉네임</th>
            <td id="name_id1">${profile.signup_nickname }</td>
            <td id="name_id2" style="display: none;"><input type="text" id="name_id2" name="input_nickname"  placeholder="${profile.signup_nickname }"></td>
            <font id="nickname_feedback" size="2"></font>
         </tr>
         

         <tr>
            <th style="background-color: #84C3CC;">포인트</th>
            <td>${profile.signup_point }</td>
         </tr>


         <tr>
             <th style="background-color: #84C3CC;">코인</th>
             <td>${curCoin } Coin</td>

         </tr>
         
         
         <tr>
            <th style="background-color: #84C3CC; vertical-align: middle;">이메일</th>
            <td id="email_id1">${profile.signup_email }</td>
            <td id="email_id2" style="display: none"><input type="text" id="email_id2" name="input_email" placeholder="${profile.signup_email }"></td>
         </tr>	
         
       
         
         
         
         
         <tr>
            <th style="background-color: #84C3CC;">주소</th>
            <td id="adr_id1">${profile.signup_adr }</td>
			
			<td id="adr_id2" style="display: none">
			<input type="text" id="adr_id2" name="input_adr"  placeholder="${profile.signup_adr }">
			</td>
         </tr>





		<tr>
            <th style="background-color: #84C3CC; vertical-align: middle;">상세주소</th>
            <td id="adr_point_id1">${profile.signup_adr_point }</td>
            
			<td id="adr_point_id2" style="display: none">
			<input type="text" id="adr_point_id2" name="input_adr_point"   
			 placeholder="${profile.signup_adr_point}">
			</td>
         </tr>
  
      
      <tr>
      <th style="background-color: #84C3CC;">가입경로</th>
      <td>${profile.signup_data }</td>
      </tr>
      
         <tr>
            <th style="background-color: #84C3CC;">가입일자</th>
            
            <td><c:set var="dateVar" value="${profile.signup_date }" />
               <fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd HH:MM"/></td>
         </tr>
      </table>
      
     
      <div class="d-grid gap-2 col-4 mx-auto" style="margin-top: 20px;">
         <button type="button" class="btn btn-outline-danger" 
         onclick="Update_User()" id="btn1">수정하기</button>
         
         <button onclick="Update_User2()" type="submit" class="btn btn-outline-primary" 
          style="display: none" id="btn2" style="margin-top: 10px;">수정완료</button>
      </div>
   </div>
</form>




</body>
</html>