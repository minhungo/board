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
			<h2 class="log_in_logo"><b>비밀번호 찾기</b></h2>


			<div class="login_id">
				<h4><b>본인확인 이메일 인증${input_id.signup_email }</b></h4>
                <hr>
                <b>이름</b>과 <font>가입 당시  <b>이메일 주소</b>와 입력한 이메일 주소가 같아야,<br> 
                인증번호를 받을 수 있습니다.</font>
				
                <br>
                <input type="text" name="login_id" id="name" name="name" placeholder="이름을 입력하세요">
                <input type="text" name="login_id" id="email" name="email" placeholder="이메일 주소를 입력하세요">
    		</div>
                    
               <br>
               
                <button class="btn btn-primary btn-lg btn-block" 
                type="button" id="email_auth_btn" name="email_auth_btn">인증번호 받기</button>
               
           
               <div id="code" style="display: none;">
                <br>  
				    <b>인증번호 :</b> <input type="text" name="email_auth_key" id="email_auth_key" placeholder="인증번호 입력">
                    <button class="btn btn-primary btn-lg btn-block"  type="button"
                    id="next" name="">다음</button>
                </div>
                
                
			<div class="login_etc">
			</div>
      
		</div>
	</div>
	
  
<!-- 이메일 인증 함수,ajax -->  
<script type="text/javascript">
	
	$('#email_auth_btn').click(function(){	     	 
   	 
		userEmail = '${input_id.signup_email }'; // 나중에 마스킹
		var email = $('#email').val();
		var name = $('#name').val();
		
	if(name == ''){
	 	alert("이름을 입력해주세요.");
  		return false;
	 }	
		
		
   	 if(email == ''){
   	 	alert("이메일을 입력해주세요.");
   	 	return false;
   	 }
   	 
   	 $.ajax({
			type : "POST",
			url : "/emailAuth",
			data : {email : email, name : name},
			success: function(data){
			
			if(data==0){
				alert("메일 발송에 실패했습니다. 이름과 이메일을 확인하세요");
			}else{
				alert("인증번호가 메일로 발송되었습니다. 인증번호를 확인 후 입력란에 적어주세요");
				email_auth_cd = data;
				$("#code").css('display','block');
			}
			
			},
			error: function(data){
				alert("메일 발송에 실패했습니다.");
			}
		}); 
	});
	
	
	$('#next').click(function(){
		
		var email_auth_key = $('#email_auth_key').val();
		
		if(email_auth_key==''){
			alert("인증번호를 입력해주세요!")
		}
		
		if(email_auth_key != email_auth_cd){
			alert("인증번호가 올바르지 않습니다. 확인 후 다시 입력해 주세요.")
		}else{
			location.href="/PWFind3";
		}
	});
	
	
	
	
	
	
</script>
	
	
	
</body>
</html>


