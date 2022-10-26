var settingsmenu1 = document.querySelector(".alert_menu");
var settingsmenu2 = document.querySelector(".board_profile");
var settingsmenu3 = document.querySelector(".board_profile1");
function settingMenuToggle1(){
  settingsmenu1.classList.toggle("alert_menu_height");
}

function settingMenuToggle2(){
     settingsmenu2.classList.toggle("board_profile_chat");
}

function settingMenuToggle3(){
     settingsmenu3.classList.toggle("board_profile1_chat");
}




var settingsmenu1 = document.querySelector(".alert_menu");
var settingsmenu2 = document.querySelector(".board_profile");
var settingsmenu3 = document.querySelector(".board_profile1");

function settingMenuToggle1(){
  settingsmenu1.classList.toggle("alert_menu_height");
}

function settingMenuToggle2(){
     settingsmenu2.classList.toggle("board_profile_chat");
}

function settingMenuToggle3(){
     settingsmenu3.classList.toggle("board_profile1_chat");
}


function test1(text,hihi){
   var a = hihi;
      
   $.ajax({
         url:"/test1",
         type:"POST",
         data: {'test' : text},
         success:function(data){
            
            
            $("#container").html(data.signup_nickname);
            $("#grade").html("<img src="+'"resources/image/'+ data.signup_grade +'.png' +'" width="30px" height="30px">'+"<span>"+data.signup_grade+"</span>")   
            $("#hoho").html("<img src="+'"resources/img/'+data.signup_profle_img +'" width="250px" height="250px" style="margin-top:40px;" >')
             if(a == data.signup_id){
            $("#hg").html("<c:if test="+'"${profile.signup_id eq '+"'"+data.signup_id+"'"+"}"+'">' +"<input type=" + '"file" name="file" >' 
                  +'<button type="submit" onclick="openPop2()" class="btn btn-success " style="width: 150px; display: inline-block; margin-bottom: 10px;">프로필 변경</button><br>'
                                    
            );
             }
            else{
               $("#hg").html("");
              
            }

         
         },
         error:function(){
            alert("에러");
         }
      });
   }




