<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
						aria-current="page" href="#" style="color: black;">동호회</a></li>
					<li class="nav-item"><a class="nav-link" href="#" style="color: black;">마이다이어리</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: black;">	
						로그인 / 회원가입</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">알람확인</a></li>
							<li><a class="dropdown-item" href="#">정보수정</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#">로그아웃</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- // top Navigation -->