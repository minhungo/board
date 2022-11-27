<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>

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


</head>
<body>
   <c:import url="header.jsp" />
<hr style="height:3px; ">
 <div class="container-fluid row" style="background-color:skyblu; height:1300px; margin:auto;">
<div class="container" style="background-color:white; width:300px; height:800px; margin-top:70px; ">
         <img src="resources/image/banner2.png" width="500" height="900">

<div class="d-flex" style="border: 0px; position:absolute; top:230px; left:120px; width:220px;">  
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
      <c:when test="${connectUser.signup_grade eq 'bronze' }"><span   style="float:right; 0px"><img src="resources/image/bronze.png" width="30" height="30" ></span></c:when>
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
   <div class="container-fluid row" style="background-color: white; width: 800px; height: 1100px; margin-left:20px; margin-right:50px;">
         <div class="container margin-bottom: -1.5rem! important;"
            style="width: 900px;">
            <h3 class="mb-4 mt-4" style="text-align: center;">글수정</h3>

            <hr class="mb-2" style="height: 3px; width:770px;">

               
      <form action="updateAction" method="post" style="height:1000px; width:800px;">
               
               <input type="hidden" name="board_idx" value="${dto.board_idx }">
               <input type="hidden" name="board_name" value="${dto.board_name}">
               <input type="hidden" name="bgnopage" value="${scri.bgnopage}">
      		   <input type="hidden" name="page" value="${page}">
      	       <input type="hidden" name="searchType" value="${scri.searchType}">
               <input type="hidden" name="keyword" value="${scri.keyword}">
               
               
               
                  <div class="mb-3">
                     <div class="mt-3">
                        <label class="mb-0" for="name" style="color: #0D6EFD;">
                        <strong>작성자<span style="color:black;">
                        &nbsp;&nbsp;${profile.signup_nickname}</span> </strong></label>
                     </div>
                  </div>



               <hr class="mb-2">


               <div class="mb-3">
                  <label class="mb-2" for="title" style="color: #0D6EFD; width:400px;"><strong>제목</strong></label>
                  <input type="text" class="form-control" name="board_title"  value="${dto.board_title}">
               </div>


               <hr class="mb-2">


               <div class="mb-3">
                  <label class="mb-2" for="subject" style="color: #0D6EFD;"><strong>내용</strong></label>
                 
                  <textarea class="form-control" rows="2" cols="50"
                     name="board_content" style="width: 615px;" placeholder="안녕하세요">
                     ${dto.board_content}
                  </textarea>
               </div>

               <hr class="mb-4">

               <div class="mb-4"></div>
               <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                  <a href="board"><button type="button" class="btn btn-outline-primary me-md-2">목록보기</button></a>
                  <button type="submit" class="btn btn-outline-primary me-md-2">수정하기</button>
               </div>
        </form>
            
            
            
            <script>
               CKEDITOR
                     .replace(
                           'board_content',
                           {
                              filebrowserUploadUrl : '/uploadImage',
                              extraPlugins : 'embed,autoembed',
                              height : 370,

                              // Load the default contents.css file plus customizations for this sample.
                              contentsCss : [
                                    'http://cdn.ckeditor.com/4.19.1/full-all/contents.css',
                                    'https://ckeditor.com/docs/ckeditor4/4.19.1/examples/assets/css/widgetstyles.css' ],
                              // Setup content provider. See https://ckeditor.com/docs/ckeditor4/latest/features/media_embed
                              embed_provider : '//ckeditor.iframe.ly/api/oembed?url={url}&callback={callback}',

                              // Configure the Enhanced Image plugin to use classes instead of styles and to disable the
                              // resizer (because image size is controlled by widget styles or the image takes maximum
                              // 100% of the editor width).
                              image2_alignClasses : [
                                    'image-align-left',
                                    'image-align-center',
                                    'image-align-right' ],
                              image2_disableResizer : true,
                              removeButtons : 'PasteFromWord',

                           });
            </script>
         </div>
         </div>
      

      <div class="container "
         style="background-color: geen; width: 200px; height: 1300px;">
         <a href="#"><img src="resources/image/ccccc.jpg" width="190px"
            height="800px" style="margin-top: 70px;"></a>

      </div>
      
   </div>



   <!--  채팅 프로필 창 영역 -->
      <form action="imgloadaction" method="post" enctype="multipart/form-data">
                
       <input type="hidden" name="signup_id" id="signup_id" value="${profile.signup_id}">


      <div class="board_profile" style="text-align:center;">
      <div class="board_profile_chat border" style="max-width: 400px; max-height: 600px; background-color:#ffffff;">
             <div class="container" style="background-color:white; text-align:right;" >
             <i class="fa-solid fa-xmark" onclick="settingMenuToggle2()"></i>
             </div>
             
             
             <div class="container" style="text-align: center; margin: auto;" id=hoho>
                    <i class="fa-solid fa-xmark-large"></i>
                    
        </div>
        <br>       
        <div id=container></div>        
        <div style="border: 1px; margin: 20px" id=grade class="grade">
        </div>
        <div style="text-align: center;">

        
        <div id=hg >
        
       </div >
       <a href='userReport' onclick="window.open(this.href,'신고','width=520,height=650,top=100,left=500');return false;">
       <button class="btn btn-success " style="width: 150px; display: inline-block; margin-bottom: 10px;">신고</button></a><br>        
        </div>
         </div>
      </div>
        </form>
  

   <c:import url="footer.jsp" />
   <script type="text/javascript" src="${path}/resources/js/js.js"></script>
</body>
</html>
</body>
</html>