<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${path}/resources/css/spcss.css" rel="stylesheet" />
<link href="${path}/resources/css/modal.css" rel="stylesheet" />
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
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

<style>

select {
   box-sizing: border-box;
   width: 100px;
   padding: 4px;
   font-size: 14px;
   font-family: arial;
   border-radius: 6px;
}

option {
   padding: 4px;
   font-size: 14px;
   color: #fff;
   background: #272822;
   font-family: arial;
   font-weight: bold;
}

button {
   font-family: arial;
   font-weight: bold;
}

input {
   font-family: arial;
   font-weight: bold;
}
#result_table {
	background-color:<div class="slideshow-container">
            
     <div class="mySlideDiv fade">
         <img src="img.jpg"> 
     </div>


 
/* Slideshow container */
.slideshow-container {
  max-width: 1440px;
  position: relative;
  margin: auto;
  margin-top: 120px;
}

/* effect */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;   
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
};
}

#ham{
   width:120px;
   height: 40px;
   color:#fff;
   background: #57a8f9;
   font-size: 16px;
   border:none;
   transition:0.3s;
   position: relative;
   left:270px;
}
#ham:focus {
   outline:0;
}
#ham:hover{
   background: #57a8f9;
   cursor: pointer;
}
</style>




<script type="text/javascript"> 
         function open_field(){    
            var con = document.getElementById("reply_content"); 
            var reply_button = document.getElementById("reply_button"); 
            if(reply_content.style.display=='none'){       
                con.style.display = 'block';
                reply_button.style.border = "1px solid black";
                
                reply_button.style.color = "#a9fec2";
                
            }else{       
                con.style.display = 'none';    
                reply_button.style.border = "0px";
                reply_button.style.color = "black";
            } 
        } 
    </script> 




<script type="text/javascript">
	function LayerView() {
		
		var con = document.getElementById("reply_content"); 
        var reply_button = document.getElementById("reply_button"); 
		
		
		if (QnA.style.display == 'none') {
			QnA.style.display = 'block';
		} else {
			QnA.style.display = 'none';
		}
	}
</script>








<!-- 댓글 수정 부분 js -->
<script type="text/javascript">

function ReplyUpdateView() {
	
	var p_tag = document.getElementById("p_tag"); 
	var p_tag2 = document.getElementById("p_tag2"); 
	
	var p_tag_ori = document.getElementById("p_tag_ori"); 
	var p_tag_ori2 = document.getElementById("p_tag_ori2"); 
	
	
	if (p_tag.style.display == 'none') {
		
		p_tag.style.display = 'block';
		p_tag2.style.display = 'none';

		p_tag_ori.style.display = 'block';
		p_tag_ori2.style.display = 'none';
		
	} else {
		p_tag.style.display = 'none';
		p_tag2.style.display = 'block';
		
		p_tag_ori.style.display = 'none';
		p_tag_ori2.style.display = 'block';
	}
}



</script>


<style> 
*{margin:0; padding:0;}       
.banner_wraper { position: absolute; width: 200px;height: 800px; overflow:hidden; }
.banner_wraper img { width:200px; height: 800px;  position: absolute;  }
</style>
 <script>
//client rolling banner
   window.onload = function() {
            var bannerLeft=0;
            var first=1;
            var last;
            var imgCnt=0;
            var $img = $(".banner_wraper img");
            var $first;
            var $last;

            $img.each(function(){  
                $(this).css("left",bannerLeft);
                bannerLeft += $(this).width()+2;
                $(this).attr("id", "banner"+(++imgCnt));  
            });

            
            if( imgCnt > 1){              

                last = imgCnt;
                setInterval(function() {
                    $img.each(function(){
                        $(this).css("left", $(this).position().left-1); 
                    });
                    $first = $("#banner"+first);
                    $last = $("#banner"+last);
                    if($first.position().left < -200) {    
                        $first.css("left", $last.position().left + $last.width()+2 );
                        first++;
                        last++;
                        if(last > imgCnt) { last=1; }   
                        if(first > imgCnt) { first=1; }
                    }
                },25);      
 }
};
</script>


