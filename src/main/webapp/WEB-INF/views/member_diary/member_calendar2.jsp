<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <link href="${pageContext.request.contextPath}/assets/css/main2.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/content2.css" type="text/css" />
  <!--풀 캘린더 CSS-->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/memcalendar.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/popup.css" type="text/css" />
  <!--풀 캘린더 JS-->
  <script src="${pageContext.request.contextPath }/assets/js/index.global.js"></script>
  <!-- 카카오 map  -->
  <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6f59970276341196f41538265d29af72&libraries=services"></script>

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
        <h1>${memberId}님의 다이어리</h1>
      </div>
      <!--/diary-topbar-img-->
      <div class="diary-subbar">
        <div>
          <h4>${memberId}님의 달력</h4>
          <input type ="hidden" value ="${memberId}" id ="memId">
        </div>
        <div class="calendar-array">
			<select id ="select-club">
				<option value="-99">전체</option>
				<option value ="-88">나의 일정</option>
				<c:forEach items ="${joinClubList}" var ="club">
					<option value ="${club.clubId}">${club.clubName}</option>
				</c:forEach>
       		</select>
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
  
  <!--모달창-->
<div class="container" >

  <div class="popup-wrap" id="popup">
    <div class="popup">
      <div class="popup-head">
        <div class="popup-close-btn">X</div>
      </div>
      <div class="popup-body">
        <div class="body-content">
          <div class="body-titlebox">
            <h4><strong>일정등록</strong></h4>
            
          </div>
       <form action="*" method = "">
          <div class="body-contentbox">
            <table id = "schedule-table">
              <tr>
                <th>일정</th>
                <td><input type="text" placeholder="일정명을 입력하세요." name = "title"> </td>
              </tr>
              <tr>
                <th rowspan="2">일정</th>
                <td rowspan="2"><input type="date" id = "startD" name = "startDate">&nbsp; ~&nbsp; 
                <input type="date" id = "endD" name ="endDate" ></td>
              </tr>
              <tr>
              </tr>
              <tr>
                <th>장소</th>
                <td><input text="" name ="place"><button type= "button" class="map-btn">위치검색</button></td>
              </tr>
              <tr class="content-area">
                <th>내용</th>
                <td><textarea name = "content"></textarea></td>
              </tr>
            </table>
            
          </div>
          <div class="sche-submit-btn">
            <button type ="submit">등록</button>
            <button type ="button">취소</button>
          </div>
       </form>
          
        </div>
      </div>
    </div>
</div>
</div>
<!--모달창-->

  <!--모달창-->
<div class="container" >

  <div class="popup-wrap2" id="popup">
    <div class="popup">
      <div class="popup-head">
        <div class="popup-close-btn">X</div>
      </div>
      <div class="popup-body">
        <div class="body-content">
       <form action="http://localhost:8000/link/search/" method = "get">
          <div class="body-titlebox">
            <input type="text" name = "keyword">
            <h4><strong>일정등록</strong></h4>
          </div>
          <div class="body-contentbox">
            <div id="map" style="width:300px;height:300px;"></div>
          </div>
          <div class="sche-submit-btn">
            <button type ="submit">검색</button>
            <button type ="button">취소</button>
          </div>
       </form>
          
        </div>
      </div>
    </div>
</div>
</div>
<!--모달창-->

  
  
</body>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>

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
$('#select-club').on("change", function(){
	
	if( $(this).val() == '-88'){
		$('#select-array').val("-99");
		$('#select-array').attr("disabled", true);
	}else{
		$('#select-array').attr("disabled", false);
	}
	getData();
	
});


