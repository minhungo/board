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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" crossorigin="anonymous"></script>
<style>
@import url('https://fonts.googleapis.com/css?family=Khula:400,700');

.button-strip {
    border: 2px solid #1496BD;
    border-radius: 5px;
    display: flex;
    margin: 15px;
}

.strip-button {
    background-color: white;
    color: #1496BD;
    width: 50%;
    height: 100%;
    text-align: center;
    vertical-align: middle;
    line-height: 65px;
    transition: background-color .4s linear, color .2s linear;
    cursor: pointer;
}

.strip-button span {
    color: inherit;
}

.strip-button-text {
    font-family: 'Khula', sans-serif;
    font-weight: 400;
    font-size: 22px;
    color: #1496BD;
}

.active-strip-button {
    background-color: #1496BD;
    color: white;
}

th,td{
padding:8px; 
border-bottom:1px solid;
border-color: rgba(0,0,0,0.25);
}

td{
font-weight:  400;
}

#container {
  margin: 0 auto;
}

.highcharts-figure,
.highcharts-data-table table {
  margin: 0 auto;
}

.highcharts-data-table table {
  font-family: Verdana, sans-serif;
  border-collapse: collapse;
  border: 1px solid #ebebeb;
  margin: 10px auto;
  text-align: center;
}

.highcharts-data-table caption {
  padding: 1em 0;
  font-size: 1.2em;
  color: #555;
}

.highcharts-data-table th {
  font-weight: 600;
  padding: 0.5em;
}

.highcharts-data-table td,
.highcharts-data-table th,
.highcharts-data-table caption {
  padding: 0.5em;
}

.highcharts-data-table thead tr,
.highcharts-data-table tr:nth-child(even) {
  background: #f8f8f8;
}

.highcharts-data-table tr:hover {
  background: #f1f7ff;
}

.highcharts-figure container2 {
    max-height: 400px;
}

</style>

</head>
    <body class="sb-nav-fixed">
    <form role="Form" method="get">
 <!-- ?????? ?????? header nav ??????-->       
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            
            <a class="navbar-brand ps-3" href="/">Slow</a>
            
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>       
        </nav>  
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" >
                    <div class="sb-sidenav-menu pt-4" >
                        <div class="nav">
                            <a class="nav-link" href="admin">
                                ??????                          
                            </a>

                            <a class="nav-link" href="getLookerStudio">
                                ??????????????????
                            </a>
                              
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                             ??????   
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                           
                           
                           
                           
                           
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="adminpro">?????? ??????</a>
                                    <a class="nav-link" href="adminreport">?????? ?????????</a>
                                    <a class="nav-link" href="userReportlist">?????? ?????? ??????</a>
                                    <a class="nav-link" href="sanctionslist">?????? ??? ??????</a>
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
                        
                        <h1 class="mt-4">
                            <script>
                                var today = new Date();
                                var year = today.getFullYear();
                                var month = today.getMonth()+1;
                                var date = today.getDate();
                                var day = today.getDay();
                                var hours= today.getHours();
                                var minutes = today.getMinutes();
                                document.write(year+"??? "+month+"??? "+date+"??? "+hours+"??? "+minutes+"??? ");
                            </script>
                        </h1>
                        <div id="content"></div>
                        <div class="row" id="row1" >

                            <!-- ??????.js -->
                                <div class="col-xl-6" style="float: left;">
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <i class="fas fa-chart-bar me-1"></i>
                                            ?????? ?????? ??????
                                        </div>
                                        <div class="card-body"><canvas id="BarChart"></canvas></div>
                                    </div>
                                </div>
                                <div class="col-xl-6" style="float: right;">
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <i class="fas fa-chart-bar me-1"></i>
                                            ?????? ?????? ??????
                                        </div>
                                        <div class="card-body"><canvas id="polarAreaChart"></canvas></div>
                                    </div>
                                </div>
                            <!-- ??????.js -->
                            
                        </div>

                        <div class="row" id="row2" style="display:none;">
                        <!-- ??????.js -->
                            <div class="col-xl-6" style="float: left;">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                       ?????? ????????? ?????? ????????? ???,?????? ???
                                    </div>
                                    <figure class="highcharts-figure">
                                      <div id="container"></div>
                                    </figure>
                                </div>
                            </div>
                            <div class="col-xl-6" style="float: right;">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                       ?????? ????????? ??? ??? ?????? ????????? ??? ???????????? ??????????????? ??? ??? ????????? ????????? ??????
                                    </div>
                                    <figure class="highcharts-figure">
                                      <div id="container2"></div>
                                    </figure>
                                </div>
                            </div>
                        <!-- ??????.js -->

                        </div>
                    </div>

            <h3 style="margin:30px 50px;">????????? ??????</h3>

            <table style="width: 1600px; margin: 30px 30px; text-align: center;">
               <thead
                  style="font-size: 20px; border-top: 2px solid black; border-bottom: 2px solid black;">

                  <tr>
                     <th style="width: 70px; height: 50px;">??????</th>
                     <th style="width: 100px; height: 50px;">??????</th>
                     <th style="width: 800px; height: 50px;">??????</th>
                     <th style="width: 150px; height: 50px;">?????????</th>
                     <th style="width: 300px; height: 50px;">?????????</th>
                     <th style="width: 200px; height: 50px;">??????</th>
                  </tr>
               </thead>
               <c:forEach var="BoardDTO" items="${ list }">
                  <tr>
                     <td>${BoardDTO.board_idx}</td>
                     <c:choose>
                        <c:when test="${BoardDTO.bgno == 1}">
                           <td style="color: blue;">Q&A</td>
                        </c:when>
                        <c:when test="${BoardDTO.bgno == 2}">
                           <td style="color: purple">??????</td>
                        </c:when>
                        <c:when test="${BoardDTO.bgno == 3}">
                           <td style="color: brown;">??????</td>
                        </c:when>
                     </c:choose>


                     <td><c:if test="${scri.keyword == ''}">
                           <a
                              href="readForm?board_idx=${BoardDTO.board_idx }
                             &bgnopage=${scri.bgnopage}
                             &page=${param.page eq null ? '1' : param.page}">
                              ${BoardDTO.board_title }</a>
                        </c:if> <!-- --------------------------------------------- --> <c:if
                           test="${scri.keyword != ''}">
                           <a
                              href="readForm?board_idx=${BoardDTO.board_idx }
                          &bgnopage=${scri.bgnopage}&page=${param.page ne null ? '1' : param.page}
                          &searchType=${ scri.searchType}&keyword=${scri.keyword }">
                              ${BoardDTO.board_title }</a>
                        </c:if></td>
                     <td>${BoardDTO.board_name }</td>
                     <td><c:set var="dateVar" value="${BoardDTO.board_date }" />
                        <fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd HH:MM" /></td>
                     <td>
                     ${BoardDTO.board_reportcheck}
                     </td>
                  </tr>
               </c:forEach>
            </table>
            
      
      
      
     <!-- ?????? -->
      		<div>
               <select name="searchType" class="me-2" style="width: 80px; height: 40px; float: left; margin-left:30px;">
               <option value="title"<c:out value="${scri.searchType eq 'board_title' ? 'selected' : ''}"/>>??????</option>
                    <option value="content"<c:out value="${scri.searchType eq 'board_content' ? 'selected' : ''}"/>>??????</option>
                    <option value="name"<c:out value="${scri.searchType eq 'board_name' ? 'selected' : ''}"/>>?????????</option>
                    <option value="titleOFcontent"<c:out value="${scri.searchType eq 'board_content' ? 'selected' : ''}"/>>??????+??????</option>
                </select>
           
                     <input class="form-control" type="text" placeholder="Search"
                        aria-label="Search" name="Keyword" id="KeywordInput" style="float: left; margin-left: 10px; margin-right: 5px; width: 400px; background-color:rgba(57,47,49,0.25); font-weight:bold; color:#392f31;"
                        value="${scri.keyword}" />
                     
                     <button  id="searchButton" style="float: left; margin-left: 12px; height:40px; width:80px; border-radius: 6px; background-color:#392f31;"
                        type="submit"><span class="txt_white">??????</span></button>


               <button type="button" onclick="location.href='writeForm'"
                  style="float: left; height: 40px; width: 80px; border-radius: 6px; background-color: #392f31; margin-left: 930px;">
                  <span class="txt_white">?????????</span>
               </button>
            </div>
       <!-- ?????? -->
      
      
      
      	
      
            
