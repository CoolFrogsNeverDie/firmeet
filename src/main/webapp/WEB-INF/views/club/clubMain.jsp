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
<link href="${pageContext.request.contextPath}/assets/css/main2.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/clubMain.css" rel="stylesheet" type="text/css" />
  <!--풀 캘린더 CSS-->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/calendar.css" type="text/css" />
  <!--풀 캘린더 JS-->
  <script src="${pageContext.request.contextPath }/assets/js/index.global.js"></script>
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

.content-area {
	width: 100%;
	height: 82%;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.carousel-inner {
	position: relative;
	width: 100%;
	overflow: hidden;
	display: flex;
	align-items: center;
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
				<div class="content-left">
					<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="width: 100%;">
						<div class="carousel-inner">
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
				</div>
				<!--/content-left-->
				<div class="content-right">
					<div class="announcement">
						<table>
							<c:forEach var="notice" items="${noticeList}" varStatus="status">
								<tr>
									<td class="title">${notice.title}</td>
									<td>${notice.aboardDate}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="calendar">
						<div id='calendar'"></div>
					</div>
				</div>
				<!--/content-right-->
			</div>
			<!--/content-area-->
		</div>
		<!--/diary-area-->
		<c:import url="/WEB-INF/views/include/side_nav.jsp"></c:import>
		<!--/wrap-->
</body>
<footer> Copyright (C) 2023 어리쥬 all rights reserved. </footer>
<script>

let calendarEl;
let calendar;

$(document).ready(function() {
	render();
	getData();
	
	calendar.addEvent({
		title: '디졌다.',
		start: '2023-07-23',
		end:'2023-07-23',
		url:'https://www.naver.com',
		 display: 'background', // 백그라운드 색상을 표시하는 옵션
         color: '#FF0000' // 원하는 색상 값으로 변경
	}); //eddEvent end
  });


function render(){
    calendarEl = $('#calendar')[0];
    calendar = new FullCalendar.Calendar(calendarEl, {
    	 headerToolbar: {
             left: '',
             center: 'title',
             right: 'prev,next'
           },
	    locale: 'en',
    	initialView: 'dayGridMonth',
    	selectable: false
    });
	
    calendar.render();
} //render event() end

	function getData(){
	
	var clubId =  ${club.clubId};
	
	CalendarVO = {
			  clubId: clubId,
			}
		
	 $.ajax({
	        
	        //요청 세팅
	        url : "${pageContext.request.contextPath}/calendar/club/getSchedule",      
	        type : "post",
	        data : CalendarVO,
	        
	        //응답 세팅
	        dataType : "json",
	        success : function(jsonResult){
	        	var data = jsonResult.data;
				console.log(data)
				
				if(data.length != 0){
					for(var i = 0; i<data.length; i++){
						if(data[i].meetCate == "3"){
						    calendar.addEvent({
								title: data[i].frontTitle +' '+ data[i].title,
								start: data[i].startDate,
								end:data[i].endDate + ' 24:00',
								url:'https://www.naver.com',
								backgroundColor : '#FF6A00',
	 							borderColor:  '#FF6A00'
							}); //eddEvent end
						}else{
						    calendar.addEvent({
								title:  data[i].frontTitle +' '+ data[i].title,
								start: data[i].startDate,
								end:data[i].endDate + ' 24:00',
								url:'https://www.naver.com',
								backgroundColor : '#66008c',
	 							borderColor:  '#66008c'
							}); //eddEvent end
						}
					}
				}
	        }, //success end
	        error : function(XHR, status, error) {
	        console.error(status + " : " + error);
	        }
					            
	     });//ajax end
	
	
	

	}

</script>
</html>