</head>
<body><!--  바디  -->

<c:import url="header.jsp"/>
<hr style="height:3px; ">



<!--  채팅 기능 폼 영역 -->
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
</div>





<!--  게시판 기능 폼 영역 -->
<c:choose>
		
<c:when test="${dto.bgno == 1}">

			
			<!-- QnA 게시판-->
	      <div class="container-fluid"
         style="background-color: white; height:auto; width: 1100px;">
         
           
         <br>
         <br>
         
         <div class="container margin-bottom: -1.5rem! important;"
            style="text-align: center; padding: 0px 50px; width: 1100px; margin-left: auto; margin-right: auto;">
            <h2 class="mb-3 mt-3 text-center"></h2>


            <form action="update" style="width: 1000px; margin-left: auto; margin-right: auto;">


               <input type="hidden" name="board_idx" value="${dto.board_idx }">
               <input type="hidden" name="page" value="${page}"> 
               <input type="hidden" name="searchType" value="${scri.searchType}">
               <input type="hidden" name="keyword" value="${scri.keyword }">
               <input type="hidden" name="board_name" value="${dto.board_name}">

               <table class="table" style="width: 900px;">
                  <thead style="border-top: 2px solid black; border-bottom: 0px; margin-left: auto; margin-right: auto;">
                     <tr style="background-color:#fff;">
                        <th scope="col" style="width: 60px;"><img
                           src="resources/image/Q3.png" width="50" height="50"></th>
                        <th colspan="2" scope="col" style="text-align: left;"><h4><b>${dto.board_title}</b></h4></th>

                     </tr>
                  </thead>
                  <tbody style="border-top: 0px; border-bottom: 0.3px solid black;">
                     <tr>
                        <td scope="col" style="width: 200px;"><img
                           src="resources/img/${dto.board_profle_img}" width="20" height="20">&nbsp;${dto.board_name}
                           
                        <td scope="col"> <c:set var="dateVar" value="${dto.board_date}"/>
      					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd HH:MM"/></td>
                        <td scope="col">조회수 ${dto.board_hit}</td>
                     </tr>


                     <tr>
                        <td colspan="5" style="height: 200px;">
                           
                           
                           <div style="text-align:left;">
                              <p>${dto.board_content}</p>
                           </div>
                           
                           <br>
                           <br>
                           
                           <div>
                              <c:if test="${!empty profile.signup_id}">                            
                                   <button type="button" id="test" onclick="LikeAction()">
                                   <img src="resources/image/great.png" width="50" height="50"></button>
                                   <span>${dto.board_like_cnt}</span>
                              </c:if>
                           </div>
                           
                           
                           <div class="footer position-absolure start-0"
                              style="width: 900px; text-align: center;">		
                                <a href="/board?bgnopage=${scri.bgnopage}&board_idx=${dto.board_idx }&page=${page }&searchType=${scri.searchType }&keyword=${scri.keyword }">
                                <input type="button" class="btn btn-outline-primary" value="목록보기"></a>
                                
                                
                              <c:if test="${profile.signup_nickname eq dto.board_name}">
                              <input type="submit" value="수정하기" class="btn btn-outline-primary">
                              <a href="deleteAction?board_idx=${dto.board_idx }&board_name=${dto.board_name}"><input type="button" value="삭제하기" class="btn btn-outline-danger"></a>&nbsp;&nbsp;
							</c:if>
                                
                                
                                
                               
                          <c:if test="${!empty profile.signup_id}">     
                          	<a href='/report?board_idx=${dto.board_idx }&board_name=${dto.board_name}' onclick="window.open(this.href,'신고','width=500,height=600,top=100,left=500');return false;"><button type="button" class="btn btn-outline-danger">신고</button></a>
                          </c:if> 
                           </div>
                           
                        </td>
                     </tr>

                  </tbody>
               </table>
            </form>


						
            <!--  답변하는 ui 숨기는 버튼-->
                      <c:if test="${!empty profile.signup_id}">

							<table  id="result_table" style="width: 915px; height:80px; background-color:#E2E2E2;" >
								<tr>
								
						<td style="width: 200px; ">
                     <img src="resources/img/${profile.signup_profle_img}" width="50" height="50">
										<b>${profile.signup_nickname}님, 답변해주세요!</b>
										<button id="ham"  type="button" onclick="Javascript:LayerView();">답변작성</button>
						</td>
									
									
								</tr>
							</table>
							<br>
							
						</c:if>
             <!--  답변하는 ui 숨기는 버튼-->      
							
						
						
