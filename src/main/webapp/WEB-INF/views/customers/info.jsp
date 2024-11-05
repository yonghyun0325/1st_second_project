<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section id="customer_info" class="section-common">

    <!-- 고객 목록 -->
    <div class="table-wrapper" style="flex:1;">
        <h3>◇ 고객 목록</h3>
        <div class="employees-list-section">
            <table id="left-table" class="table-common">
                <thead>
                     <tr>
                        <th>고객 코드</th>
                        <th>고객명</th>
                        <th>제품군</th>
                        <th>계약 기간</th>
                        <th>계약 만료 여부</th>
                     </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${customers}">
                        <tr>
                            <td>${customer.c_name} (${customer.company_name})</td>
                            <td>${customer.product_name}</td>
                            <td>
                                <fmt:formatDate value="${customer.usetime}" pattern="yyyy-MM-dd" />
                            </td>                           
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="table-wrapper" style="flex: 2;">
        <h3>◇ 고객 정보</h3>
        <form id="customerForm" name="customerForm" action="${pageContext.request.contextPath}/customers/register" method="post">
            <table id="left-table" class="table-common">
                <thead>
                    <tr>
                        <th>분류</th>
                        <th>입력</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>거래처</label></td>
                        <td><input type="text" name="company_name" required></td>
                    </tr>
                    <tr>
                        <td>고객명</label></td>
                        <td><input type="text" name="c_name"></td>
                    </tr>
                    <tr>
                        <td>연락처</label></td>
                        <td><input type="number" name="phone_num"></td>
                    </tr>
                    <tr>
                        <td>식별 번호</label></td>
                        <td><input type="number" name="i_num"></td>
                    </tr>
                    <tr>
                        <td>거래 유형</label></td>
                        <td><input type="text" name="trans_type"></td>
                    </tr>
                    <tr>
                        <td>제품군</label></td>
                        <td><input type="text" name="product_name"></td>
                    </tr>
                    <tr>
                        <td>제공 기간</label></td>
                        <td><input type="date" name="usetime"></td>
                    </tr>
                    <tr>
                        <td>요청 사항</label></td>
                        <td><input type="text" name="req_content"></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="등록">
        </form>
    </div>  

</section>

    <script>

    $(document).ready(function() {
        // 작성 완료 버튼 클릭시 글 등록하기
        $('#customerForm').on('submit', function (e) {
            // 기본 폼 제출 방지
            e.preventDefault();

            // FormData 객체로 폼 데이터 생성 (첨부파일 포함)
            let formData = new FormData(this);

            $.ajax({
                url: '${pageContext.request.contextPath}/customers/register',
                method: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    if (response.status === 'success') {
                        alert('저장이 완료되었습니다.');
                    } else if (response.status === 'fail') {
                        alert('저장에 실패했습니다.');
                    } else if (response.status === 'error') {
                        alert('저장중 오류가 발생했습니다: ' + response.message);
                    }
                },
                error: function (jqXHR) {
                    alert('정보를 저장하던중 오류가 발생했습니다. (' + jqXHR.status + ')');
                }
            });
        });
    })
</script>
