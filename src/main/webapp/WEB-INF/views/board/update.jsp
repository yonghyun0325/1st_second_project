<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<div id="board-update" class="write">
    <form id="frmBoardUpdate" name="frmBoardUpdate" action="${pageContext.request.contextPath}/board/updateProcess.do" method="post" enctype="multipart/form-data">

        <h3 id="write-title">게시글 수정</h3>

        <input type="hidden" id="b_idx" name="b_idx" value="${boardVO.b_idx}">

        <input type="hidden" id="e_idx" name="e_idx" value="${boardVO.e_idx}">
        <input type="hidden" name="type" value="${boardVO.type}">
        
        <div class="input-title-wrapper">
            <select id="category" name="category">
                <option value="일반" ${boardVO.category == '일반' ? 'selected' : ''}>일반</option>
                <option value="분실물" ${boardVO.category == '분실물' ? 'selected' : ''}>분실물</option>
            </select>

            <input type="text" name="title" placeholder="글 제목" value="${boardVO.title}" required>

            <input type="file" name="uploadFiles" multiple>
        </div>

        <textarea name="content" cols="30" rows="10">${boardVO.content}</textarea>

        <div class="write-button-bundle">
            <input type="button" value="작성취소" id="back_to_list">
            <input type="reset" value="다시입력">
            <input type="submit" value="수정완료">
        </div>
    </form>
</div>

<script>
    $(document).ready(function() {
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
        
        $('#back_to_list').on('click', function () {
            const contentDiv = $('#tab-body .tbody.active');

            $.ajax({
                url: '${pageContext.request.contextPath}/board/normal',
                method: 'GET',
                success: function (data) {
                    $(contentDiv).html(data);
                },
                error: function (jqXHR) {
                    alert('글 목록을 불러오는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });
        
        $('#frmBoardUpdate').on('submit', function (e) {
            e.preventDefault(); 
            let formData = new FormData(this);

            $.ajax({
                url: '${pageContext.request.contextPath}/board/updateProcess.do',
                method: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response.status === 'success') {
                        alert('글이 성공적으로 수정되었습니다.');
                        
                        $.ajax({
                            url: '${pageContext.request.contextPath}/board/normal',
                            method: 'GET',
                            success: function (data) {
                                const contentDiv = $('#tab-body .tbody.active');
                                $(contentDiv).html(data);
                            },
                            error: function (jqXHR) {
                                alert('글 목록을 불러오는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                            }
                        });

                    } else if (response.status === 'fail') {
                        alert('글 수정에 실패했습니다. 다시 시도해 주세요.');
                    } else if (response.status === 'error') {
                        alert('오류가 발생했습니다: ' + response.message);
                    }
                },
                error: function (jqXHR) {
                    alert('글을 수정하는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });
    });
</script>