<!-- writeReplyAction ( 답변작성  ) form 시작 부분-->
<form action="writeReplyAction">
			<br>
            <table class="table" style="width: 900px; height:auto; display: none;" id="QnA" >
			
			<input type="hidden" name="reply_name" value="${profile.signup_nickname}">
			<input type="hidden" name="reply_board_idx" value="${dto.board_idx}">
			<input type="hidden" name="reply_signup_id" value="${profile.signup_id}">
			<input type="hidden" name="reply_profle_img" value="${profile.signup_profle_img}">

               <thead style="border-top: 2px solid black; border-bottom: 2px solid black;">
                  <tr style="background-color: #fff">
                     <th scope="col" style="width: 60px;">
                     <img src="resources/image/A2.png" width="50" height="50"></th>
                     <th colspan="2" scope="col" style="text-align: left;">
                     
                     
                      <c:if test="${empty profile.signup_id}">
                     <font>로그인 후 답변 가능합니다.</font>
                     </c:if>
                      <c:if test="${!empty profile.signup_id}">
                     <font>${profile.signup_nickname}님 답변</font>
                     </c:if>
                 
                  </tr>
               </thead>
               
               
               
                  <tr>
                     <td scope="col" style="width: 100px;">
                     <img src="resources/img/${profile.signup_profle_img}" width="30" height="20">${profile.signup_nickname}</td>
                  </tr>




                  <tr style="text-align:left;">
                  
                  
                  
                     <td colspan="5" style="height: 200px;"> <!-- 글쓰기 부분 감싸는 td -->
                       <textarea rows="20" cols="120" name="reply_content" id="reply_content" >
                       </textarea>
                        <div class="footer position-absolure start-0" style="width: 900px;">
                         <button type="submit" class="btn btn-outline-primary" style="position: relative; left:305px;" >답변등록</button>
                        </div>
                     </td>
                     
                     
                  </tr>
                  
            </table>
		</form> 
		
		
		<script>
			CKEDITOR	
					.replace(
							'reply_content',
							{
								filebrowserUploadUrl : '/uploadImage',
								extraPlugins : 'embed,autoembed',
								height : 500,
								width: 900, 
								// Load the default contents.css file plus customizations for this sample.
								contentsCss : [
										'http://cdn.ckeditor.com/4.19.1/full-all/contents.css',
										'https://ckeditor.com/docs/ckeditor4/4.19.1/examples/assets/css/widgetstyles.css' ],
								// Setup content provider. See https://ckeditor.com/docs/ckeditor4/latest/features/media_embed
								embed_provider : '//ckeditor.iframe.ly/api/oembed?url={url}&callback={callback}',

								// Configure the Enhanced Image plugin to use classes instead of styles and to disable the
								// resizer (because image size is controlled by widget styles or the image takes maximum
								// 100% of the editor width).
								image2_alignClasses : [ 'image-align-left',
										'image-align-center',
										'image-align-right' ],
								image2_disableResizer : true,
								removeButtons : 'PasteFromWord',

							});
		</script>		
<!-- writeReplyAction ( 답변작성  ) form 끝-->





