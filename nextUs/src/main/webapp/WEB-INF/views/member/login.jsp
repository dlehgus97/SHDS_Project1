<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>로그인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/reset.css"/>
    <link rel="stylesheet" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="/resources/css/contents.css"/>
    <link rel="stylesheet" href="/resources/css/header.css"/>
    <link rel="stylesheet" href="/resources/css/footer.css"/>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    

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
                isPopup: false, /* 팝업을 통한 연동처리 여부 */
                loginButton: {color: "green", type: 3, height: 60}
            });

            naverLogin.init(); /* 설정정보를 초기화하고 연동을 준비 */
        });
    </script>
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
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="regist.do" class="btn">회원가입</a> 
                                    <a href="search.do" class="btn">이메일/비밀번호 찾기</a>
                                </div>
                            </div>
                            <div class="social-group">
                                <div>
                                    <p>간편 로그인</p>
                                    <!-- 카카오톡 간편로그인 -->
                                    <a href="카카오톡_로그인_URL" class="social-login">
                                        <img src="/resources/imgs/icons/kakao_login_medium_narrow.png" alt="카카오톡으로 간편 로그인" class="social-icon">
                                    </a>
                                    <!-- 네이버 간편로그인 -->
                                    <a id="naverIdLogin" class="social-login">
                                        <alt="네이버로 간편 로그인" class="social-icon">
                                    </a>
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
