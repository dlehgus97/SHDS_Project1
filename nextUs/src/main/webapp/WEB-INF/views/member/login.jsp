<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>로그인</title>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/reset.css"/>
    <link rel="stylesheet" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="/resources/css/contents.css"/>
    <link rel="stylesheet" href="/resources/css/header.css"/>
    <link rel="stylesheet" href="/resources/css/footer.css"/>

    <script>         
        $(document).ready(function() {
            $("#board1").submit(function() {
                if ($("#email").val() == '') {
                    alert("이메일을 입력해 주세요");
                    $("#email").focus();
                    return false;
                }
                if ($("#pwd").val() == '') {
                    alert("비밀번호를 입력해 주세요");
                    $("#pwd").focus();
                    return false;
                }
                saveEmail();
                return true;
            });

            var naverLogin = new naver.LoginWithNaverId({
                clientId: "qNDkrOO7CvCTWUbSRCJS",
                callbackUrl: "http://localhost:8090/member/callback",
                isPopup: false,
                loginButton: {color: "green", type: 3, height: 60}
            });
            naverLogin.init();

            naverLogin.getLoginStatus(function(status) {
                if (status) {
                    var email = naverLogin.user.getEmail();
                    console.log("email: " + email);
                    // 서버로 email을 전송하는 코드를 추가합니다.
                } else {
                    console.log("AccessToken이 유효하지 않습니다.");
                }
            });
        });
    </script>
    
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head> 
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <form action="login.do" method="post" id="board1" name="board1">
            <!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">로그인</h3>
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="email" name="email" placeholder="이메일"></li>
                                    <li><input type="password" id="pwd" name="pwd" placeholder="비밀번호"></li>
                                    <li><label><input type="checkbox" name="reg1" id="reg1"/> 아이디저장</label></li>
                                </ul>
                                <div class="login_btn"><input type="submit" value="로그인" alt="로그인" /></div>
                                <div id="naverIdLogin"></div>
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="regist.do" class="btn">회원가입</a> 
                                    <a href="search.do" class="btn">이메일/비밀번호 찾기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body> 
</html>
