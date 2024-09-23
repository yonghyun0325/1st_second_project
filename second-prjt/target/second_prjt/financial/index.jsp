<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <title>급여 관리 페이지</title>
    <link rel="stylesheet" href="../css/style.css">
    <script>
      function showTab(tabId) {
        const contents = document.querySelectorAll('.content');
        contents.forEach(content => {
          content.classList.remove('active');
        });
        document.getElementById(tabId).classList.add('active');

        const tabs = document.querySelectorAll('.tab');
        tabs.forEach(tab => {
          tab.classList.remove('active');
        });
        document.getElementById(tabId + '-tab').classList.add('active');
      }
    </script>
  </head>

  <body>
    <header>
      <h1>급여 관리</h1>
    </header>

    <div id="sidebar">
      <div class="sidebar-wrapper">
        <div class="sidebar-item"><a href="#">마이 페이지</a></div>
        <div class="sidebar-item"><a href="#">재무 관리</a></div>
        <div class="sidebar-item"><a href="#">구매 관리</a></div>
        <div class="sidebar-item"><a href="#">인사 관리</a></div>
        <div class="sidebar-item"><a href="#">고객 관리</a></div>
        <div class="sidebar-item"><a href="#">커뮤니티</a></div>
        <div class="sidebar-item"><a href="#">문의하기</a></div>
        <div class="sidebar-item"><a href="#">공지사항</a></div>
      </div>
    </div>

    <div id="content">
      <div id="tabs">
        <div id="salary-tab" class="tab active" onclick="showTab('salary')">급여 지급</div>
        <div id="bonus-tab" class="tab" onclick="showTab('bonus')">성과급/보너스</div>
        <div id="stub-tab" class="tab" onclick="showTab('stub')">급여 명세서</div>
        <div id="tax-tab" class="tab" onclick="showTab('tax')">세금 및 공제</div>
      </div>

      <div id="salary" class="content active">
        <h2>급여 지급</h2>
        <table>
          <thead>
            <tr>
              <th>사원 이름</th>
              <th>급여</th>
              <th>지급 날짜</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>홍길동</td>
              <td>3,000,000 원</td>
              <td>2024-09-30</td>
            </tr>
            <tr>
              <td>이순신</td>
              <td>4,000,000 원</td>
              <td>2024-09-30</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div id="bonus" class="content">
        <h2>성과급/보너스 관리</h2>
        <table>
          <thead>
            <tr>
              <th>사원 이름</th>
              <th>보너스</th>
              <th>지급 날짜</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>홍길동</td>
              <td>500,000 원</td>
              <td>2024-09-30</td>
            </tr>
            <tr>
              <td>이순신</td>
              <td>700,000 원</td>
              <td>2024-09-30</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div id="stub" class="content">
        <h2>급여 명세서 제공</h2>
        <table>
          <thead>
            <tr>
              <th>사원 이름</th>
              <th>명세서 제공일</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>홍길동</td>
              <td>2024-09-30</td>
            </tr>
            <tr>
              <td>이순신</td>
              <td>2024-09-30</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div id="tax" class="content">
        <h2>세금 및 공제 관리</h2>
        <table>
          <thead>
            <tr>
              <th>사원 이름</th>
              <th>세금 공제</th>
              <th>공제 날짜</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>홍길동</td>
              <td>300,000 원</td>
              <td>2024-09-30</td>
            </tr>
            <tr>
              <td>이순신</td>
              <td>400,000 원</td>
              <td>2024-09-30</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

  </body>

  </html>