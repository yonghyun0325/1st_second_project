<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    .depa-list tbody tr { cursor: pointer; }
    .depa-list tbody tr:hover { background-color: #e6e6e6; }
    .depa-list tbody tr.active { background-color: #e6e6e6; }
</style>
<!-- 급여 관리 수당등록 화면 -->
<section id="depaset">

    <!-- 부서 목록 -->
    <div class="table-wrapper" style="flex: 1;">
        <div class="list-title-wrapper">
            <h3>◇ 부서 목록</h3>
            <div class="button-bundle">
                <a href="javascript:void(0)" class="depa_addition">추가</a>
                <a href="javascript:void(0)" class="depa_update" style="display: none;">수정</a>
                <a href="javascript:void(0)" class="depa_delete" style="display: none;">삭제</a>
            </div>
        </div>
        <div class="depa-list-section">
            <table class="depa-list table-common">
                <thead>
                    <tr>
                        <th style="width: 30%;">부서 코드</th>
                        <th>부서명</th>
                        <!-- <th>직급</th>
                        <th>부서</th> -->
                    </tr>
                </thead>
                <tbody>
                    <!-- 부서 목록 표시부분 -->
                </tbody>
            </table>
        </div>
    </div>

</section>
<script>
    $(document).ready(function() {
        let selectedDepa = null;

        // 부서 목록 불러오기
        function loadDepaList() {
            $.ajax({
                url: '/depa/getDepaList',
                method: 'GET',
                dataType: 'json',
                success: function(data) {
                    const tableBody = $('.depa-list tbody');
                    tableBody.empty();
                    
                    data.forEach(function(depa) {
                        const row = $('<tr>').append(
                            $('<td>').text(depa.d_idx),
                            $('<td>').text(depa.name)
                        );

                        row.on('click', function() {
                            $('.depa-list tbody tr').removeClass('active');
                            $(this).addClass('active');
                            selectedDepa = depa;
                            toggleEditButtons(true);
                        });
                        
                        tableBody.append(row);
                    });
                },
                error: function() {
                    alert('부서 목록을 불러오는 중 오류가 발생했습니다.');
                }
            });
        }

        loadDepaList(); // 페이지 로드 시 부서 목록 초기화

        // 추가 버튼 클릭 이벤트 처리
        $('.depa_addition').on('click', function() {
            $('.button-bundle a').hide();

            const tableBody = $('.depa-list tbody');
            const newRow = $('<tr>').addClass('new-row').append(
                $('<td>').append('<input type="text" name="new_d_idx" disabled value="자동 생성됨">'),
                $('<td>').append('<input type="text" name="new_name" required>')
            );

            tableBody.prepend(newRow);

            $('.button-bundle').append(`
                <a href="javascript:void(0)" class="depa_complete">저장</a>
                <a href="javascript:void(0)" class="depa_cancel">취소</a>
            `);
        });

        // 수정 버튼 클릭 이벤트
        $('.depa_update').on('click', function() {
            if (selectedDepa) {
                const selectedRow = $('.depa-list tbody tr.active');
                selectedRow.find('td:eq(1)').html('<input type="text" value="' + selectedDepa.name + '" class="edit-name">');

                // 수정 완료, 취소 버튼 추가
                $('.button-bundle a').hide();
                $('.button-bundle').append(`
                    <a href="javascript:void(0)" class="depa_update_complete">수정 완료</a>
                    <a href="javascript:void(0)" class="depa_cancel">취소</a>
                `);
            }
        });

        $('.depa_delete').on('click', function() {
            if (selectedDepa && selectedDepa.d_idx && confirm('정말' + selectedDepa.name + '를 삭제하시겠습니까?')) {
                $.ajax({
                    url: '/depa/deleteDepa/' + selectedDepa.d_idx,
                    method: 'DELETE',
                    success: function() {
                        alert("부서가 삭제되었습니다.");
                        loadDepaList();
                        toggleEditButtons(false);
                        selectedDepa = null;
                    },
                    error: function() {
                        alert("부서를 삭제하는 중 오류가 발생했습니다.");
                    }
                });
            } else if (!selectedDepa) {
                alert("삭제할 부서를 먼저 선택하세요.");
            }
        });

        // 저장 버튼 클릭 이벤트
        $(document).on('click', '.depa_complete', function() {
            const name = $('input[name="new_name"]').val();

            if (!name) {
                alert('부서 이름을 입력하세요.');
                return;
            }

            $.ajax({
                url: '/depa/insertDepa',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ name: name }),
                success: function(response) {
                    alert("부서가 추가되었습니다.");
                    loadDepaList();
                    restoreButtons();
                },
                error: function() {
                    alert('부서를 추가하는 중 오류가 발생했습니다.');
                }
            });
        });

        // 수정 완료 버튼 클릭 이벤트
        $(document).on('click', '.depa_update_complete', function() {
            const newName = $('.edit-name').val();

            if (!newName) {
                alert('부서 이름을 입력하세요.');
                return;
            }

            $.ajax({
                url: '/depa/editDepa/' + selectedDepa.d_idx,
                method: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify({ name: newName }),
                success: function(response) {
                    alert("부서가 수정되었습니다.");
                    loadDepaList();
                    toggleEditButtons(false);
                    restoreButtons();
                },
                error: function() {
                    alert('부서를 수정하는 중 오류가 발생했습니다.');
                }
            });
        });

        // 취소 버튼 클릭 이벤트
        $(document).on('click', '.depa_cancel', function() {
            restoreButtons();
            $('.new-row, .edit-row').remove();
            selectedDepa = null;
            toggleEditButtons(false);
        });

        // 수정, 삭제 버튼 활성화/비활성화 함수
        function toggleEditButtons(enable) {
            $('.depa_update, .depa_delete').toggle(enable);
        }

        // 기본 버튼 복원 함수
        function restoreButtons() {
            $('.button-bundle a').show();
            $('.depa_complete, .depa_cancel, .depa_update_complete').remove();
        }
    });
</script>