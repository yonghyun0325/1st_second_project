<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board_list.css">
</head>
<body>

    <div class="wrap">
        <table class="board-table">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>

            <c:choose>
                <c:when test="${empty boardList}">
                    <tr>
                        <td colspan="5">등록된 게시물이 없습니다</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="board" items="${boardList}" varStatus="vs">
                        <tr>
                            <td>${vs.count}</td>
                            <td><a href="${pageContext.request.contextPath}/board/view.do?b_idx=${board.b_idx}">
                            		${board.b_title}
                            	</a>
                            </td>
                            <td>${board.b_writer}</td>
                            <td>
                                <fmt:formatDate value="${board.post_date}" type="date"
                                    pattern="yyyy-MM-dd" />
                            </td>
                            <td>${board.read_cnt}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

            
        </table>

        <!--  검색기능  -->
        <div class="search-container">
            
            <div class="search-box">
                <form>
                    <select name="searchField" class="search-field">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="writer">작성자</option>
                    </select>
                    <input type="text" name="searchWord" class="search-word">
                    <input type="submit" class="search-btn" value="검색">
                    <c:if test="${not empty member}">
                    
                        <a class= "button-box" href="${pageContext.request.contextPath}/board/write.do">
                            <button type="button" class="write-btn">글등록</button> 
                        </a>
 
            </c:if>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