<!-- 답변 적기 시작부분 -->
<c:forEach var="reply" items="${reply_list}"> 
		<br>
		<br>
				<table class="table" style="width: 900px;">

 				<thead style="border-top: 2px solid black; border-bottom: 2px solid black;">
                  <tr style="background-color: #fff">
                     <th scope="col" style="width: 60px;">
                     
                     <c:if test="${reply.reply_select == 1}">
                     <img src="resources/image/replycheck.png " width="50" height="50">
                     </c:if>
                     
                      <img src="resources/image/A2.png" width="50" height="50"></th>
                     <th colspan="2" scope="col" style="text-align: left;">
                    
                     
                     
                     <font>${reply.reply_name}님 답변</font>
                 
                  </tr>
               </thead>

				 <tr>
                     <td scope="col" style="width: 200px;">
                     <img src="resources/img/${reply.reply_profle_img}" width="20" height="20">${reply.reply_name}</td>
                     
                     <td scope="col">
									<c:set var="dateVar" value="${reply.reply_date}" /> 
									<fmt:formatDate	value="${dateVar }" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
                  </tr>
				





<!-- 수정이 필요한 QnA 부분  -->
				 <tr>
                     <td colspan="5" style="height: 200px; text-align:left;"> 
                      
                       <p id="p_tag_ori2">
                       	${reply.reply_content}
                       </p>
				
					<div id="p_tag_ori" style="display: none">
					<textarea rows="5" cols="128" id="input_reply"></textarea>
					<button type="button" onclick="Reply_Update_Action('${reply.reply_idx}')" class="btn btn-outline-primary">수정완료</button>
					</div>
					
					
							<br>
							<br>
                        <div class="footer position-absolure start-0" style="width: 900px; text-align: center;" >
                        
                            <c:if test="${profile.signup_nickname eq reply.reply_name}">
                        
						<button type="button" onclick="ReplyUpdateView()" class="btn btn-outline-primary">수정</button>
						    <a href="deleteReplyAction?reply_idx=${reply.reply_idx}&board_idx=${dto.board_idx}">
										<button type="button" class="btn btn-outline-danger">삭제</button></a>
							</c:if>
                        
                        <c:if test="${profile.signup_nickname eq dto.board_name}">
                            <input type="hidden" id="select_signup_id" value="${profile.signup_id}">
                            <button type="button" class="btn btn-outline-primary" data-id=${reply.reply_idx} id="selectAnswer">
                                    채택
                            </button>
						</c:if>
						<div id="modal-modal-overlay" style="display: none;">
                          <div id="modal-window">
                            <div id="title">
                                <h2>답변 채택</h2>
                            </div>
                            <div id="close-area">X</div>
                            <div id="content">
                                <p>답변 채택시 채택된 답변을 작성한 작성자에게 코인 5개를 줍니다</p>
                                <p>가지고 있는 코인이 없을 경우 답변 채택을 할 수 없습니다</p>
                            </div>
                            <div id="footer">
                                <button type="button" id="select_answer" class="btn btn-outline-primary">
                                    <a href="reply_selectAction?reply_idx=${reply.reply_idx}&board_name=${dto.board_name}&reply_name=${reply.reply_name}&board_idx=${dto.board_idx}"
                                        id="select_footer_confirm">
                                        확인
                                    </a>
                                </button>
                                <button type="button" id="select_cancel" class="btn btn-outline-danger">취소</button>
                            </div>
                          </div>
                        </div>
						
										
                         
						<c:if test="${!empty profile.signup_id}">				
                        <button type="button" class="btn btn-outline-danger" >신고</button>
                        </c:if>      
										
										
                        </div>
                     </td>
                  </tr>	
<!-- 수정이 필요한 QnA 부분  -->                  			
		</table>
</c:forEach> 



         </div> 
      </div><!-- 젤위 div 마감표 -->
</c:when>		
		
		
		

