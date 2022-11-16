<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/resources/css/spcss.css" rel="stylesheet"/> 
<script src="https://kit.fontawesome.com/d21710f86c.js" 
crossorigin="anonymous">
</script>	

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chakra+Petch:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/main.css" />
</head>
<header>
<c:set var="buyerId" value="${profile.signup_id}"/>
	<nav class="header" style="cursive; height:172px;">

		<div class="header_logo" style=" margin-right:10%;">
		<a href="/"><img src="resources/image/slow.png"></a>
		</div>

        <div class="inner">

          <ul class="main-menu">
            <li class="item">
              <div class="item__name">게시판</div>
              <div class="item__contents">
                <div class="contents__menu">
                  <ul class="inner">
                    <li>
                      <ul>
                        <li><a href="/board">전체게시판</a></li>
                      </ul>
                    </li>
                    <li>
                      <ul>
                        <li><a href="/board?bgnopage=1">Q&A</a></li>
                      </ul>
                    </li>
                    <li>
                      <ul>
                        <li><a href="/board?bgnopage=2">자유게시판</a></li>
                      </ul>
                    </li>
                    <li>
                      <ul>
                        <li><a href="/board?bgnopage=3">건의게시판</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>

              </div>
            </li>

            <c:if test="${empty profile.signup_id}">
            <li class="item">
              <div class="item__name">마이페이지</div>
              <div class="item__contents">
                <div class="contents__menu">
                  <ul class="inner">
                    <li>
                      <ul>
                        <li><a class="noSignupId">마이페이지</a></li>
                      </ul>
                    </li>
                    <li>
                      <ul>
                        <li><a class="noSignupId">내 코인 기록</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>

              </div>
            </li>
            <li class="item">
              <div class="item__name">코인</div>
              <div class="item__contents">
                <div class="contents__menu">
                  <ul class="inner">
                    <li>
                      <ul>
                        <li><a class="noSignupId">충전하기</a></li>
                      </ul>
                    </li>
                    <li>
                      <ul>
                        <li><a class="noSignupId">환전하기</a></li>
                      </ul>
                    </li>
                    <li>
                      <ul>
                        <li><a class="noSignupId">환불하기</a></li>
                      </ul>
                    </li>
                    <li>
                      <ul>
                        <li><a class="noSignupId">내 코인기록</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>

              </div>
            </li>
            </c:if>

            <c:if test="${!empty profile.signup_id}">
            <li class="item">
              <div class="item__name">마이페이지</div>
              <div class="item__contents">
                <div class="contents__menu">
                  <ul class="inner">
                    <li>
                      <ul>
                        <li><a href="/userInformation2?signup_id=<c:out value='${buyerId}'/>" onclick="window.open(this.href,'board','width=440, height=590,top=100,left=500');return false;">마이페이지</a></li>
                      </ul>
                    </li>
                    <li>
                      <ul>
                        <li><a href="/record?signup_id=<c:out value='${buyerId}'/>" onclick="window.open(this.href,'코인 기록','width=600,height=650,top=100,left=500');return false;">내 코인기록</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>

              </div>
            </li>
            <li class="item">
              <div class="item__name">코인</div>
              <div class="item__contents">
                <div class="contents__menu">
                  <ul class="inner">
                    <li>
                      <ul>
                        <li><a href="/PayCoin" onclick="window.open(this.href,'코인 충전','width=600,height=650,top=100,left=500');return false;">충전하기</a></li>
                      </ul>
                    </li>
                    <li>
                      <ul>
                        <li><a href="/change?signup_id=<c:out value='${buyerId}'/>" onclick="window.open(this.href,'코인 환전','width=600,height=650,top=100,left=500');return false;">환전하기</a></li>
                      </ul>
                    </li>
                    <li>
                      <ul>
                        <li><a href="/refund?signup_id=<c:out value='${buyerId}'/>" onclick="window.open(this.href,'코인 환불','width=600,height=650,top=100,left=500');return false;">환불하기</a></li>
                      </ul>
                    </li>
                    <li>
                      <ul>
                        <li><a href="/record?signup_id=<c:out value='${buyerId}'/>" onclick="window.open(this.href,'코인 기록','width=600,height=650,top=100,left=500');return false;">내 코인기록</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>

              </div>
            </li>
            </c:if>

            <li class="item">
              <div class="item__name">Contact Us</div>
              <div class="item__contents">
                <div class="contents__menu">
                  <ul class="inner">
                    <li>
                      <ul>
                        <li><a href="/contact2">찾아오시는길</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </div>
            </li>
          </ul>

        </div>
		
		<ul class="header_login">
		
		<c:if test="${empty profile.signup_id}">
		<a href="signup"><li><i class="fa-solid fa-user-plus"></i></li></a>
      	<a href="signin"><li><i class="fa-solid fa-user"></i></li></a>
   		</c:if>
   
   
   
   
   
   		<c:if test="${!empty profile.signup_id}">
   <div class="container" 
   style="display:inline-block; width:360px; height:120px;
   margin:0; padding:10px 0px; background-color:white; 
   font-family:'맑은고딕'; position: absolute; right:100px; top:40px;" >
      
      <div class="container col" style="display:inline-block; width:360px; height:20px; text-align:center;  ">
          <img src="resources/img/${profile.signup_profle_img}" width="50" height="50" style="display:inline-block;">
          <div class="container" style="display:inline-block;  width:150px; padding:0px;  margin-right:30px;">
              <span style="font-size:13px; text-align:left; color: gray"  ><b style="font-size:15px; color:black;" >
                  ${profile.signup_nickname}님</b>
                  안녕하세요 ${name}
              </span>
          </div>
          <span style="font-size:13px; text-align:left; color: black" id="MyCoin"></span>
          <input type="hidden" id="hiddenMyCoin" value=""/>
          <button type="button"
                  class="btn btn-primary"
                  style="display:inline-block; width:80px;
                  height:30px; border:0px solid white; border-radius:20px;
                  background-color:#c1c1c1; font-size:11px; position:absolute; left:295px; top:60px;" >

              <a href="/PayCoin" style="color:white;" onclick="window.open(this.href,'코인 충전','width=600,height=650,top=100,left=500');return false;">
                  코 인
              </a>

          </button>
      
      
     <button class="btn btn-primary" style="display:inline-block; width:80px; 
      height:30px; border:0px solid white; border-radius:20px; 
      background-color:#c1c1c1; font-size:11px; position:absolute; left:210px; top:60px;" 
      onclick="location.href='logout_action'">로그아웃</button>
      




      <c:if test="${profile.signup_id eq 'admin'}">
      <button class="btn btn-primary" style="display:inline-block; width:80px; 
      height:30px; border:0px solid white; border-radius:20px; 
      background-color:#c1c1c1; font-size:11px; position:absolute; right:239px; top:60px;" 
      onclick="location.href='admin'">관리자</button>
      </c:if>
      
      
      
      
       <a href='/userInformation3' onclick="window.open(this.href,'board','width=340, height=390,top=100,left=500');return false;">
       <button class="btn btn-primary" style="display:inline-block; width:80px; 
      height:30px; border:0px solid white; border-radius:20px; 
      background-color:#c1c1c1; font-size:11px; position:absolute; right:243px; top:60px;">프로필변경</button></a>
        
        
        
        
     <a href="/userInformation2?signup_id=<c:out value='${buyerId}'/>" onclick="window.open(this.href,'board','width=440, height=590,top=100,left=500');return false;"><button class="btn btn-primary"
     style="display:inline-block; width:80px; height:30px; border:0px solid white; border-radius:20px; 
      background-color:#c1c1c1; font-size:11px; position:absolute; top:60px; left:125px;">마이페이지</button>
      </a>
      
      <br>
      </div>
      <button type="button" class="btn btn-dark" style="border-radius:20px; width: 150px; display: inline-block; margin-bottom: 10px; margin-left:60px; margin-top: 5px" ><a href="/chat" style="color:white;" onclick="window.open(this.href,'유저정보','width=302,height=465,top=100,left=340');return false;">전체채팅방</a></button>
      </div>
      <br>
   		</c:if>
   		
		</ul>
	</nav>

	
	
	
	
	
	
	
	
	
	
	
	<div class="alert_menu">
		<div class="alert-menu-inner">
			<p>여기에 알림표시(연결필요)</p>
		</div>
	</div>
	

<script type="text/javascript" src="${path}/resources/js/js.js"></script>
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
            });
        });
    </script>
</c:if>

</header>
</html>