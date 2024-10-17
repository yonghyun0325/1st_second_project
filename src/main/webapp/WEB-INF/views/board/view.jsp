<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="view">
    <div class="board-info">
        <span class="board-author">${CommunityVO.name}</span>
        <span class="board-date"><fmt:formatDate value="${CommunityVO.post_date}" pattern="yyyy-MM-dd" /></span>
        <span class="board-views">조회: <span id="read-count">${CommunityVO.read_cnt}</span></span>
    </div>

    <div class="board-content-wrapper">
        <h2 class="board-title">${CommunityVO.b_title}</h2>

        <div class="board-content">
            <p>${CommunityVO.b_content}</p>
        </div>
    </div>

    <div class="write-button-bundle">
        <button id="back_to_list">목록보기</button>
        <button id="edit_button" style="display: none;">수정하기</button>
        <button id="delete_button" style="display: none;">삭제하기</button>
    </div>
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
                    const authorIdx = '${CommunityVO.e_idx}';
                    const loggedInIdx = data.e_idx;
                    const isAdmin = data.permission === 2;

                    if (loggedInIdx == authorIdx) {
                        $('#edit_button').show();
                    }

                    if (loggedInIdx == authorIdx || isAdmin) {
                        $('#delete_button').show();
                    }
                }
            },
            error: function (jqXHR) {
                alert('세션 데이터를 불러오는 중 오류가 발생했습니다.');
            }
        });
        
        // 목록보기 버튼
        $('#back_to_list').on('click', function () {
            const contentDiv = $('#tab-wrapper .content.active');
            const type = $('#type').val();

            $.ajax({
                url: '${pageContext.request.contextPath}/board/' + type,
                method: 'GET',
                success: function (data) {
                    $(contentDiv).html(data);
                },
                error: function (jqXHR) {
                    alert('글 목록을 불러오는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });

        $('#edit_button').on('click', function () {
            alert('수정 버튼 클릭됨');
        });

        // 삭제 버튼 클릭
        $('#delete_button').on('click', function () {
            if (confirm('정말로 이 글을 삭제하시겠습니까?')) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/community/deleteProcess.do',
                    method: 'POST',
                    data: { b_idx: '${CommunityVO.b_idx}' },
                    success: function() {
                        alert('글이 삭제되었습니다.');
                        location.reload();
                    },
                    error: function(jqXHR) {
                        alert('글 삭제 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                    }
                });
            }
        });
    });
</script>