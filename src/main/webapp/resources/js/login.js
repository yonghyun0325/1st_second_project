
$(document).ready(function() {
    $('form').on('submit', function(e) {
        e.preventDefault();

        const formData = {
            e_idx: $('input[name="e_idx"]').val(),
            e_pw: $('input[name="e_pw"]').val()
        };

        $.ajax({
            type: 'POST',
            url: '/employees/loginProcess.do',
            data: formData,
            dataType: 'json',
            success: function(response) {
                console.log("response: " + response.status.trim());
                if (response.status.trim() === 'success') {
                    window.location.href = '/';
                } else {
                    $('.error-message').html(`사원번호나 비밀번호가 일치하지 않습니다.`);
                }
            },
            error: function() {
                $('.error-message').html('서버 오류가 발생했습니다. 다시 시도해주세요.');
            }
        });
    });
});