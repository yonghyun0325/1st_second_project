<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<div id="write">
    <form name="frmBoardWrite" action="${pageContext.request.contextPath}/community/writeProcess.do" method="post">
        <h2>새로운 글 작성</h2>
        <input type="hidden" id="e_idx" name="e_idx">
        <input type="text" name="b_title" placeholder="글 제목" required>
        <textarea name="b_content" cols="30" rows="10"></textarea>
        <div class="write-button-bundle">
            <input type="button" value="목록보기" id="back_to_list">
            <input type="reset" value="다시입력">
            <input type="submit" value="작성완료">
        </div>
    </form>
</div>
<script>
    $(document).ready(function() {
        
        // AJAX 요청을 통해 로그인 세션 불러오기
        $.ajax({
            url: '${pageContext.request.contextPath}/session/info',
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                if (data && data.e_idx) {
                    $('#e_idx').val(data.e_idx);
                }
            },
            error: function (jqXHR) {
                alert('세션 데이터를 불러오는 중 오류가 발생했습니다.');
            }
        });
        
        // 목록보기 버튼
        $('#back_to_list').on('click', function () {
            $('#write-container').hide();
            $('#board').show();
            location.reload();
        });
        
        // 작성 완료 버튼 클릭시 글 등록하기
        $(document).on('submit', 'form[name="frmBoardWrite"]', function (e) {
             // 기본 폼 제출 방지
            e.preventDefault();
            const formData = $(this).serialize();
            $.ajax({
                url: '${pageContext.request.contextPath}/community/writeProcess.do',
                method: 'POST',
                data: formData,
                success: function (response) {
                    if (response.status === 'success') {
                        alert('글이 성공적으로 등록되었습니다.');
                        $('#write-container').hide();
                        $('#board').show();
                        location.reload();
                    } else if (response.status === 'fail') {
                        alert('글 등록에 실패했습니다. 다시 시도해 주세요.');
                    } else if (response.status === 'error') {
                        alert('오류가 발생했습니다: ' + response.message);
                    }
                },
                error: function (jqXHR) {
                    alert('글을 등록하는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });
    });
</script>