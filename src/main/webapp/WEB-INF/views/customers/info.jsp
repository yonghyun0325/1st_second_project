<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section id="info">
  		<h2>고객 관리</h2>
        <div id="container">
          	<table id="left-table">
               <thead>
                   <tr>
                       <th>고객명(업체명)</th>
                       <th>제품군</th>
                       <th>제공 기간</th>
                       <th>거래 예정 고객</th>
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
           	           	
         		<div id="right-form">
         		<form id="customerForm" name="customerForm" action="${pageContext.request.contextPath}/customers/register" method="post">
                <label>거래처: <input type="text" name = "company_name" required></label><br>
                <label>고객명: <input type="text" name = "c_name"></label><br>
                <label>연락처: <input type="number" name = "phone_num"></label><br>
                <label>식별 번호: <input type="number" name = "i_num"></label><br>
                <label>거래 유형: <input type="text" name = "trans_type"></label><br>
                <label>제품군: <input type="text" name = "product_name"></label><br>
                <label>제공 기간: <input type="date" name = "usetime"></label><br>
                <label>요청 사항: <input type="text" name = "req_content"></label><br>
                <input type="submit" value="등록">
               </form>
           </div>
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
