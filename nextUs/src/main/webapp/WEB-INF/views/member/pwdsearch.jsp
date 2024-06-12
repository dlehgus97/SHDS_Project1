<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/reset.css"/>
    <link rel="stylesheet" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="/resources/css/contents.css"/>
    <link rel="stylesheet" href="/resources/css/header.css"/>
    <link rel="stylesheet" href="/resources/css/footer.css"/>
</head>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
    
	    <h2>아이디 찾기 - 이메일 인증</h2>
	    
	    <form id="emailForm">
	        <label for="email">이메일:</label>
	        <input type="email" id="email" name="email" required>
	        <button type="button" onclick="sendEmailVerification()">이메일 인증 요청</button>
	    </form>
	    
	    <div id="verificationCodeArea" style="display: none;">
	        <label for="verificationCode">인증 코드:</label>
	        <input type="text" id="verificationCode" name="verificationCode" required>
	        <button type="button" onclick="verifyCode()">인증 확인</button>
	    </div>
	
	    <div id="result"></div>
	
	    <script>
	        function sendEmailVerification() {
	            var email = document.getElementById('email').value;
	
	            // 이메일을 서버로 보내고 이메일로 인증 코드를 보내는 작업을 수행해야 합니다.
	            // 여기서는 간단하게 콘솔에 인증 코드를 출력하는 것으로 대체합니다.
	            var verificationCode = generateVerificationCode();
	            console.log("인증 코드:", verificationCode);
	
	            // 이메일 인증 코드 입력 폼을 표시합니다.
	            document.getElementById('verificationCodeArea').style.display = 'block';
	        }
	
	        function generateVerificationCode() {
	            // 간단하게 랜덤한 6자리 숫자로 인증 코드를 생성합니다.
	            return Math.floor(100000 + Math.random() * 900000);
	        }
	
	        function verifyCode() {
	            var verificationCode = document.getElementById('verificationCode').value;
	
	            // 이메일로 전송된 인증 코드와 사용자가 입력한 코드를 비교합니다.
	            // 여기서는 간단하게 콘솔에 출력하여 확인합니다.
	            console.log("사용자가 입력한 인증 코드:", verificationCode);
	
	            // 여기에 서버로 인증 코드를 전송하여 확인하는 작업을 수행해야 합니다.
	            // 인증이 성공하면 아이디를 찾는 프로세스를 진행하거나, 사용자에게 알려줍니다.
	            // 인증이 실패하면 사용자에게 오류 메시지를 표시합니다.
	        }
	    </script>
	      
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	</div>
</body>
</html>
