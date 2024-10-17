<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<head>
<!-- css, 스타일 초기화 적용  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<!-- css, 분실물 게시판 스타일 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/community_lost.css">
</head>
<body>
	<div class="wrap">
		<h2>분실물 게시판</h2>
		<div class="board-container">
		<div class="detail-header">
		<h2 class="detail-title">${CommunityVO.b_title}</h2>
		<div class="detail-meta">
			<span>작성자: ${CommunityVO.b_writer}</span> | 
					<span>조회수: ${CommunityVO.read_cnt}</span> | 
					<span>작성일: <fmt:formatDate value="${CommunityVO.post_date}" type="date" pattern="yyyy-MM-dd hh:mm:ss" /></span>
				</div>
			</div>
			<div class="detail-content">
				<p>${CommunityVO.b_content}</p>
			</div>
			<div class="detail-btn-group">
				<!-- 조건: 회원 + 자신이 쓴 게시글-->
				<c:if test="${(not empty member) and (member.m_idx eq CommunityVO.m_idx)}">
					<button class="btn btn-edit" onclick="location.href='update.do?b_idx=${CommunityVO.b_idx}'">수정하기</button>
					<button class="btn btn-delete" onclick="deletePost()">삭제하기</button>
				</c:if>
				<button class="btn btn-back" onclick="location.href='${pageContext.request.contextPath}/index.do'">목록으로</button>
			</div>
		</div>
	</div>

	<script>
		function deletePost() {
			const ans = confirm("정말 삭제하겠습니까?");
			if (ans) {
				location.href = "deleteProcess.do?b_idx=${CommunityVO.b_idx}";
			}
		}
	</script>
</body>
