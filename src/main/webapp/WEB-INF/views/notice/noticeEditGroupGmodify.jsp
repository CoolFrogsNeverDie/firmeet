<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>개인 게시판</title>
    <c:import url="/WEB-INF/views/include/topnav.jsp"></c:import>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ba049cf132b7471f4a76ebf9ace329c&libraries=services,clusterer,drawing"></script>
    <link href="${pageContext.request.contextPath}/assets/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/noticestyle.css" rel="stylesheet" type="text/css" />
    
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
						<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/clubimg/${club.img2}" alt="프로필사진"/>
						<h2>${club.clubName}</h2>
					</div>		
					<!-- //diary-topbar -->
					
					<div class="diary-body">
                		<form action="${pageContext.request.contextPath}/${clubId}/notice/gmodify" class="formleft" method="get">
		                    <div class="edittop">
		                        <select name="" id="" class="selectbox">
		                            <option value="notice">공지게시판</option>
		                        </select>
		                        
		                        <input type="radio" name="aboardVal" value="${vo.aboardVal}" id="aboardVal">일반&nbsp;
		                        <input type="radio" name="aboardVal" value="${vo.aboardVal}" id="aboardVal" style="margin-left: 20px;">모임(결제)&nbsp;
		                        <input type="radio" name="aboardVal" value="${vo.aboardVal}" id="aboardVal" style="margin-left: 20px;" checked>모임(일정)
		                        <input type="hidden" name="meetNo" value="${vo.meetNo }">
		                        <input type="hidden" name="aboardNo" value="${vo.aboardNo }">
		                       <select name="meetYear" id="meetYear" class="meetYear">
		                            <option value="2023">2023년</option>
		                            <option value="2024">2024년</option>
		                            <option value="2025">2025년</option>
		                            <option value="2026">2026년</option>
		                            <option value="2027">2027년</option>
		                            <option value="2028">2028년</option>
		                            <option value="2029">2029년</option>
		                            <option value="2030">2030년</option>
		                            <option value="2031">2031년</option>
		                            <option value="2032">2032년</option>
		                            <option value="2033">2033년</option>
		                            <option value="2034">2034년</option>
		                        </select>
		                            
		                        <select name="meetMon" id="meetMon" class="meetMon">
		                            <option value="1">1월</option>
		                            <option value="2">2월</option>
		                            <option value="3">3월</option>
		                            <option value="4">4월</option>
		                            <option value="5">5월</option>
		                            <option value="6">6월</option>
		                            <option value="7">7월</option>
		                            <option value="8">8월</option>
		                            <option value="9">9월</option>
		                            <option value="10">10월</option>
		                            <option value="11">11월</option>
		                            <option value="12">12월</option>
		                        </select>
		
		                        <select id="meetName" name="meetName" class="meetName">
		                            <option value="정기모임">정기모임</option>
		                            <option value="깜짝모임">깜짝모임</option>
		                            <option value="번개모임">번개모임</option>
		                            <option value="일반모임">일반모임</option>
		                        </select>
		                        
		                        <input type="hidden" name="memberId" value="${member.memberId}">${memberId}
		                        <button type="submit" class="ct-color btnbox">등록</button>
		                     </div>
		                     <div class="content-left">
		
			                    <div>
			                        <label for="firstName" style="font-weight: bold; font-size: 15px; margin-right: 5px;">제목</label>
			                        <input class="noticetitle1" type="text" id="title" name="title" value="${vo.title}">
			                    </div>
			
			                    <div class="ababab">
			                        <textarea id="summernote" name="boardContent">${vo.boardContent}</textarea>
			                        <div class="contentleftbox"></div>
			                    </div>
	                
	                    
				                 <div class="modal" id="group">
				                    <div class="modal-dialog">
				                        <div class="modal-content">
				                            <div class="modal-header">
				                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				                            </div>
				                            <div class="modal-body">
				                                 <div class="grouptitle" id="result"></div>
				                                  <div class="payvotebody">
				                                     <span class="groupvotetitle">만남일</span>
				                                     <input class="groupvotedate" type="date" id="startDate" name="startDate" value="${vo.startDate}"> ~
				                                     <input class="groupvotedate" type="date" id="endDate" name="endDate" value="${vo.endDate}">
				                                     <input class="votemin" type="text" id="meetTime" name="meetTime" value="${vo.meetTime}">시<br>
				                                     <span class="groupvotetitle">&nbsp;장 소&nbsp;</span>
				                                     <input class="groupvotemeet" type="text" id="meetPlace" name="meetPlace" value="${vo.meetPlace}">
				                                     <button type="button" class="btn btn-secondary" id="openmap">지도등록</button>
				                                  	 <input type="text" name="address1" value="x" id="address1" value="${vo.address1}"> 
													 <input type="text" name="address2" value="y" id="address2" value="${vo.address2}">
				                                     
				 									<div class="map_wrap">
													   <div id="map" style="width:100%;height:100%;display: block;"></div>
													      <div id="menu_wrap" class="bg_white">
													        <div class="option">
													            <div>
													               <p><em>지도 위에 위치를 클릭해주세요!</em></p>
													                <input type="text" id="keyword" size="15">
													              	<button type="button" class="btn btn-success" id="searchButton" style="margin-left: 10px;display: noen">확인</button>
													            </div>
													        </div>
													        <hr>
													        <ul id="placesList"></ul>
													        <div id="pagination"></div>
													    </div>
													</div>
				                           			<br>
				                                 </div>
				                                 <div style="text-align: center; font-weight: bold; margin-top: 20px;">
				                                 	 <button type="button" id="reset" class="ct-color modelbtnR">등록취소</button>
				                                     <button type="button" class="ct-color modelbtnS" id="saveButton2" style="margin-left: 10px;">등록하기</button>
				                                 </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				           </div>
			         </form>
			            <!--/content-left-->
			            <div class="content-right">
			                <table id="dataTable" style="display: none;">
			                    <thead>
			                        <tr>
			                            <th class="nglist">
			                                <p id="result1"></p>
			                            </th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                        <tr>
			                            <td class="ngname">
			                                <span id="startDate1"></span> ~ <span id="endDate1"></span>
			                                <p id="meetTime1"></p>
			                                <p id="meetPlace1"></p>
			                            </td>
			                        </tr>
			                    </tbody>
			                </table>
			                <div id="map2" style="width:100%;height:150px;"></div>
         				</div>
	        		</div>
	        <!--/content-area-->
