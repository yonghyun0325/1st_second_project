<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board_write.css">
</head>
<body>
<div class="wrap">
    <h2 class="form-title">글쓰기</h2>
    <div class="form-container">
        <form name="frmBoardWrite" action="writeProcess.do" method="post">
            <input type="hidden" name="m_idx" value="${member.m_idx}">
            <div class="form-group">
                <label for="b_writer">작성자:</label>
                <input type="text" id="b_writer" name="b_writer" value="${member.member_name}" readonly>
            </div>
            <div class="form-group">
                <label for="b_title">제목:</label>
                <input type="text" id="b_title" name="b_title" required>
            </div>
            <div class="form-group">
                <label for="b_content">내용:</label>
                <textarea id="b_content" name="b_content" rows="10" required></textarea>
            </div>
            <div class="form-btn-group">
                <input type="submit" class="btn btn-submit" value="작성완료">
                <input type="reset" class="btn btn-reset" value="다시입력">
                <input type="button" class="btn btn-back" value="목록보기" onclick="location.href='../index.do'">
            </div>
        </form>
    </div>
</div>
</body>
</html>