<c:when test="${dto.bgno == 2}">


			    	<!-- 자유게시판-->	
			    	
			    	
		
		<div class="container-fluid "
         style="background-color:white; height:auto; width:1100px;" >
         
         <br>
         <br>
         
         
         <div class="container margin-bottom: -1.5rem! important;"
            style="text-align: center; padding: 0px 0px; width: 1100px; margin-left: auto; margin-right: auto;">
            <h2 class="mb-3 mt-3 text-center"></h2>
        





            <form action="update"
               style="width: 1000px; margin-left: auto; margin-right: auto;">

               <input type="hidden" name="board_idx" value="${dto.board_idx }">
           	   <input type="hidden" name="board_name" value="${dto.board_name}">
               <input type="hidden" name="page" value="${page}"> 
               <input type="hidden" name="searchType" value="${scri.searchType}">
               <input type="hidden" name="keyword" value="${scri.keyword }">
               <table class="table" style="width: 1000px;">
                  <thead
                     style="width: 800px; border-top: 2px solid black; border-bottom: 0px; margin-left: auto; margin-right: auto;">
                     
                      <tr>
                        <th colspan="3" scope="col" style="text-align: center;"><h4><b>${dto.board_title}</b></h4></th>
                     </tr>
                     
                     
                     <tr style="width: 800px; background-color: #fff;">
                        <td align="left" scope="col" style="width: 200px; font-size:1.2em;">
                        
                        
          
                         <img src="resources/img/${dto.board_profle_img}" width="20" height="20">&nbsp;<strong style="color: #636363;">${dto.board_name}</strong></td>
                         
                         
                         
                         <td scope="col"> <c:set var="dateVar" value="${dto.board_date}"/>
      <fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd HH:MM"/></td>
                        <td align="right" scope="col" style="width: 300px;">조회수 ${dto.board_hit }</td>
                     </tr>
                  </thead>
                  <tbody
                     style="border-top: 0px; border-bottom: 0.3px solid black; width: 800px;">
                    


                     <tr>
                        <td colspan="5" style="height: 200px;">
                           <div style="text-align:left;">
                              <p>${dto.board_content}</p>
                           </div>
                           
                           <br>
                           <br>
                         <div>
                               <c:if test="${!empty profile.signup_id}">                            
                                   <button type="button" id="test" onclick="LikeAction()">
                                   <img src="resources/image/great.png" width="50" height="50"></button>
                                   <span>${dto.board_like_cnt}</span>
                               </c:if>
                           </div>
                           <div class="footer position-absolure start-0"
                              style="width: 900px;">
                              
                              
                                <c:if test="${profile.signup_nickname eq dto.board_name}">
                              <input type="submit" value="수정하기" class="btn btn-outline-primary">
                              <a href="deleteAction?board_idx=${dto.board_idx }&board_name=${dto.board_name}"><input type="button" value="삭제하기" class="btn btn-outline-danger"></a>&nbsp;&nbsp;
							</c:if>
                              
                              
                              
                              <a href="/board?bgnopage=${scri.bgnopage}&board_idx=${dto.board_idx }&page=${page }&searchType=${scri.searchType }&keyword=${scri.keyword }"><input type="button" class="btn btn-outline-primary" value="목록보기"></a>
                             
                            <c:if test="${!empty profile.signup_id}"> 
                             <a href='/report?board_idx=${dto.board_idx }&board_name=${dto.board_name}' onclick="window.open(this.href,'신고','width=500,height=600,top=100,left=500');return false;"><button type="button" class="btn btn-outline-danger">신고</button></a>
							</c:if>

                           </div>
                        </td>
                     </tr>

                  </tbody>
               </table>
            </form>



	<!-- 자게 댓글 나타내는 버튼-->
 	<h5 class="mb-3 mt-3 ms-5" style="text-align: left; width: 70px;">
 	댓글 <i class="far fa-comment-dots" type="button" id="reply_button" onclick="javascript:open_field();"></i> </h5>



			<form action="writeReplyAction" method="post">
			
			<input type="hidden" name="reply_name" value="${profile.signup_nickname}">
			<input type="hidden" name="reply_board_idx" value="${dto.board_idx}">
			<input type="hidden" name="reply_signup_id" value="${profile.signup_id}">
			<input type="hidden" name="reply_profle_img" value="${profile.signup_profle_img}">
			
			
            <table class="table" border="2"
               style="width: 1000px; margin-left: auto; margin-right: auto;">

		
			
				
				<tr id="reply_content" style="display:none">
                  <td colspan="4" style="margin-left: auto; margin-right: auto;">
                     <div style="width:auto;" >
                        <textarea name="reply_content" style="width:850px; height:70px;"></textarea>
                     </div>
                  </td>
               		<td>
                  <button type="submit" class="btn btn-outline-secondary" style="height:auto;">작성하기</button>
               		</td>
               	</tr>
            </table>
            </form>

		

				<form action="Reply_Update_Action" method="post" name="update_reply">
						<c:forEach var="reply" items="${reply_list}">
						
							<input type="hidden" name="reply_idx" value="${reply.reply_idx}">
				
							<table class="table mt-5" border="2" style="width: 1000px; margin-left: auto; margin-right: auto;">

								<tr style="border-top: 0.3px; background-color: #fff;">
									<td align="left" scope="col" style="width: 200px; font-size: 1.2em;">
									<img src="resources/img/${reply.reply_profle_img}" width="20" height="20">&nbsp;
										<strong style="color: #636363;">${reply.reply_name}</strong>
										</td>
										
										
									<td colspan="2" scope="col" style="text-align: right;">
									<c:set var="dateVar" value="${reply.reply_date}" /> 
									<fmt:formatDate	value="${dateVar }" pattern="yyyy-MM-dd HH:mm:ss" />

								

							
										
										
						<!-- 댓글 직권처리 -->				
 						<c:if test="${profile.signup_nickname eq reply.reply_name}">
                        
							<button type="button" onclick="ReplyUpdateView()" class="btn btn-outline-primary">수정</button>
						    <a href="deleteReplyAction?reply_idx=${reply.reply_idx}&board_idx=${dto.board_idx}">
							<button type="button" class="btn btn-outline-danger">삭제</button></a>
							
						</c:if>
					<!-- 댓글 직권처리 -->		
						<c:if test="${!empty profile.signup_id}">
							<button type="button" class="btn btn-outline-danger">신고</button>
						</c:if>
									</td>
								</tr>



								<tr>
									<td colspan="5">
										
										<div id="p_tag2">
											<p style="text-align: left;">${reply.reply_content}</p>
										</div>
										
										<div id="p_tag" style="display: none">
										<textarea rows="5" cols="128" id="input_reply"></textarea>
      									<button type="button" onclick="Reply_Update_Action('${reply.reply_idx}')" class="btn btn-outline-primary">수정완료</button>
										</div>
									</td>
								</tr>
							</table>
						</c:forEach>
				</form>				
						
						
						
						
			</div>
      </div>	
