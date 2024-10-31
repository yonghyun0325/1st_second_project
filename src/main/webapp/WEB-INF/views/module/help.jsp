<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/help.css">
<script src="${pageContext.request.contextPath}/resources/js/help.js"></script>

<div>
    <button class="btn-open-modal2">
        <i class="fas fa-user-headset"></i>
    </button>

    <!-- 모달 콘텐츠를 button 외부에 분리 -->
    <div class="modal2_content">
        <span class="close">&times;</span>
        <h2>문의하기</h2>

        <!-- 선택 박스 및 입력 필드 -->
        <form id="inquiryForm" method="POST" action="/help/insertHelp">
            <label for="product">문의가 필요한 부분이 무엇입니까?</label>
            <select id="product" name="product">
                <option value="">목록을 선택하십시오.</option>
                <option value="finance">재무업무</option>
                <option value="purchase">구매업무</option>
                <option value="hr">인사업무</option>
                <option value="board">게시판</option>
                <option value="etc">기타 문의</option>
            </select>
            
            <label for="service">어떤 지원 서비스가 필요합니까?</label>
            <select id="service" name="service">
                <option value="">상위 목록을 선택하십시오.</option>
            </select>
            
            <label for="etcQ">추가 문의사항</label>
            <textarea class="etcQ" id="etcQ" name="etcQuestion"></textarea>
            
            <button type="submit">제출</button>
        </form>
    </div>
</div>