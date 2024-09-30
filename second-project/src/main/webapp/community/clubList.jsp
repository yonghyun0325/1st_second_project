<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>동호회 목록</title>
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
    </style>
</head>
<body>
    <h1>동호회 목록</h1>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>동호회 이름</th>
                <th>관리자</th>
                <th>가입 인원</th>
            </tr>
        </thead>
        <tbody>
            <!-- 동호회 목록 -->
            <tr>
                <td>1</td>
                <td><a href="viewClub.jsp">프로그래밍 동호회</a></td>
                <td>홍길동</td>
                <td>50명</td>
            </tr>
        </tbody>
    </table>
    <div>
        <button onclick="location.href='createClub.jsp'">동호회 만들기</button>
    </div>
</body>
</html>
