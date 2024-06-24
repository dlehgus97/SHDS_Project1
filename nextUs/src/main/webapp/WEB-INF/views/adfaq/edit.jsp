<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
<meta charset="utf-8">
<title>FAQ</title>
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">

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
    function goSave() {
    	oEditors.getById['content'].exec('UPDATE_CONTENTS_FIELD',[]);
    	$("#frm").submit();
    }
    </script>
</head> 
<body>
<div id="preloader">
        <div class="loader"></div>
    </div>
	<div class="page-container">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<div class="main-content" style="background-color:#f0fffe;">
				<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>
				
				
                <div class="main-content-inner">
				<div class="row">
					<div class="col-12 mt-5">
						<div class="card">
							<div class="card-body">
							<h1 class="header-title" style="font-size: 35px">FAQ 수정</h1>
    
                <div class="bbs">
                <form method="post" name="frm" id="frm" action="update.do" enctype="multipart/form-data" >
                <input type="hidden" name="no" value="${vo.no}">
                    <table class="board_write">
                        <tbody>
                        <tr>
                            <th>질문</th>
                            <td>
                                <input type="text" name="question" id="title" class="wid100" value="${vo.question }"/>
                            </td>
                        </tr>
                        <tr>
                            <th>답변</th>
                            <td>
                                <textarea name="answer" id="content" style="width:100%;">${vo.answer }</textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btnSet"  style="text-align:right;">
                        <a class="btn" href="javascript:goSave();">저장 </a>
                    </div>
                    </form>
                </div>
            </div>
        </div>
		 </div> </div> </div> </div> 
            <%@ include file="/WEB-INF/views/admin/adminFooter.jsp"%>
        </div>
		
    
<!-- alertdesign -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>  
 
<!-- bootstrap -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script> 
    
    
</body> 
</html>