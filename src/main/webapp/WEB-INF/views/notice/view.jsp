<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section id="view-notice" class="view">
    <div class="board-info">
        <span class="board-author">${boardVO.name}</span>
        <span class="board-date"><fmt:formatDate value="${boardVO.post_date}" pattern="yyyy-MM-dd HH:MM" /></span>
        <span class="board-views">조회: <span id="read-count">${boardVO.read_cnt}</span></span>
    </div>

    <div class="board-content-wrapper">
        <h2 class="board-title">${boardVO.title}</h2>

        <div class="board-content">
            <p>${boardVO.content}</p>
        </div>
    </div>

    <div class="board-button-bundle">
        <input type="button" value="목록보기" id="back_to_list">
        <input type="button" value="수정하기" id="edit_button" style="display: none;">
        <input type="button" value="삭제하기" id="delete_button" style="display: none;">
    </div>
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
                    const authorIdx = '${boardVO.e_idx}';
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
        
        // 목록보기
        $('#view-notice').off('click', '#back_to_list').on('click', '#back_to_list', function () {
            loadList();
        });

        // 수정 버튼
        $('#view-notice').off('click', '#edit_button').on('click', '#edit_button', function () {
            const contentDiv = $('#tab-body .tbody.active');
            const b_idx = '${boardVO.b_idx}';

            $.ajax({
                url: '/notice/update.do',
                method: 'GET',
                data: { 
                    b_idx: '${boardVO.b_idx}',
                },
                success: function (data) {
                    $(contentDiv).html(data);
                },
                error: function (jqXHR) {
                    alert('수정 페이지를 불러오는 중 문제가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });

        // 삭제 버튼
        $('#view-notice').off('click', '#delete_button').on('click', '#delete_button', function () {
            if (confirm('정말 삭제하시겠습니까?')) {
                $.ajax({
                    url: '/notice/deleteProcess.do',
                    method: 'POST',
                    data: { b_idx: '${boardVO.b_idx}' },
                    success: function() {
                        alert('글이 삭제되었습니다.');
                        loadList();
                    },
                    error: function(jqXHR) {
                        alert('글 삭제 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                    }
                });
            }
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