//캘린더 이전 버튼 클릭 했을때
$('.forCalendar').on("click",'button.fc-prev-button', function(){
	getData();
});
//캘린더 이후 버튼 선택했을 때
$('.forCalendar').on("click",'button.fc-next-button', function(){
	getData();
	console.log('test2');
});


	  $(".popup-close-btn").click(function(){
	      modalClose();
	  });
	  function modalClose(){
	    $("#popup").fadeOut();
	  }


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
	    	selectable: true,
	    	//드래그 이벤트처리
	    	dateClick: function(info) {
		        $("#popup").css('display','flex').hide().fadeIn()
		        $('#startD').val(info.dateStr);
		        $('#endD').val(info.dateStr);
	          },
	        select: function(info) {
	        	$("#popup").css('display','flex').hide().fadeIn()
		        $('#startD').val(info.startStr);
		        $('#endD').val(info.endStr);
	        },
	    });

	    calendar.render();
		
	}
	
	
	function getData(){
		
		var title = $("#fc-dom-1").text();
		var years = title.substring(0,4);
		var month = title.substring(title.length-2,title.length-1);
		var memberId =  $('#memId').val();
	 	var viewOption1 =  $('#select-array').val(); 
	 	var viewOption2 =  $('#select-club').val(); 
		
	 	console.log('정보 확인  : ' + years + '달 : ' + month + '  멤버 아이디 : '  +memberId + ' 정렬 옵션 1 : ' + viewOption1 + '정렬옵션2: ' + viewOption2)
		
	
		CalendarVO = {
	 		memberId: memberId,
	 		viewOption1: viewOption1,
	 		viewOption2 : viewOption2,			  	  
			month: month,
			years:years
		}
	
		
	 	console.log(CalendarVO);
	
	 	
	 	 $.ajax({
	         
	         //요청 세팅/calendar/member/getSchedule
	         url : "${pageContext.request.contextPath}/calendar/member/getSchedule",      
	         type : "POST",
	         data : CalendarVO,
	         
	         //응답 세팅
	         dataType : "json",
	         success : function(jsonResult){
	   			
	        	 var data = jsonResult.data;
	        	 var club = data.clubSche;
	        	 var per = data.perSche;
	        	 console.log(club);
	        	 console.log(per);
	        	 
	 			calendar.removeAllEvents();
	        	 
	        	 if(club != null ){
		 				for(var i = 0; i<club.length; i++){
		 					if(club[i].meetCate =="3"){
		 						calendar.addEvent({
		 							title: '[' + club[i].clubName + ']' + club[i].title + club[i].frontTitle,
		 							start: club[i].startDate,
		 							end: club[i].endDate + ' 24:00',
		 							url: 'http://www.naver.com',
		 							backgroundColor: '#FF6A00',
		 							borderColor:  '#FF6A00'
		 						});//addEvent end
		 					}else{
		 						calendar.addEvent({
		 							title: '[' + club[i].clubName + ']' + club[i].title + club[i].frontTitle,
		 							start: club[i].startDate,
		 							end: club[i].endDate + ' 24:00',
		 							url: 'http://www.naver.com',
		 							backgroundColor: '#66008c',
		 							borderColor:  '#66008c'
		 						});//addEvent end
		 					}//if end
		 				}//for end
	        	 } //club.length check
	        	 
	        	 if(per != null){
	        		 for(var i =0; i<per.length; i++){
	        			 calendar.addEvent({
	 							title: per[i].title ,
	 							start: per[i].startDate,
	 							end: per[i].endDate + ' 24:00',
	 							url: 'http://www.naver.com',
	 							backgroundColor: '#0C70F2',
	 							borderColor:  '#0C70F2'
	 						});//addEvent end
	        		 }
	        	 }//if end
	         }, //success end
	         error : function(XHR, status, error) {
	         console.error(status + " : " + error);
	         }
	 				            
	      });//ajax end
	 	

	
	}
	
	
	

	/*

	//스케줄 정보를 받아와서 render()에 넘겨주는 function
	function getdata(){
	var test = $("#fc-dom-1").text();
	var years = test.substring(0,4);
	var month = test.substring(test.length-2,test.length-1);
 	var viewOption1 =  $('#select-array').val(); 
	var viewOption2 = $('#select-club').val();
	var memberId = ${memberId}; 

	console.log('test');
	console.log(CalendarVO);
	}

	
	 $.ajax({
        
        //요청 세팅
        url : "${pageContext.request.contextPath}/calendar/getSchedule",      
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
							end:data[i].endDate,
							url:'https://www.naver.com',
							backgroundColor : '#FF6A00'
						}); //eddEvent end
					}else{
					    calendar.addEvent({
							title:  data[i].frontTitle +' '+ data[i].title,
							start: data[i].startDate,
							end:data[i].endDate,
							url:'https://www.naver.com',
							backgroundColor : '#66008c'
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


*/
</script>
</html>