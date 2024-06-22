<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<!-- 헤더푸터 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">

<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/contents.css" />
<!--부트스트랩 Libs CSS -->
<link rel="stylesheet" href="/resources/css/board/libs.bundle.css" />
<!--부트스트랩 Theme CSS -->
<link rel="stylesheet" href="/resources/css/board/theme.bundle.css" />
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
    <%@ include file="/WEB-INF/views/include/header.jsp"%>
    
    <!-- BREADCRUMB -->
    <nav class="py-5">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Breadcrumb -->
            <ol class="breadcrumb mb-0 fs-xs text-gray-400">
              <li class="breadcrumb-item">
                <a class="text-gray-400" href="index.html">Home</a>
              </li>
              <li class="breadcrumb-item active">
                회원 탈퇴
              </li>
            </ol>

          </div>
        </div>
      </div>
    </nav>

    <!-- CONTENT -->
    <section class="pt-7 pb-12">
      <div class="container">
        <div class="row">
          <div class="col-12 col-md-3">

            <!-- Nav -->
            <nav class="mb-10 mb-md-0">
              <div class="list-group list-group-sm list-group-strong list-group-flush-x">
                <a class="list-group-item list-group-item-action dropend-toggle" href="orderlist.do">
                  주문 내역
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle" href="wishlist.do">
                  찜 목록
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle" href="pinfo.do">
                  내 정보 수정
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle" href="asklist.do">
                  문의 내역
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle active" href="withdrawal.do">
                  회원 탈퇴
                </a>
              </div>
            </nav>

          </div>

          <div class="col-12 col-md-9">
            <div class="row justify-content-center">

              <div class="col-12 col-md-6">

                <!-- Heading -->
                <h3 class="mb-4 text-center">회원 탈퇴</h3>

                <!-- 탈퇴 폼 -->
                <form id="withdrawalForm" action="/mypage/withdrawal.do" method="post">
                  <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
                  </div>
                  <button type="button" class="btn btn-danger btn-block mt-4" onclick="confirmWithdrawal()">탈퇴하기</button>
                </form>

                <!-- Confirm Modal -->
                <div id="confirmModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="confirmModalLabel">회원 탈퇴 확인</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        정말로 회원 탈퇴하시겠습니까?
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-danger" onclick="withdrawal()">확인</button>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    <!--부트스트랩 JAVASCRIPT -->
    <!-- Vendor JS -->
    <script src="/resources/js/board/vendor.bundle.js"></script>
    <!-- Theme JS -->
    <script src="/resources/js/board/theme.bundle.js"></script>
    
    <script type="text/javascript">
      function confirmWithdrawal() {
        $('#confirmModal').modal('show');
      }

      function withdrawal() {
        $('#withdrawalForm').submit();
      }
    </script>

</body>
</html>
