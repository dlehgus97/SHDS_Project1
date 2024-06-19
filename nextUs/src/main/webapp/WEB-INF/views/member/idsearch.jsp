<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>아이디 찾기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/reset.css"/>
    <link rel="stylesheet" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="/resources/css/contents.css"/>
    <link rel="stylesheet" href="/resources/css/header.css"/>
    <link rel="stylesheet" href="/resources/css/footer.css"/>
    <style>
        .sub {
            max-width: 600px; /* 디자인에 맞게 최대 너비를 조정하세요 */
            margin: 0 auto;   /* 이 설정은 .sub 섹션을 수평으로 가운데 정렬합니다 */
            text-align: center; /* .sub 내부의 텍스트를 가운데 정렬합니다 */
        }

        .sub_title {
            text-align: center; /* 제목을 왼쪽으로 정렬합니다 */
        }

        .box {
            text-align: center; /* 상자 내용을 왼쪽으로 정렬합니다 */
        }

        .id_search_form {
            text-align: center; /* 폼 요소들을 왼쪽으로 정렬합니다 */
        }
    </style>
    <script>
        function validateForm() {
            const name = document.getElementById("name").value;
            const birthday = document.getElementById("birthday").value;
            const hp = document.getElementById("hp").value;
            
            const nameRegex = /^[가-힣a-zA-Z]+$/; // 이름: 한글 또는 영문자
            const birthdayRegex = /^\d{4}-\d{2}-\d{2}$/; // 생일: YYYY-MM-DD 형식
            const hpRegex = /^01[016789]-\d{3,4}-\d{4}$/; // 전화번호: 010-1234-5678 형식

            if (!nameRegex.test(name)) {
                alert("잘못된 이름 형식입니다.");
                return false;
            }
            if (!birthdayRegex.test(birthday)) {
                alert("잘못된 생일 형식입니다. YYYY-MM-DD 형식으로 입력해주세요.");
                return false;
            }
            if (!hpRegex.test(hp)) {
                alert("잘못된 전화번호 형식입니다. 010-1234-5678 형식으로 입력해주세요.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <div class="sub">
            <h3 class="sub_title">아이디 찾기</h3>
            <div class="box">
                <fieldset class="id_search_form">
                    <form action="/member/findid.do" method="post" id="idsearchForm" name="idsearchForm" onsubmit="return validateForm();">
                        <ul>
                            <li><input type="text" id="name" name="name" placeholder="이름" value="${MemberVO.name != null ? MemberVO.name : ''}"></li>
                            <li><input type="text" id="birthday" name="birthday" placeholder="생일 (YYYY-MM-DD)" value="${MemberVO.birthday != null ? MemberVO.birthday : ''}"></li>
                            <li><input type="text" id="hp" name="hp" placeholder="전화번호" value="${MemberVO.hp != null ? MemberVO.hp : ''}"></li>
                        </ul>
                        <div class="search_btn"><input type="submit" value="찾기" alt="찾기" /></div>
                    </form>
                </fieldset>
            </div>
        </div>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body>
</html>
