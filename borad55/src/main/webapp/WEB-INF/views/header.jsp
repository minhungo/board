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
	
</head>
<header>
	<nav class="header" style="font-family: 'DynaPuff', cursive; height:110px;">
		
		<div class="header_logo" style=" margin-right:10%;">
		<a href="/"><img src="resources/image/slow.png"></a>
		</div>
		
<nav class="nabar" style="position:absolute; left:710px;">
	
	<ul class="navbar_menu" >
	<li><a href="/board">전체 게시판</a>
	</li>
	<li><a href="/board?bgnopage=1">Q&A</a>
	</li>
	<li><a href="/board?bgnopage=2">자유게시판</a>
	</li>
	<li><a href="/board?bgnopage=3">건의게시판</a>
	</li>
	<li ><a href="/contact2">contact us</a></li>
	</ul>
	
</nav>
		
		<ul class="header_login">
		
		<c:if test="${empty profile.signup_id}">
		<a href="signup"><li><i class="fa-solid fa-user-plus"></i></li></a>
      	<a href="signin"><li><i class="fa-solid fa-user"></i></li></a>
   		</c:if>
   
   
   
   
   
   		<c:if test="${!empty profile.signup_id}">
   <div class="container" 
   style="display:inline-block; width:360px; height:100px; 
   margin:0; padding:10px 0px; background-color:white; 
   font-family:'맑은고딕'; position: absolute; right:100px; top:12px;" >
      
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
      
      
      
        
        
        
        
     <a href='/userInformation2' onclick="window.open(this.href,'board','width=440, height=590,top=100,left=500');return false;"><button class="btn btn-primary" 
     style="display:inline-block; width:80px; height:30px; border:0px solid white; border-radius:20px; 
      background-color:#c1c1c1; font-size:11px; position:absolute; top:60px; left:125px;">마이페이지</button>
      </a>
      
      <br>
      </div>
      
      </div>
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

</header>
</html>