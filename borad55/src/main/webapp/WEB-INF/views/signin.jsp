<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/53a8c415f1.js"
	crossorigin="anonymous"></script>
<link href="${path}/resources/css/spcss.css" rel="stylesheet"/> 	
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


<form action="log_action" method="post">
	<div class="wrap">
		<div class="login">
			<h2 class="log_in_logo"><b>로그인</b></h2>

				<div class="login_id">
				<h4><b>ID</b></h4>
				<input type="text" name="login_id"  placeholder="ID를 입력하세요">
				</div>
			
				<div class="login_pw">
				<h4><b>Password</b></h4>
				<input type="password" name="login_pw"  placeholder="비밀번호를 입력하세요">
				</div>
				
				<div class="login_etc">
			
			
				
			</div>
			<div class="mb-4"></div>
			<div><button class="btn btn-primary btn-lg btn-block" type="submit">로그인</button>
			<a href="signup"><button class="btn btn-primary btn-lg btn-block" type="button">회원가입</button></a></div>
		</div>
	</div>
</form>
	
	
	
	
	
</body>
</html>


