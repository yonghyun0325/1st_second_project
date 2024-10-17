<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<head>
    <!-- css, 스타일 초기화 적용  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <!-- css, 스타일 시트 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<div id="board">
    <table class="board-table">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:choose>
            <c:when test="${empty communityList}">
                <tr>
                    <td colspan="5">등록된 게시물이 없습니다</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="board" items="${communityList}" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td><a href="${pageContext.request.contextPath}/board/view.do?b_idx=${board.b_idx}">
                                ${board.b_title}
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
    
    <!-- 검색기능 -->
    <div class="search-container">
        <div class="search-box">
            <form>
                <select name="searchField" class="search-field">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="writer">작성자</option>
                </select>
                <input type="text" name="searchWord" class="search-word">
                <input type="submit" id="search_btn" value="검색">
                <input type="button" id="write_btn" value="글쓰기">
            </form>
        </div>
    </div>
</div>

<div id="write-container" style="display:none"></div>

<script>
    $(document).ready(function () {
        // 글쓰기 버튼 클릭시 글 쓰기 폼 write.jsp 호출
        $('#write_btn').on('click', function () {
            $.ajax({
                url: '${pageContext.request.contextPath}/community/write.do',
                method: 'GET',
                success: function (data) {
                    // 호출 성공시 목록은 숨기고, 글쓰기 폼 보이게 하기
                    $('#board').hide();
                    $('#write-container').html(data).show(); 
                },
                error: function (jqXHR) {
                    alert('글쓰기 폼을 불러오지 못했습니다. (' + jqXHR.status + ')');
                }
            });
        });
    });

    // 게시글 클릭시 상세보기 화면 view.jsp 호출
    $('.board-table a').on('click', function (e) {
        e.preventDefault();
        const boardId = $(this).attr('href').split('=')[1];

        $.ajax({
            url: '${pageContext.request.contextPath}/community/view.do',
            method: 'GET',
            data: { b_idx: boardId },
            success: function (data) {
                // 기존 목록 숨기고, 상세보기 내용 보여주기
                $('#board').hide();
                $('#write-container').html(data).show(); 
            },
            error: function (jqXHR) {
                alert('게시글을 불러오는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
            }
        });
    });
</script>