<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="employees-list-section">
    <table class="employees-list">
        <thead>
            <tr>
                <th>사원번호<div class="resize-handle"></div></th>
                <th>성명<div class="resize-handle"></div></th>
                <th>직급<div class="resize-handle"></div></th>
                <th>부서</th>
            </tr>
        </thead>
        <tbody>
            <!-- 사원 목록 표시부분 -->
        </tbody>
    </table>
</div>
<script>
    // ajax 요청으로 사원 목록 불러오기
    $.ajax({
        url: '/employees/getEmployeesList.do',
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            const tableBody = $('.employees-list tbody');
            tableBody.empty();
            
            data.forEach(function(employee) {
                const row = $('<tr>').append(
                    $('<td>').text(employee.e_idx),
                    $('<td>').text(employee.name),
                    $('<td>').text(employee.position),
                    $('<td>').text(employee.depa)
                );
                
                row.on('click', function() {
                    loadEmployeeDetails(employee.e_idx);
                    loadSalaryDetails(employee.e_idx);
                    e_idx = employee.e_idx;
                    enableAllowanceFields();
                });
                
                tableBody.append(row);
            });
        },
        error: function() {
            window.alert('사원 목록을 불러오는 중 오류가 발생했습니다.');
        }
    });
</script>