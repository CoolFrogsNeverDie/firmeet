<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>퍼밋에 오신것을 환영합니다.</title>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.min.css"> --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/assets/css/index.css" rel="stylesheet" type="text/css" />
<!--모달-->


</head>

<body>
	<!-- 상단 내비게이션 바 -->
	<div class="ly-head-container">
		<header>
			<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>
		</header>
	</div>

	<!-- // 상단 내비게이션 바 -->
	<div style="position: fixed; z-index: -99; width: 100%; height: 100%">
	
      <video muted autoplay loop style="width: 100%;">
        <source src="${pageContext.request.contextPath}/assets/video/indexback2.mp4" type="video/mp4">
        <strong>Your browser does not support the video tag.</strong>
      </video>
	
	</div>

	<!-- 중간 콘텐츠 -->
	<div class="ly-body-container ">
	
		<div class="main">
			<div class="main-content">
				<div class="diary-area" data-memid="${member.memberId}" data-clubid="${club.clubId}">
					<div class="diary-body">
						<div class= "search-board"> 
							<input type = "text" id = "search-keyword" value = "${keyword}" placeholder ="어떤 모임을 원하세요?">
							<button type ="button" class="board-search-btn"><img src = "${pageContext.request.contextPath}/assets/images/icon/search.png"></button>
						</div>	
						<div class="index-comment" style="-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none">
							<div style="height: 180px;">
								<h1 class="h1-1">First </h1><span>Meet,</span>
							</div>
							<div>
								<h1 class="h1-2">Perfect</h1><span>Meet</span>
							</div>
						</div>
					</div>
				</div>
				<!--/diary-area-->
			</div>
			<!-- //main-content -->
		</div>
		<!-- container -->
	</div>
	<!-- //중간 콘텐츠 -->
</body>
</html>
