<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
	background-image: url('resources/image/kkk2.png');
	background-size: 2000px 950px;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
}

a {
	text-decoration: none;
	color: black;
}

li {
	list-style: none;
}

.wrap {
	width: 100%;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0.1);
}

.login {
	width: 30%;
	height: 600px;
	background: white;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.log_in_logo {
	color: blue;
	font-size: 2em;
}

.login_id {
	margin-top: 20px;
	width: 80%;
}

.login_id input {
	width: 100%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.login_pw {
	margin-top: 20px;
	width: 80%;
}

.login_pw input {
	width: 100%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.login_etc {
	padding: 10px;
	width: 80%;
	font-size: 14px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-weight: bold;
}
</style>
</head>
<body>


	<div class="wrap">
		<div class="login">
			<h2 class="log_in_logo"><b>비밀번호 변경</b></h2>


			<div class="login_id">
				<h4><b>이메일 인증완료!!</b></h4>
                <hr>
                <font><b>${input_id.signup_id}님 반갑습니다.</b><br> 
                 변경할 비밀번호를 입력해주세요</font>
				
                <br>
                
                <input type="password" id="pw1" name="pw1" placeholder="변경 비밀번호를 입력">
				<input type="password" id="pw2" name="pw2" placeholder="변경 비밀번호를 확인">
        
    		</div>
      	      <br>
                <button class="btn btn-primary btn-lg btn-block" 
                type="button" id="email_auth_btn" name="email_auth_btn">비밀번호 변경</button>
		</div>
	</div>
	
  
<!-- password js -->  
<script type="text/javascript">
	$('#email_auth_btn').click(function(){	     	 
   	 
		var pw1 = $('#pw1').val();
		var pw2 = $('#pw2').val();
		var id = '${input_id.signup_id}';
		
   	 if(pw1 == ''){
   	 	alert("변경 비밀번호를 입력해주세요.");
   	 	return false;
   	 }
   	 
   	 if(pw2 == ''){
   	 	alert("변경 비밀번호 확인을 입력해주세요.");
   	 	return false;
   	 }
   	 
	 if(pw1 != pw2){
	   	 	alert("변경할 비밀번호를 동일하게 입력하세요");
	   	 	return false;
	 }

	 
  	 $.ajax({
			type : "POST",
			url : "/PwChange",
			data : {pw1 : pw1, pw2 : pw2, id : id},
			success: function(result){
				
				if(result==1){
				alert("비밀번호 변경 성공!");
				location.href="/signin";
				}
			},
			error: function(data){
				alert("비밀번호 변경에 실패했습니다.");
			}
		});
	}); 
</script>
	
	
	
</body>
</html>


