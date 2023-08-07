<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>개인 게시판</title>
    <c:import url="/WEB-INF/views/include/topnav.jsp"></c:import>
    <link href="${pageContext.request.contextPath}/assets/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/noticestyle.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/color_code/color${club.colorType}.css" rel="stylesheet" type="text/css" /> 
 <script>
 
 	/*메뉴바 스크립트용 JS*/
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
                    $('#clubList').append('<li><a class="dropdown-item" href="${pageContext.request.contextPath}/club/main/'+clubId+'">' + name + '</a></li>'); 
                }
            },
            error: function (error) {
                // AJAX 에러 시 실행되는 코드
                console.error('Error:', error)
            }
        });
    });
</script>

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
				<div class="diary-area" data-memid = "${member.memberId}" data-clubid ="${club.clubId}">
					<div class="diary-topbar">
						<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/clubimg/${club.img2}" alt="프로필사진" />
						<h2>${club.clubName}</h2>
						
						<form name="form1" method="post" action="${pageContext.request.contextPath }/${club.clubId }/notice/noticelist">
						  	<div class= "search-board"> 
								<input name="keyword" id="search-keyword" value="${map.keyword }" placeholder="검색어를 입력하세요">
								<button type ="submit" class="board-search-btn"><img src = "${pageContext.request.contextPath}/assets/images/icon/search.png"></button>
						  	</div>
		  				</form>
					</div>		
					<!-- //diary-topbar -->
					
					<div class="diary-body">					
						<!-- 개인별코딩 ---------------------------------------------------------------->
						<div>
        					<button type="button" id="noticewrite" class="ct-color">글쓰기</button>
        				</div>	
						<div id="list_body">
							<table class="list_table" border="1">
								<tr>
									<th>번호</th>
									<th>작성자</th>
									<th>제목</th>
									<th>등록일</th>
									<th>조회수</th>
								</tr>
								<c:forEach var="row" items="${nlist }">
									<c:if test="${sessionScope.clubId == row.clubId }">
										<tr id="scroll" class="list-item">
											<td>${row.aboardNo }/${row.voteYV}/${row.voteNo}
											</td>
											<td>${row.memberId }</td>
											<c:choose>
												<c:when test="${row.aboardVal == 1 }">
													<%-- <td><a href="${pageContext.request.contextPath }/${clubId }/notice/editlist?aboardNo=${row.aboardNo}&memberId=${member.memberId}">${row.title }</a></td> --%>
													<td><a href="${pageContext.request.contextPath }/${clubId }/notice/voteResult/${row.aboardNo}?voteNo=${row.voteNo}&aboardNo=${row.aboardNo}&memberId=${member.memberId}">${row.title }</a></td>
												</c:when>
												<c:when test="${row.aboardVal == 2 }">
													<td><a href="${pageContext.request.contextPath }/${clubId }/notice/editlistgroup?aboardNo=${row.aboardNo}">
														<c:if test="${row.paycount == row.maxPerson }">
															[자동등록]${row.title }
														</c:if>
														<c:if test="${row.paycount < row.maxPerson }">
															${row.title }
														</c:if>
													</a></td>
												</c:when>
												<c:when test="${row.aboardVal == 3 }">
													<td><a href="${pageContext.request.contextPath }/${clubId }/notice/editlistgroupG?aboardNo=${row.aboardNo}">${row.title }</a></td>
												</c:when>
												<c:when test="${row.aboardVal == 4 }">
													<td><a href="${pageContext.request.contextPath }/${clubId }/notice/noticeVoteViewR?aboardNo=${row.aboardNo}">[자동등록]${row.title }</a></td>
												</c:when>
											</c:choose>
											<td>${row.aboardDate }</td>
											<td>${row.aboardHit }</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
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

$(document).ready(function() {
	
	$('#noticewrite').click(function() {
		  window.location.href = '${pageContext.request.contextPath }/${clubId }/notice/noticeEditGeneral'	
	});
});
	
function loadMoreItems() {
  // 여기에서 서버에서 데이터를 가져오는 API 요청을 수행하거나 미리 준비한 항목들을 추가합니다.
  // 이 예제에서는 미리 준비한 항목을 추가합니다.
  for (let i = 1; i <= 5; i++) {
    $("#list-container").append('<tr id="scroll" class="list-item">');
    $("#list-container").append('<td>${row.aboardNo }</td>');
    $("#list-container").append('<td>${row.memberId }</td>');
    $("#list-container").append('<td><a href="${pageContext.request.contextPath }/${clubId }/notice/editlist?aboardNo=${row.aboardNo}">${row.title }</a></td>');
    $("#list-container").append('<td>${row.aboardDate }</td>');
    $("#list-container").append('<td>${row.aboardHit }</td>');
    $("#list-container").append('</tr>');
  }
}

</script>

</html>
