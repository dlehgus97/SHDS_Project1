<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>아이디 찾기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="/resources/css/reset.css"/>
    <link rel="stylesheet" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="/resources/css/contents.css"/>
    <link rel="stylesheet" href="/resources/css/header.css"/>
    <link rel="stylesheet" href="/resources/css/footer.css"/>
    <style>
        .sub {
            max-width: 600px;
            margin: 0 auto;
            text-align: center;
        }
        .sub_title {
            text-align: center;
        }
        .box {
            text-align: center;
        }
        .id_search_form {
            text-align: center;
        }
    </style>   
    <script type="text/javascript">
        function validateEmail(email) {
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailPattern.test(email);
        }

        function validateForm() {
            var email = $("#email").val();
            if (!email) {
                alert("이메일을 입력해주세요.");
                return false;
            } else if (!validateEmail(email)) {
                alert("유효한 이메일 형식을 입력해주세요.");
                return false;
            }
            return true;
        }

        function sendEmailVerification() {
            if (!validateForm()) {
                return;
            }

            var email = $("#email").val();
            
            $.ajax({
                type: "POST",
                url: "/member/findAuth.do",
                data: {
                    email: email
                },
                success: function(response) {
                    if (response.status) {
                        Swal.fire({
                            icon: 'success',
                            title: '입력하신 이메일로 인증번호를 전송했습니다.',
                            returnFocus: false
                        });
                        $("#verificationCodeArea").show();
                        $("#result").text("이메일 인증 코드를 입력해주세요.");
                        $("#emailVerificationButton").text("재인증 요청"); // 버튼 텍스트 변경
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: '오류',
                            text: response.error,
                            returnFocus: false
                        });
                    }
                },
                error: function() {
                    Swal.fire({
                        icon: 'error',
                        title: '서버 오류',
                        text: '서버와의 통신 중 오류가 발생했습니다.',
                        returnFocus: false
                    });
                }
            });
        }

        function verifyCode() {
            var email = $("#email").val();
            var code = $("#verificationCode").val();
            
            $.ajax({
                type: "POST",
                url: "/member/verifyCode.do",
                data: {
                    email: email,
                    code: code
                },
                success: function(response) {
                    if (response.status) {
                        // 인증 성공 시 세션에 이메일 저장
                        sessionStorage.setItem("userEmail", email);
                        
                        // 비밀번호 변경 페이지로 이동
                        window.location.href = '/member/changePassword.do';
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: '오류',
                            text: response.error,
                            returnFocus: false
                        });
                    }
                },
                error: function() {
                    Swal.fire({
                        icon: 'error',
                        title: '서버 오류',
                        text: '서버와의 통신 중 오류가 발생했습니다.',
                        returnFocus: false
                    });
                }
            });
        }
        
    </script>
</head>
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <div class="sub">
            <h3 class="sub_title">비밀번호 찾기</h3>
            <div class="box">
                <fieldset class="id_search_form">
                    <form id="idsearchForm" name="idsearchForm" onsubmit="return validateForm();">
                        <ul>
                            <li><input type="text" id="email" name="email" placeholder="이메일" value="${MemberVO.email != null ? MemberVO.email : ''}"></li>
                        </ul>
                        <div class="search_btn">
                            <button type="button" id="emailVerificationButton" onclick="sendEmailVerification()">이메일 인증 요청</button>
                        </div>
                        <div id="verificationCodeArea" style="display: none;">
                            <label for="verificationCode">인증 코드:</label>
                            <input type="text" id="verificationCode" name="verificationCode" required>
                            <button id="verify_button" type="button" onclick="verifyCode()">인증 확인</button>
                        </div>
                        <div id="result"></div>
                    </form>
                </fieldset>
            </div>
        </div>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body>
</html>
