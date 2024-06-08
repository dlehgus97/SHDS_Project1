<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>회원가입</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/reset.css"/>
    <link rel="stylesheet" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="/resources/css/contents.css"/>
    <script src="/resources/js/script.js"></script>
    <script>
    	var dupCheck = false;
    	function goSave() {
    		if ($("#email").val() == '') {
    			alert('이메일을 입력하세요');
    			$("#email").focus();
    			return;
    		}
    		/*
    		if (!dupCheck) {
    			alert('이메일 중복여부를 체크해주세요');
    			return;
    		}
    		*/
    		var con = true;
    		$.ajax({
				url:'/member/emailCheck.do',
				data : {email:$("#email").val()},
				async : false,
				success : function(res) {
					console.log(res);
					if (res == '1') {
						alert('중복된 이메일입니다.\r\n다른 이메일을 입력해 주세요');
						con = false;
						return;
					}
				}
			});
    		if (!con) return;
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
    			alert('비밀번호는 영문+숫자 조합으로 8자이상 입력하세요');
    			$("#pw").val('');
    			$("#pw_check").val('');
    			return;
    		}
    		if ($("#name").val() == '') {
    			alert('이름을 입력하세요');
    			$("#name").focus();
    			return;
    		}
    		// 전송
    		$("#frm").submit();
    	}
    	$(function() {
    		$("#emailCheck").click(function() {
    			$.ajax({
    				url:'/member/emailCheck.do',
    				data:{email:$('#email').val()},
    				success:function(res) {
    					console.log(res);
						if (res == '0') {
							alert('사용 가능한 이메일입니다.');
						} else {
							alert('중복된 이메일입니다.\r\n다른 이메일을 입력해 주세요');
						}
    				}
    			})
    		})
    	})
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
        <!-- 헤더 위치 -->
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">회원가입</h3>
                <form name="frm" id="frm" action="insert.do" method="post">
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
                                <input type="text" name="email" id="email" class="inNextBtn" style="float:left;">
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
                            <td><input type="text" name="birthday" id="birth" style="float:left;"> </td>
                        </tr>
                        <tr>
                            <th>*휴대폰 번호</th>
                            <td>
                                <input type="text" name="hp" id="hp" value=""  maxlength="15" style="float:left;">
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
		<!-- 푸터 위치 -->
    </div>
</body> 
</html>
