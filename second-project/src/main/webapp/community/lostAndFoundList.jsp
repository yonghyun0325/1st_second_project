<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>분실물 목록</title>
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
    <h1>분실물 목록</h1>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>분실물명</th>
                <th>습득 장소</th>
                <th>등록일</th>
            </tr>
        </thead>
        <tbody>
            <!-- 분실물 목록 -->
            <tr>
                <td>1</td>
                <td><a href="viewLostItem.jsp">지갑</a></td>
                <td>회의실</td>
                <td>2024-09-30</td>
            </tr>
        </tbody>
    </table>
    <div>
        <button onclick="location.href='reportLostItem.jsp'">분실물 등록</button>
    </div>
</body>
</html>
