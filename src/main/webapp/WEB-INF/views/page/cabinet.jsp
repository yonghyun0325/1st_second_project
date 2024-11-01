<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #cabinet {
        overflow-y: scroll;
        background: none;
    }

    .cabinet-container {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: flex-start;
        width: 100%;
        padding: 10px 0;
    }

    .cabinet-card {
        width: 320px;
        height: 200px;
        padding: 15px;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        flex-shrink: 0;
    }

    .cabinet-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }

    .cabinet-card-title {
        display: flex;
        justify-content: space-between;
    }

    .cabinet-card-title strong {
        font-size: 1.2em;
        color: #000000;
    }

    .cabinet-description {
        font-size: 0.9em;
        color: #666;
        margin-top: 10px;
    }

    /* 모달 스타일 */
    .modal {
        display: none; /* 모달 숨김 */
        position: fixed;
        top: 50%; /* 화면 중앙을 기준으로 위치 */
        left: 50%; /* 화면 중앙을 기준으로 위치 */
        transform: translate(-50%, -50%); /* 중앙 정렬을 위한 변환 */
        width: 100%;
        height: 100%;
        background-color: rgba(255, 255, 255, 0); 
        z-index: 1000;
        justify-content: center;
        align-items: center;
    }
    .modal-content {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        width: 400px;
        height: 250px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .modal-content input[type="text"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    /* 모달 버튼 2개 박스 */
    .modal-buttons {
        display: flex;
        justify-content: space-between; /* 버튼 사이 간격 유지 */
        gap: 10px; /* 버튼 간격 */
        padding: 10px;
    }

    /* 저장 버튼 스타일 */
    .save-btn {
        width: 100px;
        padding: 10px;
        background-color: #408ed6; 
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .save-btn:hover {
        background-color: #368bdb; 
    }

    /* 취소 버튼 스타일 */
    .cancel-btn {
        width: 100px;
        padding: 10px;
        background-color: #e4e1e0;
        color: rgb(3, 3, 3);
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .cancel-btn:hover {
        background-color: #bebdbd; 
    }
    /*포스트 + 버튼 */
    #addcabinetBtn {
        width: 320px;
        height: 200px;
        background-color: #f9f9f9; /* 배경색 설정 */
        border: 2px dashed #ccc; /* 테두리 스타일: 점선 */
        display: flex;
        justify-content: center; /* 버튼 안에서 수평 가운데 정렬 */
        align-items: center; /* 버튼 안에서 수직 가운데 정렬 */
        font-size: 48px; /* + 기호 크기 */
        color: #aaa; /* + 기호 색상 (기본: 회색) */
        cursor: pointer; /* 마우스 커서를 포인터로 변경 */
        transition: color 0.3s ease; /* 색상 변경 시 부드럽게 전환 */
        border-radius: 8px; /* 모서리를 둥글게 */
        margin-top:20px;
    }

    #addcabinetBtn:hover {
        color: #585a58; /* 마우스를 올렸을 때 + 기호 색상 변경 (초록색) */
        border-color: #6c746d; /* 마우스를 올렸을 때 테두리 색상 변경 */
    }

    .cabinet-favorites {
        display: flex;
        overflow-x: auto;
        white-space: nowrap;
        padding: 10px 0;
        gap: 20px;
        margin-bottom: 2em;
    }

    .favorite-btn {
        background: none;
        border: none;
        cursor: pointer;
        font-size: 1.2em;
        color: #ccc;
        transition: transform 0.3s ease;
        padding: 0;
    }

    .favorite-btn:hover {
        background: none;
    }

    .favorite-btn.active {
        color: gold;
        transform: scale(1.2);
    }

    .favorite-btn i {
        transition: color 0.3s ease;
    }

    #no-favorites {
        background-color: #f9f9f9;
        border: 2px dashed #ccc;
        display: flex;
        justify-content: center;
        font-size: 28px;
        color: #aaa;
        transition: color 0.3s ease;
        border-radius: 8px;
        text-wrap: auto;
        text-align: center;
    }

    #no-favorites:hover {
        color: #585a58;
        border-color: #6c746d;
    }

