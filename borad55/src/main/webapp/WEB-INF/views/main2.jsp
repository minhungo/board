<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="${path}/resources/css/spcss.css" rel="stylesheet" />
<meta name="viewport" content="width=device=width, initial-scale=1.0">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
   crossorigin="anonymous">

<!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
    />

<style>
* {
   margin: 0;
   padding: 0;
}
th, td {
   padding: 8px;
   border-bottom: 1px solid;
   border-color: rgba(0, 0, 0, 0.25);
}

td {
   font-weight: 400;
}

.carousel-inner {
    height:400px;
}
</style>

</head>
<body>


    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100" src="resources/image/developer.png" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="resources/image/coding1.png" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="resources/image/developer.png" alt="Third slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="resources/image/coding1.png" alt="Forth slide">
            </div>
        </div>
    </div>





<div class="container-fluid row" style="background-color:skyblu; height:1300px; margin:auto;">


<div class="container" style="background-color:white; width:300px; height:800px; margin-top:70px; ">
<img src="resources/image/banner2.png" width="500" height="900">

<div class="d-flex" style="border: 0px; position:absolute; top:230px; left:120px; width:220px; margin-top:500px ">  
      <div class="container row"
         style="background-color: white; padding: 0px">
            </div>
</div>
</div>


      <!-- 제일 큰 컨테이너 -->
      <div class="container row "
         style="background-color: white; width: 1200px; height: 400px;">

         <!-- 중간 컨테이너 -->
         <div class="container "
            style="background-color: white; width: 570px; margin: 20px auto; padding: 0px;">

      
            
               <div class="container "
               style="background-color: white; width: 560px; height: 300px; padding: 20px 0px;">


               <table style="width: 550px; margin: 10px auto;">
                  <thead style="border-bottom: 2px solid black;">
                     <tr>
                        <th colspan="2"
                           style="padding-bottom: 20px; color: #392f31; font-size: 22px;">조회수&nbsp;<img src="resources/image/find.png" width="20" height="22"></th>
                        <td style="text-align: right; font-size: 15px; color: rgba(0, 0, 0, 0.5); 
                        font-weight: bold;"><a href="/board">+더보기</a></td>
                     </tr>
                  </thead>
                  
                  
                  
                  
                  <c:forEach var="BoardDTO" items="${ list3 }">
                     <tr id="click">

         <!-- 카테고리 나누기 main -->
                        <c:choose>
                           <c:when test="${BoardDTO.bgno == 1}">
                              <td style="width: 100px; font-weight: 400"><span
                                 style="margin: 1px; madding: 5px; color: skyblue;">QnA</span></td>
                           </c:when>
                           <c:when test="${BoardDTO.bgno == 2}">
                              <td style="width: 100px; font-weight: 400"><span
                                 style="margin: 1px; madding: 5px; color: skyblue;">자유</span></td>
                           </c:when>
                           <c:when test="${BoardDTO.bgno == 3}">
                              <td style="width: 100px; font-weight: 400"><span
                                 style="margin: 1px; madding: 5px; color: skyblue;">건의</span></td>
                           </c:when>
                        </c:choose>
         <!-- 카테고리 나누기 main -->
                        <td colspan="2">
                           <a href="readForm?board_idx=${BoardDTO.board_idx }">${BoardDTO.board_title }</a>
                           <span style="color: orange;">[${BoardDTO.board_reply_cnt}]</span> 
                           
                           
                           <span style="color: red;">H</span>
                           </td>
                     </tr>
                  </c:forEach>
                  
               </table>
            </div>


            <div class="container "
               style="background-color: white; width: 560px; height: 300px; padding: 20px 0px;">

               <table style="width: 550px; margin: 10px auto;">
                  
                  
                  
                  <thead style="border-bottom: 2px solid black;">
                     <tr>
                        <th colspan="2"
                           style="padding-bottom: 20px; color: #392f31; font-size: 22px;">추천수&nbsp;<img src="resources/image/gg.png" width="25" height="25"></th>
                        <td style="text-align: right;
                         font-size: 15px;
                          color: rgba(0, 0, 0, 0.5); font-weight: bold;"><a href="/board">+더보기</a></td>
                     </tr>
                  </thead>
                  
      

                  <c:forEach var="BoardDTO" items="${ list4 }">
                     
                     
                     <!-- 카테고리 나누기 main -->
                        <c:choose>
                           <c:when test="${BoardDTO.bgno == 1}">
                              <td style="width: 100px; font-weight: 400"><span
                                 style="margin: 1px; madding: 5px; color: skyblue;">QnA</span></td>
                           </c:when>
                           <c:when test="${BoardDTO.bgno == 2}">
                              <td style="width: 100px; font-weight: 400"><span
                                 style="margin: 1px; madding: 5px; color: skyblue;">자유</span></td>
                           </c:when>
                           <c:when test="${BoardDTO.bgno == 3}">
                              <td style="width: 100px; font-weight: 400"><span
                                 style="margin: 1px; madding: 5px; color: skyblue;">건의</span></td>
                           </c:when>
                        </c:choose>
                     <!-- 카테고리 나누기 main -->

                     <td colspan="2"><a
                           href="readForm?board_idx=${BoardDTO.board_idx }">${BoardDTO.board_title }</a>
                           <span style="color: orange;">[${BoardDTO.board_reply_cnt}]</span> 
                           
                           
                           <span style="color: red;" >H</span>
                           </td>
                     </tr>
                  </c:forEach>
               </table>
            </div>
            
            
         <!-- 10/11 추가코드 -->
            <br>
            <br>
            <h2 style="text-align: left; display:inline-block; "><b>이달의 추천 도서</b></h2>
            <img src="resources/image/Book.png" width=30px height=30px >
            
            <div class="container"
               style="height: 190px; margin-top: 55px; width: 500px; text-align: center;">
               <div class="container "
                  style="display: inline-block; width: 200px; border-radius: 10px; background-color: #fff; border: 1px solid black; margin-right: 20px;">
                  <img src="resources/image/jump.jpg" height="180" width="180">
               </div>

               <div class="container "
                  style="display: inline-block; width: 200px; border-radius: 10px; background-color: #fff; border: 1px solid black; margin-left: 20px;">
                  <img src="resources/image/Database.jpg" height="180" width="180">
               </div>

            </div>

            <div class="container"
               style="display: inline-block; text-align: center; text-weight: 300; font-size: 20px; padding-left: 60px; width: 284px;">
               <a href="https://product.kyobobook.co.kr/detail/S000001817933">
               <span style="font-style:italic;">점프 투 파이썬</span></a>
            </div>
            <div class="container"
               style="display: inline-block; text-align: center; text-weight: 300; font-size: 20px; width: 238px;">
               <a href="https://ebook-product.kyobobook.co.kr/dig/epd/ebook/E000002945300">
               <span style="font-style:italic;">오라클</span></a>
            </div>
            <!-- 10/11 추가코드 -->      


         </div>



         <div class="container "
            style="background-color: white; width: 570px; margin: 20px auto; padding: 0px;">



            <div class="container "
               style="background-color: white; width: 560px; height: 300px; padding: 20px 0px;">

               <table style="width: 550px; margin: 10px auto;">
                  
                  
                  
                  <thead style="border-bottom: 2px solid black;">
                     <tr>
                        <th colspan="2"
                           style="padding-bottom: 20px; color: #392f31; font-size: 22px;">질문&nbsp;<img src="resources/image/question2.png" width="20" height="22"></th>
                        
                        <td style="text-align: right; font-size: 15px; color: rgba(0, 0, 0, 0.5); font-weight: bold;">
                        <a href="/board?bgnopage=1">+더보기</a></td>
                     </tr>
                  </thead>
                  
      

                  <c:forEach var="BoardDTO" items="${ list }">
                     
                     <!-- 카테고리 나누기 main -->
                        <c:choose>
                           <c:when test="${BoardDTO.bgno == 1}">
                              <td style="width: 100px; font-weight: 400"><span
                                 style="margin: 1px; madding: 5px; color: skyblue;">QnA</span></td>
                           </c:when>
                           <c:when test="${BoardDTO.bgno == 2}">
                              <td style="width: 100px; font-weight: 400"><span
                                 style="margin: 1px; madding: 5px; color: skyblue;">자유</span></td>
                           </c:when>
                           <c:when test="${BoardDTO.bgno == 3}">
                              <td style="width: 100px; font-weight: 400"><span
                                 style="margin: 1px; madding: 5px; color: skyblue;">건의</span></td>
                           </c:when>
                        </c:choose>
                     <!-- 카테고리 나누기 main -->
                  
                  
                           <td colspan="2"><a
                           href="readForm?board_idx=${BoardDTO.board_idx }">${BoardDTO.board_title }</a>
                           <span style="color: orange;">[${BoardDTO.board_reply_cnt}]</span> 
                           
                           
                           <span style="color: red;">N</span>
                           </td>
                     </tr>
                  </c:forEach>
               </table>
            </div>
            
            
            
            
                  
            
            
            
            
            
            
            
            <div class="container "
               style="background-color: white; width: 560px; height: 300px; padding: 20px 0px;">

               <table style="width: 550px; margin: 10px auto;">
                  
                  
                  
                  <thead style="border-bottom: 2px solid black;">
                     <tr>
                        <th colspan="2"
                           style="padding-bottom: 20px; color: #392f31; font-size: 22px;">자유&nbsp;<img src="resources/image/all.png" width="20" height="22"></th>
                        <td style="text-align: right; font-size: 15px; color: rgba(0, 0, 0, 0.5); 
                        font-weight: bold;"><a href="/board?bgnopage=2">+더보기</a></td>
                     </tr>
                  </thead>
                  
      

                  <c:forEach var="BoardDTO" items="${ list2 }">
                     
                     <!-- 카테고리 나누기 main -->
                        <c:choose>
                           <c:when test="${BoardDTO.bgno == 1}">
                              <td style="width: 100px; font-weight: 400"><span
                                 style="margin: 1px; madding: 5px; color: skyblue;">QnA</span></td>
                           </c:when>
                           <c:when test="${BoardDTO.bgno == 2}">
                              <td style="width: 100px; font-weight: 400"><span
                                 style="margin: 1px; madding: 5px; color: skyblue;">자유</span></td>
                           </c:when>
                           <c:when test="${BoardDTO.bgno == 3}">
                              <td style="width: 100px; font-weight: 400"><span
                                 style="margin: 1px; madding: 5px; color: skyblue;">건의</span></td>
                           </c:when>
                        </c:choose>
                     <!-- 카테고리 나누기 main -->
                  
                  
                           <td colspan="2"><a href="readForm?board_idx=${BoardDTO.board_idx }">${BoardDTO.board_title }</a>
                           <span style="color: orange;">[${BoardDTO.board_reply_cnt}]</span> 
                           <span style="color: red;">N</span>
                           </td>
                     </tr>
                  </c:forEach>
               </table>
            </div>
            
            
            
            
            <!-- 10/11 추가코드2 -->
            <br>
            <br>
            <div class="container"
               style="height: 190px; margin-top: 100px; width: 500px; text-align: center;">
               <div class="container "
                  style="display: inline-block; width: 200px; border-radius: 10px; background-color: #fff; border: 1px solid black; margin-right: 20px;">
                  <img src="resources/image/go.jpg" height="180" width="180">
               </div>

               <div class="container "
                  style="display: inline-block; width: 200px; border-radius: 10px; background-color: #fff; border: 1px solid black; margin-left: 20px;">
                  <img src="resources/image/java.jpg" height="180" width="180">
               </div>

            </div>

            <div class="container"
               style="display: inline-block; text-align: center; text-weight: 300; font-size: 20px; padding-left: 60px; width: 284px;">
               <a href="https://ebook-product.kyobobook.co.kr/dig/epd/ebook/E000003001553">
               <span style="font-style:italic;">GO 프로그래밍</span></a>
            </div>
            <div class="container"
               style="display: inline-block; text-align: center; text-weight: 300; font-size: 20px; width: 238px;">
               <a href="https://ebook-product.kyobobook.co.kr/dig/epd/ebook/E000002945295">
               <span style="font-style:italic;">자바 프로그래밍</span></a>
            </div>
            <!-- 10/11 추가코드2 -->
            
            
            
            
            
            
            
            
         </div>
<!-- 중간 컨테이너 끝 -->

      </div>
<!-- 젤 큰 컨테이너 끝 -->


      <div class="container "style="background-color: geen; width: 200px; height: 1300px;">
         <a href="https://sesac.seoul.kr/common/greeting.do">
            <img src="resources/image/ccccc.jpg" width="350px" height="900px" style="margin-top: 70px;">
         </a>
      </div>
   </div>






   <c:import url="footer.jsp" />

   <script type="text/javascript" src="${path}/resources/js/js.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

   <!-- Swiper JS -->
       <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

       <!-- Initialize Swiper -->
       <script>
         var swiper = new Swiper(".mySwiper", {
           spaceBetween: 30,
           centeredSlides: true,
           autoplay: {
             delay: 5000,
             disableOnInteraction: false,
           },
           pagination: {
             el: ".swiper-pagination",
             clickable: true,
           },
           navigation: {
             nextEl: ".swiper-button-next",
             prevEl: ".swiper-button-prev",
           },
         });
       </script>

</body>
</html>