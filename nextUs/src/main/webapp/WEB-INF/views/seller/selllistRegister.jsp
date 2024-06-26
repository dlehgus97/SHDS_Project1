<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>판매글 등록하기 | NEXt Us</title>
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
	<style>
	    .option-row {
	        margin-bottom: 10px;
	        display: flex;
	        align-items: center;
	    }
	    .option-label {
	        display: inline-block;
	        width: 80px;
	        font-weight: bold;
	        color: #333;
	    }
	    .option-input {
	        margin-right: 10px;
	        padding: 5px;
	        border: 1px solid #ccc;
	        border-radius: 4px;
	        width: calc(50% - 20px);
	    }
	    .option-input[type="text"] {
	        width: 30%;
	    }
	    .option-input[type="number"] {
	        width: 20%;
	    }
	</style>
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
    <div class="wrap">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">판매글 등록</h3>
    
                <div class="bbs">
                <form method="post" name="frm" id="frm" action="${pageContext.request.contextPath}/selllistRegister" enctype="multipart/form-data" >
                    <table class="board_write">
                        <tbody>
                        <tr>
                            <th>제품명</th>
                            <td>
                                <input type="text" name="title" id="title" class="wid100" value="" placeholder="제목을 입력하세요."/>
                            </td>
                        </tr>
						<tr>
                            <th>카테고리</th>
                            <td>
                                <form>
							        <label for="mainCategory">대분류 카테고리</label>
							        <select id="mainCategory" onchange="updateSubCategory()">
							            <option value="">선택하세요</option>
							        </select>
							        
							        <label for="subCategory">소분류 카테고리</label>
							        <select id="subCategory" name="categoryno">
							            <option value="">선택하세요</option>
							        </select>
							    </form>
                            </td>
                        </tr>
						<tr>
                            <th>옵션</th>
                            <td>
								<div class="option-row">
						            <label class="option-label" for="bronze-description">BRONZE</label>
						            <input type="text" id="bronze-description" class="option-input" placeholder="설명을 입력하세요." name="bronzecontent">
						            <input type="number" id="bronze-price" class="option-input" placeholder="가격을 입력하세요." name="bronzeprice" step=1000>
						        </div>
						        <div class="option-row">
						            <label class="option-label" for="silver-description">SILVER</label>
						            <input type="text" id="silver-description" class="option-input" placeholder="설명을 입력하세요." name="silvercontent">
						            <input type="number" id="silver-price" class="option-input" placeholder="가격을 입력하세요." name="silverprice" step=1000>
						        </div>
						        <div class="option-row">
						            <label class="option-label" for="gold-description">GOLD</label>
						            <input type="text" id="gold-description" class="option-input" placeholder="설명을 입력하세요." name="goldcontent">
						            <input type="number" id="gold-price" class="option-input" placeholder="가격을 입력하세요." name="goldprice" step=1000>
						        </div>
                            </td>
                        </tr>
                        <tr>
                        	<th>썸네일</th>
                        	<td>
								<div class="form-group" style="position: relative; display: inline-block;">
                                    <label class="form-label" for="thumbnail">
                                    </label>
                                    
                                    <!-- Image -->
                                    <!--<img id="thumbnailImage" class="card-img-top" src="/resources/imgs/default_thumbnail.png" alt="..."
                                         style="width: 300px; height: 300px; object-fit: cover; display: block; margin-top: 10px;">
                                    
                                    <!-- Delete Button -->
                                    <!-- <button id="deleteButton" type="button" style="position: absolute; top: 60px; right: 40px; background: black; color: white; border: none; border-radius: 50%; width: 30px; height: 30px; display: none; cursor: pointer;">X</button>
                                	-->
                                    <input class="form-control form-control-sm" type="file" name="file" id="file" style="margin-top: 5px; width: 300px; height: 30px;"/>
                                </div>
                        	</td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content" id="content" style="width:100%;"></textarea>
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
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
	<script>
        document.getElementById('file').addEventListener('change', function(e){
            const file = e.target.files[0];
            const reader = new FileReader();
            reader.onload = function(e){
                document.getElementById('thumbnailImage').src = e.target.result;
            };
            reader.readAsDataURL(file);
        });
        
     // 카테고리 데이터
        const categories = [
            { categoryno: 1, categoryname: "웹", nested: null },
            { categoryno: 2, categoryname: "모바일", nested: null },
            { categoryno: 3, categoryname: "인공지능", nested: null },
            { categoryno: 4, categoryname: "기타", nested: null },
            { categoryno: 5, categoryname: "홈페이지", nested: 1 },
            { categoryno: 6, categoryname: "UI, 퍼블리싱", nested: 1 },
            { categoryno: 7, categoryname: "검색최적화", nested: 1 },
            { categoryno: 8, categoryname: "애널리틱스", nested: 1 },
            { categoryno: 9, categoryname: "안드로이드", nested: 2 },
            { categoryno: 10, categoryname: "iOS", nested: 2 },
            { categoryno: 11, categoryname: "기타", nested: 2 },
            { categoryno: 12, categoryname: "생성형 AI", nested: 3 },
            { categoryno: 13, categoryname: "머신러닝, 딥러닝", nested: 3 },
            { categoryno: 14, categoryname: "보안", nested: 4 },
            { categoryno: 15, categoryname: "QA", nested: 4 },
            { categoryno: 16, categoryname: "기술지원", nested: 4 },
            { categoryno: 17, categoryname: "파일변환", nested: 4 }
        ];

        // 대분류 카테고리 선택 옵션 추가
        const mainCategorySelect = document.getElementById('mainCategory');
        const subCategorySelect = document.getElementById('subCategory');
        
        function populateMainCategory() {
            categories.filter(cat => cat.nested === null).forEach(cat => {
                const option = document.createElement('option');
                option.value = cat.categoryno;
                option.textContent = cat.categoryname;
                mainCategorySelect.appendChild(option);
            });
        }

        // 소분류 카테고리 업데이트
        function updateSubCategory() {
            const selectedMainCategory = mainCategorySelect.value;
            subCategorySelect.innerHTML = '<option value="">선택하세요</option>';

            if (selectedMainCategory) {
                categories.filter(cat => cat.nested == selectedMainCategory).forEach(cat => {
                    const option = document.createElement('option');
                    option.value = cat.categoryno;
                    option.textContent = cat.categoryname;
                    subCategorySelect.appendChild(option);
                });
            }
        }

        // 초기화
        populateMainCategory();
    </script>
</body> 
</html>