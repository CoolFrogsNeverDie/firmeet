<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>어푸어푸 갤러리</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/assets/css/main2.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/gallery.css" rel="stylesheet" type="text/css" />
<!--모달-->
<style>
.gallery-img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.gallery-area .example-image {
	width: 185px;
	height: 185px;
	margin: 5px;
}
</style>
</head>

<body>
	<!-- top Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark $purple-100 static-top">
		<div class="container">
			<a class="navbar-brand" href="#"> <img src="${pageContext.request.contextPath}/assets/images/logo/logo_b.png" alt="..." height="36" />
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="#">링크</a></li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">드롭다운</a>
						<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
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
	<!-- // 상단 내비게이션 바 -->

	<!-- 페이지 콘텐츠 -->
	<div class="wrap">
		<div class="diary-area">
			<div class="diary-topbar">
				<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="프로필사진" />
				<h1>어푸어푸</h1>
			</div>
			<!--/diary-topbar-img-->
			<div class="diary-subbar">
				<h4>갤러리</h4>
			</div>
			<!--/diary-subbar-->
			<div class="content-area">
				<div class="content-left">
					<dl>
						<dt>
							<span></span>23년 7월
						</dt>
						<dd>- 어푸어푸 수영대회</dd>
						<dd>- 어푸어푸 수영대회</dd>
						<dd>- 어푸어푸 수영대회</dd>
						<dt>
							<span></span>23년 6월
						</dt>
						<dd>- 어푸어푸 수영대회</dd>
						<dd>- 어푸어푸 수영대회</dd>
						<dd>- 어푸어푸 수영대회</dd>
						<dt>
							<span></span>23년 5월
						</dt>
						<dd>- 어푸어푸 수영대회</dd>
						<dd>- 어푸어푸 수영대회</dd>
						<dd>- 어푸어푸 수영대회</dd>
						<dt>
							<span></span>23년 4월
						</dt>
						<dd>- 어푸어푸 수영대회</dd>
						<dd>- 어푸어푸 수영대회</dd>
						<dd>- 어푸어푸 수영대회</dd>
						<dt>
							<span></span>23년 3월
						</dt>
						<dd>- 어푸어푸 수영대회</dd>
						<dd>- 어푸어푸 수영대회</dd>
						<dd>- 어푸어푸 수영대회</dd>
					</dl>
				</div>
				<!--/content-left-->
				<div class="content-right">
					<div class="content-bnt">
						<button id="addButton">사진올리기</button>
					</div>
					<div class="gallery-area">
						<div>
							<a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-3.jpg" data-lightbox="example-set"> <img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-3.jpg" alt="" />
							</a> <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-4.jpg" data-lightbox="example-set"> <img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-4.jpg" alt="" />
							</a> <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-5.jpg" data-lightbox="example-set"> <img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-5.jpg" alt="" />
							</a> <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-6.jpg" data-lightbox="example-set"> <img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-6.jpg" alt="" />
							</a> <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-6.jpg" data-lightbox="example-set"> <img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-6.jpg" alt="" />
							</a> <a class="example-image-link" href="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" data-lightbox="example-set"> <img class="example-image" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="" />
							</a> <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-3.jpg" data-lightbox="example-set"> <img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-3.jpg" alt="" />
							</a> <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-4.jpg" data-lightbox="example-set"> <img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-4.jpg" alt="" />
							</a> <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-5.jpg" data-lightbox="example-set"> <img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-5.jpg" alt="" />
							</a> <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-6.jpg" data-lightbox="example-set"> <img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-6.jpg" alt="" />
							</a> <a class="example-image-link" href="http://lokeshdhakar.com/projects/lightbox2/images/image-6.jpg" data-lightbox="example-set"> <img class="example-image" src="http://lokeshdhakar.com/projects/lightbox2/images/thumb-6.jpg" alt="" />
							</a> <a class="example-image-link" href="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" data-lightbox="example-set"> <img class="example-image" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="" />
							</a>
						</div>
					</div>
					<!--gallery-area-->
				</div>
				<!--/content-right-->
			</div>
			<!--/content-area-->
		</div>
		<!--/diary-area-->
		<div class="menu-bar" name="사이드메뉴바">
			<div class="group-profile">
				<div class="group-profile-img-area">
					<img class="group-profile-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="프로필사진" />
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
</body>
<footer> Copyright (C) 2023 어리쥬 all rights reserved. </footer>
<script src="${pageContext.request.contextPath}/assets/js/lightbox-plus-jquery.min.js"></script>
<script>
	var $target = $("dt"), isClass = null;

	$target.on("click", function() {
		var _$self = $(this), isActive = _$self.hasClass("active");

		_$self.toggleClass("active");
		_$self.nextUntil("dt").slideToggle(!isActive);
	});
</script>
<script>
	$(document)
			.ready(
					function() {
						$("#addButton")
								.click(
										function() {
											var path = window.location.pathname; // 현재 페이지의 경로
											var clubId = path.match(/\d+/)[0]; // 경로에서 숫자 값을 추출
											window.location.href = "${pageContext.request.contextPath}/gallery/uploadForm/" + clubId;
										});
					});
</script>
</html>
