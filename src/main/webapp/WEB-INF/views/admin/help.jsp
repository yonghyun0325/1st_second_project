<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 접수된 문의 조회 페이지 -->
<section id="admin_help" class="section-common">
    <div class="table-wrapper" style="flex: 1;">
        <div class="list-title-wrapper">
            <h3>◇ 접수된 문의사항 목록</h3>
        </div>
        <div class="table-list-section">
            <table class="admin-help-list table-common table-select-list">
                <thead>
                    <tr>
                        <th style="width: 30%;">사원번호</th>
                        <th>성명</th>
                        <th>문의 코드</th>
                        <th>문의 종류</th>
                        <th>문의 서비스</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 문의 목록 표시부분 -->
                </tbody>
            </table>
        </div>
    </div>
    
    <div class="admin-help-info-wrapper" style="flex: 1;">
        <div class="list-title-wrapper">
            <h3>◇ 문의 내용</h3>
        </div>
        <div class="help-info-wrapper">
            <div class="help-info-who help-info-header">
                <p>문의자</p>
                <p id="help-name"></p>
            </div>
            <div class="help-info-eidx help-info-header">
                <p>사원번호</p>
                <p id="e_idx"></p>
            </div>
            <div class="help-info-content">
                <p>문의 내용</p>
                <p id="help-info-detail"></p>
            </div>
            <div class="help-info-footer">
                <button id="help-delete" type="button">처리 완료</button>
            </div>
        </div>
    </div>
</section>
<script>
    // 페이지 로드 시 문의 목록 조회
    $(document).ready(function () {
        loadHelpList();
        let currentHelpId = null;

        // 문의 목록 불러오기
        function loadHelpList() {
            $.ajax({
                url: "/help/list",
                type: "GET",
                success: function (response) {
                    const tbody = $(".admin-help-list tbody");
                    tbody.empty();
                    response.forEach(function (item) {
                        tbody.append(
                            '<tr data-help-id="' + item.help_id + '">' +
                                '<td>' + item.e_idx + '</td>' +
                                '<td>' + item.name + '</td>' +
                                '<td>' + item.help_id + '</td>' +
                                '<td>' + item.product + '</td>' +
                                '<td>' + item.service + '</td>' +
                            '</tr>'
                        );
                    });
                }
            });
        }

        $(".admin-help-list tbody").on("click", "tr", function () {
            const helpId = $(this).data("help-id");
            loadHelpDetail(helpId);
        });

        function loadHelpDetail(helpId) {
            currentHelpId = helpId;
            $.ajax({
                url: '/help/detail/' + helpId,
                type: "GET",
                success: function (response) {
                    $("#help-name").text(response.name);
                    $("#e_idx").text(response.e_idx);
                    $("#help-info-detail").text(response.help_detail);
                }
            });
        }

        $("#help-delete").click(function () {
            if (currentHelpId) {
                $.ajax({
                    url: '/help/delete/' + currentHelpId,
                    type: "DELETE",
                    success: function (response) {
                        alert(response.message);
                        loadHelpList(); 
                        $("#help-name").text('');
                        $("#e_idx").text('');
                        $("#help-info-detail").text('');
                    }
                });
            } else {
                alert("먼저 삭제할 문의를 선택해주세요.");
            }
        });
    });

</script>