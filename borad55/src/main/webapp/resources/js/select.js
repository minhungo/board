
const modal = document.querySelector('#modal-modal-overlay');
modal.style.display = 'none';


function selectAnswer() {
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
        }
    });

};