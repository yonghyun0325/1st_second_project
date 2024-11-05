<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script src="${pageContext.request.contextPath}/resources/js/depaset.js"></script>

<section id="depaset">
    <div class="table-wrapper" style="flex: 1;">
        <div class="list-title-wrapper">
            <h3>◇ 부서 목록</h3>
            <div class="button-bundle">
                <a href="javascript:void(0)" class="depa_addition">추가</a>
                <a href="javascript:void(0)" class="depa_update" style="display: none;">수정</a>
                <a href="javascript:void(0)" class="depa_delete" style="display: none;">삭제</a>
            </div>
        </div>
        <div class="table-list-section">
            <table class="depa-list table-common table-select-list">
                <thead>
                    <tr>
                        <th style="width: 30%;">부서 코드</th>
                        <th>부서명</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 부서 목록 표시부분 -->
                </tbody>
            </table>
        </div>
    </div>
</section>