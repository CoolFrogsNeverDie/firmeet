<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지 에디터</title>
    <c:import url="/WEB-INF/views/include/topnav.jsp"></c:import>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ba049cf132b7471f4a76ebf9ace329c&libraries=services,clusterer,drawing"></script>
    
	    <!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
</head>
<body>

<!----------------------------------------- top Navigation ----------------------------------------->
<%@ include file="../include/nav.jsp" %>

<div class="wrap">
      <div class="diary-area">
        <div class="diary-topbar">
          <img
            class="diary-topbar-img" src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" alt="프로필사진" />
          <h1>어푸어푸</h1>
        </div>
        <!--/diary-topbar-img-->
        <div class="diary-subbar">
          <h4>공지 게시판</h4>
        </div>
        <!--/diary-subbar-->
        <div class="content-area">
          <div class="content-left">

            <!-- 여기부터 작성 -->
           
            <div class="noticeform">
              <div>
                  <p class="noticetitle">${vo.title }</p>
                  <div class="noticebtn">
                    <button type="button" class="btn btn-warning" id="nlist">목록</button>
                    <button type="button" class="btn btn-success">다음글</button>
                  </div>
              </div>
              <div class="noticeprofil">
                  <img class="profileimg" src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" alt="">
                  <span class="username">${vo.memberId }</span>
                  <span class="userlevel">매니저</span><br>
                  <div class="userp">
                      <span class="userdate">작성일 : </span>
                      <span class="usertext">${vo.aboardDate}</span>
                      <span class="usercount">조회수 : </span>
                      <span class="usertext">${vo.aboardHit}</span>
                  </div>
              </div>
              <hr>
              <div>
                  <p class="noticecontent"> ${vo.boardContent}</p>
              </div>
                <table id="dataTable" style="width: 40%; float: left;">
					<thead>
					<tr>
	                     <th class="noticegrouplist">
	                         <p class="noticegroupname"><span>투표 제목 : </span>${vo.meetYear}<span>년&nbsp;</span>${vo.meetMon}<span>월&nbsp;</span>${vo.meetName}</p>
	                     </th>
	                   </tr>
	               </thead>
	               <tbody>
	                   <tr>
                       	  <td class="noticegrouplist1">
                             <span class="noticegroupname"><span>만남일 : </span>${vo.startDate}</span> ~ <span class="noticegroupname" id="endDate1"><span>종료일 : </span>${vo.endDate}</span>
                             <p class="noticegroupname"><span>만남시간 : </span>${vo.meetTime}</p>
                             <p class="noticegroupname"><span>만남장소 : </span>${vo.meetPlace}</p>
                             <p class="noticegroupname">회비 :<span id="price">${vo.price}</span></p>
                             <p class="noticegroupname"><span>투표종료일 : </span>${vo.voteEnd}</p>
                             <p class="noticegroupname"><span>최소인원 : </span>${vo.minPerson}</p>
                             <p class="noticegroupname"><span>최대인원 : </span>${vo.maxPerson}</p>
                             <p class="noticegroupname">address1 : <span id="address1">${vo.address1}</span></p>
                             <p class="noticegroupname">address2 : <span id="address2">${vo.address2}</span></p>
                             <button id="paybtn" onclick="kakaopay()">결제하기</button>
                          </td>
	                 </tr>
	               </tbody>
               </table>
               
               <div class="mapview">
               		<div id="map2" style="width:100%;height:250px;"></div>
               </div>
               
              <div class="like">
                  <span class="likecolor">♡</span><span>좋아요</span><span class="likecount">0</span>
              </div>
              
   		</div>
          <!-- 여기까지 -->
      <!-- -------------------------------------------------일반투표-------------------------------------------------------->
  </div>
          <!--/content-left-->
</div>
        <!--/content-area-->
    <div class="noticereply">
       <h4 class="noticereplytitle">댓글</h4>
       <div>
           <img class="profileimg" src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" alt=""> 
           <span class="username">홍순이</span>
           <p class="noticereplytext"></p>
           <span class="userdate">작성일 : </span>
           <p class="usertext"></p>
       </div>
   </div>
        
</div>
      <!--/diary-area-->
      <div class="menu-bar" >
        <div class="group-profile">
          <div class="group-profile-img-area">
            <img
              class="group-profile-img"
              src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg"
              alt="프로필사진"
            />
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
  <script src="${pageContext.request.contextPath }/assets/js/imgSlider.js"></script>
  <script>
  
  var price = $('#price').text();
  console.log(price);
  
  function kakaopay(){
  
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp51377887"); // 예: imp00000000
	
	IMP.request_pay({		
		pg : 'kakaopay',
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),   //주문번호
		name : 'firmeet',                                  //상품명
		amount : $('#price').text(),                    //가격
		//customer_uid : buyer_name + new Date().getTime(),  //해당 파라미터값이 있어야 빌링 키 발급 시도
		buyer_email : $('.sessionuserID').text(),             //구매자 이메일
		buyer_name : 'buyer_name',                           //구매자 이름
		buyer_tel : 'hp',                                    //전화번호
		buyer_addr : 'addr',	                             //주소
	},function(data){
		if(data.success){
			console.log('빌링키 발급 성공', data)
			alert("결제가 완료되었습니다.")
        }else{
        	var msg = "결제 실패"
        	msg += "에러 내용" + data.error_msg;
        	alert(msg);
        	return false;
        }
		$("#paybtn").submit();
	});
 }
	
/*   function (rsp) {
      console.log(rsp);
      if (rsp.success) {
        var msg = '결제가 완료되었습니다.';
        alert(msg);
        location.href = "결제 완료 후 이동할 페이지 url"
      } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        alert(msg);
      }
    } */
</script>
<script>
  $(document).ready(function() {
	  
	  $('#nlist').click(function() {
		  window.location.href = '${pageContext.request.contextPath }/${clubId }/notice/noticelist'	
	  });
	  
	  var address1 = $("#address1").text();
	  var address2 = $("#address2").text();
		console.log('ㅎㅎ',address1);
		console.log(address2);
		var NoticeBoardVO ={
				address1 : address1,
				address2 :  address2
		}
		//통신  id////////////////////////////////////////////
		$.ajax({
        url: '${pageContext.request.contextPath }/notice/address', // 서버의 엔드포인트 URL을 적절하게 변경해야 합니다.
        method: 'POST',
        data: NoticeBoardVO,
        dataType: 'json',
        
        success: function(jsonResult) {
        	console.log(jsonResult)
        	var data = jsonResult.data;
        	
        	if(jsonResult.result == 'success'){
        		if(jsonResult.data != null){
        			$("#address11").val(data.address1);
        			$("#address22").val(data.address2);
        			console.log(data.address1);
        			console.log(data.address2);
        		}else{
        			$("#x").html("사용불가");
        		}
        	}else {
				//메세지 출력
				var msg = jsonResult.failMsg;
				alert(msg);
			}
        	
        	//var data = jsonResult.data;
        },
        error: function(xhr, status, error) {
            // 오류 처리
            console.error('Error:', error);
        }
    });
	console.log('zz',address1);
    
/* map2 */        
   	var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
        mapOption2 = { 
            center: new kakao.maps.LatLng(address1, address2), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
   	};
   	console.log(address1, address2);
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
    map2.setZoomable(true);   
    
});
</script>
</html>