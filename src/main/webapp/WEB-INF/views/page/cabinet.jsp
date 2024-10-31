<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/cabinet.css">

<section id="todo">
    <!-- <h1>Todo List</h1> -->
    <div class="todo-container" id="todoContainer">
        <!-- Todo 목록 표시 -->
        <c:forEach items="${cabinets}" var="cabinet">
            <div class="todo-card">
                <strong>${cabinet.title}</strong>
                <div class="todo-description">${cabinet.description}</div>
            </div>
        </c:forEach>
        <!-- 추가할 더미 카드들 -->
    </div>
    
    <!-- + 버튼을 사용한 Todo 추가 -->
    <div class="add-todo-form">
        <button type="button" id="addTodoBtn" class="todo-card">+</button>
    </div>
    
    <!-- 모달 창 -->
    <form id="todo-modal-Form" method="Post" action="/insertCabinet">
        <div id="todoModal" class="modal">
            <div class="modal-content">
                <input type="hidden" id="e_idx" name="e_idx" value="${cabinet.e_idx}">
                <input type="text" id="newTodoTitle" placeholder="보드 이름을 입력하세요." required>
                <input type="text" id="newTodoDescription" placeholder="설명을 입력하세요." required>
                <div class="modal-buttons">
                    <button type="button" id="saveTodoBtn" class="save-btn">저장</button>
                    <button type="button" id="cancelTodoBtn" class="cancel-btn">취소</button>
                </div>
            </div>
        </div>
    </form>
</section>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // 모달 창 열기
        document.getElementById('addTodoBtn').addEventListener('click', function () {
            var modal = document.getElementById('todoModal');
            modal.style.display = 'flex';
        });

        // 저장 버튼 클릭 시 AJAX 요청
        document.getElementById('saveTodoBtn').addEventListener('click', function () {
            var title = document.getElementById('newTodoTitle').value;
            var description = document.getElementById('newTodoDescription').value;

            // 입력값이 비어있지 않은지 확인
            if (title.trim() === '' || description.trim() === '') {
                alert('Title과 Description을 입력하세요.');
                return;
            }

            // AJAX 요청으로 데이터 전송
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/insertCabinet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200 && xhr.responseText === "success") {
                        // 새로운 todo-card 생성
                        var todoCard = document.createElement('div');
                        todoCard.classList.add('todo-card');

                        var todoTitle = document.createElement('strong');
                        todoTitle.textContent = title;

                        var todoDescription = document.createElement('div');
                        todoDescription.classList.add('todo-description');
                        todoDescription.textContent = description;

                        // 새로운 카드에 추가
                        todoCard.appendChild(todoTitle);
                        todoCard.appendChild(todoDescription);

                        // todo-container에 추가
                        document.getElementById('todoContainer').appendChild(todoCard);

                        // 모달 창 닫기 및 입력 필드 초기화
                        document.getElementById('todoModal').style.display = 'none';
                        document.getElementById('newTodoTitle').value = '';
                        document.getElementById('newTodoDescription').value = '';
                    } else {
                        alert("저장에 실패했습니다. 다시 시도하세요.");
                    }
                }
            };

            // 전송할 데이터 포맷팅
            var data = "title=" + encodeURIComponent(title) + "&description=" + encodeURIComponent(description);
            xhr.send(data); // 데이터 전송
        });

        // 취소 버튼 클릭 시 모달 창 닫기
        document.getElementById('cancelTodoBtn').addEventListener('click', function () {
            document.getElementById('todoModal').style.display = 'none';
        });
    });
</script>