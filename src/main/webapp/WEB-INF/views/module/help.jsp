<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="${pageContext.request.contextPath}/resources/js/help.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/help.css">

<div>
    <div class="btn-open-help">
        <div class="btn-open-help-icon">
            <i class="fas fa-user-headset"></i>
        </div>

        <div class="help-content">
            <div class="help-header">
                <div class="help-header-title">
                    <i class="fas fa-user-headset"></i>
                    <h2>문의하기</h2>
                </div>
                <span class="help-close">&times;</span>
            </div>
            <form id="inquiryForm" method="POST" action="/help/insertHelp">
                <label for="product">문의가 필요한 부분을 선택해주십시오.</label>
                <select id="product" name="product" required>
                    <option value="">목록을 선택해주십시오.</option>
                    <option value="finance">재무업무</option>
                    <option value="purchase">구매업무</option>
                    <option value="hr">인사업무</option>
                    <option value="board">게시판</option>
                    <option value="etc">기타 문의</option>
                </select>

                <label for="service">어떤 지원 서비스가 필요합니까?</label>
                <select id="service" name="service" required>
                    <option value="">상위 목록을 선택해주십시오.</option>
                </select>

                <label for="help_detail">문의 내용</label>
                <textarea class="help_detail" id="help_detail" name="help_detail" required></textarea>

                <div class="help-footer">
                    <input type="submit" value="제출하기">
                </div>
            </form>
        </div>
    </div>
</div>