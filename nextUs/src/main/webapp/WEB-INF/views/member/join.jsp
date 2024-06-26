<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>회원 가입 | NEXt Us</title>
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
    <script src="/resources/js/script.js"></script>
    <script>
        var dupCheck = false;

        function goSave() {
            var email = $("#email").val();
            var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

            if (email == '') {
                alert('이메일을 입력하세요');
                $("#email").focus();
                return;
            }

            if (!emailRegex.test(email)) {
                alert('이메일 형식이 올바르지 않습니다.');
                $("#email").focus();
                return;
            }

            if ($("#checkEmail").val() != '1') {
                alert('이메일 중복 확인을 해주세요.');
                return;
            }

            if ($("#pw").val() == '') {
                alert('비밀번호를 입력하세요');
                $("#pw").focus();
                return;
            }

            if ($("#pw").val() != $("#pw_check").val()) {
                alert('비밀번호를 확인하세요');
                return;
            }

            var reg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/;
            if ($("#pw").val().match(reg) == null) {
                alert('비밀번호는 영문+숫자 조합으로 8자 이상 입력하세요');
                $("#pw").val('');
                $("#pw_check").val('');
                return;
            }

            if ($("#name").val() == '') {
                alert('이름을 입력하세요');
                $("#name").focus();
                return;
            }
            
            if ($("#nickname").val() == '') {
                alert('닉네임을 입력하세요');
                $("#nickname").focus();
                return;
            }
            
            var birthday = $("#birthday").val();
            if (birthday == '') {
                alert('생년월일을 입력하세요');
                $("#birthday").focus();
                return;
            }
            
            
            if ($("#hp1").val() == '' || $("#hp2").val() == '' || $("#hp3").val() == '') {
                alert('휴대폰 번호를 모두 입력하세요');
                $("#hp1").focus();
                return;
            }
            
            if ($("#zipcode").val() == '') {
                alert('우편번호를 입력하세요');
                $("#zipcode").focus();
                return;
            }
            
            

            var hp1 = $("#hp1").val();
            var hp2 = $("#hp2").val();
            var hp3 = $("#hp3").val();
            var hp = hp1 + '-' + hp2 + '-' + hp3;
			console.log(hp);
            $("#hp").val(hp); // 숨겨진 필드에 전화번호 설정

            $("#frm").submit(); // 폼 제출
        }

        $(function() {
            $("#emailCheck").click(function() {
                var email = $("#email").val();

                // 이메일 형식 검사 정규표현식
                var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

                if (email == '') {
                    alert('이메일을 입력하세요');
                    $("#email").focus();
                    return;
                }

                if (!emailRegex.test(email)) {
                    alert('이메일 형식이 올바르지 않습니다.');
                    $("#email").focus();
                    return;
                }

                $.ajax({
                    url: '/member/emailCheck.do',
                    data: { email: email },
                    success: function(res) {
                        console.log(res);
                        if (res == '0') {
                            alert('사용 가능한 이메일입니다.');
                            $("#checkEmail").val('1');
                        } else {
                            alert('중복된 이메일입니다.\r\n다른 이메일을 입력해 주세요');
                            $("#checkEmail").val('0');
                        }
                    }
                });
            });
        });
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function zipcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                $('#zipcode').val(data.zonecode);
	                $('#addr1').val(roadAddr);
	            }
	        }).open();
	    }
	</script>
</head> 
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">회원가입</h3>
                <form name="frm" id="frm" action="insert.do" method="post">
                
                <input type="hidden" name="hp" id="hp">
                <table class="board_write">
                    <caption>회원가입</caption>
                    <colgroup>
                        <col width="20%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>*이메일</th>
                            <td>
                                <input type="text" name="email" id="email" class="inNextBtn" style="float:left;  height: 31px;">
                                <span class="email_check"><a href="javascript:;"  class="btn bgGray" style="float:left; width:auto; clear:none;" id="emailCheck">중복확인</a></span>
                            </td>
                        </tr>
                        <tr>
                            <th>*비밀번호</th>
                            <td><input type="password" name="pwd" id="pw" style="float:left;"> <span class="ptxt">비밀번호는 숫자, 영문 조합으로 8자 이상으로 입력해주세요.</span> </td>
                        </tr>
                        <tr>
                            <th>*비밀번호<span>확인</span></th>
                            <td><input type="password" name="pw_check" id="pw_check" style="float:left;"></td>
                        </tr>
                        <tr>
                            <th>*이름</th>
                            <td><input type="text" name="name" id="name" style="float:left;"> </td>
                        </tr>
                        <tr>
                            <th>*닉네임</th>
                            <td><input type="text" name="nickname" id="nickname" style="float:left;"> </td>
                        </tr>
                        <tr>
                            <th>*성별</th>
                            <td>
                            <select name="gender" id="gender">
                            <option value="1">남성</option>
                            <option value="2">여성</option>
                            </select> 
                            </td>
                        </tr>
                        <tr>
                            <th>*생년월일</th>
                            <td><input type="Date" name="birthday" id="birthday" style="float:left;"> </td>
                        </tr>
                        <tr>
           					 <th>*휴대폰 번호</th>
            				 <td>
                				<select id="hp1" style="width: 80px; height: 31px;">
                    				<option value="">선택</option>
                    				<option value="010">010</option>
                    				<option value="011">011</option>
                    				<option value="019">019</option>
                    				<option value="016">016</option>
                				</select>
                				<span>-</span>
                				<input type="text" id="hp2" value="" maxlength="4" style="width: 80px;">
                				<span>-</span>
                				<input type="text" id="hp3" value="" maxlength="4" style="width: 80px;">
            				</td>
        				</tr>
                        <tr>
                            <th rowspan="3">*주소</th>
                            <td>
                                <input type="text" name="zipcode" id="zipcode" value=""  maxlength="6" style="float:left;" readonly>
                                <span class="email_check"><a href="javascript:zipcode();"  class="btn bgGray" style="float:left; width:auto; clear:none;">우편번호</a></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" name="addr1" id="addr1" value=""  maxlength="15" style="float:left;" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" name="addr2" id="addr2" value=""  maxlength="15" style="float:left;">
                            </td>
                        </tr>
                    </tbody>
                </table>
                        <input type="hidden" name="cmd" value="write.do"/>
                        <input type="hidden" name="checkEmail" id="checkEmail" value="0"/>
                </form>
                <div class="btnSet clear">
                    <div><a href="javascript:;" class="btn" onclick="goSave();">가입</a> <a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
                </div>
            </div>
        </div>
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body> 
</html>
