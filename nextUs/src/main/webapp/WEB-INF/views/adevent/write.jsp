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
	<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
	<link rel="stylesheet" href="/resources/css/reset.css"/>
	<link rel="stylesheet" href="/resources/css/style.css"/>
	<link rel="stylesheet" href="/resources/css/contents.css"/>
    <script src="/smarteditor/js/HuskyEZCreator.js"></script>
	<script>
	var oEditors = [];
	$(function() {
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: oEditors,
	        elPlaceHolder: "content",
	        sSkinURI: "/smarteditor/SmartEditor2Skin.html",    
	        htParams : {
	            bUseToolbar : true,                // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,        // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            fOnBeforeUnload : function(){
	            }
	        }, //boolean
	        fOnAppLoad : function(){
	            //예제 코드
	            //oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	        },
	        fCreator: "createSEditor2"
	    });
	})
	
	function formatDate(dateString) {
	    const date = new Date(dateString);
	    const year = date.getFullYear();
	    const month = String(date.getMonth() + 1).padStart(2, '0');
	    const day = String(date.getDate()).padStart(2, '0');
	
	    return `${year}-${month}-${day}`;
	}
	
	function goSave() {
	    // Get the start date and end date input elements
	    const startDateInput = document.getElementById('start_date');
	    const endDateInput = document.getElementById('end_date');
	
	    // Convert the input date strings to the required format
	    const startDateFormatted = formatDate(startDateInput.value);
	    const endDateFormatted = formatDate(endDateInput.value);
	
	    // Create hidden input elements to store the formatted dates
	    const startFormattedInput = document.createElement('input');
	    startFormattedInput.type = 'hidden';
	    startFormattedInput.name = 'start';
	    startFormattedInput.value = startDateFormatted;
	
	    const endFormattedInput = document.createElement('input');
	    endFormattedInput.type = 'hidden';
	    endFormattedInput.name = 'end';
	    endFormattedInput.value = endDateFormatted;
	
	    // Append the hidden inputs to the form
	    const form = document.getElementById('frm');
	    form.appendChild(startFormattedInput);
	    form.appendChild(endFormattedInput);
	
	    // Update the content field and submit the form
	    oEditors.getById['content'].exec('UPDATE_CONTENTS_FIELD', []);
	    $("#frm").submit();
	}
	
	function goCancel() {
	    if(confirm("작성을 취소하시겠습니까?")) {
	        window.history.back();
	    }
	}
	</script>

</head> 
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">이벤트 등록</h3>
    
                <div class="bbs">
                <form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data" >
                    <table class="board_write">
                        <tbody>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="title" id="title" class="wid100" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <th>시작일</th>
                            <td>
                                <input type="date" name="start" id="start_date" class="wid100" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <th>종료일</th>
                            <td>
                                <input type="date" name="end" id="end_date" class="wid100" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <th>메인 이벤트</th>
                            <td>
                                <input type="checkbox" name="is_main" id="is_main" value="1"/>
                                <label for="main_event">메인 이벤트로 지정</label>
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content" id="content" style="width:100%;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                                <input type="file" name="file" id="file" class="wid100"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btnSet" style="text-align:right;">
					    <a class="btn" href="javascript:goSave();">저장</a>
					    <a class="btn" href="javascript:goCancel();">취소</a>
					</div>
                    </form>
                </div>
            </div>
        </div>
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
</body> 
</html>