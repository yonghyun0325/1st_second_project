<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<section id="notice">
    <table class="notice-table">
        <tr>
            <th>번호</th>
            <th>구분</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:choose>
            <c:when test="${empty noticeList}">
                <tr>
                    <td colspan="6">등록된 게시물이 없습니다</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="notice" items="${noticeList}" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${board.category}</td>
                        <td><a href="${pageContext.request.contextPath}/notice/view.do?b_idx=${board.b_idx}">
                                ${board.title}
                            </a>
                        </td>
                        <td>${board.name}</td>
                        <td>
                            <fmt:formatDate value="${board.post_date}" type="date"
                                pattern="yyyy-MM-dd" />
                        </td>
                        <td class=".read-count">${board.read_cnt}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </table>
    <div class="board-footer">
        <form action="${pageContext.request.contextPath}/notice/notice" method="get">
            <select name="searchField" class="search-field">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="writer">작성자</option>
            </select>
            <input type="text" name="searchWord" class="search-word">
            <input type="submit" id="search_btn" value="검색">
            <button type="button" id="write_btn_notice">글쓰기</button>
        </form>
    </div>
</section>

<script>
    $(document).ready(function () {
        // 글쓰기 버튼 클릭시 글 쓰기 폼 write.jsp 호출
        $('#tab-wrapper .content.active').on('click', '#write_btn_notice', function () {
            const contentDiv = $(this).closest('.tbody.active');
        
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

        // 게시글 클릭시 상세보기 화면 view.jsp 호출
        $('#tab-wrapper').on('click', '.content.active .notice-table a', function (e) {
            e.preventDefault();
            const contentDiv = $('#tab-boddy .tbody.active');

            $.ajax({
                url: '${pageContext.request.contextPath}/notice/view.do',
                method: 'GET',
                data: { b_idx: boardId },
                success: function (data) {
                    $(contentDiv).html(data); 
                },
                error: function (jqXHR) {
                    alert('게시글을 불러오는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });
    });
</script>