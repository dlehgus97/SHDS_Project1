<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인 | NEXt Us</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>
const naverLogin = new naver.LoginWithNaverId({
    clientId: "WIEqlNA2CqPh2z9TwTTs",
    callbackUrl: "http://localhost:8090/member/callback",
    isPopup: false,
    callbackHandle: true
});

naverLogin.init();

window.addEventListener('load', function () {    
    naverLogin.getLoginStatus(function(status) {
        if (status) {
            const email = naverLogin.user.getEmail();
            const name = naverLogin.user.getName();
            
            console.log("Email: ", email);
            console.log("Name: ", name);

            $.ajax({
                type: 'post',
                url: '/member/loginCallback',
                data: {"email": email, "name": name, "loginstate":2},
                dataType: 'text',
                success: function(result) {
                    console.log(result);
                    if (result == '"true"') {
                        location.href = "/index.do"; // 가입된 회원일 경우 메인 페이지로 이동
                    } else if (result == '"false"') {
                        alert('가입되지 않은 회원입니다');
                        location.href = '/member/login.do'; // 가입되지 않은 회원일 경우 회원가입 페이지로 이동
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log('오류 발생');
                    console.log("jqXHR: ", jqXHR);
                    console.log("textStatus: ", textStatus);
                    console.log("errorThrown: ", errorThrown);
                }
            });
        } else {
            alert("네이버 로그인 실패");
        }
    });
});
</script>
</head>
</html>