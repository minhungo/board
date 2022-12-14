
const modal = document.querySelector('#modal-modal-overlay');
modal.style.display = 'none';

const select_usercoin = $('#select_signup_id').val();

$(document).on("click", "#selectAnswer", function(){
    const replyIdx = $(this).data("id");
    selectAnswer(replyIdx);
});

function selectAnswer(item) {

    $.ajax({
        url : '/checkSelect',
        type : 'POST',
        contentType: 'application/json',
        dataType: 'json',
        data : JSON.stringify({
            reply_idx : item
        }),
        success : function(result) {
            if(result != 1){
                $.ajax({
                    url : '/getMyCoin',
                    type : 'post',
                    contentType: 'application/json',
                    dataType: 'json',
                    data : JSON.stringify({
                        signup_id : select_usercoin
                    }),
                    success : function(result) {
                        if(result > 4){
                            modal.style.display = 'block';
                            document.body.style.overflow = 'hidden';

                            const select_answer = document.getElementById('select_answer');
                            const cancel_select = document.getElementById('select_cancel');
                            const close_Btn = document.getElementById('close-area');

                            cancel_select.addEventListener("click", e => {
                                modal.style.display = "none";
                                document.body.style.overflow = 'auto';
                                return false;
                            });

                            close_Btn.addEventListener("click", e => {
                                modal.style.display = "none";
                                document.body.style.overflow = 'auto';
                                return false;
                            });

                            select_answer.addEventListener("click", e => {
                                modal.style.display = "none";
                                document.body.style.overflow = 'auto';
                                return true;
                            });

                            // esc ??? ?????? ?????????
                            window.addEventListener("keyup", e => {
                                if(modal.style.display === "flex" && e.key === "Escape") {
                                    modal.style.display = "none";
                                    document.body.style.overflow = 'auto';;
                                    return false;
                                }
                            });
                        }else{
                            alert("?????? ????????? ????????? ????????????.\n?????????????????? ?????? ?????? 5?????? ???????????????.\n????????? ??????????????????")
                        }
                    },
                    error : function() {
                        alert("???????????? ?????? ????????? ?????????????????????.\n????????? ??? ?????? ??????????????????");
                    }
                });
            }else{
                alert("?????? ????????? ???????????????.");
            }
        },
        error : function() {
            alert("???????????? ?????? ????????? ?????????????????????.\n?????? ?????? ?????? ??????????????????");
        }
    });

};