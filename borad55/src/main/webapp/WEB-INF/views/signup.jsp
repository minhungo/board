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
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
      background-image: url('resources/image/kkk2.png');
	background-size: 2000px 1050px;
    }

    .input-form {
      max-width: 680px;
      margin-top: 10px;
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
  
  
 <script>
	 function join() {
		var userInfo = document.userInfo;
		var id = userInfo.input_id.value;
		var password = userInfo.input_pw.value;
		var name = userInfo.input_name.value;
		var email = userInfo.input_email.value;
		var adr = userInfo.input_adr.value;
		
		if (!id || !password) {
			alert("아이디와 비밀번호를 모두 입력해주세요.")
			return false;
		}else if(!name || !email){
			alert("이름과 이메일을 모두 입력해주세요.")
			return false;
		}else if(!adr){
			alert("주소를 입력해주세요.")
			return false;
		}else if (document.userInfo.input_pw.value != document.userInfo.input_pw2.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}else{
			userInfo.submit();
		}
	}

	function goListForm() {
		location.href = "/";
	}
</script>
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body>





  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3" style="color: blue"><b>회원가입</b></h4>
        
        
        <form class="validation-form" method="post" action="signupAction" name="userInfo">
        
        <input type="hidden" name="signup_profle_img" id="signup_profle_img" value="human1.png">
        
        
        
          <div class="row">
          <div class="mb-3">
              <label for="input_id"><b>ID</b></label>
              <input type="text" class="form-control" name="input_id" id="input_id" placeholder="ID를 입력해주세요." required>
              <div><font id="id_feedback" size="2"></font></div>
            </div>
          </div>
          
   
          

          
          <div class="mb-3">
              <label for="name"><b>비밀번호</b></label>
              <input type="password" class="form-control" name="input_pw" placeholder="비밀번호를 입력해주세요." value="" required>
              <div class="invalid-feedback">
                                   비밀번호를 입력해주세요.
              </div>
            </div>
            
            <div class="mb-3">
              <label for="name"><b>비밀번호  확인</b></label>
              <input type="password" class="form-control" name="input_pw2" placeholder="비밀번호를 다시 확인해주세요." value="" required>
              <div class="invalid-feedback">
                                   비밀번호를 다시 확인해주세요.
              </div>
            </div>
          
            <div class="mb-3">
              <label for="name"><b>이름</b></label>
              <input type="text" class="form-control" name="input_name" placeholder="이름을 입력해주세요." value="" required>
              <div class="invalid-feedback">
                                      이름을 입력해주세요.
              </div>
            </div>
            
             <div class="mb-3">
              <label for="name"><b>닉네임</b></label>
              <input type="text" class="form-control" name="input_nickname" id="input_nickname" placeholder="닉네임을 입력해주세요." value="" required>
              <div class="invalid-feedback">
                                      닉네임을 입력해주세요.
              </div>
              <div><font id="nickname_feedback" size="2"></font></div>
            </div>
          

          <div class="mb-3">
            <label for="email"><b>이메일</b></label>
            <input type="email" class="form-control" name="input_email" placeholder="이메일을 입력해주세요." required>
            <div class="invalid-feedback">
                                 이메일을 입력해주세요.
            </div>
          </div>


		<div class="mb-3">
						
						<label for="postcode"><b>우편번호</b></label> 
						<div class="in-line">
						<input type="text" class="form-control" style="width:200px; float:left;" id="sample6_postcode" placeholder="우편번호">
						<input type="button" class="btn btn-primary" style="height:38px;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						</div>
						<div class="invalid-feedback">우편번호를 입력해주세요.</div>
						
					</div>



          
                     <div class="mb-3">
						<label for="address"><b>주소</b></label> <input type="text"
						class="form-control" id="sample6_address" placeholder="주소를 입력하세요" name=input_adr>
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>

          			<div class="mb-3">
						<label for="address2"><b>상세주소</b><span class="text-muted">&nbsp;(필수아님)</span></label> 
						<div class="in-line">
						<input type="text" class="form-control" style="width:300px; float:left;" id="sample6_detailAddress" placeholder="상세주소를 입력하세요" name=input_adr2>
						<input type="text" class="ms-3" style="width:300px; height:38px;" id="sample6_extraAddress" placeholder="참고항목"></div>
					</div>


					<script
						src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
						function sample6_execDaumPostcode() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var addr = ''; // 주소 변수
											var extraAddr = ''; // 참고항목 변수

											//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
											if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
												addr = data.roadAddress;
											} else { // 사용자가 지번 주소를 선택했을 경우(J)
												addr = data.jibunAddress;
											}

											// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
											if (data.userSelectedType === 'R') {
												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ''
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ''
														&& data.apartment === 'Y') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												
												// 조합된 참고항목을 해당 필드에 넣는다.
												document.getElementById("sample6_extraAddress").value = extraAddr;

											} else {
												document.getElementById("sample6_extraAddress").value = '';
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document.getElementById('sample6_postcode').value = data.zonecode;
											document.getElementById("sample6_address").value = addr;
											// 커서를 상세주소 필드로 이동한다.
											document.getElementById("sample6_detailAddress").focus();
										}
									}).open();
						}
					</script>

          <div class="row">
            <div class="col-md-8 mb-3">
              <label for="root"><b>가입 경로</b></label>
              <select class="custom-select d-block w-100" name="select_data">
                <option value=""></option>
                <option>검색</option>
                <option>카페</option>
                <option>유튜브</option>
                <option>광고</option>
              </select>
              <div class="invalid-feedback">
                                      가입 경로를 선택해주세요.
              </div>
            </div>
          </div>
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
          </div>
          <div class="mb-4"></div>
          
          
 <!-- id 중복체크 ajax위치 그대로 놔둬야 함 -->
  <script type ="text/javascript">
	$('#input_id').blur(function(){
		let aa = $('#input_id').val();
			
		$.ajax({
			url : "/idcheck",
			type : "post",
			data : {aa: aa},
			dataType : 'json',
			success : function(result){
				if(result == 1){
					$("#id_feedback").html('이미 사용중인 아이디입니다.');
					$("#id_feedback").attr('color','#dc3545');
					return false;
				} else{
					$("#id_feedback").html('사용할 수 있는 아이디입니다.');
					$("#id_feedback").attr('color','#2fb380');
				} 
			},
			error : function(){
				alert("서버요청실패");
			}
		})
	})
</script> 
          
          
<!--nickname 중복체크 ajax 위치 그대로 놔둬야 함 -->
 <script type ="text/javascript">
	$('#input_nickname').blur(function(){
		let nick = $('#input_nickname').val();
			
		$.ajax({
			url : "/NickNameCheck",
			type : "post",
			data : {nick: nick},
			dataType : 'json',
			success : function(result){
				if(result == 1){
					$("#nickname_feedback").html('이미 사용중인 닉네임입니다.');
					$("#nickname_feedback").attr('color','#dc3545');
					return false;
				} else{
					$("#nickname_feedback").html('사용할 수 있는 닉네임입니다.');
					$("#nickname_feedback").attr('color','#2fb380');
				} 
			},
			error : function(){
				alert("서버요청실패");
			}
		})
	})
</script>        
          
          
          
          
          <button class="btn btn-primary btn-lg btn-block" type="button" onclick="join()">가입 완료</button>
          <button class="btn btn-primary btn-lg btn-block" type="button" onclick="goListForm()">가입취소</button>
        </form>
      
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      
    </footer>
  </div>
  
</body>

</html>