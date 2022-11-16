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
<script
   src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
   integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
   integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
   crossorigin="anonymous"></script>
<script type="text/javascript" src="${path}/resources/js/js.js"></script>



<style>
th, td {
   padding: 8px;
   border-bottom: 1px solid;
   border-color: rgba(0, 0, 0, 0.25);
}

td {
   font-weight: 400;
}
</style>


<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<style>
* {
   margin: 0;
   padding: 0;
}

.banner_wraper {
   width: 1600px;
   height: 500px;
   overflow: hidden;
}

.banner_wraper img {
   width: 1600px;
   height: 500px;
   position: absolute;
}
</style>
<script>
   //client rolling banner
   window.onload = function() {
      var bannerLeft = 0;
      var first = 1;
      var last;
      var imgCnt = 0;
      var $img = $(".banner_wraper img");
      var $first;
      var $last;

      $img.each(function() {
         $(this).css("left", bannerLeft);
         bannerLeft += $(this).width() + 2;
         $(this).attr("id", "banner" + (++imgCnt));
      });

      if (imgCnt > 1) {

         last = imgCnt;
         setInterval(function() {
            $img.each(function() {
               $(this).css("left", $(this).position().left - 1);
            });
            $first = $("#banner" + first);
            $last = $("#banner" + last);
            if ($first.position().left < -1600) {
               $first.css("left", $last.position().left + $last.width()
                     + 2);
               first++;
               last++;
               if (last > imgCnt) {
                  last = 1;
               }
               if (first > imgCnt) {
                  first = 1;
               }
            }
         }, 20);
      }
   };
</script>



</head>
<body>

   <c:import url="header.jsp" />

   <div class="container " style="background-color: geen; width: 1600px;">
      <div class="banner_wraper">
         <img src="resources/image/developer.png" alt=""> <img
            src="resources/image/coding.png" alt=""><img
            src="resources/image/developer.png" alt=""> <img
            src="resources/image/developer.png" alt=""><img
            src="resources/image/developer.png" alt="">
      </div>
   </div>





<div class="container-fluid row" style="background-color:skyblu; height:1300px; margin:auto;">


<div class="container" style="background-color:white; width:300px; height:800px; margin-top:70px; ">


<div class="d-flex" style="border: 0px; position:absolute; top:230px; left:120px; width:220px; margin-top:500px ">  
      <div class="container row"
         style="background-color: white; padding: 0px">
      

               <c:if test="${empty profile.signup_id}">
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
<button type="button" class="btn btn-success" style="width: 150px; display: inline-block; margin-bottom: 10px; margin-left:60px;" ><a href="/chat" style="color:white;" onclick="window.open(this.href,'유저정보','width=303,height=467,top=100,left=500');return false;">전체채팅방</a></button><br>
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
            <h2 style="text-align: left; display:inline-block; "><b>추천 책</b></h2>
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
                  
                  
                           <td colspan="2"><a
                           href="readForm?board_idx=${BoardDTO.board_idx }">${BoardDTO.board_title }</a>
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


      <div class="container "
         style="background-color: geen; width: 200px; height: 1300px;">
         <a href="https://sesac.seoul.kr/common/greeting.do"><img src="resources/image/ccccc.jpg" width="190px"
            height="800px" style="margin-top: 70px;"></a>

      </div>
   </div>




   <!--  채팅 프로필 창 영역 -->
      <form action="imgloadaction" method="post" enctype="multipart/form-data">
     
       <input type="hidden" name="signup_id" id="signup_id" value="${profile.signup_id}">


      <div class="board_profile" style="text-align:center; margin-top: 490px;">
      <div class="board_profile_chat border" style="max-width: 400px; max-height: 600px; background-color:#ffffff;">
             <div class="container" style="background-color:white; text-align:right;" >
             <i class="fa-solid fa-xmark" onclick="settingMenuToggle2()"></i>
             </div>
             
             
             <div class="container" style="text-align: center; margin: auto;">
                    <i class="fa-solid fa-xmark-large"></i>
                    <img src="resources/img/${profile.signup_profle_img}" width="250px" height="250px" style="margin-top:40px;" >
        </div>
        <br>
        <div id=container></div>
        <div style="border: 1px; margin: 20px" id=grade>
        </div>
        <div style="text-align: center;">
        
        
       
        <input type="file" name="file" >
        <button type="submit" onclick="openPop2()" class="btn btn-success " style="width: 150px; display: inline-block; margin-bottom: 10px;">프로필 변경</button><br>
       
       <a href='userReport' onclick="window.open(this.href,'신고','width=520,height=650,top=100,left=500');return false;">
       <button class="btn btn-success " style="width: 160px; display: inline-block; margin-bottom: 10px;">신고</button></a><br>
        
        </div>
         </div>
      </div>
        </form>




   <c:import url="footer.jsp" />
   <script type="text/javascript" src="${path}/resources/js/js.js"></script>      
</body>
</html>