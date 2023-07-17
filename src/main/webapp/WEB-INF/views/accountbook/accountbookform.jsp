<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>어푸어푸 가계부 업로드</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link
	href="${pageContext.request.contextPath}/assets/css/accountbookform.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/main2.css"
	rel="stylesheet" type="text/css" />
<!--모달-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>

<body>
	<!-- top Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark $purple-100 static-top">
		<div class="container">
			<a class="navbar-brand" href="#"> <img
				src="${pageContext.request.contextPath}/assets/images/logo/logo_b.png"
				alt="..." height="36" />
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="#">링크</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">드롭다운</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">액션</a></li>
							<li><a class="dropdown-item" href="#">다른 액션</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#">다른 항목</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- // top Navigation -->

	<div class="wrap">
		<div class="diary-area">
			<div class="diary-topbar">
				<img class="diary-topbar-img"
					src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg"
					alt="프로필사진" />
				<h1>어푸어푸</h1>
			</div>
			<!--/diary-topbar-img-->
			<div class="diary-subbar">
				<h4>가계부 업로드</h4>
			</div>
			<!--/diary-subbar-->
			<div class="content-area">
				<div class="content-left">
					<img id="preview" src="#" alt="미리보기 이미지"
						style="max-width: 100%; max-height: 90%; display: none; margin: 0 auto;">
				</div>
				<!--/content-left-->
				<div class="content-right">
					<form action="${pageContext.request.contextPath}/accountBook/upload"  method="POST" enctype="multipart/form-data">
						<div class="form-group d-flex justify-content-between">
							<label for="expense">지출</label> 
							<input type="radio" id="expense" name="incomeExpense" value="지출" checked>
							<label for="income">수입</label>
							<input type="radio" id="income" name="incomeExpense" value="수입">
						</div>
						<div class="form-group">
							<label for="meetSelect">사용 모임:</label> <select id="meetSelect"
								name="meet" class="form-select">
								<c:forEach var="meet" items="${meetList}" varStatus="status">
									<option value="${meet.meetNo}">${meet.meetName}</option>
								</c:forEach>
							</select>
							<c:forEach var="meet" items="${meetList}" varStatus="status"
								begin="0" end="0">
								<input type="hidden" name="clubId" value="${meet.clubId}">
							</c:forEach>
							<input type="hidden" name="memberId" value="aaa">
						</div>
						<div class="form-group">
							<label for="categorySelect">카테고리:</label> <select
								id="categorySelect" name="category" class="form-select">
								<option value="식비">식비</option>
								<option value="유흥">유흥</option>
								<option value="비품">비품</option>
								<option value="시설">시설</option>
								<option value="이동비">이동비</option>
								<option value="의료">의료</option>
								<option value="기타">기타</option>
								<!-- 셀렉트 박스 옵션 추가 -->
							</select>
						</div>
						<div class="form-group">
							<label for="amountInput">용도:</label> <input type="text"
								id="amountInput" name="purpose" class="form-control">
						</div>
						<div class="form-group">
							<label for="amountInput">금액:</label> <input type="text"
								id="amountInput" name="amount" class="form-control">
						</div>
						<div class="form-group">
                     		<label class="form-text">이미지선택</label> <input id="file" type="file" name="uploadPicture" value="" onchange="previewImage(event)">
                  		</div>
						<button type="submit" class="btn btn-primary">저장</button>
					</form>

				</div>

			</div>
			<!--/content-area-->
		</div>
		<!--/diary-area-->
		<div class="menu-bar" name="사이드메뉴바">
			<div class="group-profile">
				<div class="group-profile-img-area">
					<img class="group-profile-img"
						src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg"
						alt="프로필사진" />
				</div>
				<!--/group-profile-img-area-->
			</div>
			<!--/group-profile-->
			<ul class="side-nav">
				<li>공지사항</li>
				<li>갤러리</li>
				<li>달력</li>
				<li>자유 게시판</li>
				<li>멤버</li>
				<li>가계부</li>
			</ul>
			<!--/side-nav-->
		</div>
		<!--/menu-bar-->
	</div>
	<!--/wrap-->
	<footer> Copyright (C) 2023 어리쥬 all rights reserved. </footer>
</body>
<script>
	function previewImage(event) {
		var reader = new FileReader();
		reader.onload = function() {
			var image = document.getElementById('preview');
			image.src = reader.result;
			image.style.display = 'block';
		}
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
</html>
