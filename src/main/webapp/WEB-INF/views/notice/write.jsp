<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<div id="write" data-type="${type}">
    <form name="frmBoardWrite" action="${pageContext.request.contextPath}/community/writeProcess.do" method="post" enctype="multipart/form-data">

        <h3 id="write-title"></h3>

        <!-- 사원번호와 타입 -->
        <input type="hidden" id="e_idx" name="e_idx">
        <input type="hidden" name="type" value="${type}">
        
        <div class="input-title-wrapper">
            <!-- 게시글 타입별 카테고리 선택 부분 -->
            <select id="category" name="category">
            </select>

            <!-- 글 제목 입력 부분 -->
            <input type="text" name="title" placeholder="글 제목" required>

            <!-- 첨부파일 입력 부분 -->
            <input type="file" name="uploadFiles" multiple>
        </div>

        <!-- 글 내용 입력 부분 -->
        <textarea name="content" cols="30" rows="10"></textarea>

        <!-- 버튼 부분 -->
        <div class="write-button-bundle">
            <input type="button" value="작성취소" id="back_to_list">
            <input type="reset" value="다시입력">
            <input type="submit" value="작성완료">
        </div>
    </form>
</div>
<script>
    $(document).ready(function() {
        let type = $('#write').data('type');
        console.log("(write.jsp) 게시글 작성 요청, 받은 타입: " + type)
        setCategoryOptions(type);
        
        // 로그인 세션 가져와서 사원번호 값 form 에 추가
        $.ajax({
            url: '${pageContext.request.contextPath}/session/info',
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                if (data && data.e_idx) {
                    $('#e_idx').val(data.e_idx);
                }
            },
            error: function (jqXHR) {
                alert('세션 데이터를 불러오는 중 오류가 발생했습니다.');
            }
        });
        
        // 목록보기 버튼
        $('#back_to_list').on('click', function () {
            const contentDiv = $('#tab-wrapper .content.active');

            $.ajax({
                url: '${pageContext.request.contextPath}/board/' + type,
                method: 'GET',
                success: function (data) {
                    console.log('(write.jsp) 목록보기 호출, 전달한 타입: ' + type)
                    $(contentDiv).html(data);
                },
                error: function (jqXHR) {
                    alert('글 목록을 불러오는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });
        
        // 카테고리 옵션 설정
        function setCategoryOptions(type) {
            const categorySelect = $('#category');
            const titleDiv = $('#write-title');
            categorySelect.empty();
            titleDiv.empty();
            
            if (type === 'normal') {
                categorySelect.append('<option value="일반">일반</option>');
                titleDiv.text('새로운 글 작성');
            } else if (type === 'notice') {
                categorySelect.append('<option value="중요">중요</option>');
                categorySelect.append('<option value="행사">행사</option>');
                titleDiv.text('새로운 공지사항 작성');
            }
        }
        
        // 작성 완료 버튼 클릭시 글 등록하기
        $('#frmBoardWrite').off('submit').on('submit', function (e) {
            // 기본 폼 제출 방지
            e.preventDefault();

            // FormData 객체로 폼 데이터 생성 (첨부파일 포함)
            let formData = new FormData(this);

            $.ajax({
                url: '${pageContext.request.contextPath}/board/writeProcess.do',
                method: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response.status === 'success') {
                        alert('글이 성공적으로 등록되었습니다.');
                        
                        $.ajax({
                            url: '${pageContext.request.contextPath}/board/' + type,
                            method: 'GET',
                            success: function (data) {
                                const contentDiv = $('#tab-wrapper .content.active');
                                $(contentDiv).html(data);
                            },
                            error: function (jqXHR) {
                                alert('글 목록을 불러오는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                            }
                        });

                    } else if (response.status === 'fail') {
                        alert('글 등록에 실패했습니다. 다시 시도해 주세요.');
                    } else if (response.status === 'error') {
                        alert('오류가 발생했습니다: ' + response.message);
                    }
                },
                error: function (jqXHR) {
                    alert('글을 등록하는 중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });
    });
</script>