<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- top Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark $purple-100 static-top">
	<div class="container">
		<a class="navbar-brand" href="#"> <img src="${pageContext.request.contextPath}/assets/images/logo/logo_b.png" alt="..." height="36" />
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">

			<c:choose>
				<c:when test="${empty member.memberId}">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item"><a class="nav-link active" aria-current="page" href="#" style="color: black;">동호회</a></li>
						<li class="nav-item"><a class="nav-link" href="#" style="color: black;">마이다이어리</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/loginForm" style="color: black;"> 로그인 / 회원가입</a>
						</li>
					</ul>
				</c:when>
				<c:when test="${!empty member.memberId}">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" id="clubId" style="color: black;"> 동호회</a>
							<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown" id="clubList">

							</ul>
						</li>
						<li class="nav-item"><a class="nav-link" href="#" style="color: black;">마이다이어리</a></li>
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: black;"> ${member.memberId}</a>
							<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">알람확인</a></li>
								<li><a class="dropdown-item" href="#">정보수정</a></li>
								<li><hr class="dropdown-divider" /></li>
								<li><a class="dropdown-item" href="#">로그아웃</a></li>
							</ul>
						</li>
					</ul>
				</c:when>
			</c:choose>
		</div>
	</div>
</nav>
<!-- // top Navigation -->

 <script>
    // 클릭 이벤트 처리
    $(document).on('click', '#navbarDropdown', function () {
    	 $('#clubList').empty();
    	
        // AJAX 요청 보내기
        var memberId = '${member.memberId}';
        console.log('memberId:', memberId);

        $.ajax({
            type: 'POST', // 또는 'GET'에 맞게 설정
            url: '${pageContext.request.contextPath}/main/clubList', // 서버 측의 엔드포인트 주소
            data: {
                memberId: memberId, // 클라이언트에서 서버로 넘길 변수
            },
            success: function (jsonResult) {
                var list = jsonResult.data; // 변경: clubList -> list
                console.log(list);
                for (var i = 0; i < list.length; i++) { // 변경: clubList -> list
                    var name = list[i].clubName; // 변경: club.name -> list[i].clubName    
                    var clubId = list[i].clubId; 
                    $('#clubList').append('<li><a class="dropdown-item" href="${pageContext.request.contextPath}/club/main/'+clubId+'">' + name + '</a></li>'); // 변경: $dt -> #clubList
                }
            },
            error: function (error) {
                // AJAX 에러 시 실행되는 코드
                console.error('Error:', error);
            }
        });
    });
</script>
