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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/clubMain.css" rel="stylesheet" type="text/css" />
    <!--풀 캘린더 CSS-->
  	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/calendar.css" type="text/css" />
  	<link href="${pageContext.request.contextPath}/assets/css/color_code/color${club.colorType}.css" rel="stylesheet" type="text/css" />
  	<!--풀 캘린더 JS-->
  	<script src="${pageContext.request.contextPath }/assets/js/index.global.js"></script>
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
						<img class="diary-topbar-img" src="${pageContext.request.contextPath}/upload/club/${club.img2}" alt="프로필사진" />
						<h2>${club.clubName}</h2>
  						
  						
						<div class= "search-board" style="display: none;"> 
							<input type = "text" id = "search-keyword" value = "${keyword}" placeholder ="검색어를 입력하세요.">
							<button type ="button" class="board-search-btn"><img src = "${pageContext.request.contextPath}/assets/images/icon/search.png"></button>
						</div>						
						
					</div>		
					<!-- //diary-topbar -->
					
					
					<div class="diary-body">					
						<div class="main-content2">
							<div class="content-left">
								<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="width: 100%;">
									<div class="carousel-inner">
										<c:forEach var="img" items="${gImgVos}" varStatus="status">
											<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
												<img class="d-block w-100" src="${pageContext.request.contextPath }/upload/gallery/${img.imgSave}" alt="Slide ${status.index + 1}">
											</div>
										</c:forEach>
										<!-- c:forEach -->
									</div>
									<!-- carousel-inner -->
									<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
										<span class="visually-hidden">Previous</span>
									</button>
									<!-- carousel-control-prev 이전 -->
									<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span> 
										<span class="visually-hidden">Next</span>
									</button>
									<!-- carousel-control-next 이후 -->
								</div>
								<!-- carouselExampleControls -->
							</div>
							<!-- content-left -->	
							<div class="content-right">
								<div class="announcement">
									<!-- 공지테이블-->
									<table>
										<c:forEach var="notice" items="${noticeList}" varStatus="status" begin = "0" end ="4" >
										<tr>
											<c:choose>
												<c:when test="${notice.aboardVal == 1 }">
													<c:if test="${notice.voteYV == 0 }">
														<td><a href="${pageContext.request.contextPath }/${clubId }/notice/editlist?aboardNo=${notice.aboardNo}&memberId=${member.memberId}">${notice.title }</a></td>
														<td>${notice.aboardDate}</td>
													</c:if>
													<c:if test="${notice.voteYV >= 1 }">
														<td><a href="${pageContext.request.contextPath }/${clubId }/notice/voteResult/${notice.aboardNo}?voteNo=${notice.voteNo}&aboardNo=${notice.aboardNo}&memberId=${member.memberId}">${notice.title }</a></td>
														<td>${notice.aboardDate}</td>
													</c:if>
												</c:when>
												<c:when test="${notice.aboardVal == 2 }">
													<td><a href="${pageContext.request.contextPath }/${clubId }/notice/editlistgroup?aboardNo=${notice.aboardNo}">
														<c:if test="${notice.paycount == notice.maxPerson }">
															[자동등록]${notice.title }
														</c:if>
														<c:if test="${notice.paycount < notice.maxPerson }">
															${notice.title }
														</c:if>
													</a></td>
													<td>${notice.aboardDate}</td>
												</c:when>
												<c:when test="${notice.aboardVal == 3 }">
													<td><a href="${pageContext.request.contextPath }/${clubId }/notice/editlistgroupG?aboardNo=${notice.aboardNo}">${notice.title }</a></td>
													<td>${notice.aboardDate}</td>
												</c:when>
												<c:when test="${notice.aboardVal == 4 }">
													<td><a href="${pageContext.request.contextPath }/${clubId }/notice/noticeVoteViewR?aboardNo=${notice.aboardNo}">[자동등록]${notice.title }</a></td>
													<td>${notice.aboardDate}</td>
												</c:when>
											</c:choose>
											</tr>
										</c:forEach>
										<!-- forEach -->
									</table>
									<!-- 공지테이블-->
								</div>
								<!-- announcement -->
								<div class="calendar">
									<div id='calendar2'></div>
								</div>
								<!-- calendar -->	
							</div>
							<!-- content-right -->
						</div>
						<!-- main-content -->	
					</div>
					<!-- diary-body -->				
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
<style>
#calendar2 .fc-daygrid-day-number{font-size: 11px;}
#calendar2 #fc-dom-1{font-size : 15px;}
#calendar2 .fc-col-header-cell-cushion {font-size: 15px;}
#calendar2 .fc .fc-daygrid-day-number {padding: 2px;position: relative;z-index: 1;}
#calendar2 .fc-col-header-cell-cushion {font-size: 14px;}
#calendar2 .fc .fc-daygrid-day-number { padding: 2px; position: relative; bottom: 3px; right: -1px; z-index: 4;}
#calendar2 .fc-col-header-cell-cushion{font-size: 14px;}
#calendar2 .fc-direction-ltr .fc-daygrid-event.fc-event-end{    margin-right: 0; margin-top: -8px;}
#calendar2 .fc-direction-ltr .fc-daygrid-event.fc-event-start {margin-left: 0;}
#calendar2 .fc .fc-toolbar.fc-header-toolbar { margin-bottom: 1em; margin-top: 0.5em;}
</style>
<script>

