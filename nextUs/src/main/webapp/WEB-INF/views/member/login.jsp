<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>로그인 | NEXt Us</title>
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
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <style>
        .social-group {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
        }
        .social-group img {
            height: 60px;
        }
    </style>
    <script>         
        $(document).ready(function() {
            // 페이지 로드 시, 쿠키에 저장된 아이디가 있는지 확인하여 입력 필드에 넣기
            var savedEmail = getCookie("savedEmail");
            if (savedEmail !== "") {
                $("#email").val(savedEmail);
                $("#reg1").prop("checked", true); // 체크박스 체크 상태로 만들기
            }

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
                // 아이디 저장 체크박스 확인 후 쿠키에 저장
                if ($("#reg1").is(":checked")) {
                    var email = $("#email").val();
                    setCookie("savedEmail", email, 30); // 쿠키 유효기간을 30일로 설정
                } else {
                    deleteCookie("savedEmail"); // 체크 해제 시 쿠키 삭제
                }
                saveEmail();
                return true;
            });

            // 네이버 로그인 초기화
            var naverLogin = new naver.LoginWithNaverId({
                clientId: "WIEqlNA2CqPh2z9TwTTs",
                callbackUrl: "http://13.125.219.9:8090/member/callback",
                isPopup: false, /* 팝업을 통한 연동처리 여부 */
                loginButton: {color: "green", type: 3, height: 60}
            });

            naverLogin.init(); /* 설정정보를 초기화하고 연동을 준비 */

            function setCookie(name, value, days) {
                var expires = "";
                if (days) {
                    var date = new Date();
                    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                    expires = "; expires=" + date.toUTCString();
                }
                document.cookie = name + "=" + (value || "") + expires + "; path=/";
            }

            function getCookie(name) {
                var nameEQ = name + "=";
                var ca = document.cookie.split(';');
                for (var i = 0; i < ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) === ' ') c = c.substring(1, c.length);
                    if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
                }
                return "";
            }

            function deleteCookie(name) {
                document.cookie = name + '=; Max-Age=-99999999;';
            }
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
                                <!-- 카카오톡 간편로그인 -->
                                <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=2acf526c8960600ac4bb86eac6ea31ab&redirect_uri=http://13.125.219.9:8090/member/kakaocallback&response_type=code">
                                    <img src="/resources/imgs/icons/kakao_login_medium_narrow.png" alt="카카오 로그인">
                                </a>
                                <!-- 네이버 간편로그인 -->
                                <a id="naverIdLogin" class="social-login">
                                    <img src="https://static.nid.naver.com/oauth/big_g.PNG" alt="네이버 로그인" class="social-icon">
                                </a>
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
