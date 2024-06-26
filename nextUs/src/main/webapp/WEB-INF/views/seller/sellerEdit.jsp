<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>셀러 정보 수정 | NEXt Us</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <base href="${pageContext.request.contextPath}/">
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
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .wrap {
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .header, .footer {
            flex-shrink: 0;
        }

        .content {
            display: flex;
            flex-grow: 1;
        }

        .sidebar {
            width: 200px;
            min-width: 200px;
            background-color: #404040;
            color: white;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            min-height: 500px;
        }

        .sidebar a {
            padding: 15px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
        }

        .sidebar a:hover {
            background-color: #575757;
        }

        .main-content {
            margin-left: 150px;
			margin-right: 150px;
            padding: 20px;
            flex-grow: 1;
        }

        .profile-container {
            display: flex;
            align-items: center;
            padding: 20px;
            background-color: #e0e0e0;
            border-radius: 8px;
            max-width: 800px;
            margin: 50px auto;
        }

        .profile-picture {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-right: 20px;
        }

        .store-name {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .product-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
        }

        .product-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: calc(40% - 10px); /* 한 줄에 두 개의 상품 */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        .product-card img {
            width: 100%;
            height: auto;
            max-height: 200px;
            object-fit: cover;
            border-bottom: 1px solid #ddd;
        }

        .product-details {
            padding: 10px;
            text-align: center;
        }

        .product-details h3 {
            font-size: 20px;
            margin: 10px 0;
            color: #333;
        }

        .product-details p {
            font-size: 16px;
            margin: 5px 0;
            color: #666;
        }
		.button-container {
		    margin-top: 10px;
		}


		.edit-form {
        max-width: 600px;
        margin: 20px auto;
        background-color: #ffffff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        padding: 20px;
    	}

	    .edit-form label {
	        font-weight: bold;
	        margin-top: 10px;
	        display: block;
	    }
	
	    .edit-form input[type="text"],
	    .edit-form textarea {
	        width: 100%;
	        padding: 8px;
	        margin-top: 5px;
	        border: 1px solid #ddd;
	        border-radius: 5px;
	        box-sizing: border-box;
	        font-size: 16px;
	    }
	
	    .edit-form textarea {
	        height: 150px;
	        resize: vertical;
	    }
	    .button-container {
	        text-align: center;
	        margin-top: 20px;
	        display: flex;
	       	justify-content: center; /* 가운데 정렬 */
	    }
	
	    .button-container {
            display: flex;
            gap: 10px;
        }

        .btn-submit, .btn-cancel {
            display: inline-block;
            width: 110px;
            height: 36px;
            border-radius: 30px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
            line-height: 36px;
            vertical-align: middle;
        }

        .btn-submit {
            background-color: #343a40; /* 무채색 */
            color: white;
        }

        .btn-submit:hover {
            background-color: #495057; /* 더 어두운 무채색 */
        }

        .btn-cancel {
            background-color: #adb5bd; /* 밝은 무채색 */
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-cancel:hover {
            background-color: #ced4da; /* 더 밝은 무채색 */
        }
	    
	    h1 {
            text-align: center;
            margin: 20px 0;
            color: #555;
        }
        .big-category-container {
        	margin-top: 15px;
        	margin-bottom: 15px;
        }
		.category-container {
            display: flex;
            align-items: center;
        }
        .category-container label {
            margin-right: 10px;
        }
        
        .bank-container {
			display: flex;
            align-items: center;
        }
		.bank-container select {
            margin-right: 20px; /* 원하는 간격으로 조정하세요 */
        }
        
        select {
        	border-radius: 5px; /* 모서리 둥글게 설정 */
        	border: 1px solid #ccc; /* 테두리 설정 */
        }
        
        select:hover {
        	border-color: #777;
        }
        
		#mainCategory1 {
        	min-width: 60px;
        }
        #mainCategory2 {
        	min-width: 60px;
        }
        #subCategory1 {
        	min-width: 125px;
        }
        #subCategory2 {
        	min-width: 125px;
        }        
        
    </style>
