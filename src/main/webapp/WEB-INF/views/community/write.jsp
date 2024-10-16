<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.human.web.vo.EmployeesVO"%> 
<%@ page import="javax.servlet.http.HttpSession"%>
<meta charset="UTF-8">

<div id="write-container">
    <form name="frmBoardWrite" action="writeProcess.do" method="post">
        <h2>새로운 글 작성</h2>
        <input type="text" name="b_title" placeholder="글 제목">
        <textarea name="b_content" cols="30" rows="10"></textarea>
        <div class="write-button-bundle">
            <input type="submit" value="작성완료">
            <input type="reset" value="다시입력">
            <input type="button" value="목록보기" id="back_to_list">
        </div>
    </form>
</div>
<script>
    $(document).ready(function() {
        $('#back_to_list').on('click', function () {
            $('#write_form_container').hide();
            $('#list_container').show();
        });
    });
</script>