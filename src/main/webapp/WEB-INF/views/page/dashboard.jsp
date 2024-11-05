<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script src="/resources/js/dashboard.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/dashboard.css">

<div class="gadget" id="calendar">
    <div class="gadget-header">
        <h3 class="gadget-title">나의 일정 관리</h3>
        <button class="gadget-pin gadget-btn">
            <i class="fas fa-thumbtack"></i>
        </button>
        <button class="gadget-toggle gadget-btn">
            <i class="far fa-compress-alt"></i>
        </button>
    </div>
    <div class="gadget-body">
        <div class="gadget-content">
            <div id="calendar">
                <div class="calendar-title-wrap">
                    <button id="prev-month"><i class="fas fa-chevron-left"></i></button>
                    <h3 id="calendar-title"></h2>
                    <button id="next-month"><i class="fas fa-chevron-right"></i></button>
                </div>
                <table border="1">
                    <thead>
                        <tr>
                            <th style="color:red">일요일</th>
                            <th>월요일</th>
                            <th>화요일</th>
                            <th>수요일</th>
                            <th>목요일</th>
                            <th>금요일</th>
                            <th style="color:blue">토요일</th>
                        </tr>
                    </thead>
                    <tbody id="calendar-body">
                    </tbody>
                </table>
            </div>
            <!-- 할 일 입력 모달 -->
            <div id="cal-modal" class="cal-modal">
                <div class="cal-modal_content">
                    <div class="cal-modal-header">
                        <h3 id="cal-modal-title">할 일 목록</h3>
                        <button id="close-cal-modal" class="gadget-btn"><i class="fal fa-times"></i></button>
                    </div>
                    <div class="taskDescription">
                        <textarea id="taskDescription"></textarea>
                    </div>
                    <button id="saveTask">저장</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="gadget" id="topNotices">
    <div class="gadget-header">
        <h3 class="gadget-title">사내 공지사항</h3>
        <button class="gadget-pin gadget-btn">
            <i class="fas fa-thumbtack"></i>
        </button>
        <button class="gadget-toggle gadget-btn">
            <i class="far fa-compress-alt"></i>
        </button>
    </div>
    <div class="gadget-body">
        <div class="gadget-content">
            <ul id="noticeList"></ul>
        </div>
    </div>
</div>

<div class="gadget" id="favoriteRooms">
    <div class="gadget-header">
        <h3 class="gadget-title">내 회의실</h3>
        <button class="gadget-pin gadget-btn">
            <i class="fas fa-thumbtack"></i>
        </button>
        <button class="gadget-toggle gadget-btn">
            <i class="far fa-compress-alt"></i>
        </button>
    </div>
    <div class="gadget-body">
        <div class="gadget-content">
            <ul id="favoriteRoomList"></ul>
        </div>
    </div>
</div>