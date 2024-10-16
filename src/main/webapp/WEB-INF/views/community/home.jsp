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
                <a href="${pageContext.request.contextPath}/community/write.do">
                    <button type="button" id="write_btn">글쓰기</button> 
                </a>
        </form>
    </div>
</div>