<!-- 개인별코딩 ---------------------------------------------------------------->
				</div>
			</div>
		<div class="side-menu">
			<c:import url="/WEB-INF/views/include/side_nav_update.jsp"></c:import>
		</div>
		</div>
	</div>
    
</body>
<script>
 
$(document).keypress(function(e) { 
   if (e.keyCode == 13) e.preventDefault(); 
});

$(document).ready(function() {
	
	  const today = new Date().toISOString().split('T')[0];
	  $('#startDate').attr('min', today);
	  $('#endDate').attr('min', today);
	
    // 라디오 버튼 변경 시 페이지를 바꿔주는 jQuery 이벤트 처리
    $('input[name="aboardVal"]').on('change', function() {
        // 페이지 전환을 위해 선택된 라디오 버튼의 값을 GET 파라미터로 넘깁니다.
         // 선택된 값에 따라 페이지 이동
         var selectedValue = $("input[name='aboardVal']:checked").val();
            switch (selectedValue) {
                case "1":
                    window.location.href = "noticeEditGeneral";
                    break;
                case "2":
                    window.location.href = "noticeEditGroupP";
                    break;
                case "3":
                    window.location.href = "noticeEditGroupG";
                    break;
                default:
                    // 선택된 값이 없을 경우 처리할 내용
                    break;
            }
    });
    
    $("#reset").on("click", function() {
        $("#group").hide();
        $(".modal-backdrop.show").css("display", "none");
    });
	
	 $('.map_wrap').hide();
	 
	 $('#openmap').on('click', function() {
         // 버튼 클릭 시 지도 보여주기
         $('.map_wrap').show();
	 });
	 
	// 라디오 버튼 변경 시 페이지를 바꿔주는 jQuery 이벤트 처리
    $('input[name="aboardVal"]').on('change', function() {
        // 페이지 전환을 위해 선택된 라디오 버튼의 값을 GET 파라미터로 넘깁니다.
        window.location.href = "noticeEditGeneral";
    });
	
	$("#openmap").on("click", function() {
		var location = $("#meetPlace").val();
		console.log(location);
		$("#keyword").attr('value',location);
		$("#searchButton").trigger("click");
	});
	
    $("#saveButton2").on("click", function() {
       var meetYearValue = $('#meetYear').val();
       var meetMonValue = $('#meetMon').val();
       var meetNameValue = $('#meetName').val();
       var combinedValue = meetYearValue + '년 ' + meetMonValue+ '월 ' + meetNameValue;
       var result = $("#result").val();
       var startDate = $("#startDate").val();
       var endDate = $("#endDate").val();
       var meetTime = $("#meetTime").val();
       var meetPlace = $("#meetPlace").val();
       var x = $("#address1").val();
       var y = $("#address2").val();
        
        $("#dataTable").css("display", "block");
        $("#map2").css("display", "block");
        $("#group").modal("hide");

        $("#result1").text(combinedValue);
        $("#startDate1").text("시작일 : " + startDate);
        $("#endDate1").text("종료일 : " + endDate);
        $("#meetTime1").text("시간 : " + meetTime+" 시");
        $("#meetPlace1").text("장소 : " + meetPlace);
        
/* map2 */        
   	var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
        mapOption2 = { 
            center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
   	};
   	console.log(x, y);
    var map2 = new kakao.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다

    // 지도를 클릭한 위치에 표출할 마커입니다
    var marker2 = new kakao.maps.Marker({ 
        // 지도 중심좌표에 마커를 생성합니다 
        position: map2.getCenter() 
    }); 
    // 지도에 마커를 표시합니다
    marker2.setMap(map2);

    // 지도에 클릭 이벤트를 등록합니다
    // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
    kakao.maps.event.addListener(map2, 'click', function(mouseEvent) {        
        
        // 클릭한 위도, 경도 정보를 가져옵니다 
        var latlng = mouseEvent.latLng; 
        
        // 마커 위치를 클릭한 위치로 옮깁니다
        marker2.setPosition(latlng);
    });
    
});
	 
	 $('#group').on("click", function() {
		   var meetYearValue = $('#meetYear').val();
		   var meetMonValue = $('#meetMon').val();
		   var meetNameValue = $('#meetName').val();
		   var combinedValue = meetYearValue + '년 ' + meetMonValue+ '월 ' + meetNameValue;
		
		$('#result').text(combinedValue);
	});
});


