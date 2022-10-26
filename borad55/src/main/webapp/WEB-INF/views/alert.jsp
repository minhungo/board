<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<!DOCTYPE html>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
var msg = "<c:out value='${msg_str}'/>";
var msg_and = "<c:out value='${msg_and}'/>";
var msg_true = "<c:out value='${msg_san}'/>";

var url = "<c:out value='${url}'/>";
alert(' '+'"${msg_san}"'+'로 인해 '+' '+'${msg_str}'+' '+'~'+' '+'${msg_and}'+' '+'까지'+'   '+'계정이 정지 되었습니다.'+'  '+'고객센터에 문의하세요.');

location.href='<c:out value="${pageContext.request.contextPath}"/>${url}';

</script>