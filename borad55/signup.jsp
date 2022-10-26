<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}


</style>

<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>

<script type="text/javascript">
$.ajax({
	url : "test.action",
	type : 'post',
	data : {
		name : "이름",
		age : "20",
		gender : "man"
	},
	success : function(data) {
				
     },
	error : function() {
		alert("error");
	}
});
</script>

<script type="text/javascript">
	 function join() {
		var userInfo = document.userInfo;
		var id = userInfo.id.value;
		var password = userInfo.password.value;
		var name = userInfo.name.value;
		var email = userInfo.email.value;
		var adr = userInfo.adr.value;

		if (!id || !password) {
			alert("아이디와 비밀번호를 모두 입력해주세요.")
			return false;
		} else if (!name || !email) {
			alert("이름과 이메일을 모두 입력해주세요.")
		} else if (!adr) {
			alert("주소를 입력해주세요.")
		} else if (document.userInfo.password.value != document.userInfo.passwordcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		} else {
			userInfo.submit();
		}
	}

	function goListForm() {
		location.href = "ListForm";
	}
</script>

</head>

<body>


	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>



				<form class="validation-form" action="signupAction" method="post"
					name="userInfo">



					<div class="row">
						<div class="mb-3">
							<label for="name">ID</label> <input type="text"
								class="form-control" name="id" id="id" placeholder="ID를 입력해주세요."
								required>
							<button id="xx">중복확인</button>
							<font id="olmessage" size="2"></font> 
							<div class="invalid-feedback">ID를 입력해주세요.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="name">비밀번호</label> <input type="text"
							class="form-control" name="password" placeholder="비밀번호를 입력해주세요."
							value="" required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="name">비밀번호 확인</label> <input type="text"
							class="form-control" name="passwordcheck"
							placeholder="비밀번호를 다시 확인해주세요." value="" required>
						<div class="invalid-feedback">비밀번호를 다시 확인해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="name">이름</label> <input type="text"
							class="form-control" name="name" placeholder="이름을 입력해주세요."
							value="" required>
						<div class="invalid-feedback">이름을 입력해주세요.</div>
					</div>


					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" name="email" placeholder="이메일을 입력해주세요."
							required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>


					</div>

					<div class="mb-3">
						<label for="address">주소</label> <input type="text"
							class="form-control" name="adr" placeholder="주소를 입력해주세요."
							required>
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="address2">상세주소<span class="text-muted">&nbsp;(필수
								아님)</span></label> <input type="text" class="form-control" name="adr2"
							placeholder="상세주소를 입력해주세요.">
					</div>

					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="root">가입 경로</label> <select
								class="custom-select d-block w-100" name="data">
								<option value=""></option>
								<option>검색</option>
								<option>카페</option>
							</select>
							<div class="invalid-feedback">가입 경로를 선택해주세요.</div>
						</div>
					</div>
					<hr class="mb-4">

					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>


					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="button"
						onclick="join()">가입완료</button>
					<button class="btn btn-primary btn-lg btn-block" type="button"
						onclick="goListForm()">취소</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small"> </footer>
	</div>

</body>

</html>