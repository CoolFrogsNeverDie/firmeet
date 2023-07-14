<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="../include/topnav.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>어푸어푸 보더 업로드</title>
  <!--제이쿼리-->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <!--부트스트랩-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

  <!--CSS-->
  <link href="${pageContext.request.contextPath }/assets/css/main2.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/content2.css" type="text/css" />
  <!--풀 캘린더 CSS-->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/calendar.css" type="text/css" />
  <!--풀 캘린더 JS-->
  <script src="${pageContext.request.contextPath }/assets/js/index.global.js"></script>
  
  
  <style>
    .fc .fc-daygrid-day-top {
      display: block;
    }
  </style>
</head>

<body>
  <!----------------------------------------- top Navigation ----------------------------------------->
  
  <!----------------------------------------- // 상단 내비게이션 바 //----------------------------------------->
  <!-- 페이지 콘텐츠 -->

  <div class="wrap">
    <div class="diary-area">
      <div class="diary-topbar">
        <img class="diary-topbar-img" src="./asset/pro.jpg" alt="프로필사진" />
        <h1>어푸어푸</h1>
      </div>
      <!--/diary-topbar-img-->
      <div class="diary-subbar">
        <div>
          <h4>동호회 달력</h4>
        </div>
        <div class="calendar-array">
          <select id = "select-array">
            <option value ="-99">전체</option>
            <option value = "2">결제공지</option>
            <option value ="3">일정</option>
          </select>
        </div>
      </div>
      <!--/diary-subbar-->
      <div class="content-area">
        <div class="content-left">

          <div class="forCalendar">
            <div id='calendar' style="width: 95%; height: 100%;"></div>

          </div>

          <!--/calendar-area-->
        </div>
        <!--/content-left-->
      </div>
      <!--/content-area-->
    </div>
    <!--/diary-area-->
    <div class="menu-bar" name="사이드메뉴바">
      <div class="group-profile">
        <div class="group-profile-img-area">
          <img class="group-profile-img" src="./asset/pro.jpg" alt="프로필사진" />
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
<script>

//calendar 객체 전역변수 설정
let calendarEl;
let calendar;

//document ready
$(document).ready(function() {
	render();
	getData();
	
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
	    calendarEl = $('#calendar')[0];
	    calendar = new FullCalendar.Calendar(calendarEl, {
	    	 headerToolbar: {
	             left: '',
	             center: 'title',
	             right: 'prev,next'
	           },
		    locale: 'ko',
	    	initialView: 'dayGridMonth',
	    	selectable: true
	    	
	    	
	    	
	    });

	    calendar.render();
		
	}


	//스케줄 정보를 받아와서 render()에 넘겨주는 function
	function getData(){
	
	var title = $("#fc-dom-1").text();
	var years = title.substring(0,4);
	var month = title.substring(title.length-2,title.length-1);
	var clubId =  ${clubId};
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
        url : "${pageContext.request.contextPath}/calendar/club/getSchedule",      
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
	 
	}//get data end



</script>
</html>