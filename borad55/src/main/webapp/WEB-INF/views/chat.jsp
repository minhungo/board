<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device=width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
   <title>Chating</title>
<style>



*{ margin:0px; padding:0px; font-family:Helvetica, Arial, sans-serif;}
ul{
list-style:none;
margin:0;
padding:0;
}

ul li {
display:inline-block;
clear:both;
padding:10px;
border-radius:20px;
margin-bottom:2px;
}

.him{

float:left;
margin-left:10px;
position: relative;
word-break:break-all;
background: #dedede;

}
.him:after {
   right: 100%;
   top: 50%;
   border: solid transparent;
   content: "";
   height: 0;
   width: 0;
   position: absolute;
   pointer-events: none;
   border-color: rgba(222, 222, 222, 0);
   border-right-color: #dedede;
   border-width: 5px;
   margin-top: -5px;
   border-left: 0;
}

.him:before {
   border-color: rgba(194, 225, 245, 0);
   border-right-color: #c2e1f5;
   border-width: 9px;
   margin-top: -9px;
}




.me{
float:right;
margin-right:10px;

position: relative;
background: #685140;
word-break:break-all;
 color: #ffffff;
<!--

}
  .me:after {
left: 100%;
   top: 50%;
   border: solid transparent;
   content: "";
   height: 0;
   width: 0;
   position: absolute;
   pointer-events: none;
   border-color: rgba(136, 183, 213, 0);
   border-left-color: #604c3e;
   border-width: 5px;
   margin-top: -5px;
}
.me:before {
   border-color: rgba(194, 225, 245, 0);
   border-right-color: #c2e1f5;
   border-width: 9px;
   margin-top: -9px;
}


   

.him + .me{
border-bottom-right-radius:5px;

}
.me + .me{
border-top-right-radius:5px;
border_bottom-right-radius:5px;
}

.me:last-of-type{
border-bottom-right-radius:20px;
}

.wrapper::-webkit-scrollbar {
    width: 10px;
  }
  .wrapper::-webkit-scrollbar-thumb {
    background-color: #0084ff;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
  .wrapper::-webkit-scrollbar-track {
    background-color: white;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
 



</style>
  

<script type="text/javascript">
   var ws;

   function wsOpen(){
      ws = new WebSocket("ws://" + location.host + "/chating");
      wsEvt();
   }
      
   function wsEvt() {
      ws.onopen = function(data){
         //소켓이 열리면 동작
      }
      
      ws.onmessage = function(data) {
         //메시지를 받으면 동작
         var msg = data.data;
         if(msg != null && msg.trim() != ''){
            var d = JSON.parse(msg);
            if(d.type == "getId"){
               var si = d.sessionId != null ? d.sessionId : "";
               if(si != ''){
                  $("#sessionId").val(si); 
               }
            }else if(d.type == "message"){
               if(d.sessionId == $("#sessionId").val()){
                  $("#chating").append("<ul><li class='me'>나 :" + d.msg + "</li><ul>");
               }else{
                  $("#chating").append("<ul><li class='him'>" + d.userName + " :" + d.msg + "</li></ul>");
               }
                  
            }else{
               console.warn("unknown type!")
            }
         }
      }

      document.addEventListener("keypress", function(e){
         if(e.keyCode == 13){ //enter press
            send();
         }
      });
   }

   function chatName(){
      var userName = $("#userName").val();
      if(userName == null || userName.trim() == ""){
         alert("사용자 이름을 입력해주세요.");
         $("#userName").focus();
      }else{
         wsOpen();
         $("#yourName").hide();
         $("#yourMsg").show();
      }
   }

   function send() {
      var option ={
         type: "message",
         sessionId : $("#sessionId").val(),
         userName : $("#userName").val(),
         msg : $("#chatting").val()
      }
      ws.send(JSON.stringify(option))
      $('#chatting').val("");
   }
   
   window.onload = pageLoad;
    function pageLoad(){
        document.getElementById('startBtn').click();
    
    }
    

</script>
</head>
<body>



   <div class="wrapper" style="width:100%;  margin:auto; margin-top:40px; 
   overflow-y: scroll; height:500px; border-radius: 20px; overflow-x: hidden;">
   
   <div class="name" style="height:50px;  margin-left: -4px; margin-right:-4px; margin-bottom:20px; color:#fff; text-align:center; line-height:1.9em; font-size:24px; border-radius: 20px;">
      
      </div>
      
          
   <ul></ul>

      <input type="hidden" id="sessionId" value="">
      
      <div id="chating" class="chating">
      </div>
      
      <div id="yourName">
         <table class="inputTable">
            <tr>
               <th>사용자명</th>
               <th><input type="text" class="speech" name="userName" id="userName" value="${profile.signup_nickname}"></th>
               <th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
            </tr>
         </table>
      </div>
   </div>
   
      <div id="yourMsg" class="msger-inputarea" style=" text-align:center; border: 1px solid black; background: background-color:white; height:53px;">
         <table class="inputTable" style="margin:0 auto;  width:250px; height:40px; ">
            <tr style="">
               <th><input id="chatting" placeholder="메시지를 입력해 주세요 ..." style="height:51px; width:300px; background-color:#FFFFFF; margin:0 auto; border:none; outline:none;"></th>
               <th><button  onclick="send()" id="sendBtn" style="margin:0 auto; height:51px; width:80px; background-color:#392f31; color: white;">전송</button></th>
            </tr>
         </table>
      </div>
   
</body>
</html>