</c:when>









<c:when test="${dto.bgno == 3}">	

		
		    				<!-- 건의게시판-->	
		    			
		    			
		<div class="container-fluid "
         style="background-color: white; height:auto; width: 1100px; margin-bottom: 100px;">
         
         <br>
         <br>
         
         <div class="container margin-bottom: -1.5rem! important;"
            style="text-align: center; padding: 0px 0px; width: 1100px; margin-left: auto; margin-right: auto;">
            <h2 class="mb-3 mt-3 text-center"></h2>


            <form action="update"
               style="width: 1000px; margin-left: auto; margin-right: auto;">


               <input type="hidden" name="board_idx" value="${dto.board_idx }">
				<input type="hidden" name="board_name" value="${dto.board_name}">
               <input type="hidden" name="page" value="${page}"> <input
                  type="hidden" name="searchType" value="${scri.searchType}">

               <input type="hidden" name="keyword" value="${scri.keyword }">

               <table class="table" style="width: 1000px;">
                  <thead
                     style="width: 800px; border-top: 2px solid black; border-bottom: 0px; margin-left: auto; margin-right: auto;">
                    
                    
                    
                     <tr>
                        <th colspan="3" scope="col" style="text-align: center;"><h4><b>${dto.board_title}</b></h4></th>
                     </tr>
                     
                     
                     <tr style="width: 800px; background-color: #fff;">
                        <td align="left" scope="col" style="width: 200px; font-size:1.2em;">
                        <img src="resources/img/${dto.board_profle_img}" width="20" height="20">&nbsp;<strong style="color: #636363;">${dto.board_name}</strong></td>
                         <td scope="col"> <c:set var="dateVar" value="${dto.board_date}"/>
      <fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd HH:MM"/></td>
                        <td align="right" scope="col" style="width: 300px;">조회수 ${dto.board_hit }</td>
                     </tr>
                  </thead>
                  <tbody
                     style="border-top: 0px; border-bottom: 0.3px solid black; width: 800px;">
                     


                     <tr>
                        <td colspan="5" style="height: 200px;">
                           <div style="text-align:left;">
                              <p>${dto.board_content}</p>
                           </div>
                           
                           
                           
                          	<br>
							<br>
                            <div>
                               <c:if test="${!empty profile.signup_id}">                            
                                   <button type="button" id="test" onclick="LikeAction()">
                                   <img src="resources/image/great.png" width="50" height="50"></button>
                                   <span>${dto.board_like_cnt}</span>
                               </c:if>
                           </div>
                           <div class="footer position-absolure start-0"
                              style="width: 900px;">
                             <a href="/board?bgnopage=${scri.bgnopage}&board_idx=${dto.board_idx }&page=${page }&searchType=${scri.searchType }&keyword=${scri.keyword }"><input type="button" class="btn btn-outline-primary" value="목록보기"></a>
                            
                             <c:if test="${profile.signup_nickname eq dto.board_name}">
                              <input type="submit" value="수정하기" class="btn btn-outline-primary">
                              <a href="deleteAction?board_idx=${dto.board_idx }&board_name=${dto.board_name}"><input type="button" value="삭제하기" class="btn btn-outline-danger"></a>&nbsp;&nbsp;
							</c:if>
                            <c:if test="${!empty profile.signup_id}">	
                              <a href='/report?board_idx=${dto.board_idx }&board_name=${dto.board_name}' onclick="window.open(this.href,'신고','width=500,height=600,top=100,left=500');return false;"><button type="button" class="btn btn-outline-danger">신고</button></a>
							</c:if>
                           </div>
                        </td>
                     </tr>

                  </tbody>
               </table>
            </form>



	<!-- 건의 댓글 나타내는 버튼-->
 	<h5 class="mb-3 mt-3 ms-5" style="text-align: left; width: 70px;">
 	댓글 <i class="far fa-comment-dots" type="button" id="reply_button" onclick="javascript:open_field();" ></i> </h5>



           <form action="writeReplyAction" method="post">
           
			<input type="hidden" name="reply_name" value="${profile.signup_nickname}">
			<input type="hidden" name="reply_board_idx" value="${dto.board_idx}">
			<input type="hidden" name="reply_signup_id" value="${profile.signup_id}">
			<input type="hidden" name="reply_profle_img" value="${profile.signup_profle_img}">
			
			
            <table class="table" border="2"
               style="width: 1000px; margin-left: auto; margin-right: auto;">

               <tr id="reply_content">
                  <td colspan="4" style="margin-left: auto; margin-right: auto;">
                     <div style="width:auto;">
                        <textarea name="reply_content" style="width:850px; height:70px; "></textarea>
                     </div>
                  </td>
               		<td>
                  <button type="submit" class="btn btn-outline-secondary" style="height:70px;">작성하기</button>
               		</td>
               		</tr>
            </table>
            </form>
            
            
            
            
            
            <c:forEach var="reply" items="${reply_list}">
           	 <table class="table mt-5" border="2"
               		style="width: 1000px; margin-left: auto; margin-right: auto;">
               	<tr style="border-top: 0.3px; background-color: #fff;">
                  <td align="left" scope="col" style="width: 200px; font-size:1.2em;">
                  
                  
                  <img src="resources/img/${reply.reply_profle_img}" width="20" height="20">&nbsp;
                  <strong style="color: #636363;">${reply.reply_name}</strong></td>
                  
                  <td colspan="2" scope="col" style="text-align:right;">
                  <c:set var="dateVar" value="${reply.reply_date}" />
                        <fmt:formatDate value="${dateVar }"
                           pattern="yyyy-MM-dd HH:mm:ss" />
                           
                           
                  <!-- 댓글 직권처리 -->				
 						<c:if test="${profile.signup_nickname eq reply.reply_name}">
                        
							<button type="button" onclick="ReplyUpdateView()" class="btn btn-outline-primary">수정</button>
						    <a href="deleteReplyAction?reply_idx=${reply.reply_idx}&board_idx=${dto.board_idx}">
							<button type="button" class="btn btn-outline-danger">삭제</button></a>
							
						</c:if>         
                      <!-- 댓글 직권처리 -->
                  <c:if test="${!empty profile.signup_id}">          
                  <button type="button" class="btn btn-outline-danger">신고</button>
                  </c:if>
                  
                  
                  </td>
                  </tr>
  				              	<tr>
									<td colspan="5">
										<div id="p_tag2">
											<p style="text-align: left;">${reply.reply_content}</p>
										</div>
										
										<div id="p_tag" style="display: none">
										<textarea rows="5" cols="128" id="input_reply"></textarea>
      									<button type="button" onclick="Reply_Update_Action('${reply.reply_idx}')" class="btn btn-outline-primary">수정완료</button>
										</div>
									</td>
								</tr>
            </table>
			</c:forEach>




         </div>
      </div>	
			
