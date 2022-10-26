<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<link href="${path}/resources/css/spcss.css" rel="stylesheet"/> 	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DynaPuff&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/d21710f86c.js" 
crossorigin="anonymous">	
</script>

<style>

</style>
<nav class="nabar border">
	<ul class="navbar_menu">
	<li><a href="/board?bgnopage=0">전체 게시판</a></li>
	
	<li><a href="/board?bgnopage=1">Q&A</a>
	<ul class="sub-menu">
		<li><a href="#">서브1</a></li>
		<li><a href="#">서브2</a></li>
		<li><a href="#">서브3</a></li>
	</ul>
	</li>
	<li><a href="/board?bgnopage=2">자유게시판</a></li>
	<li><a href="/board?bgnopage=3">건의 게시판</a></li>
	<li><a href="/contact2">contact</a></li>
	</ul>
</nav>

</head>
<body>

</body>
</html>