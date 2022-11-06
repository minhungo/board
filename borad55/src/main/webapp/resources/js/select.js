
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
                        if(result > 0){
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

                                // esc 로 모달 내리기
                                window.addEventListener("keyup", e => {
                                    if(modal.style.display === "flex" && e.key === "Escape") {
                                        modal.style.display = "none";
                                        document.body.style.overflow = 'auto';;
                                        return false;
                                    }
                                });
                        }else{
                            alert("현재 소지한 코인이 없습니다.\n답변채택에는 기본 코인1개가 필요합니다.\n코인을 충전해주세요")
                        }
                    },
                    error : function() {
                        alert("네트워크 통신 오류가 발생하였습니다.\n잠시 후에 다시 시도해주세요");
                    }
                });
            }else{
                alert("이미 채택한 답변입니다.");
            }
        },
        error : function() {
            alert("네트워크 통신 오류가 발생하였습니다.\n잠시 후에 다시 시도해주세요");
        }
    });

};