$(document).ready(function(){
	$('#club-main').css('background-color','white');
	$('#club-main').css('color','gray');
	$('#club-main').css('border-left','white');
	$('#club-main').css('box-shadow', '6px 3px 6px 0px #48484847');
});

$(document).ready(function() {
    // 클릭 가능한 요소를 선택하여 클릭 이벤트 처리
    $(".clickable").on("click", function() {
      // 데이터 속성에 저장된 URL 가져오기
      var url = $(this).data("url");
      // 가져온 URL로 페이지 이동
      window.location.href = url;
    });
 });



//calendar용 전역변수 설정
let calendarEl;
let calendar;

	$(document).ready(function() {
		render();
		getData();
		
	  });

	//calendar 그리는 메서드
	function render(){
	    calendarEl = $('#calendar2')[0];
	    calendar = new FullCalendar.Calendar(calendarEl, {
	    	 headerToolbar: {
	             left: '',
	             center: 'title',
	             right: 'prev,next'
	           },
		    locale: 'en',
	    	initialView: 'dayGridMonth',
	    	contentHeight: 364,
	    	selectable: false,
	    	contentHeight:function(){
	    		if(screen.width<800){
	    		    return 500;
	    		    }else{
	    		    return 850;
	    		    }
	    		},
	    });
		
	    calendar.render();
	} //render event() end

	
	//calendar 데이터 가져오는 메서드
	function getData(){
	
	var clubId =  ${club.clubId};

	console.log(clubId);
	
	CalendarVO = {
			clubId	: clubId,
			}
		
	console.log('AJAX로 넘어갈 객체' + CalendarVO);
	
		 $.ajax({
	        
	        //요청 세팅
	        url : "${pageContext.request.contextPath}/calendar/club/getschedule2",      
	        type : "post",
	        data : CalendarVO,
	        
	        //응답 세팅
	        dataType : "json",
	        success : function(jsonResult){
	        	var data = jsonResult.data;
				console.log(data)
	
					data.forEach(function(data) {
					
 						calendar.addEvent({
								title: data.title,
								start: data.startDate,
								end:data.endDate + ' 24:00',
								url:'${pageContext.request.contextPath}/'+data.clubId + '/notice/editlistgroup?aboardNo=' + data.boardNo,
								backgroundColor : 'F7D060',
	 							borderColor:  'F7D060'
							}); //eddEvent end
				
					});
				
				
	        }, //success end
	        error : function(XHR, status, error) {
	        console.error(status + " : " + error);
	        }
					            
	     });//ajax end
	}//getData() end

</script>
</html>