</style>
<section id="cabinet">
    <h3>즐겨찾기</h3>
    <div class="cabinet-favorites" id="cabinet-favorites">
        <div id="no-favorites" class="cabinet-card">
            아직 즐겨찾기한<br>회의실이 없습니다
        </div>
    </div>
    <h3>회의실 목록</h3>
    <div class="cabinet-container" id="cabinet-container">
        <!-- 자바스크립트에 의해 로딩됨 -->
    </div>
    
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
<script>
    $(document).ready(function () {
        const e_idx = $('#e_idx').val();
        let favoriteIds = [];
        
        function loadFavorites() {
            $.ajax({
                type: "GET",
                url: "/cabinet/getFavoriteList",
                data: { e_idx: e_idx },
                success: function (favorites) {
                    favoriteIds = favorites.map(favorite => favorite.c_id);
                    $('#cabinet-favorites').empty();

                    if (favorites.length > 0) {
                        $('#no-favorites').hide();
                        favorites.forEach(favorite => {
                            const favoriteCard = $('<div>').addClass('cabinet-card').attr('data-id', favorite.c_id);
                            const titleDiv = $('<div>').addClass('cabinet-card-title').append(
                                $('<strong>').text(favorite.title),
                                $('<button>').addClass('favorite-btn active').data('id', favorite.c_id).append(
                                    $('<i>').addClass('fas fa-star')
                                )
                            );
                            const descriptionDiv = $('<div>').addClass('cabinet-description').text(favorite.description);
                            favoriteCard.append(titleDiv).append(descriptionDiv);
                            $('#cabinet-favorites').append(favoriteCard);
                        });
                    } else {
                        $('#no-favorites').show();
                    }
                    loadCabinets();
                },
                error: function () {
                    console.error("즐겨찾기 목록 로드 중 오류 발생");
                }
            });
        }
    
        function loadCabinets() {
            $.ajax({
                type: "GET",
                url: "/cabinet/getCabinets",
                success: function (cabinets) {
                    $('#cabinet-container').empty();
                
                    cabinets
                        .filter(cabinet => !favoriteIds.includes(cabinet.c_id)) 
                        .forEach(cabinet => {
                            const cabinetCard = $('<div>').addClass('cabinet-card').attr('data-id', cabinet.c_id);
                            const titleDiv = $('<div>').addClass('cabinet-card-title').append(
                                $('<strong>').text(cabinet.title),
                                $('<button>').addClass('favorite-btn').data('id', cabinet.c_id).append(
                                    $('<i>').addClass('far fa-star')
                                )
                            );
                            const descriptionDiv = $('<div>').addClass('cabinet-description').text(cabinet.description);
                            cabinetCard.append(titleDiv).append(descriptionDiv);
                            $('#cabinet-container').append(cabinetCard);
                        });
                },
                error: function () {
                    console.error("회의실 목록 로드 중 오류 발생");
                }
            });
        }
    
        loadFavorites();
        
        $('#addcabinetBtn').on('click', function () {
            $('#cabinetModal').css('display', 'flex');
        });
        
        $('#savecabinetBtn').on('click', function () {
            const title = $('#newcabinetTitle').val().trim();
            const description = $('#newcabinetDescription').val().trim();
        
            if (title === '' || description === '') {
                alert('Title과 Description을 입력하세요.');
                return;
            }
        
            $.ajax({
                type: "POST",
                url: "/cabinet/insertCabinet",
                data: { title: title, description: description },
                success: function (response) {
                    if (response === "success") {
                        loadCabinets();
                        $('#cabinetModal').css('display', 'none');
                        $('#newcabinetTitle').val('');
                        $('#newcabinetDescription').val('');
                    } else {
                        alert("저장에 실패했습니다. 다시 시도하세요.");
                    }
                },
                error: function () {
                    alert("서버 오류가 발생했습니다. 다시 시도하세요.");
                }
            });
        });
        
        $('#cancelcabinetBtn').on('click', function () {
            $('#cabinetModal').css('display', 'none');
        });
    
        $('#cabinet-container, #cabinet-favorites').on('click', '.favorite-btn', function (event) {
            event.stopPropagation();
            const roomId = $(this).data('id');
            const icon = $(this).find('i');
            const isFavorite = icon.hasClass('fas');
        
            if (isFavorite) {
                icon.removeClass('fas').addClass('far');
                $(this).removeClass('active');
                $(this).closest('.cabinet-card', function () {
                    $(this).remove();
                    loadFavorites();
                });
                removeFavorite(e_idx, roomId);
            } else {
                icon.removeClass('far').addClass('fas');
                $(this).addClass('active');
                addFavorite(e_idx, roomId);
            }
        });
    
        function addFavorite(e_idx, roomId) {
            $.ajax({
                type: "POST",
                url: "/cabinet/addFavorite",
                data: { e_idx: e_idx, c_id: roomId },
                success: function (response) {
                    if (response === "success") {
                        loadFavorites();
                    } else {
                        console.error("즐겨찾기 추가 실패");
                    }
                },
                error: function () {
                    console.error("즐겨찾기 추가 중 오류 발생");
                }
            });
        }
    
        function removeFavorite(e_idx, roomId) {
            $.ajax({
                type: "POST",
                url: "/cabinet/removeFavorite",
                data: { e_idx: e_idx, c_id: roomId },
                success: function (response) {
                    if (response === "success") {
                        loadFavorites();
                    } else {
                        console.error("즐겨찾기 제거 실패");
                    }
                },
                error: function () {
                    console.error("즐겨찾기 제거 중 오류 발생");
                }
            });
        }
    });
</script>