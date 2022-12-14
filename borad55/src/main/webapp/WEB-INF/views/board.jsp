<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${path}/resources/css/spcss.css" rel="stylesheet"/> 	
<meta name="viewport" content="width=device=width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<style>

select {
	box-sizing: border-box;
	width: 100px;
	padding: 4px;
	font-size: 14px;
	font-family:'맑은 고딕';
	border-radius: 6px;
}

option {
	padding: 4px;
	font-size: 14px;
	color: black;
	background: white;
	font-family:'맑은 고딕';
	font-weight: bold; 
}

button {
    font-family:'맑은 고딕';
	font-weight: bold;
}

input {
    font-family:'맑은 고딕';
	font-weight: bold;

}

th,td{
padding:8px; 
border-bottom:1px solid;
border-color: rgba(0,0,0,0.25);
}

td{
font-weight:  400;
}

/**a태그 색상 변경**/
	#readlink:link {color:blue; text-decoration:none;}
    #readlink:visited {color:blue; text-decoration:inherit;}
   	#click:hover {color:gray; background-color:#f8f8f8; text-decoration:none;}
    #readlink:active {color:red; text-decoration:none;}


*{margin:0; padding:0;}       
.banner_wraper { position: absolute; width: 200px;height: 800px; overflow:hidden; }
.banner_wraper img { width:200px; height: 800px;  position: absolute;  }

</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script>
//client rolling banner
   window.onload = function() {
            var bannerLeft=0;
            var first=1;
            var last;
            var imgCnt=0;
            var $img = $(".banner_wraper img");
            var $first;
            var $last;

            $img.each(function(){  
                $(this).css("left",bannerLeft);
                bannerLeft += $(this).width()+2;
                $(this).attr("id", "banner"+(++imgCnt));  
            });

            
            if( imgCnt > 1){              

                last = imgCnt;
                setInterval(function() {
                    $img.each(function(){
                        $(this).css("left", $(this).position().left-1); 
                    });
                    $first = $("#banner"+first);
                    $last = $("#banner"+last);
                    if($first.position().left < -200) {    
                        $first.css("left", $last.position().left + $last.width()+2 );
                        first++;
                        last++;
                        if(last > imgCnt) { last=1; }   
                        if(first > imgCnt) { first=1; }
                    }
                },25);      
 }
};
</script>



</head>
<body><!--  바디  -->
<c:import url="header.jsp"/>
<hr style="height:3px; ">



<!--  채팅 기능 폼 영역 -->
<div class="container-fluid row" style="background-color:skyblu; height:1300px; margin:auto;">
<div class="container" style="background-color:white; width:300px; height:800px; margin-top:70px; ">
         <img src="resources/image/banner2.png" width="500" height="900">

<div class="d-flex" style="border: 0px; position:absolute; top:230px; left:120px; width:220px;">  
      <div class="container row" style="background-color: white; padding: 0px">
           <c:if test="${empty profile.signup_id}">
              <c:forEach var="connectUser" items="${connectUser}">
                 <div class="border-bottom " style="width: 230px; padding: 0px;" id="${connectUser.signup_nickname}" onclick="settingMenuToggle2(); test1('${connectUser.signup_nickname}','${profile.signup_id }');">
                    <div class="chat_img ">
                       <img src="resources/img/${connectUser.signup_profle_img}">
                    </div>
                    <span style="padding-left: 100px">${connectUser.signup_nickname}</span>
                    <c:choose>
                      <c:when test="${connectUser.signup_grade eq 'bronze' }"><span   style="align:right;"><img src="resources/image/bronze.png" width="30" height="30" ></span></c:when>
                      <c:when test="${connectUser.signup_grade eq 'silver' }"><span   style="margin-right: 0px"><img src="resources/image/silver.png" width="30" height="30"></span></c:when>
                      <c:when test="${connectUser.signup_grade eq 'gold' }"><span   style="margin-right: 0px"><img src="resources/image/gold.png" width="30" height="30"></span></c:when>
                      <c:when test="${connectUser.signup_grade eq 'platinum' }"><span   style="margin-right: 0px"><img src="resources/image/platinum.png" width="30" height="30"></span></c:when>
                      <c:when test="${connectUser.signup_grade eq 'diamond' }"><span   style="float:right: 0px"><img src="resources/image/diamond.png" width="35" height="35"></span></c:when>
                    </c:choose>
                 </div>
              </c:forEach>
           </c:if>

               <c:if test="${!empty profile.signup_id}">
                  <c:forEach var="connectUser" items="${connectUser}">
                     <div class="border-bottom " style="width: 230px; padding: 0px;" id="${connectUser.signup_nickname}" onclick="settingMenuToggle2(); test1('${connectUser.signup_nickname}','${profile.signup_id }');">
                        <div class="chat_img ">
                           <img src="resources/img/${connectUser.signup_profle_img}">
                        </div>
                        <span style="padding-left: 100px">${connectUser.signup_nickname}</span>
                        <c:choose>
       <c:when test="${connectUser.signup_grade eq 'bronze' }"><span   style="padding-left: 10px"><img src="resources/image/bronze.png" width="30" height="30"></span></c:when>
      <c:when test="${connectUser.signup_grade eq 'silver' }"><span   style="padding-left: 10px"><img src="resources/image/silver.png" width="30" height="30"></span></c:when>
      <c:when test="${connectUser.signup_grade eq 'gold' }"><span   style="padding-left: 10px"><img src="resources/image/gold.png" width="30" height="30"></span></c:when>
      <c:when test="${connectUser.signup_grade eq 'platinum' }"><span   style="padding-left: 10px"><img src="resources/image/platinum.png" width="30" height="30"></span></c:when>
      <c:when test="${connectUser.signup_grade eq 'diamond' }"><span   style="padding-left: 10px"><img src="resources/image/diamond.png" width="35" height="35"></span></c:when>      
      </c:choose>
                     </div>
                  </c:forEach>
               </c:if>

            </div>
