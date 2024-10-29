<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>

<section id="board-${type}" class="board" data-type="${type}">
    <div class="board-header">
        <form action="${pageContext.request.contextPath}/board/normal" method="get">
            <select name="searchField" class="search-field">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="writer">작성자</option>
            </select>
            <div class="search-container">
                <button type="submit" id="search_btn"><i class="fas fa-search"></i></button>
                <input type="text" name="searchWord" class="search-word" placeholder="검색">
            </div>
            <c:choose>
                <c:when test="${type eq 'notice'}">
                    <c:if test="${permission >= 1}">
                        <button type="button" id="write_btn_${type}">새 글 작성</button>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <button type="button" id="write_btn_${type}">새 글 작성</button>
                </c:otherwise>
            </c:choose>
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