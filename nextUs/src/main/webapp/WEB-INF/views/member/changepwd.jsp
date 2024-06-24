<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="/resources/css/reset.css"/>
    <link rel="stylesheet" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="/resources/css/contents.css"/>
    <link rel="stylesheet" href="/resources/css/header.css"/>
    <link rel="stylesheet" href="/resources/css/footer.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $("#submitBtn").click(function(event) {
        event.preventDefault(); // 폼 제출 방지
        
        var pw = $("#pw").val();
        var pwCheck = $("#pw_check").val();
        
        // 비밀번호 유효성 검사
        if (pw === '') {
            alert('비밀번호를 입력하세요');
            $("#pw").focus();
            return;
        }
        
        if (pw !== pwCheck) {
            alert('비밀번호가 일치하지 않습니다');
            return;
        }
        
        var reg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/;
        if (!reg.test(pw)) {
            alert('비밀번호는 영문자와 숫자를 포함하여 8자 이상 입력하세요');
            $("#pw").val('');
            $("#pw_check").val('');
            $("#pw").focus();
            return;
        }
        
        // 비밀번호 변경을 위한 Ajax 요청
        $.ajax({
            type: "POST", // POST 방식으로 변경
            url: "/changePassword.do", // 변경할 URL에 맞게 설정
            data: {
                newPassword: $("#pw").val(), // 변경할 비밀번호 데이터 전송
                userEmail : sessionStorage.getItem("userEmail")
            },
            success: function(response) {
                if (response.status) {
                    alert('비밀번호가 성공적으로 변경되었습니다.');
                    window.location.href = '/member/login.do'; // 변경 후 로그인 페이지로 이동
                } else {
                    alert('비밀번호 변경 중 오류가 발생했습니다: ' + response.error);
                }
            },
            error: function() {
                alert('서버 오류: 비밀번호 변경 중 문제가 발생했습니다.');
            }
        });
    });
});

</script>
</head>
<body>
    <h2>비밀번호 변경</h2>
    <form id="passwordForm" action="changePassword" method="post">
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <label for="pw">새 비밀번호:</label>
        <input type="password" id="pw" name="pw" required><br>
        
        <label for="pw_check">새 비밀번호 확인:</label>
        <input type="password" id="pw_check" name="pw_check" required><br>
        
        <button type="button" id="submitBtn">비밀번호 변경</button>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </form>
</body>
</html>
