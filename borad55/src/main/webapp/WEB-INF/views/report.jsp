<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!DOCTYPE html>

<html>
<head>
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


a { color: blue; }
a:visited {
  color : blue;
}
a:hover {
  color : red;
}
a:active {
  color : green
}
</style>
<link href="${path}/resources/css/spcss.css" rel="stylesheet"/> 
<meta charset="UTF-8">
<title>게시물 신고</title>
</head>
<body>

<form action="reportaction" method="get">


    <div style="max-height:630px;">
             <h3 class="mt-3" style="color:#BD0404;"><img src="resources/image/alert2.png" width="50" height="50" style="margin-bottom:10px;">&nbsp;<strong>게시물 신고</strong></h3>
             <hr class="mb-4" style="border: 3px double;">
             <p>&nbsp;&nbsp;&nbsp;신고는 반대의견을 표시하는 기능이 아닙니다.</p>
             <p>&nbsp;&nbsp;&nbsp;신고 대신 반대의견이나 [답글]을 적어보시는 건 어떨까요?</p>
             <p>&nbsp;&nbsp;&nbsp;다른의경에 대한 경청과 예의를 갖춘 토론이 댓글을 더 가치있게 합니다.</p>
             
             <hr>
             <h3 class="ms-3" style="width:630px; margin-left:15px; color:#C42B1E;">신고사유</h3><br>
             <table class="ms-3" style="margin-left:15px; width:620px;">
                <tr>
                   
                   
                   
                   
                   <td style="text-align:left; font-size:20px; padding-left:20px;">
                     <input type="hidden" name="board_idx" value="${dto.board_idx}">
                     
                     <input type="hidden" name="signup_nickname" value="${dto.board_name}">
                     <input type="hidden" name="user_reportcheck" value="${dto2.user_reportcheck}">
                                             
                     <input type="radio" name="board_reportcheck" value="모욕/공격적인 언어 "/>
                     <label for="rd1">모욕/공격적인 언어 </label><br/>
                     <input type="radio" name="board_reportcheck"  value="광고성 게시물"/>
                     <label for="rd2">광고성 게시물</label><br/>
                     <input type="radio" name="board_reportcheck"  value="욕설/부적절한 언어"/>
                     <label for="rd3">욕설/부적절한 언어</label><br/>
                     <input type="radio" name="board_reportcheck"  value="도배성 게시물"/>
                     <label for="rd4">도배성 게시물</label><br/>
                     <input type="radio" name="board_reportcheck"  value="정치 게시물"/>
                     <label for="rd5">정치 게시물</label><br/>
                     <input type="radio" name="board_reportcheck"  value="종교 게시물"/>
                     <label for="rd6">종교 게시물</label><br/>
                     <input type="radio" name="board_reportcheck"  value="선동성 게시물"/>
                     <label for="rd7">선동성 게시물</label><br/>
                     
                  </td>
               </tr>
               </table>
               
               <div style="background-color:#F8F9FA; padding-left:10px; padding-right:10px; padding-top:20px; padding-bottom:20px; margin-top:70px; color:#A6A6A6;">
                     * 3회 이상 신고 될 경우 제재 될 수 있으니 조심해주세요 <br><br>
                     * 허위 신고일 경우, 신고자의 서비스 활동이 제한 될 수 있으니, 유의하여 신중하게 신고해 주세요.<br><br>
                     * 명예훼손, 저작권등 신고자의 권리가 침해된 경우에는 <a href="https://cyberbureau.police.go.kr/board/boardList.do?board_id=faq3&mid=010503" target="_blank">사이버수사대</a>에  문의하세요.<br>
                  

               </div>
            
            
            <div class="d-grid gap-2 col-4 mx-auto" style="margin-top:35px;">
               <button type="submit" class="btn btn-outline-danger">신고하기</button>
               
            </div>
            </div>
            
</form>

     
</body>
</html>