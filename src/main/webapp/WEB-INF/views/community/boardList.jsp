<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
        .write-btn {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>게시판 목록</h1>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <!-- 여기에 게시글 목록이 동적으로 삽입됩니다. -->
            <tr>
                <td>1</td>
                <td><a href="viewPost.jsp">첫 번째 게시글</a></td>
                <td>관리자</td>
                <td>2024-09-30</td>
                <td>10</td>
            </tr>
        </tbody>
    </table>
    <div class="write-btn">
        <button onclick="location.href='writePost.jsp'">글쓰기</button>
    </div>
</body>
</html>
