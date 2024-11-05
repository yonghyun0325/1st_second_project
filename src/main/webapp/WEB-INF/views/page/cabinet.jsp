<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="${pageContext.request.contextPath}/resources/js/cabinet.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/cabinet.css">

<section id="cabinet">
    <h3>즐겨찾기</h3>
    <div class="cabinet-favorites" id="cabinet-favorites">
        <div id="no-favorites" class="cabinet-card">
            아직 즐겨찾기한<br>회의실이 없습니다
        </div>
    </div>
    <h3>회의실 목록</h3>
    <div class="cabinet-container" id="cabinet-container"></div>
    
    <div class="add-cabinet-form">
        <button type="button" id="addcabinetBtn" class="cabinet-card">+</button>
    </div>
    
    <form id="cabinet-modal-Form" method="Post" action="/insertCabinet">
        <div id="cabinetModal" class="modal">
            <div class="modal-content">
                <input type="hidden" id="e_idx" name="e_idx" value="${e_idx}">
                <input type="text" id="newcabinetTitle" placeholder="보드 이름을 입력하세요." required>
                <input type="text" id="newcabinetDescription" placeholder="설명을 입력하세요." required>
                <div class="modal-buttons">
                    <button type="button" id="savecabinetBtn" class="save-btn">저장</button>
                    <button type="button" id="cancelcabinetBtn" class="cancel-btn">취소</button>
                </div>
            </div>
        </div>
    </form>
</section>