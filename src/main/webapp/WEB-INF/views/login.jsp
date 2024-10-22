<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <%@ include file="module/head.jsp" %>
    <title>FUNFUN Office - 로그인</title>

    <body>
        <div class="login-container">
            <div class="login-wrapper">
                <div class="title-area">
                    <!-- <img class="logo"> -->
                    <div class="title">FUNFUN OFFICE</div>
                </div>
                <form action="/employees/loginProcess.do" method="post">
                    <div class="login_id">
                        <input type="text" name="e_idx" required maxlength="9" oninput="this.value = this.value.replace(/[^0-9]/g, '')" placeholder="사원번호">
                    </div>
                    <div class="login_pw">
                        <input type="password" name="e_pw" placeholder="비밀번호" required>
                    </div>
                    <p class="error-message"></p>
                    <button type="submit" class="button-login">로그인</button>
                </form>
                <div class="contact">
                    <a href="#">인사과 문의하기</a>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function() {
                $('form').on('submit', function(e) {
                    e.preventDefault();
                
                    const formData = {
                        e_idx: $('input[name="e_idx"]').val(),
                        e_pw: $('input[name="e_pw"]').val()
                    };
                
                    $.ajax({
                        type: 'POST',
                        url: '/employees/loginProcess.do',
                        data: formData,
                        dataType: 'json',
                        success: function(response) {
                            console.log("response: " + response.status.trim());
                            if (response.status.trim() === 'success') {
                                window.location.href = '/';
                            } else {
                                $('.error-message').html(`사원번호나 비밀번호가 일치하지 않습니다.`);
                            }
                        },
                        error: function() {
                            $('.error-message').html('서버 오류가 발생했습니다. 다시 시도해주세요.');
                        }
                    });
                });
            });
        </script>
    </body>
</html>
