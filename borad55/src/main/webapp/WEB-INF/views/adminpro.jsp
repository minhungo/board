<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device=width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="${path}/resources/css/styles.css" rel="stylesheet"/>        
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<style>

th,td{
padding:8px; 
border-bottom:1px solid;
border-color: rgba(0,0,0,0.25);
}

td{
font-weight:  400;
}

</style>



</head>


  <body class="sb-nav-fixed">
    <form role="Form" method="get">
 <!-- 여기 밑이 header nav 영역-->       
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            
            <a class="navbar-brand ps-3" href="/admin">Slow</a>
            
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>       
        </nav>  
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" >
                    <div class="sb-sidenav-menu pt-4" >
                        <div class="nav">
                            <a class="nav-link" href="admin">
                                메인                          
                            </a>
                          
                              
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                             관리   
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                           
                           
                           
                           
                           
                           
                           
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="adminpro">회원 관리</a>
                                    <a class="nav-link" href="adminreport">신고 게시판</a>
                                    <a class="nav-link" href="userReportlist">유저 신고 내역</a>
                                    <a class="nav-link" href="sanctionslist">제재 된 유저</a>
                                </nav>
                            </div>
                            
                            
                            
                            
                        </div>
                    </div>
                      <div class="sb-sidenav-footer">
                     <a href="/logout_action" style="text-decoration:none; color:white">Logout</a>
                    </div>
                </nav>
            </div>

     
     
            <div id="layoutSidenav_content">
               
               
               
                <main>
                    <div class="container-fluid px-4">
                    
             
                    
                    
                     <div class="container-fluid px-4">
                        <h1 class="mt-4">
                            <script>
                                var today = new Date();
                                var year = today.getFullYear();
                                var month = today.getMonth()+1;
                                var date = today.getDate();
                                var day = today.getDay();
                                var hours= today.getHours();
                                var minutes = today.getMinutes();
                                document.write(year+"년 "+month+"월 "+date+"일 "+hours+"시 "+minutes+"분 ");
                            </script>
                        </h1>
                    </div>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                        
                    <h3 style="margin:30px 30px;">유저 리스트</h3>
                     <table style=" width:1600px;   margin: 30px 10px; text-align:center; ">
               <thead style="font-size:20px; border-top:2px solid black; border-bottom:2px solid black;">
               <tr >
                  <th style="width:70px; height: 50px;">회원번호</th>
                  <th style="width:100px; height: 50px;">아이디</th>
                  <th style="width:150px; height: 50px;">닉네임</th>
                  <th style="width:150px; height: 50px;">이름</th>
                  <th style="width:300px; height: 50px;">email</th>
                  <th style="width:200px; height: 50px;">가입날짜</th>
                  <th style="width:300px; height: 50px;">가입경로</th>
                  <th style="width:200px; height: 50px;">상세정보</th>
               </tr>
               </thead>




             
               <c:forEach var="signupDTO" items="${ signuplist }">
               <tr>
                  <td>${signupDTO.signup_num }</td>
                  <td>${signupDTO.signup_id }</td>
                  <td> ${signupDTO.signup_nickname }</td>
                  <td>${signupDTO.signup_name }</td>
                  <td>${signupDTO.signup_email }</td>
                  <td><c:set var="dateVar" value="${signupDTO.signup_date }" />
                  <fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd HH:MM" /></td>
                  <td>${signupDTO.signup_data }</td> 
  
                  <td><a href='/userInformation?signup_num=${signupDTO.signup_num }' onclick="window.open(this.href,'유저정보','width=600,height=670,top=100,left=500');return false;">상세정보</a></td>
                 

               </tr>
               </c:forEach>
              
                </table>
                
                
    
    <input type="hidden" name="signup_num" value="${signupDTO.signup_num}">
    <input type="hidden" name="signup_id" value="${signupDTO.signup_id}">
    <input type="hidden" name="signup_nickname" value="${signupDTO.signup_nickname}">
    <input type="hidden" name="signup_name" value="${signupDTO.signup_name}">
    <input type="hidden" name="signup_date" value="${signupDTO.signup_date}">
    <input type="hidden" name="signup_data" value="${signupDTO.signup_data}">
    <input type="hidden" name="signup_email" value="${signupDTO.signup_email}">
    <input type="hidden" name="signup_adr" value="${signupDTO.signup_adr}">
    <input type="hidden" name="signup_adr_point" value="${signupDTO.signup_adr_point}">
   
  
  
               
 </div>
         
         
         
         
              <!-- 검색 -->
      		       <select name="searchType" class="me-2" style="float:left; width: 80px; height: 40px; margin-left:30px;">
               <option value="ID"<c:out value="${scri.searchType eq 'signup_id' ? 'selected' : ''}"/>>아이디</option>
                    <option value="nickname"<c:out value="${scri.searchType eq 'signup_name' ? 'selected' : ''}"/>>닉네임</option>
                    <option value="name"<c:out value="${scri.searchType eq 'signup_name' ? 'selected' : ''}"/>>이름</option>
                    
                     
                </select>
                <!-- --------------------------------------- -->
           
                     <input class="form-control" type="text" placeholder="Search"
                        aria-label="Search" name="Keyword" id="KeywordInput" style="float:left; margin-left: 0px; margin-right: 5px; width: 400px; background-color:rgba(57,47,49,0.25); font-weight:bold; color:#392f31;"
                        value="${scri.keyword}" />   
                        
                         <button  id="searchButton" style="height:40px; width:80px; border-radius: 6px; background-color:#392f31; margin-left:0px;"
                        type="submit"><span class="txt_white">검색</span></button>
                               
                </main>

            </div>
        </div>
           <!-- 검색 -->
                     
                     
                     
                     <br>
                     <br>
                      <nav aria-label="...">
               <ul class="pagination justify-content-center">
					
                  <c:if test="${pageMaker.prev}">
                     <li class="page-item"><a class="page-link"
                        href="adminpro${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
                  </c:if>
                  <c:forEach begin="${pageMaker.startPage}"
                     end="${pageMaker.endPage}" var="idx">
                     <li class="page-item"><a class="page-link"
                        href="adminpro${pageMaker.makeSearch(idx)}">${idx}</a></li>
                  </c:forEach>
                  <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                     <li class="page-item"><a class="page-link"
                        href="adminpro${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
                  </c:if>
               </ul>
            </nav>
         
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                               
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        
 
    </body>
</html>