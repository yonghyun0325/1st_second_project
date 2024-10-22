<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<section id="board-notice" class="board">
    <div class="board-header">
        <form action="${pageContext.request.contextPath}/notice/notice" method="get">
            <select name="searchField" class="search-field">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="writer">작성자</option>
            </select>
            <div class="search-container">
                <button type="submit" id="search_btn"><i class="fas fa-search"></i></button>
                <input type="text" name="searchWord" class="search-word" placeholder="검색">
            </div>
            <button type="button" id="write_btn_notice">새 글 작성</button>
        </form>
    </div>

    <table class="board-table">
        <tr>
            <th>구분</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:choose>
            <c:when test="${empty boardList}">
                <tr>
                    <td colspan="5">등록된 게시물이 없습니다</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="board" items="${boardList}">
                    <tr>
                        <td>${board.category}</td>
                        <td>
                            <a href="javascript:void(0)" data-b_idx="${board.b_idx}"> ${board.title} </a>
                        </td>
                        <td>${board.name}</td>
                        <td>
                            <fmt:formatDate value="${board.post_date}" type="date"
                                pattern="yyyy-MM-dd HH:MM" />
                        </td>
                        <td class=".read-count">${board.read_cnt}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </table>
    <div class="board-footer">
        <div class="pagination">
            <c:if test="${totalPages > 1}">
                <c:if test="${currentPage > 1}">
                    <a href="javascript:void(0)" class="page-link" data-page="${currentPage - 1}">이전</a>
                </c:if>
        
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <span class="current-page">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:void(0)" class="page-link" data-page="${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        
                <c:if test="${currentPage < totalPages}">
                    <a href="javascript:void(0)" class="page-link" data-page="${currentPage + 1}">다음</a>
                </c:if>
            </c:if>
        </div>
    </div>
</section>
<script>
    $(document).ready(function () {
        // 글쓰기
        $('#board-notice').off('click', '#write_btn_notice').on('click', '#write_btn_notice', function () {
            const contentDiv = $('#tab-body .tbody.active');
        
            $.ajax({
                url: '/notice/write.do',
                method: 'GET',
                success: function (data) {
                    $(contentDiv).html(data); 
                },
                error: function (jqXHR) {
                    alert('글쓰기 폼을 불러오지 못했습니다. (' + jqXHR.status + ')');
                }
            });
        });

        // 내용 보기
        $('#board-notice').off('click', '.board-table a').on('click', '.board-table a', function (e) {
            e.preventDefault();
            const contentDiv = $('#tab-body .tbody.active');
            const boardId = $(this).data('b_idx');

            $.ajax({
                url: '/notice/view.do',
                method: 'GET',
                data: { 
                    b_idx: boardId,
                },
                success: function (data) {
                    $(contentDiv).html(data); 
                },
                error: function (jqXHR) {
                    alert('게시글을 불러오는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });

        // 검색
        $('#board-notice').off('click', '#search_btn').on('click', '#search_btn', function (e) {
            e.preventDefault();
            const searchField = $('select[name="searchField"]').val();
            const searchWord = $('input[name="searchWord"]').val();
            const contentDiv = $('#tab-body .tbody.active');

            $.ajax({
                url: '/notice/notice',
                method: 'GET',
                data: {
                    searchField: searchField,
                    searchWord: searchWord,
                },
                success: function(data) {
                    $(contentDiv).html(data); 
                },
                error: function(jqXHR) {
                    alert('검색 결과를 불러오는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });

        // 페이지네이션
        $('#board-notice').off('click', '.pagination .page-link').on('click', '.pagination .page-link', function () {
            const page = $(this).data('page'); 
            const searchField = $('select[name="searchField"]').val();
            const searchWord = $('input[name="searchWord"]').val();

            $.ajax({
                url: '/notice/notice',
                method: 'GET',
                data: {
                    page: page,
                    searchField: searchField,
                    searchWord: searchWord
                },
                success: function(data) {
                    const contentDiv = $('#tab-body .tbody.active');
                    $(contentDiv).html(data); 
                },
                error: function(jqXHR) {
                    alert('페이지를 불러오는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });

    });
</script>