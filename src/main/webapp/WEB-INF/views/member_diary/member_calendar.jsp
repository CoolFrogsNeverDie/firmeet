<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
          <h4>&#128197;&nbsp;&nbsp;${memberId}님의 달력</h4>
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
  
  <!-- 일정 등록모달창-->
<div class="container1" >

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
       <form action="${pageContext.request.contextPath}/calendar/member/add-persche" method = "GET" class= "add-persche">
            <input type="hidden" id = "address1" name = "address1" value = "-1">
            <input type="hidden" id = "address2" name = "address2" value ="-1">
            <input type="hidden" name = "memberId" value = "se" id = "memId">
            <input type="hidden" id = "marker_place">
          <div class="body-contentbox">
            <table id = "schedule-table">
              <tr>
                <th>일정</th>
                <td><input type="text" placeholder="일정명을 입력하세요." id = "title" name = "title"> </td>
              </tr>
              <tr>
                <th rowspan="2">일정</th>
                <td rowspan="2"><input type="date" id = "startD" name = "startDate">&nbsp; ~&nbsp; 
                <input type="date" id = "endD" name ="endDate" ></td>
              </tr>
              <tr>
              </tr>
              <tr>
                <th>장소등록</th>
                <td>
				<span class= "checkbox-loca"><input type ="checkbox" id = "loca-insert-select" > &nbsp;장소 등록 </span>
				<span><input type = "text" readonly name = "place" id = "place-result" value =" "></span>
                <input type = "text" class= "search-place" id  = "place"  readonly><button type= "button" class="map-search-btn">위치검색</button></td>
              </tr>
              <tr class="content-area">
                <th>내용</th>
                <td><textarea name = "content" id = "content"></textarea></td>
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



  <!-- 일정 확인모달창-->
<div class="container3" >

  <div class="popup-wrap">
    <div class="popup">
      <div class="popup-head">
        <div class="popup-close-btn">X</div>
      </div>
      <div class="popup-body">
        <div class="body-content">
          <div class="body-titlebox">
            <h4><strong>일정등록</strong></h4>
            
          </div>
       <form action="${pageContext.request.contextPath}/calendar/member/add-persche" method = "GET" class= "add-persche">
            <input type="hidden" name = "address1" value = "-1">
            <input type="hidden" name = "address2" value ="-1">
            <input type="hidden" name = "memberId" value = "se">
            <input type="hidden" >
          <div class="body-contentbox">
            <table id = "schedule-table">
              <tr>
                <th>일정</th>
                <td><input type="text" placeholder="일정명을 입력하세요."name = "title"> </td>
              </tr>
              <tr>
                <th rowspan="2">일정</th>
                <td rowspan="2"><input type="date" name = "startDate">&nbsp; ~&nbsp; 
                <input type="date" id = "endD" name ="endDate" ></td>
              </tr>
              <tr>
              </tr>
              <tr>
                <th>장소등록</th>
                <td>
	 				<span class= "checkbox-loca"><input type ="checkbox"> &nbsp;장소 등록 </span><br>
                <input type = "text" class= "search-place" name = "place" value = " " readonly><button type= "button" class="map-search-btn">위치검색</button></td>
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
<div class="container2" >

  <div class="popup-wrap2" id="popup">
    <div class="popup" id = "2th-popup">
      <div class="popup-head">
        <div class="popup-close-btn2">X</div>
      </div>
      <div class="popup-body">
        <div class="body-content">
       <form action="http://localhost:8000/link/search/" method = "get">
          <div class="body-titlebox">
            <h4><strong>지도 선택</strong></h4>

          </div>
          <div class="body-contentbox">
            <div id="map" style="width:500px;height:400px;"></div>
          </div>
       </form>
          
        </div>
      </div>
    </div>
</div>
</div>
<!--모달창-->

  
  
</body>
<!-- 지도 JS 영역 -->
<style>
<!--지도-->
.marker-place{
padding:5px;font-size:14px; text-align:center; height: 100px;
}
.loca-insert-btn{
	margin-bottom : 4px; background-color: black; color: white; text-align: center; font-size:12px; display:inline-block;
	width:70px; height: 30px; margin-top:7px;
	position: absolute; bottom: 5px; left: 50%; transform: translateX(-50%);
}
.loca-insert-btn:hover{
	background-color:white;
	color: black; border: 0.5px solid black;
}
popup-wrap input {
height:30px;
}
.map-search-btn{
 background-color: black; color: white;
font-size: 15px;
    width: 70px;
    height: 30px;
} 
.checkbox-loca{
  display: flex;
  align-items: center;
font-size : 13px;}
</style>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 


// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x)
    
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다

		let lat =  marker.getPosition().getLat(); 
        let lng =  marker.getPosition().getLng();
        let place_name = place.place_name;
        infowindow.setContent('<div class= "marker-place" style="height: 100px;">' + place_name + '<br> <button type="button" class= "loca-insert-btn">위치등록</button></div>');
    	$('#address1').val(lat);
    	$('#address2').val(lng);
    	$('#marker_place').val(place_name);
        infowindow.open(map, marker);
    });
}


function setCenter(x, y) {            
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(x, y);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}

$('.map-search-btn').on("click", function(){
	
	var keyword = $('.search-place').val();
	ps.keywordSearch(keyword, placesSearchCB); 
	$('.container2 .popup-wrap2').css('display', 'block');
	
	
});

$('.popup-close-btn2').on("click", function(){
	
		console.log('확인');
		$('.popup-wrap2').css("display", 'none');
});

//장소 등록
$('#2th-popup').on("click",'.loca-insert-btn', function(){
	let place_name =  $('#marker_place').val()
// 	 
	$('#place-result').val(place_name);
	$('.popup-wrap2').css("display", 'none');
	
});

//개인일정 등록 submit 이벤트
$('.add-persche').on("submit", function(){
	var memId = $('#memId').val();
	var title = $('#title').val();
	var startD = $('#startD').val();
	var endD = $('#endD').val();
	
	if(title.length < 1){
		alert('타이틀을 입력하세요.')
		return false;
	}if(memId.length < 1){
		alert('로그인이 필요한 서비스입니다.')
		return false;
	}if(startD.length < 1){
		alert('시작 날짜를 지정해주세요.')
		return false;
	}if(endD.length < 1){
		alert('끝나는 날짜를 지정해주세요.')
		return false;
	}
	return true;
})

//일정 등록 팝업 리셋
function reset_popup1(){
	$('#content').val("");
	$('#startD').val("");
	$('#endD').val("");
	$('#title').val("");
	$('#place').val("");
	$('#address1').val("-1");
	$('#address2').val("-1");
	$('#loca-insert-select').prop('selectedIndex', -1);
}
//일정등록 팝업 주소 리셋
function reset_popup1_address(){
	$('#address1').val("-1");
	$('#address2').val("-1");
}


$('#loca-insert-select').on('change', function() {
	  if ($(this).is(':checked')) {
		  $('#place').removeAttr('readonly');
	  } else {
		  $('#place').attr('readonly', 'readonly');
		  reset_popup1_address();
	  }
	});

</script>





<!--// 지도 JS 영역 //-->


<!-- 캘린더 JS 영역 -->
<script>




//calendar 객체 전역변수 설정
let calendarEl;
let calendar;

//document ready
$(document).ready(function() {
	render();
	getData();
	
	/*
	$('.container3 .popup-wrap').css('display', 'block');
	*/


});
  
//정렬 선택 했을때 데이터 다시 불러옴
$('#select-array').on("change", function(){
	getData();
});
//정렬 기준 변경 시 --내 일정-- 선택 시 결제/모임 정렬 기능 비활성화&전체로 value값 변경
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
	      reset_popup1();
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
	    	eventlimit: true,
			dayMaxEvents: true,
	    	//드래그 이벤트처리
	           views: {
	        	    timeGrid: {
	        	    	  eventLimit: 2
	        	    }
	        	  },
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
	
	//바뀐 캘린더 스케줄 불러오는 메서드//
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
	 							id : 'per',
	 					        className : 'per-block',
	 							backgroundColor: '#0C70F2',
	 							borderColor:  '#0C70F2',
	 						}
	        			 
	        			 
	        			 
	        			 );//addEvent end

	        		 }//for end
	        	 }//if end
	         }, //success end
	         error : function(XHR, status, error) {
	         console.error(status + " : " + error);
	         }
	 				            
	      });//ajax end
	 	

	
	}
	
	

</script>

<script>
$('.per-block')on("click", function(){
	
	alert('test')
});
$('#calendar')on("click",'.per-block', function(){

	alert('test')
});


</script>

</html>