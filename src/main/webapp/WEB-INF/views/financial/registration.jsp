<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<div id="registration">
    <div class="employees-list-wrap">
        <h3>기본 정보</h3>
        <div class="employees-list">
            <table>
                <thead>
                    <tr>
                        <th>사원번호</th>
                        <th>성명</th>
                        <th>직급</th>
                        <th>부서</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
    <div class="financial-info-wrap">
        <h3>상세 정보</h3>
        <div class="financial-info">
            상세 정보 화면
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $.ajax({
            url: '/employees/getEmployeesList.do',
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                const tableBody = $('.employees-list tbody');
                tableBody.empty();
                
                data.forEach(function(employee) {
                    const row = '<tr>' +
                                    '<td>' + employee.e_idx + '</td>' +
                                    '<td>' + employee.name + '</td>' +
                                    '<td>' + employee.position + '</td>' +
                                    '<td>' + employee.depa + '</td>' +
                                '</tr>';
                    tableBody.append(row);
                });
            },
            error: function() {
                window.alert('사원 목록을 불러오는 중 오류가 발생했습니다.');
            }
        });
    });
</script>