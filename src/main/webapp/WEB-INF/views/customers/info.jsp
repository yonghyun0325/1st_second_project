<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="${pageContext.request.contextPath}/resources/js/customers.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/customers.css"> --%>

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