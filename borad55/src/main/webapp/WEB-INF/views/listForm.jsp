<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록보기</title>

<style type="text/css">


     *{
        margin:0 auto;
        padding: 0 auto;
        overflow: hidden;
        
     }
	
  
   	ul {
   	    
			list-style: none;
			width : 10%;
		
			
			text-align: center;
			
			
		
		}
		
		li{
		list-style: none; float: left; padding: 1px; }
		
    td, h2{
             text-align: center;
   
   }
   
#sh{

			text-align: center;
					
}

.search{
            text-align: center;
}


   
</style>
</head>
<body>

<H2>게시판 글목록</H2>


<form role="Form" method="get"> 

<table width="500" cellpadding="0" cellspacing="0" border="1">

<tr>
       <th>번호</th>
       <th>이름</th>
       <th>제목</th>
       <th>날짜</th>
       <th>조회수</th>
</tr>


<c:forEach var="BoardDTO" items="${ list }">

       <tr>
        <td>${ BoardDTO.board_idx }</td>
	        <td>${BoardDTO.board_name }</td>
	      
        
        <td>
        <c:if test="${scri.keyword == ''}">
        <a href="readForm?board_idx=${BoardDTO.board_idx }&page=${param.page eq null ? '1' : param.page}">
        ${BoardDTO.board_title }</a>
        </c:if>
     <!-- --------------------------------------------- -->    
        <c:if test="${scri.keyword != ''}">
        <a href="readForm?board_idx=${BoardDTO.board_idx }&page=${param.page ne null ? '1' : param.page}&searchType=${ scri.searchType}&keyword=${scri.keyword }">
        ${BoardDTO.board_title }</a>
        </c:if>
        
        </td>
        
        
     <td>
     <c:set var="dateVar" value="${BoardDTO.board_date }"/>
      <fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd HH:MM"/>
      </td>
      <td>${BoardDTO.board_hit }</td>
     </tr> 
</c:forEach>


<!-- ------------------------- -->
<tr>
<td colspan="5"><a href="writeForm">글작성</a>   

<a href="signup">회원가입창</a>   
<a href="signin">로그인창</a>
</td>     
</tr>

</table>

<div>

  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="listForm${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="listForm${pageMaker.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
    	<li><a href="listForm${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>

<!-- ------- -->
<div class="search">

   <Form name=searchForm action="list" method="get">
   
   <input type="hidden" name="page" value="1">
    <select name="searchType">
    
      <!--텍스트 타입으로 만든 목록 혹시나해서 만듬 밑에 버튼으로도 돌아가는데 이걸로도 돌아감 혹시나 해서 남김 (공부용)-->
      <%-- option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>목록보기</option> --%>                                                               <!-- 셀렉트벨류들 가져오는 함수 selected -->
      <option value="title"<c:out value="${scri.searchType eq 'board_title' ? 'selected' : ''}"/>>제목</option>
      <option value="content"<c:out value="${scri.searchType eq 'board_content' ? 'selected' : ''}"/>>내용</option>
      <option value="name"<c:out value="${scri.searchType eq 'board_name' ? 'selected' : ''}"/>>작성자</option>
      <option value="titleOFcontent"<c:out value="${scri.searchType eq 'board_content' ? 'selected' : ''}"/>>제목+내용</option>
      </select>
         
         <!--  위에 옵션 n을 해도  목록이 뜨는데 저건 텍스트값을 널값으로 줘야 넘어감 그래서 버튼이 더편함 공부용으로 남겨줌 -->
        <!-- --------------------------------- -->
        <input type="text" name="Keyword" id="KeywordInput" value="${scri.keyword}"/>
 


<button id="searchButton" type="submit">검색</button>
</Form>
 <a href="listForm"><input type="button" value="목록보기"></a>

<!--  버튼 눌렀을때 검색 -->
  
</div>

<script>
      $(function(){
        $('#searchButton').click(function() {
          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   

</script> 
    
<!--  뒤로가기해도 조회수 증가 -->
  <script>
     
     window.onpageshow = function(event){
     if(event.persisted){
     
     document.location.reload();
     }
     
   };
   </script>
 

</body> 
</html>