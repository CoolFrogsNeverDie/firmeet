<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>어푸어푸 갤러리</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/lightbox.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath }/assets/css/main2.css"
	rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script src="${pageContext.request.contextPath }/assets/js/gallery_upload.js"></script>
<style>
.upload-btn-wrapper {
	position: relative;
	overflow: hidden;
	display: inline-block;
}

.upload-btn {
	border: 2px solid gray;
	color: gray;
	background-color: white;
	padding: 8px 20px;
	border-radius: 8px;
	font-size: 20px;
	font-weight: bold;
	margin-top:10px
}

.upload-btn-wrapper input[type=file] {
	font-size: 100px;
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0;
}

.dropZone {
	width: 500px;
	height: 300px;
	border: 3px solid black;
	box-sizing: border-box; /* 추가 */
}

#fileDragDesc {
	width: 100%;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
	padding: 5px;
	text-align: center;
	line-height: 300px;
	vertical-align: middle;
}

.btn {
	width: 250px;
	height: 60px;
	margin: 10px auto;
	background-color: black;
	color: white;
}
</style>
</head>

<body>
	<!----------------------------------------- top Navigation ----------------------------------------->
	<nav class="navbar navbar-expand-lg navbar-dark $purple-100 static-top">
		<div class="container">
			<a class="navbar-brand" href="#"> <img
				src="${pageContext.request.contextPath}/assets/images/logo/logo_b.png" alt="..."
				height="36" />
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
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							드롭다운 </a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">액션</a></li>
							<li><a class="dropdown-item" href="#">다른 액션</a></li>
							<li>
								<hr class="dropdown-divider" />
							</li>
							<li><a class="dropdown-item" href="#">다른 항목</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!----------------------------------------- // 상단 내비게이션 바 //----------------------------------------->
	<!-- 페이지 콘텐츠 -->

	<div class="wrap">
		<div class="diary-area">
			<div class="diary-topbar">
				<img class="diary-topbar-img"
					src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg"
					alt="프로필사진" />
				<h1>어푸어푸</h1>
			</div>
			<!--/diary-topbar-img-->
			<div class="diary-subbar">
				<h4>다이어리 메인</h4>
			</div>
			<!--/diary-subbar-->
			<div class="content-area">
				<div class="content-right">
					<div class="upload-btn-wrapper">
						<input type="file" id="input_file" multiple="multiple"
							style="height: 100%;" />
						<button class="upload-btn">파일선택</button>
					</div>
					<br />

					<form name="uploadForm" id="uploadForm"
						enctype="multipart/form-data" method="post">
						<div id="img"></div>
						<div id="dropZone" style="border: 2px; border-style: solid; border-color: black; ">
							<div id="fileDragDesc">파일을 드래그 해주세요.</div>
							<table id="fileListTable" width="100%" border="0px">
								<tbody id="fileTableTbody">

								</tbody>
							</table>
						</div>
					</form>
					<input type="button" onclick="uploadFile(); return false;"
						class="btn bg_01" value="파일 업로드">
				</div>
				<!--/content-right-->
			</div>
			<!--/content-area-->
		</div>
		<!--/diary-area-->
		<div class="menu-bar" name="사이드메뉴바">
			<div class="group-profile">
				<div class="group-profile-img-area">
					<img class="group-profile-img"
						src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg"
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
	<footer>
		Copyright (C) 2023 어리쥬
	</footer>
</body>
</html>