<!-- -------??????????????? -->
<br>
<br>
            <nav aria-label="...">
               <ul class="pagination justify-content-center">

                  <c:if test="${pageMaker.prev}">
                     <li class="page-item"><a class="page-link"
                        href="admin${pageMaker.makeSearch(pageMaker.startPage - 1)}">??????</a></li>
                  </c:if>
                  <c:forEach begin="${pageMaker.startPage}"
                     end="${pageMaker.endPage}" var="idx">
                     <li class="page-item"><a class="page-link"
                        href="admin${pageMaker.makeSearch(idx)}">${idx}</a></li>
                  </c:forEach>
                  <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                     <li class="page-item"><a class="page-link"
                        href="admin${pageMaker.makeSearch(pageMaker.endPage + 1)}">??????</a></li>
                  </c:if>
               </ul>
            </nav>


           
               
               
               
               
               
               
               
               
                
     
        </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="${path}/resources/assets/demo/admin_chartJS.js"></script>
        <script src="${path}/resources/assets/demo/buttonstrip.min.js"></script>
        <script>
            $( document ).ready(function() {

                chartJS();

            });

            var bs1 = new ButtonStrip({
                id: 'buttonStrip1'
            });
            bs1.addButton('Chart.JS', true, 'click', function(){
                toggleBtn();
            });
            bs1.addButton('HighChart.JS', false, 'click', function(){
                toggleBtn();
            });
            bs1.append('#content');

            const row2 = document.getElementById('row2');
            const row1 = document.getElementById('row1');

            function toggleBtn(){
                if(row2.style.display !== 'none'){
                    row2.style.display = 'none';
                    row1.style.display = 'block';
                }else{
                    row2.style.display = 'block';
                    row1.style.display = 'none';
                }
            }

        </script>

        <!-- highcharts -->
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/highcharts-more.js"></script>
        <script src="https://code.highcharts.com/modules/solid-gauge.js"></script>
        <!-- highcharts -->

    </body>
</html>