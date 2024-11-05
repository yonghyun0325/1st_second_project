
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