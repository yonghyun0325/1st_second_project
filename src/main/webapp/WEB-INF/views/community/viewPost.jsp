<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 보기</title>
</head>
<body>
    <h1>게시글 보기</h1>
    <div>
        <h2>게시글 제목</h2>
        <p>작성자: 관리자 | 작성일: 2024-09-30</p>
        <p>조회수: 10</p>
    </div>
    <div>
        <p>게시글 내용이 여기에 표시됩니다.</p>
    </div>
    <div>
        <button onclick="location.href='boardList.jsp'">목록으로</button>
        <button onclick="location.href='editPost.jsp'">수정</button>
        <button onclick="location.href='deletePost.jsp'">삭제</button>
    </div>
</body>
</html>