/* 시작할때 */
$(document).ready(function() {
   /* 썸머노트 시작 */
   $('#summernote').summernote({
        placeholder: '내용을 입력하세요',
        tabsize: 2,
        lang: 'ko-KR', // default: 'en-US'
        height: 500, // set editor height
        width: 620,
        minHeight: 500, // set minimum height of editor
        maxHeight: 500, // set maximum height of editor
        focus: true, // set focus to editable area after initializing summernote
        toolbar: [
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline']],
            ['color', ['color']],
            ['para', ['paragraph']],
            ['insert', ['picture', 'video']],
            ['view', ['codeview']],
            ['custom', ['vote']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana', 'Tahoma', 'Courier New', '맑은 고딕', '굴림', '돋움'],
        fontNamesIgnoreCheck: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana', 'Tahoma', 'Courier New', '맑은 고딕', '굴림', '돋움'],
        buttons: {
            vote: CustomButton // 버튼 동작을 처리하는 함수
        },
        callbacks: {
        	onImageUpload: function(files, editor){
        		uploadSummernoteImageFile(files[0], this);
        	}
        
        }
   });
});

function uploadSummernoteImageFile(file, editor){
	console.log("파일업로드  <img src=>");
	
	data = new FormData(); 
	data.append("file",file); 
	
	console.log(file);
	console.log("gg"+editor);
	
	//ajax통신  -> 요청은 같은 기술 , 응답 이 데이터만 온다
	$.ajax({
		url : "${pageContext.request.contextPath }/"+${requestScope.clubId}+"/notice/upload",		
		type : "post",
		/* contentType : "application/json", */
		data : data, 
		contentType:false, 
        processData:false, 
		
		dataType : "json",
		success : function(jsonResult){
			/* 성공시 처리해야될 코드 작성 */
			if(jsonResult.data != null){
			     var imageUrl = '${pageContext.request.contextPath }/upload/' + jsonResult.data ;
			     var style = 'width: 25%';
			     
			     $img = $('<img>').attr({ src: imageUrl }).css("width", "25%")
                 $(editor).summernote('insertNode', $img[0]);
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
}

/* 섬머노트버튼 투표모달창 */
function CustomButton(context) {
    var ui = $.summernote.ui;
    var button = ui.button({
        contents: 'vote',
        tooltip: 'vote Button',
        click: function() {
            // 버튼을 클릭했을 때 수행할 동작을 여기에 작성합니다.
            //alert('Custom button clicked!');
            var modalContent = $('.modal-body');
            // 모달 띄우기
            $('#group').modal('show');
        }
    });
    return button.render();
}

</script>

<script>
$('#searchButton').click(function(event) {
    // 마커를 담을 배열입니다
   var markers = [];
    
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = {
           center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
           level: 1 // 지도의 확대 레벨
       };  
   
   // 지도를 생성합니다    
   var map = new kakao.maps.Map(mapContainer, mapOption); 
   
   // 장소 검색 객체를 생성합니다
   var ps = new kakao.maps.services.Places();  
   
   // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
   var infowindow = new kakao.maps.InfoWindow({zIndex:1});
   
   // 키워드로 장소를 검색합니다
   searchPlaces();
   
   
   // 키워드 검색을 요청하는 함수입니다
   function searchPlaces() {
   
       var keyword = document.getElementById('keyword').value;
   
       if (!keyword.replace(/^\s+|\s+$/g, '')) {
           alert('키워드를 입력해주세요!');
           return true;
       }
   
       // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
       ps.keywordSearch(keyword, placesSearchCB); 
       console.log(keyword);
   }
   
	   // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
   function placesSearchCB(data, status, pagination) {
       if (status === kakao.maps.services.Status.OK) {
   
           // 정상적으로 검색이 완료됐으면
           // 검색 목록과 마커를 표출합니다
           displayPlaces(data);
   
           // 페이지 번호를 표출합니다
           displayPagination(pagination);
   
       } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
   
           alert('검색 결과가 존재하지 않습니다.');
           return;
   
       } else if (status === kakao.maps.services.Status.ERROR) {
   
           alert('검색 결과 중 오류가 발생했습니다.');
           return;
       }
   }
   
   // 검색 결과 목록과 마커를 표출하는 함수입니다
   function displayPlaces(places) {
   
       var listEl = document.getElementById('placesList'), 
       menuEl = document.getElementById('menu_wrap'),
       fragment = document.createDocumentFragment(), 
       bounds = new kakao.maps.LatLngBounds(), 
       listStr = '';
       
       // 검색 결과 목록에 추가된 항목들을 제거합니다
       removeAllChildNods(listEl);
   
       // 지도에 표시되고 있는 마커를 제거합니다
       removeMarker();
       
       for ( var i=0; i<places.length; i++ ) {
   
           // 마커를 생성하고 지도에 표시합니다
           var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
               marker = addMarker(placePosition, i), 
               itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
   
           // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
           // LatLngBounds 객체에 좌표를 추가합니다
           bounds.extend(placePosition);
   
           // 마커와 검색결과 항목에 mouseover 했을때
           // 해당 장소에 인포윈도우에 장소명을 표시합니다
           // mouseout 했을 때는 인포윈도우를 닫습니다
           (function(marker, title) {
               kakao.maps.event.addListener(marker, 'mouseover', function() {
                   displayInfowindow(marker, title);
               });
   
               kakao.maps.event.addListener(marker, 'mouseout', function() {
                   infowindow.close();
               });
   
               itemEl.onmouseover =  function () {
                   displayInfowindow(marker, title);
               };
   
               itemEl.onmouseout =  function () {
                   infowindow.close();
               };
           })(marker, places[i].place_name);
   
           fragment.appendChild(itemEl);
       }
   
       // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
       listEl.appendChild(fragment);
       menuEl.scrollTop = 0;
   
       // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
       map.setBounds(bounds);
   }
   


	   // 지도에 클릭 이벤트를 등록합니다
   // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
   kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
      var latlng = mouseEvent.latLng;
      
      var x = latlng.getLat();
      var y = latlng.getLng();
      
      console.log('x:', x);
      console.log('y:', y);
      
      document.getElementById('address1').value = x;
      document.getElementById('address2').value = y;
      
      $(".map_wrap").hide();
   });
   
   // 검색결과 항목을 Element로 반환하는 함수입니다
   function getListItem(index, places) {
   
       var el = document.createElement('li'),
       itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                   '<div class="info">' +
                   '   <h5>' + places.place_name + '</h5>';
   
       if (places.road_address_name) {
           itemStr += '    <span>' + places.road_address_name + '</span>' +
                       '   <span class="jibun gray">' +  places.address_name  + '</span>';
       } else {
           itemStr += '    <span>' +  places.address_name  + '</span>'; 
       }
                    
         itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                   '</div>';           
   
       el.innerHTML = itemStr;
       el.className = 'item';
   
       return el;
   }
   
   // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
   function addMarker(position, idx, title) {
       var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
           imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
           imgOptions =  {
               spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
               spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
               offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
           },
           markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
               marker = new kakao.maps.Marker({
               position: position, // 마커의 위치
               image: markerImage 
           });
   
       marker.setMap(map); // 지도 위에 마커를 표출합니다
       markers.push(marker);  // 배열에 생성된 마커를 추가합니다
   
       return marker;
   }
   
   // 지도 위에 표시되고 있는 마커를 모두 제거합니다
   function removeMarker() {
       for ( var i = 0; i < markers.length; i++ ) {
           markers[i].setMap(null);
       }   
       markers = [];
   }
   
   // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
   function displayPagination(pagination) {
       var paginationEl = document.getElementById('pagination'),
           fragment = document.createDocumentFragment(),
           i; 
   
       // 기존에 추가된 페이지번호를 삭제합니다
       while (paginationEl.hasChildNodes()) {
           paginationEl.removeChild (paginationEl.lastChild);
       }
   
       for (i=1; i<=pagination.last; i++) {
           var el = document.createElement('a');
           el.href = "#";
           el.innerHTML = i;
   
           if (i===pagination.current) {
               el.className = 'on';
           } else {
               el.onclick = (function(i) {
                   return function() {
                       pagination.gotoPage(i);
                   }
               })(i);
           }
   
           fragment.appendChild(el);
       }
       paginationEl.appendChild(fragment);
   }
   
   // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
   // 인포윈도우에 장소명을 표시합니다
   function displayInfowindow(marker, title) {
       var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
   
       infowindow.setContent(content);
       infowindow.open(map, marker);
   }
   
    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
   function removeAllChildNods(el) {   
       while (el.hasChildNodes()) {
           el.removeChild (el.lastChild);
       }
   }
/*     function relayout() {    
       map.relayout();
   } */
});

function colorSet(){
    
    var color1 = "${club.color1}"   
    var color2 = "${club.color2}"   
    var color3 = "${club.color3}"   
    var color4 = "${club.color4}"   
    
    
    console.log(color1+ " " +color2 + " " + color3  + " " + color4 + " ");
        $('.ly-body-container').css('background-color',color1); // 배경색 수정1
        $('body').css('background-color',color1); // 배경색 수정2
        $('body').css('min-height','100vh'); //길이 수정(틀어짐 없게)
        $('.ly-head-container').css('background-color',color2); //탑바 컬러 지정
        $('.sd-color').css('background-color',color2); //사이드바의 컬러 지정
        $('.sd-color').css('color',color4); //사이드바의 텍스트 컬러 지정
        $('.sd-color').css('border-left','10px solid ' + color3); //사이드바의 그림자 컬러 지정
        $('.ct-border').css('color',color3); //사이드바쪽 관리자 메뉴가는 거
        $('.ct-color').css('background-color',color3); //버튼 컬러
        $('.ct-color').css('color',color4); //버튼의 텍스트 컬러
        $('.ct-color').css('border','1px solid ' +color4); //버튼의 텍스트 컬러

  }

</script>
</html>