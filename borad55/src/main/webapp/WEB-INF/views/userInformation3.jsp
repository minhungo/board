<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
   crossorigin="anonymous">
<script
   src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
   integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
   integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
   crossorigin="anonymous"></script>

<style>
body {
        height: 100vh;
        width: 100vw;
        background-image: url('resources/img/human1.png');
        background-repeat : no-repeat;
        background-size : cover;
      }
</style>

<script type="text/javascript">


function Update_User() {
	
	var name_id1 = document.getElementById("pro"); 
	var name_id2 = document.getElementById("pro2"); 
	

	if (name_id2.style.display == 'none') {
		
		name_id2.style.display = 'block';
		name_id1.style.display = 'none';
	}else{
		name_id1.style.display = 'block';
		name_id2.style.display = 'none';
	}
}	
	</script>




</head>



<body>

<form action="imgloadaction" method="post" enctype="multipart/form-data">
<table>
 <input type="hidden" name="signup_id" value="${profile.signup_id}">
         
        <td style="aligin:bottom;  background: transparent;  color:#FFFFFF; 
         font-size:20px; width:160px;  font-weight: 800; color: black; position:absolute; top: 200px; left: 57px;">${profile.signup_nickname }</td>
         <img src="resources/img/${profile.signup_profle_img}" width="220" height="150" style="position:absolute; bottom:260px; top:30px; left:60px; right:120px; color:white;">

        
        <label for="file"  id="pro" style="position: absolute; top: 250px; right:140px;" >
          <div class="btn btn-outline-primary" onclick="Update_User()">파일 업로드하기</div>
        </label>
        <input style="display: none;" type="file" name="file" id="file">
       
          <button type="submit" class="btn btn-outline-primary" id="pro2" style="position:absolute; top:300px; left: 56px; display: none">프로필 변경</button>
</table>
</form>

</body>
</html>