<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<section id="view-${type}" class="view" data-type="${type}" data-b_idx="${boardVO.b_idx}">
    <div class="board-info">
        <span class="board-author">${boardVO.name}</span>
        <span class="board-date"><fmt:formatDate value="${boardVO.post_date}" pattern="yyyy-MM-dd HH:MM" /></span>
        <span class="board-views">조회: <span id="read-count">${boardVO.read_cnt}</span></span>
    </div>

    <div class="board-content-wrapper">
        <div class="board-content-title-wrapper">
            <h2 class="board-title">${boardVO.title}</h2>
            <c:if test="${not empty attachedFiles}">
                <div class="attached-files">
                    <ul>
                        <c:forEach var="file" items="${attachedFiles}">
                            <li>
                                <a href="${pageContext.request.contextPath}/board/download.do?origin_filename=${file.origin_filename}&save_filename=${file.save_filename}" target="_blank">
                                    <i class="fas fa-save"></i> ${file.origin_filename}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
        </div>
        <div class="board-content">
            <p>${boardVO.content}</p>
        </div>
    </div>

    
    <div class="board-button-bundle">
        <c:choose>
            <c:when test="${employees.e_idx == boardVO.e_idx}">
                <input type="button" value="수정하기" id="edit_button">
                <input type="button" value="삭제하기" id="delete_button">
            </c:when>
            <c:when test="${employees.permission == 2}">
                <input type="button" value="삭제하기" id="delete_button">
            </c:when>
        </c:choose>

        <input type="button" value="목록보기" id="back_to_list">
    </div>
</section>
<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>