</div>
</div>


<!--  게시판 기능 폼 영역 -->
<div class="container row " style="background-color:white; width:1200px; height:1000px; ">
<div class="container">


 <c:choose>
	<c:when test="${scri.bgnopage == 0}">
	<p class="mb-3 mt-5 text-center" style="font-size: 23px;  color: black; text-shadow: 1px 1px 1.5px ;">전체게시판
  <img src="resources/image/earth.jpg" style="width: 50px"></p>
	</c:when>
	
	<c:when test="${scri.bgnopage == 1}">
	<p class="mb-3 mt-5 text-center" style="font-size: 23px;  color: black; text-shadow: 1px 1px 1.5px ;">QnA
  <img src="resources/image/question2.png" style="width: 50px"></p>
	</c:when>
     
     <c:when test="${scri.bgnopage == 2}">
	<p class="mb-3 mt-5 text-center" style="font-size: 23px;  color: black; text-shadow: 1px 1px 1.5px ;">자유게시판
  <img src="resources/image/all.png" style="width: 50px"></p>
	</c:when>
	
	<c:when test="${scri.bgnopage == 3}">
	<p class="mb-3 mt-5 text-center" style="font-size: 23px;  color: black; text-shadow: 1px 1px 1.5px ;">건의게시판
  <img src="resources/image/건의.png" style="width: 50px"></p>
	</c:when>
</c:choose>
	 
	<form role="Form" method="get"> 
	
	<table style="width: 1000px; margin-left: auto; margin-right: auto; text-align:center;">
		
			<thead >
			<tr style="font-size:20px; border-top:2px solid black; border-bottom:2px solid black;">
				<th scope="col">No</th>
				<th scope="col">카테고리</th>
				<th scope="col">작성자</th>
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
			</thead>
			
 <c:forEach var="BoardDTO" items="${ list }">  
       <tr id="click">
        <td >${BoardDTO.board_idx}</td>
           <c:choose >
              <c:when test="${BoardDTO.bgno == 1}">
              <td style="color:dark;">Q&A</td>
              </c:when>
            <c:when test="${BoardDTO.bgno == 2}">
            <td style="color:dark">자유</td>
            </c:when>
            <c:when test="${BoardDTO.bgno == 3}">
            <td style="color:dark;">건의</td>
            </c:when>
            </c:choose>
            
            
            
	    <td><img src="resources/img/${BoardDTO.board_profle_img}" width="20" height="20">${BoardDTO.board_name }</td>
        
        
        <td>	
        <c:if test="${scri.keyword == ''}">
        <a href="readForm?board_idx=${BoardDTO.board_idx}&bgnopage=${scri.bgnopage}&page=${param.page eq null ? '1' : param.page}" 
        id="readlink">
        ${BoardDTO.board_title }</a>
        </c:if>
        
 
        	 <c:if test="${BoardDTO.board_reply_cnt != 0}"> 
        		<font style="color:#ff0000; font-size: 13px"><b>[${BoardDTO.board_reply_cnt}]</b></font> 
  			</c:if>
  		    
        <c:if test="${scri.keyword != ''}">
        <a href="readForm?board_idx=${BoardDTO.board_idx }&bgnopage=${scri.bgnopage}&page=${param.page ne null ? '1' : param.page}&searchType=${ scri.searchType}&keyword=${scri.keyword }">
        ${BoardDTO.board_title }</a>
        </c:if>
        </td>
        
         <td>
     <c:set var="dateVar" value="${BoardDTO.board_date }"/>
      <fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd HH:MM"/>
      </td>
      <td style="color:#320606;">${BoardDTO.board_hit }</td>
     </tr> 
