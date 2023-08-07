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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/popup.css" type="text/css" />
	<!--풀 캘린더 CSS-->
  	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/calendar.css" type="text/css" />
  	<!--풀 캘린더 JS-->
  	<script src="${pageContext.request.contextPath }/assets/js/index.global.js"></script>
  	<link href="${pageContext.request.contextPath}/assets/css/color_code/color${club.colorType}.css" rel="stylesheet" type="text/css" />
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
  						
					</div>		
					<!-- //diary-topbar -->
					
					<div class="calendar-body club-c-body">					
						<!-- 개인별코딩 ---------------------------------------------------------------->
						  <div class="diary-subbar memcal-subbar">
							<input type ="hidden" value ="${member.memberId}" id ="memId">
							<div class="clubcalendar-array">
								<select id = "select-array" class= "select-sche-option2">
									<option value ="-99">전체</option>
									<option value = "2">결제공지</option>
									<option value ="3">일정</option>
								</select>
							</div>
						</div>
						<div class="forCalendar">
            				<div id='mem-calendar'></div>
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
<c:import url="/WEB-INF/views/include/mem_calendar_popup.jsp"></c:import>
</body>
<script>

//calendar 객체 전역변수 설정
let calendarEl;
let calendar;


//document ready
$(document).ready(function() {
	render();
	getData();
	$('#club-calendar').css('box-shadow', '6px 3px 6px 0px #48484847');
	$('#club-calendar').css('border-left', '0px');
	$('#club-calendar').css('color', 'gray');
	$('#club-calendar').css('background-color', 'white');
	$('#club-calendar').css('border-left', '10px solid white');
  });
  
//정렬 선택 했을때
$('#select-array').on("change", function(){
	getData();
});


//캘린더 이전 버튼 클릭 했을때
$('.forCalendar').on("click",'button.fc-prev-button', function(){
	getData();
	console.log('test1');
});
//캘린더 이후 버튼 선택했을 때
$('.forCalendar').on("click",'button.fc-next-button', function(){
	getData();
	console.log('test2');
});
$('.forCalendar').on("click",'button', function(){
	console.log('test');
});


	//캘린더 그리는 메서드
	function render(){
	    calendarEl = $('#mem-calendar')[0];
	    calendar = new FullCalendar.Calendar(calendarEl, {
	    	 headerToolbar: {
	             left: '',
	             center: 'title',
	             right: 'prev,next'
	           },
		    locale: 'ko',
	    	initialView: 'dayGridMonth',
	    	selectable: false
	    });

	    calendar.render();
		
	}


	//스케줄 정보를 받아와서 render()에 넘겨주는 function
	function getData(){
	
	var title = $("#fc-dom-1").text();
	var years = title.substring(0,4);
	var month = title.substring(title.length-2,title.length-1);
	var clubId =  ${club.clubId};
 	var viewOption1 =  $('#select-array').val(); 
	

	CalendarVO = {
			  clubId: clubId,
			  viewOption1 : viewOption1,
			  month: month,
			  years:years
			}
	console.log(CalendarVO)

	 $.ajax({
        
        //요청 세팅
        url : "${pageContext.request.contextPath}/calendar/club/getschedule",      
        type : "post",
        data : CalendarVO,
        
        //응답 세팅
        dataType : "json",
        success : function(jsonResult){
        	var data = jsonResult.data;
			console.log(data)

			calendar.removeAllEvents();
			
			if(data.length != 0){
				for(var i = 0; i<data.length; i++){
					if(data[i].meetCate == "2"){
					    calendar.addEvent({
							title: data[i].frontTitle +' '+ data[i].title,
							start: data[i].startDate,
							end:data[i].endDate + ' 24:00',
							url:'${pageContext.request.contextPath}/'+data[i].clubId + '/notice/editlistgroup?aboardNo=' + data[i].boardNo,
 							backgroundColor: '#DE8685',
 							borderColor:  '#DE8685'
						}); //eddEvent end
					}else{
					    calendar.addEvent({
							title:  data[i].frontTitle +' '+ data[i].title,
							start: data[i].startDate,
							end:data[i].endDate + ' 24:00',
							url:'${pageContext.request.contextPath}/'+data[i].clubId + '/notice/editlistgroup?aboardNo=' + data[i].boardNo,
 							backgroundColor: '#85ADDE',
 							borderColor:  '#85ADDE'
						}); //eddEvent end
					}
				}
			}
        }, //success end
        error : function(XHR, status, error) {
        console.error(status + " : " + error);
        }
				            
     });//ajax end
	 
	}//get data end



</script>

</html>
