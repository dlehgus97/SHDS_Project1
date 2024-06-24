<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<link rel="stylesheet" href="../resources/css/admin/memberStatus.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">

<style>
    .form-container {
        max-width: 600px;
        margin: auto;
        padding: 20px;
        background: #f4f4f4;
        border-radius: 8px;
    }
    
    .form-group {
        margin-bottom: 15px;
    }
    
    .form-group label {
        display: block;
        font-weight: bold;
    }
    
    .form-group input, .form-group textarea {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    
    .form-group textarea {
        height: 150px;
        resize: none;
    }
    
   .buttons{
   display:flex;
   gap:50px;
   
   }
   .mybutton{
   	width:500px;
   	height:45px;
   }
</style>
</head>
<body>


	<div class="page-container">
		<%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
		<div class="main-content" style="background-color: #f0fffe;">
			<%@ include file="/WEB-INF/views/admin/adminHeader.jsp"%>

			<div class="main-content-inner">
				<div class="row">
					<div class="col-12 mt-5">
						<div class="card">
							<div class="card-body">
									<h1 class="header-title" style="font-size: 35px">공지사항 작성</h1>
									<form action="insertnotice.do" method="post">
										<div class="form-group">
											<h4>제목</h4>
											<input type="text" id="title"
												name="title" style="margin-left:0px;" required>
										</div>
										<div class="form-group">
											<h4>내용</h4>
											<textarea id="content" style="height:420px;" name="content" required></textarea>
										</div>
										<div class="form-group buttons" >
											<button class="btn btn-success btn-lg btn-block mybutton"type="submit" style="margin-top:9px;">등록</button>
											<button onclick="goBack()" class="btn btn-secondary btn-lg btn-block mybutton">취소</button>
										</div>
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>

		</div>
		<%@ include file="/WEB-INF/views/admin/adminFooter.jsp"%>
	</div>
<script>
        function goBack() {
            history.back();
        }
    </script>

	<!-- bootstrap -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
</body>
</html>