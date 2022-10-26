<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

 
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>유저 제재</title>

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


<!-- 7일후 날짜 구하느 -->


</head>
<body>

  
  
  


<form action="sanctionsAction" method="POST">
     <div style="max-height:500px;">
             <h3 class="mt-3" style="color:#BD0404;"><img src="resources/image/alert2.png" width="50" height="50" style="margin-bottom:10px;">&nbsp;<strong>제재하기</strong></h3>
             <hr class="mb-5" style="border: 3px double;">
             
            
            
             <table class="ms-3 mt-5" style="margin-left:15px; width:500px; text-align:center;">
                <tr>
                   <th style="text-align:left; padding-left:50px; font-size:15px;">
          
                   </th>
                   
                   
                </tr>
                   
                <tr>
          
                 
                      <c:set var="str_sanctions" value="<%=new java.util.Date()%>"/>

                      <c:set var="str_sanctions"><fmt:formatDate value="${str_sanctions}" pattern="yyyy/MM/dd" /></c:set>
                                                    
                    
                   <td>

                        <input type=text  name="str_sanctions" value="${str_sanctions}">&nbsp;&nbsp;~&nbsp;&nbsp;
                        
                           <select name="and_sanctions" class="me-2" style="width: 180px; height: 40px;">
                        
                        <option value=<c:out value="${strDate3}"/>><c:out value="${strDate3}"/></option>
                        <option value=<c:out value="${strDate7}"/>><c:out value="${strDate7}"/></option>
                        <option value=<c:out value="${strDate30}"/>><c:out value="${strDate30}"/></option>
          
                 </select>          
                  </td>
               </tr>
               </table>


            <div class="d-grid gap-2 col-4 mx-auto" style="margin-top:55px;">

            <input type="hidden" name="signup_num" value="${signup_num}">
            
            
            
                 <div>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 제재 사유</div>
              <select name="true_sanctions" class="me-2" style="width: 150px; height: 40px;">
                           
                        <option value="음란성 게시물">음란성 게시물</option>
                         <option value="광고성 게시물">광고성 게시물</option>
                          <option value="욕설/부적절한 언어">욕설/부적절한 언어</option>
                           <option value="도배성 게시물">도배성 게시물</option>
                            <option value="정치성 게시물">정치성 게시물</option>
                             <option value="종교유도 게시물">종교유도 게시물</option>
                              <option value="선동성 게시물">선동성 게시물</option>
                              
              </select>         
            
            <button type="submit" class="btn btn-outline-danger">제재하기</button>
         
            </div>
            </div>
        </form>


</body>
</html>