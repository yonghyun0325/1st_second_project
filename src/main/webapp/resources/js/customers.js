
$(document).ready(function() {
    $('#customerForm').on('submit', function (e) {
        e.preventDefault();

        let formData = new FormData(this);

        $.ajax({
            url: '${pageContext.request.contextPath}/customers/register',
            method: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                if (response.status === 'success') {
                    alert('저장이 완료되었습니다.');
                } else if (response.status === 'fail') {
                    alert('저장에 실패했습니다.');
                } else if (response.status === 'error') {
                    alert('저장중 오류가 발생했습니다: ' + response.message);
                }
            },
            error: function (jqXHR) {
                alert('정보를 저장하던중 오류가 발생했습니다. (' + jqXHR.status + ')');
            }
        });
    });
})