</head>
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        
        <div class="content">
            <div class="sidebar">
                <a href="seller/sellerWeeklyMetrics">판매자 주간 지표</a>
                <a href="seller/sellerBuyList">거래 관리</a>
                <a href="seller/selllistManagement">판매글 관리</a>
                <a href="seller/sellerReviews">리뷰 관리</a>
                <a href="seller/sellerEdit">셀러 정보 수정</a>
            </div>
            <div class="main-content">
                <h1>셀러 정보 수정</h1>
			    <form action="/seller/update" method="post">
			        <div class="edit-form">
			    		<label for="info">설명</label>
			            <textarea id="info" name="info">${seller.info}</textarea>
                        <label for="mainCategory1">전문분야 1</label>
                        <div class="category-container">
	                        <select id="mainCategory1" onchange="updateSubCategory('mainCategory1', 'subCategory1')">
	                            <option value="">선택하세요</option>
	                        </select>			
	                        <label for="subCategory1"></label>
	                        <select id="subCategory1" name="category1">
	                            <option value="">선택하세요</option>
	                        </select>
						</div>
                        <label for="mainCategory2">전문분야 2</label>
                        <div class="category-container">		                        
	                        <select id="mainCategory2" onchange="updateSubCategory('mainCategory2', 'subCategory2')">
	                            <option value="">선택하세요</option>
	                        </select>
	                        <label for="subCategory2"></label>
	                        <select id="subCategory2" name="category2">
	                            <option value="">선택하세요</option>
	                        </select>
						</div>
	            
			            <label for="bank">은행</label>
			            <select id="bank" name="bank">
						    <option value="shinhan">신한</option>
						    <option value="kookmin">국민</option>
						    <option value="woori">우리</option>
						</select>
						
			            <label for="account">계좌번호</label>
			            <input type="text" id="account" name="account" value="${seller.account}">

			            <div class="button-container">
			                <button type="submit" class="btn-submit" onclick="return confirmSubmit()">확인</button>
			                <a href="seller/sellerEdit" class="btn-cancel">취소</a>
			            </div>
			        </div>
			    </form>
			</div>

        </div>

        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
<script>
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
	const mainCategorySelect1 = document.getElementById('mainCategory1');
	const subCategorySelect1 = document.getElementById('subCategory1');
	const mainCategorySelect2 = document.getElementById('mainCategory2');
	const subCategorySelect2 = document.getElementById('subCategory2');
	
	function populateMainCategory() {
	    categories.filter(cat => cat.nested === null).forEach(cat => {
	        const option1 = document.createElement('option');
	        option1.value = cat.categoryno;
	        option1.textContent = cat.categoryname;
	        mainCategorySelect1.appendChild(option1);
	
	        const option2 = document.createElement('option');
	        option2.value = cat.categoryno;
	        option2.textContent = cat.categoryname;
	        mainCategorySelect2.appendChild(option2);
	    });
	}
	
	// 소분류 카테고리 업데이트
	function updateSubCategory(mainCategoryId, subCategoryId) {
	    const mainCategorySelect = document.getElementById(mainCategoryId);
	    const subCategorySelect = document.getElementById(subCategoryId);
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
	
	// 매핑 객체 생성
	const bankMapping = {
	    "shinhan": "신한은행",
	    "kookmin": "국민은행",
	    "woori": "국민은행"
	};
	
	// 페이지 로드 시, DB에서 가져온 값을 한국어로 변환 및 카테고리 설정
	window.onload = function() {
	    populateMainCategory();
	
	    // 이전에 저장된 카테고리 값 설정
	    const savedSubCategory1 = "${seller.category1}";
	    const savedMainCategory1 = categories.find(cat => cat.categoryno == savedSubCategory1)?.nested;
	    
	    const savedSubCategory2 = "${seller.category2}";
	    const savedMainCategory2 = categories.find(cat => cat.categoryno == savedSubCategory2)?.nested;
	
	    if (savedMainCategory1 !== undefined) {
	        mainCategorySelect1.value = savedMainCategory1;
	        updateSubCategory('mainCategory1', 'subCategory1');
	        subCategorySelect1.value = savedSubCategory1;
	    }
	
	    if (savedMainCategory2 !== undefined) {
	        mainCategorySelect2.value = savedMainCategory2;
	        updateSubCategory('mainCategory2', 'subCategory2');
	        subCategorySelect2.value = savedSubCategory2;
	    }
	
	    // DB에서 가져온 값을 한국어로 변환
	    const selectedBank = "${seller.bank}";
	    document.getElementById('bank').value = selectedBank;
	};
	
	// 폼이 제출되기 전에 한국어 값을 영어로 변환
	document.querySelector('form').onsubmit = function() {
	    // 카테고리 값 가져오기

	    
	    const bankSelect = document.getElementById('bank');
	    const selectedBankKor = bankSelect.options[bankSelect.selectedIndex].text;
	    
	    for (let key in bankMapping) {
	        if (bankMapping[key] === selectedBankKor) {
	            bankSelect.value = key;
	            break;
	        }
	    }
	};
	
	function confirmSubmit() {
	    if (confirm("정말 수정하시겠습니까?")) {
		    const subCategory1 = document.getElementById('subCategory1').value;
		    const subCategory2 = document.getElementById('subCategory2').value;
		    
		    // 카테고리 값이 같으면 경고 메시지 표시
		    if (subCategory1 === subCategory2) {
		        alert("카테고리를 다르게 설정해주세요.");
		        event.preventDefault(); // 폼 제출 방지
		        return false;
		    }
		    
	        alert("수정되었습니다.");
	        return true;
	    } else {
	        return false;
	    }
	};
</script>
</body>
</html>