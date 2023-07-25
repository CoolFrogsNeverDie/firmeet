<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${club.clubName}메인</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/assets/css/imgSlider.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/main2.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/clubMain.css" rel="stylesheet" type="text/css" />
<style>
.side-nav li>a {
	color: black;
	text-decoration: none;
}

.side-nav li:hover {
	background-color: #000000;
}

.side-nav li:hover>a {
	color: white;
}

.carousel-inner {
	position: relative;
	width: 100%;
	overflow: hidden;
	background-color: #222222;
}

.carousel-item {
	position: absolute;
	display: none;
	float: left;
	width: 100%;
	margin-right: -100%;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	transition: transform .6s ease-in-out;
	top: 50%;
	transform: translateY(-50%);
}


</style>
</head>

<body>
	<!-- top Navigation -->
	<%@ include file="../include/nav.jsp"%>

	<div class="wrap">
		<div class="diary-area">
			<div class="diary-topbar">
				<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="프로필사진" />
				<h1>${club.clubName}</h1>
			</div>
			<!--/diary-topbar-img-->
			<div class="diary-subbar">
				<h4>&#127968 &nbsp;&nbsp; 다이어리 메인</h4>
			</div>
			<!--/diary-subbar-->
			<div class="content-area">
				<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="width: 59%; height: 90%; display: inline-block; margin-top: 10px;">
					<div class="carousel-inner" style="height: 100%;">
						<c:forEach var="img" items="${gImgVos}" varStatus="status">
							<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
								<img class="d-block w-100" src="${pageContext.request.contextPath}/assets/images/galleryImg/${img.imgSave}" alt="Slide ${status.index + 1}">
							</div>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
					</button>
				</div>

				<!--/content-left-->
				<div class="content-right">
					<div class="announcement">
						<table>
							<tr>
								<td class="title">[공지] 여과기 보수공사 관련 공지사항</td>
								<td>23–06-01</td>
							</tr>
							<tr>
								<td class="title">[공지] 올림픽스포츠센터 회원 대상 올림픽파..</td>
								<td>23–04-14</td>
							</tr>
							<tr>
								<td class="title">2023 여름방학특강 운영계획</td>
								<td>23–04-14</td>
							</tr>
							<tr>
								<td class="title">주차혼잡 안내문 (6.23~25)</td>
								<td>23–04-14</td>
							</tr>
							<tr>
								<td class="title">2023년 7월 회원등록안내</td>
								<td>23–04-14</td>
							</tr>
						</table>
					</div>
					<div class="calendar"></div>
				</div>
				<!--/content-right-->
			</div>
			<!--/content-area-->
		</div>
		<!--/diary-area-->
		<c:import url="/WEB-INF/views/include/side_nav.jsp"></c:import>
		<!--/wrap-->
</body>

<script src="${pageContext.request.contextPath}/assets/js/imgSlider.js"></script>
<script>
	
</script>
</html>
