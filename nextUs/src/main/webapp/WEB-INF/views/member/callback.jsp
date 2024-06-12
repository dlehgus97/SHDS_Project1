<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
 
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
    var naverLogin = new naver.LoginWithNaverId({
        clientId: "qNDkrOO7CvCTWUbSRCJS", // 본인걸로 수정, 띄어쓰기 금지.
        callbackUrl: "http://localhost:8090/index.do", // 아무거나 설정
        isPopup: false,
        callbackHandle: true
    });
    naverLogin.init();
 
    window.addEventListener('load', function () {
        naverLogin.getLoginStatus(function (status) {
            if (status) {
                var age = naverLogin.user.getAge();
                var birthday = naverLogin.user.getBirthday();
                var email = naverLogin.user.getEmail();
                var gender = naverLogin.user.getGender();
                var id = naverLogin.user.getId();
                var name = naverLogin.user.getName();
                var nickName = naverLogin.user.getNickName();
                console.log({'email':email, 'gender':gender, 'id':id, 'name':name, 'nickname':nickName});
                
                $.ajax({
                    type: 'post',
                    url: 'naverLogin', // 로그인 처리 URL
                    data: {'email': email, 'gender': gender, 'id': id, 'name': name, 'nickname': nickName},
                    dataType: 'text',
                    success: function(result) {
                        if(result == 'ok') {
                            console.log('로그인 성공');
                            location.replace("http://localhost:8090/index.do"); // 로그인 성공 시 이동할 페이지
                        } else if(result == 'no') {
                            console.log('로그인 실패 - 회원가입 필요');
                            location.replace("http://localhost:8090/register.do"); // 회원가입 페이지로 이동
                        }
                    },
                    error: function(result) {
                        console.log('오류 발생', result);
                    }
                });
            } else {
                console.log("callback 처리에 실패하였습니다.");
            }
        });
    });
</script>
</body>
</html>
