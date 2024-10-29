<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="update-${type}" class="write"  data-type="${type}">
    <form id="frmBoardUpdate-${type}" name="frmBoardUpdate" action="/board/updateProcess.do" method="post" enctype="multipart/form-data">

        <h3 id="update-title">게시글 수정</h3>

        <input type="hidden" id="b_idx" name="b_idx" value="${boardVO.b_idx}">
        <input type="hidden" id="e_idx" name="e_idx" value="${boardVO.e_idx}">
        <input type="hidden" name="type" value="${boardVO.type}">
        
        <div class="input-title-wrapper">
            
            <!-- 카테고리 선택 부분 -->
            <select id="category" name="category">
                <c:choose>
                    <c:when test="${type eq 'notice'}">
                        <option value="공지" ${boardVO.category == '공지' ? 'selected' : ''}>공지</option>
                        <option value="행사" ${boardVO.category == '행사' ? 'selected' : ''}>행사</option>
                    </c:when>

                    <c:when test="${type eq 'normal'}">
                        <option value="일반" ${boardVO.category == '일반' ? 'selected' : ''}>일반</option>
                    </c:when>

                    <c:when test="${type eq 'lost'}">
                        <option value="분실" ${boardVO.category == '분실' ? 'selected' : ''}>분실</option>
                        <option value="습득" ${boardVO.category == '습득' ? 'selected' : ''}>습득</option>
                    </c:when>
                </c:choose>
            </select>

            <input type="text" name="title" placeholder="글 제목" value="${boardVO.title}" required>

            <input type="file" name="uploadFiles">
            
        </div>
        
        <div class="input-content-wrapper">
            <!-- 기존 첨부파일 목록 -->
            <div class="attached-files">
                <ul>
                    <c:forEach var="file" items="${attachedFiles}">
                        <li>
                            <a href="${pageContext.request.contextPath}/board/download.do?origin_filename=${file.origin_filename}&save_filename=${file.save_filename}">
                                <i class="fas fa-save"></i> ${file.origin_filename}
                            </a>
                            <label>
                                <input type="checkbox" name="deleteFiles" value="${file.a_idx}">
                                삭제
                            </label>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <textarea name="content" cols="30" rows="10">${boardVO.content}</textarea>
        </div>

        <div class="board-button-bundle">
            <input type="button" value="작성취소" id="back_to_list">
            <input type="reset" value="다시입력">
            <input type="submit" value="수정완료">
        </div>
    </form>
</section>
<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>