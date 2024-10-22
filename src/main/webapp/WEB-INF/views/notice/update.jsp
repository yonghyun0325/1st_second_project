<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section id="update-notice" class="write">
    <form id="frmBoardUpdate" name="frmBoardUpdate" action="${pageContext.request.contextPath}/notice/updateProcess.do" method="post" enctype="multipart/form-data">

        <h3 id="update-title">공지글 수정</h3>

        <input type="hidden" id="b_idx" name="b_idx" value="${boardVO.b_idx}">

        <input type="hidden" id="e_idx" name="e_idx" value="${boardVO.e_idx}">
        <input type="hidden" name="type" value="${boardVO.type}">
        
        <div class="input-title-wrapper">
            <select id="category" name="category">
                <option value="일반" ${boardVO.category == '일반' ? 'selected' : ''}>일반</option>
                <option value="행사" ${boardVO.category == '행사' ? 'selected' : ''}>행사</option>
            </select>

            <input type="text" name="title" placeholder="글 제목" value="${boardVO.title}" required>

            <input type="file" name="uploadFiles" multiple>
        </div>

        <textarea name="content" cols="30" rows="10">${boardVO.content}</textarea>

        <div class="board-button-bundle">
            <input type="button" value="작성취소" id="back_to_list">
            <input type="reset" value="다시입력">
            <input type="submit" value="수정완료">
        </div>
    </form>
</section>

<script>
    $(document).ready(function() {
        // 로그인 세션 불러오기
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
        
        // 목록보기
        $('#update-notice').off('click', '#back_to_list').on('click', '#back_to_list', function () {
            loadList();
        });

        // 수정완료
        $('#frmBoardUpdate').on('submit', function (e) {
            e.preventDefault();  // 기본 폼 제출 방지
            let formData = new FormData(this);  // FormData 객체로 폼 데이터 생성 (첨부파일 포함)

            $.ajax({
                url: '/notice/updateProcess.do',
                method: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response.status === 'success') {
                        alert('성공적으로 수정되었습니다.');
                        loadList();
                    } else if (response.status === 'fail') {
                        alert('수정에 실패했습니다. 다시 시도해 주세요.');
                    } else if (response.status === 'error') {
                        alert('오류가 발생했습니다: ' + response.message);
                    }
                },
                error: function (jqXHR) {
                    alert('수정하는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });

        function loadList() {
            $.ajax({
                url: '/notice/notice',
                method: 'GET',
                success: function (data) {
                    const contentDiv = $('#tab-body .tbody.active');
                    $(contentDiv).html(data);
                },
                error: function (jqXHR) {
                    alert('글 목록을 불러오는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        }
    });
</script>