</c:forEach>

	</table>
 
    
	<div class="container row" style="margin:20px 0px; padding-left:90px; width:1100px;">
      
         <form  name=searchForm action="list" method="get">
          <input type="hidden" name="page" value="1">
         
            
               <select name="searchType" class="me-2" style="width: 80px; height: 40px;">
               <option value="title"<c:out value="${scri.searchType eq 'board_title' ? 'selected' : ''}"/>>제목</option>
                    <option value="content"<c:out value="${scri.searchType eq 'board_content' ? 'selected' : ''}"/>>내용</option>
                    <option value="name"<c:out value="${scri.searchType eq 'board_name' ? 'selected' : ''}"/>>작성자</option>
                    <option value="titleOFcontent"<c:out value="${scri.searchType eq 'board_content' ? 'selected' : ''}"/>>제목+내용</option>
                </select>
                <!-- --------------------------------------- -->
           
         				
         
                     <input class="form-control" type="text" placeholder="Search"
                        aria-label="Search" name="Keyword" id="KeywordInput" style="margin-left: 0px; margin-right: 5px; width: 400px; background-color:rgba(57,47,49,0.25); font-weight:bold; color:#392f31;"
                        value="${scri.keyword}" />
                     
                     <button  id="searchButton" style="height:40px; width:80px; border-radius: 6px; background-color:#392f31; margin-left:0px;"
                        type="submit"><span class="txt_white">검색</span></button>
                     
                     
                     
                    <c:if test="${empty profile.signup_id}">
  					</c:if>
			
			
					<c:if test="${!empty profile.signup_id}">
                  	<button  type="button" onclick="location.href='writeForm'" style="height:40px; width:80px; border-radius: 6px; background-color:#392f31; margin-left:330px;">
                  	<span class="txt_white">글쓰기</span></button>
				   </c:if>
                     
                     
                     </form>
                      
                      
                      
                      
      
   </div>
	
	<nav aria-label="...">
		<ul class="pagination justify-content-center">  
		
    <c:if test="${pageMaker.prev}">
          <li  class="page-item"><a class="page-link" href="board${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	 <li class="page-item"><a class="page-link" href="board${pageMaker.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>
    <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
    	<li  class="page-item"><a class="page-link" href="board${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
    </ul>
	</nav>
  
            <br>
            <br>
            <div>
             <h2 style="margin-left: 72px"><b>이달의 추천 도서</b> <img src="resources/image/Book.png" width=30px height=30px ></h2> 
            <br>
            </div>
            
            
               <div class="container "
                  style="display: inline-block; width: 200px; border-radius: 10px; background-color: #fff; border: 1px solid black; margin-left: 85px; 
                  margin-right: 55px">
                  <img src="resources/image/jump.jpg" height="180" width="180"><a href="https://product.kyobobook.co.kr/detail/S000001817933">
               <span style="font-style:italic;">점프 투 파이썬</span></a>
               </div>

               <div class="container "
                  style="display: inline-block; width: 200px; border-radius: 10px; background-color: #fff; border: 1px solid black;  margin-right: 55px; ">
                  <img src="resources/image/Database.jpg" height="180" width="180">
                   <a href="https://ebook-product.kyobobook.co.kr/dig/epd/ebook/E000002945300">
                   <span style="font-style:italic;">오라클</span></a>
               </div>
               
               
               <div class="container "
                  style="display: inline-block; width: 200px; border-radius: 10px; background-color: #fff; border: 1px solid black; margin-right: 55px;">
                  <img src="resources/image/go.jpg" height="180" width="180">
                   <a href="https://ebook-product.kyobobook.co.kr/dig/epd/ebook/E000003001553">
               <span style="font-style:italic;">GO 프로그래밍</span></a>
               </div>
               
               
               <div class="container "
                  style="display: inline-block; width: 200px; border-radius: 10px; background-color: #fff; border: 1px solid black; ">
                  <img src="resources/image/java.jpg" height="180" width="180">
                  <a href="https://ebook-product.kyobobook.co.kr/dig/epd/ebook/E000002945295">
               <span style="font-style:italic;">자바 프로그래밍</span></a>
               </div>
               
               
               


              <br>
              <br>
              <br>
             <a href="https://www.wavve.com/search?searchWord=%EC%95%BD%ED%95%9C%EC%98%81%EC%9B%85"><img src="resources/image/wow2.png" height="150" width="1500"></a>
  
  
  
  
  
</div>
</div>






<!--  뒤로가기 업로딩 -->
  <script>
     
     window.onpageshow = function(event){
     if(event.persisted){
     
     document.location.reload();
     }
     
   };
   </script>
<!-- -------------------------------------------------- -->



<!--  배너 영역 -->
<div class="container " style="background-color:geen; width:200px; height:1300px;">
<div class="banner_wraper" style="margin-top:80px;">
    <img src="resources/image/vertical ad 2.png" alt=""><img src="resources/image/asd.png" alt="">
</div>
</div>
</div>





	




<c:import url="footer.jsp"/>
<script type="text/javascript" src="${path}/resources/js/js.js"></script>

</body>
</html>