<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>개인 게시판</title>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.min.css"> --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/assets/css/layout.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/manager_page.css" rel="stylesheet" type="text/css" />
<!--모달-->
<style type="text/css">
.color-list {
	display: flex;
}

.color {
	width: 100px;
	height: 100px;
	border-radius: 150px;
	position: relative;
	border: 3px solid #ffffff;
	margin-right: 5px
} 

.sub-color {
	width: 100%;
	height: 50%;
	border-radius: 0px 0px 150px 150PX;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translateX(-50%);
}

/*블랙모드*/
.vintage-beige-pink {
	background-color: #343434;
}
.vintage-beige-pink .sub-color {
	background-color: #ffffff;
}

/*빈티지 베이지 핑크*/
.vintage-beige-pink {
	background-color: #f8ecc9;
}
.vintage-beige-pink .sub-color {
	background-color: #f1bbba;
}

/*초록*/
.green {
	background-color: #f3f6f6;
}
.green .sub-color {
	background-color: #a9cecf;
}

/*핫핑크 블랙*/
.hot-pink-black {
	background-color: #08172a;
}
.hot-pink-black .sub-color {
	background-color: #ed265f;
}

/*무난 핑크와 블랙*/
.pink-and-black {
	background-color: #191919;
}
.pink-and-black .sub-color {
	background-color: #fdc8c8;
}

/*약간 그린끼 도는 엘로우 + 오렌지*/
.greenish-yellow-orange {
	background-color: #ece476;
}
.greenish-yellow-orange .sub-color {
	background-color: #fb903c;
}

/*보라색에 회색끼 살짝 도는 흰색*/
.purple-white {
	background-color: #fafafa;
}
.purple-white .sub-color {
	background-color: #d52b9b;
}

/*사이버펑크*/
.cyberpunk {
	background-color: #1c2966;
}
.cyberpunk .sub-color {
	background-color: #FF0075;
}

</style>
</head>

<body>
	<!-- 상단 내비게이션 바 -->
	<div class="ly-head-container">
		<header>
			<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>
		</header>
	</div>
	<!-- // 상단 내비게이션 바 -->

	<!-- 중간 콘텐츠 -->
	<div class="ly-body-container ">
		<div class="main">
			<div class="main-content">
				<div class="diary-area" data-memid="${member.memberId}" data-clubid="${club.clubId}">


					<div class="diary-topbar">
						<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/clubimg/${club.img2}" alt="프로필사진" />
						<h2>${club.clubName}</h2>


						<div class="search-board">
							<input type="text" id="search-keyword" value="${keyword}" placeholder="검색어를 입력하세요.">
							<button type="button" class="board-search-btn">
								<img src="${pageContext.request.contextPath}/assets/images/icon/search.png">
							</button>
						</div>

					</div>
					<!-- //diary-topbar -->


					<div class="manager-body">
						<!-- 개인별코딩 ---------------------------------------------------------------->
						<div class="topbar">
							<div class="menu-btn-area">
								<a class="ct-color" href="${pageContext.request.contextPath}/management/club/${club.clubId}">가입승인</a> <a class="ct-color" href="${pageContext.request.contextPath}/management/club/editgrade/${club.clubId}">권한설정</a> <a class="ct-color" href="${pageContext.request.contextPath}/management/club/qna/${club.clubId}">문의답변</a> <a class="ct-color" href="${pageContext.request.contextPath}/management/club/edit/${club.clubId}">정보수정</a>
							</div>
						</div>

						<div class="list-area">
							<!-- AJAX로 게시글 그릴 공간 -->
							<div class="color-list" data-main="#f8ecc9" data-sub="#f1bbba" data-bnt="#eb9f9f">
								<div class="color vintage-beige-pink">
									<div class="sub-color"></div>
								</div>
								<!-- //빈티지 베이지 핑크 -->
								<div class="color green" data-main="#f3f6f6" data-sub="#a9cecf" data-bnt="#78a7a8">
									<div class="sub-color"></div>
								</div>
								<!-- //초록이 -->
								<div class="color hot-pink-black" data-main="#08172a" data-sub="#ed265f" data-bnt="#ac1a44">
									<div class="sub-color"></div>
								</div>
								<!-- //핫핑크 블랙 -->
								<div class="color pink-and-black" data-main="#191919" data-sub="#fdc8c8" data-bnt="#ed265f">
									<div class="sub-color"></div>
								</div>
								<!-- //무난 핑크와 블랙 -->
								<div class="color greenish-yellow-orange" data-main="#ece476" data-sub="#fb903c" data-bnt="#ed265f">
									<div class="sub-color"></div>
								</div>
								<!-- //약간 그린끼 도는 엘로우 + 오렌지 -->
								<div class="color purple-white" data-main="#fafafa" data-sub="#d52b9b" data-bnt="#ed265f">
									<div class="sub-color"></div>
								</div>
								<!-- //보라색에 회색끼 살짝 도는 흰색 -->
								<div class="color cyberpunk" data-main="#1c2966" data-sub="#FF0075" data-bnt="#77D970">
									<div class="sub-color"></div>
								</div>
								<!-- //사이버펑크 -->
							</div>
							<!-- //color-list -->
						</div>

						<div id="board-get"></div>
						<!-- 무한 스크롤 감시용 div -->
						<!-- 개인별코딩 ---------------------------------------------------------------->
					</div>

				</div>
				<!--/diary-area-->
			</div>
			<!-- //main-content -->

			<div class="side-menu">
				<c:import url="/WEB-INF/views/include/side_nav_update.jsp"></c:import>
			</div>
		</div>
		<!-- container -->
	</div>
	<!-- //중간 콘텐츠 -->

</body>
    <script>
        // JavaScript로 색상값을 가져오는 부분
        const colorElements = document.querySelectorAll('.color');

        function handleColorHover(event) {
            const colorElement = event.target; // 이벤트가 발생한 .color 요소를 가져옴
            const mainColor = colorElement.dataset.main;
            const subColor = colorElement.dataset.sub;
            const buttonColor = colorElement.dataset.bnt;

            console.log('Main Color:', mainColor); // 출력 예: #f8ecc9
            console.log('Sub Color:', subColor); // 출력 예: #f1bbba
            console.log('Button Color:', buttonColor); // 출력 예: #eb9f9f
            
            $('.ly-body-container').css('background-color',mainColor); // 배경색 수정1
            $('body').css('background-color',mainColor); // 배경색 수정2
            $('body').css('min-height','100vh'); //길이 수정(틀어짐 없게)
            $('.ly-head-container').css('background-color',subColor); //탑바 컬러 지정
            $('.sd-color').css('background-color',subColor); //사이드바의 컬러 지정
            $('.sd-color').css('color','white'); //사이드바의 텍스트 컬러 지정
            $('.sd-color').css('border-left', '10px solid ' + buttonColor + ';'); //사이드바의 그림자 컬러 지정
            $('.ct-border').css('color',buttonColor); //사이드바쪽 관리자 메뉴가는 거
            $('.ct-color').css('background-color',buttonColor); //버튼 컬러
        }

        colorElements.forEach((colorElement) => {
            colorElement.addEventListener('mouseover', handleColorHover);
        });
    </script>
</html>
