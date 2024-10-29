<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="write-${type}" class="write" data-type="${type}">
    <form id="frmBoardWrite-${type}" name="frmBoardWrite" action="/board/writeProcess.do" method="post" enctype="multipart/form-data">

        <h3 id="write-title">새로운 글 작성</h3>

        <!-- 사원번호와 타입 -->
        <input type="hidden" name="e_idx" value="${e_idx}">
        <input type="hidden" name="type" value="${type}">
        
        <div class="input-title-wrapper">
            <!-- 카테고리 선택 부분 -->
            <select id="category" name="category">
                <c:choose>
                    <c:when test="${type eq 'notice'}">
                        <option value="공지">공지</option>
                        <option value="행사">행사</option>
                    </c:when>

                    <c:when test="${type eq 'normal'}">
                        <option value="일반">일반</option>
                    </c:when>

                    <c:when test="${type eq 'lost'}">
                        <option value="분실">분실</option>
                        <option value="습득">습득</option>
                    </c:when>
                </c:choose>
            </select>

            <!-- 글 제목 입력 부분 -->
            <input type="text" name="title" placeholder="글 제목" required>

            <!-- 첨부파일 입력 부분 -->
            <input type="file" name="uploadFiles">
        </div>

        <!-- 글 내용 입력 부분 -->
        <div class="input-content-wrapper">
            <textarea name="content" cols="30" rows="10"></textarea>
        </div>

        <!-- 버튼 부분 -->
        <div class="board-button-bundle">
            <input type="button" value="작성취소" id="back_to_list">
            <input type="reset" value="다시입력">
            <input type="submit" value="작성완료">
        </div>
    </form>
</section>
<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>