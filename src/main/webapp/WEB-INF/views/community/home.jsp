<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<head>
    <!-- css, 스타일 초기화 적용  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <!-- css, 분실물 게시판 스타일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/community_home.css">
</head>
<div id="list_container">
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
                        <td>${board.b_writer}</td>
                        <td>
                            <fmt:formatDate value="${board.post_date}" type="date"
                                pattern="yyyy-MM-dd" />
                        </td>
                        <td>${board.read_cnt}</td>
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
                    <!-- <a href="${pageContext.request.contextPath}/community/write.do"> -->
                        <button type="button" id="write_btn">글쓰기</button> 
                    <!-- </a> -->
            </form>
        </div>
    </div>
</div>

<div id="write_form_container" style="display:none"></div>

<script>
    $(document).ready(function () {
        $('#write_btn').on('click', function () {
            $.ajax({
                url: '${pageContext.request.contextPath}/community/write.do',
                method: 'GET',
                success: function (data) {
                    $('#list_container').hide();
                    $('#write_form_container').html(data).show(); 
                },
                error: function (jqXHR) {
                    alert('글쓰기 폼을 불러오지 못했습니다. (' + jqXHR.status + ')');
                }
            });
        });

        $(document).on('submit', 'form[name="frmBoardWrite"]', function (e) {
            e.preventDefault(); // 기본 폼 제출 방지
            const formData = $(this).serialize();
            $.ajax({
                url: '${pageContext.request.contextPath}/community/writeProcess.do',
                method: 'POST',
                data: formData,
                success: function () {
                    $('#write_form_container').hide();
                    $('#list_container').show();
                    location.reload();
                },
                error: function (jqXHR) {
                    alert('글을 등록하는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });
    });
</script>