</c:when>

</c:choose>			
		



 <!--  뒤로가기해도 조회수 증가 -->
      <script>
         window.onpageshow = function(event) {
            if (event.persisted) {

               document.location.reload();
            }

         };
      </script>




<!--  배너 영역 -->
<div class="container " style="background-color:geen; width:200px; height:1300px;">
<div class="banner_wraper" style="margin-top:80px;">
    <img src="resources/image/vertical ad 2.png" alt=""> <img src="resources/image/asd.png" alt="">
</div>
</div>


</div>



<div class="container-fluid" style="height:300px; background-color:white">
<br>
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
       <c:if test="${!empty profile.signup_id}">
	       <a href='userReport' onclick="window.open(this.href,'신고','width=520,height=650,top=100,left=500');return false;">
	       <button class="btn btn-success " style="width: 150px; display: inline-block; margin-bottom: 10px;">신고</button></a><br>        
        </c:if>
        </div>
         </div>
      </div>
        </form>
<!--  채팅 프로필 창 영역 -->


<c:import url="footer.jsp" />
	
	
	
	
	
<!-- 좋아요 ajax !! -->	
<script type ="text/javascript">
			var board_idx = ${dto.board_idx};
   			var signup_id = '${profile.signup_id}';
     
    function LikeAction(){    
    	
        $.ajax({
               type :"post",  
               url : "/LikeAction",       
               dataType : "json",   
               data : {'board_idx':board_idx, 'signup_id':signup_id},
               
               success : function(likeCheck) {
                       if(likeCheck == 0){
                           $("#likeimg").attr("src", "/resources/image/good.png");
                          alert("추천완료.");
                          location.reload();
                       }
                       else if (likeCheck == 1){
                           $("#likeimg").attr("src", "/resources/image/good.png");
                           alert("추천취소");
                           location.reload();
                   }
               },
            error : function(){
               alert("로그인이 필요합니다.");
            }
           });
    }
</script> 
<!-- 좋아요 ajax !! 끝 -->	




<!-- 댓글 수정 !! -->	
<script type ="text/javascript">
     
    function Reply_Update_Action(a){    
    	
    	var b = document.getElementById('input_reply').value;
     
        $.ajax({
               type :"post",  
               url : "/Reply_Update_Action",       
               dataType : "json",   
               data : {'reply_idx':a, 'reply_content':b},
               
               success : function(result) {
                       if(result == 1){
                          alert("수정완료.");
                          location.reload();
                       }
                       else if (result == 0){
                           alert("수정실패");
                           location.reload();
                   }
               },
            error : function(){
               alert("통신실패.");
            }
           });
    }
</script> 
<!-- 댓글 수정 !! 끝 -->	



  <script>
     window.onpageshow = function(event){
     if(event.persisted){
     
     document.location.reload();
     }
   };
   </script>
 

	<script type="text/javascript" src="${path}/resources/js/js.js"></script>
	<script type="text/javascript" src="${path}/resources/js/select.js"></script>
</body>
</html>