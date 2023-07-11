<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <script>
  /*객체 배열로 가져와서*/

  /*
  
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          locale : 'ko',
  	      timeZone: 'ko',
  	   	 events: [
  	      {
  	        title: 'render schedule',
  	        start: '2023-07-20',
  	        end: '2023-07-23'
  	      },
  	      {
  	    	  title: '멋쟁이',
  	    	  start: 2023-07-01,
  	    	  end: 2023-07-05
  	      }
  	    ],
        });
        calendar.render();
      });
  */
  
  
  /*
      document.addEventListener('DOMContentLoaded', function() {

      });
    $(document).ready(function() {
	  schedule_Render('render schedule', '2023-07-20', '2023-07-23');


	function schedule_Render(title, start, end) {
	  var calendarThe = $('#calendar')[0];
	  var calendar = new FullCalendar.Calendar(calendarThe, {
        locale : 'ko',
	    timeZone: 'ko',
	    initialView: 'dayGridMonth',
	    events: [
	      {
	        title: 'render schedule',
	        start: '2023-07-20',
	        end: '2023-07-23'
	      },
	      {
	    	  title: '멋쟁이',
	    	  start: 2023-07-01,
	    	  end: 2023-07-05
	      }
	    ],
	    editable: true
	  });
	  calendar.render();
	}
    });
	
    
    */
/*  
$(document).ready(function() {

    $('#calendar').fullCalendar({
      locale: 'zh-cn',
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,basicWeek,basicDay'
      },
      defaultDate: '2018-03-12',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2018-03-01'
        },
        {
          title: 'Long Event',
          start: '2018-03-07',
          end: '2018-03-10'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2018-03-09T16:00:00'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2018-03-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2018-03-11',
          end: '2018-03-13'
        },
        {
          title: 'Meeting',
          start: '2018-03-12T10:30:00',
          end: '2018-03-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2018-03-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2018-03-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2018-03-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2018-03-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2018-03-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2018-03-28'
        }
      ]
    });

  });
  */
  </script>
  <!--모달-->
  <style>
    .fc .fc-daygrid-day-top {
      display: block;
    }
  </style>
</head>

<body>
  <!----------------------------------------- top Navigation ----------------------------------------->
  <nav class="navbar navbar-expand-lg navbar-dark $purple-100 static-top">
    <div class="container">
      <a class="navbar-brand" href="#">
        <img src="./asset/001.png" alt="..." height="36" />
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">홈</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">링크</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">
              드롭다운
            </a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#">액션</a></li>
              <li><a class="dropdown-item" href="#">다른 액션</a></li>
              <li>
                <hr class="dropdown-divider" />
              </li>
              <li>
                <a class="dropdown-item" href="#">다른 항목</a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
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
            <option>전체</option>
            <option>모임</option>
            <option>투표</option>
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

$(document).ready(function() {
	
	render();
	
});



$(window).on("load",function() {
	
	var clubId = ${clubId};
 	var viewOption =  ${viewOption};
 	var month =  ${month};
	
	CalendarVO = {
			  clubId: clubId,
			  viewOption: viewOption,
			  month: month
			}

	 console.log('AJAX로 넘기려는 객체  : ' + CalendarVO)
	 console.log('AJAX로 넘기려는 객체  : ' + clubId)
	 console.log('AJAX로 넘기려는 객체  : ' + viewOption)
	 console.log('AJAX로 넘기려는 객체  : ' + month)
	 

	 $.ajax({
        
        //요청 세팅
        url : "${pageContext.request.contextPath}/calendar/getSchedule",      
        type : "post",
        data : CalendarVO,
        
        //응답 세팅
        dataType : "json",
        success : function(jsonResult){
       	 	
        	var data = jsonResult.data;

            data.forEach(function(item) {
					console.log(item.startDate);
					console.log(item.endDate);

					 calendar.addEvent( {'title':item.title, 'start' : item.startDate, 'end':item.endDate});
					
              });
        },
        error : function(XHR, status, error) {
        console.error(status + " : " + error);
        }
				            
     });//ajax end
	 

});//document ready event end



function render(){
	
	   var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      initialView: 'dayGridMonth',
	      locale : 'ko',
		      timeZone: 'ko',
		   	 events: [
		      {
		        title: data.title,
		        start: data.startDate,
		        end: data.endDate
		      }
		    ],
	    });
	    calendar.render();
	
}

</script>
</html>