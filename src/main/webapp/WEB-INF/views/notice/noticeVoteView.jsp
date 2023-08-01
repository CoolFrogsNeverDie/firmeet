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
	<link href="${pageContext.request.contextPath}/assets/css/main2_test.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/assets/css/noticestyle.css" rel="stylesheet" type="text/css" />
</head>
<body>

<!----------------------------------------- top Navigation ----------------------------------------->
<%@ include file="../include/nav.jsp" %>

<div class="wrap">
      <div class="diary-area">
        <div class="diary-topbar">
          <img
            class="diary-topbar-img" src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" alt="프로필사진" />
          <h1>${club.clubName}</h1>
        </div>
        <!--/diary-topbar-img-->
        <div class="diary-subbar" style="border : none;">
          <h4>공지 게시판</h4>
        </div>
        <!--/diary-subbar-->
        <div class="content-area">
          <div class="content-left">

            <!-- 여기부터 작성 -->
           
            <div class="noticeform">
              <div>
                  <p class="noticetitle">제목 :&nbsp;&nbsp;${vo.title }</p>
                  <div class="noticebtn">
                    <button type="button" class="listbtn" id="nlist">목록</a></button>
                    <button type="button" class="nextbtn">다음글</button>
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
        <div id="content_body">
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
	                             <p class="noticegroupname" hidden="hidden">address1 : <span id="address1">${vo.address1}</span></p>
	                             <p class="noticegroupname" hidden="hidden">address2 : <span id="address2">${vo.address2}</span></p>
	                             <p class="noticegroupname" hidden="hidden">aboardNo : <span id="aboardNo">${vo.aboardNo}</span></p>
	                             <p class="paycount">현재인원 : <span id="paycount">${vo.paycount}</span> / <span>최대인원 : </span>${vo.maxPerson}</p>
	                             <span id="memberId">${member.memberId}</span>/<span id="aboardNo">${vo.aboardNo}</span>/<span id="meetNo">${vo.meetNo}</span>/
	                             <span id="paycount">${vo.paycount}</span>/<span id="payresultNo">${vo.payresultNo}</span>
	                             <button id="paybtn" onclick="kakaopay()">결제하기</button>
	                          </td>
		                 </tr>
		               </tbody>
	               </table>
               <div class="mapview">
               		<div id="map2" style="width:91%;height:250px;"></div>
               </div>
               
                             <!-- 댓글 -->
                  <div class="noticereply">
        			<div class="board-area2" >
		    			<div class="board">
						    <div class="board-header">
		
						    	<div class="board-info" data-aboardno = "${vo.aboardNo}" ></div>
							    </div>
							    <div class="board-content" style="margin-left: 20px; margin-top: 20px;">
							    <c:if test="${vo.likeNo == 0 }">
								    <span class="likecolor" data-bno = "${vo.aboardNo }"   data-likeno = "${vo.likeNo }" >♡</span>
								</c:if>
								<c:if test="${vo.likeNo > 0 }">
								    <span class="likecolor" data-bno = "${vo.aboardNo }"   data-likeno = "${vo.likeNo }">♥</span>
							    </c:if>
							    <span>좋아요 (<span class= "likeCnt">${vo.likeCnt}</span>)</span>
							    </div>
							    <div class="board-comment-list" style="margin-top: 40px; margin-left:30px; width: 900px;">
								    <div class="board-comment" >
								   
								    <h5>댓글</h5><!-- <span><button class="write-comment-btn">댓글 닫기</button></span> -->
								    
								    <c:forEach items="${vo.replyList}" var = "reply">
								    
										<div class="comment-list" id = "r${vo.aboardNo}" style="margin-left: 30px;">
										
										    <div class="reply-area group${reply.replyGroup}" id = "c${reply.replyNo}">
										    	<c:if test="${reply.deep > 1 }">
										            <span><b>&nbsp;&nbsp;&nbsp; <span class="re">↳</span>${reply.memberName}님 : </b></span>
										        </c:if>
										        <c:if test="${reply.deep == 1 }">
										            <span><b>${reply.memberName}님 :</b></span>
										        </c:if>
										        <span style="margin-left: 1%;">${reply.replyContent}</span><span style="float: right;">${reply.replyDate}</span>
										        <c:if test="${reply.deep == 1 && reply.stat == 1 }">
										           <span><button class= "rreply-btn" data-aboardno = "${vo.aboardNo}"  data-replyno = "${reply.replyNo}">답글</button></span>
										        </c:if>
										        <c:if test="${member.memberId == reply.memberId && reply.stat == 1 }">
											        	<span class="reply-delete" data-deletere = "${reply.replyNo}" data-deep = "${reply.deep}" style="float: right; margin-right: 1%;">&nbsp;삭제</span>
											    </c:if>
										    </div>
										</div>
										
								    </c:forEach>
			
									<div class="write-comment">
										<div class="new-content">
							            	<textarea class= "comment-content" id="replyContent" name="replyContent" style="border: 1px solid #000; width: 820px; margin-top: 10px;"></textarea>
							            	<button class="add-reply" data-boardno ="${vo.aboardNo}">등록</button>
				            			</div>
								    </div>
							    </div>
						    </div>
					    </div>
			        </div>
			   </div>
               
              <!-- 댓글 끝 -->  
               
               
        </div>
              
   	</div>
          <!-- 여기까지 -->
      <!-- -------------------------------------------------일반투표-------------------------------------------------------->
  </div>
          <!--/content-left-->
</div>
        <!--/content-area-->
        
</div>
      <!--/diary-area-->
	<c:import url="/WEB-INF/views/include/side_nav_update.jsp"></c:import>
      <!--/menu-bar-->
    </div>
    <!--/wrap-->
  </body>
  <script src="${pageContext.request.contextPath }/assets/js/imgSlider.js"></script>
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
        url: '${pageContext.request.contextPath }/${clubId}/notice/address', // 서버의 엔드포인트 URL을 적절하게 변경해야 합니다.
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
//---------------------------------------------------------------------------------------
$(document).ready(function () {
	
    $('.noticereply').on("click",'.add-reply', function(){
    	
    	var textbox = $(this).prev();
		var replyContent = textbox.val();
		var aboardNo = $('#aboardNo').text();
		var memberId = $('#memberId').text();
    	
    	console.log(textbox);
    	console.log(replyContent);
    	console.log(aboardNo);
    	console.log(memberId);

    	var aReplyVO = {
    			aboardNo : aboardNo,
    			replyContent : replyContent,
				memberId : memberId
    	}
    	
    	if(replyContent.length < 5){
    		alert('댓글을 다섯글자 이상 입력해주세요.');
    		return;
    	}
    	
    	 $.ajax({
    	       //요청 세팅
    	       url : "${pageContext.request.contextPath}/${clubId}/notice/addReply",
    	       type : "post",
    	       data : aReplyVO,
    	       
    	       //응답 세팅
    	       dataType : "json",
    	       success : function(jsonResult){
    				console.log(jsonResult);
    				var reply = jsonResult.data;
    				var addElement = $('#r'+reply.aboardNo);
    					console.log(reply);
    					console.log(addElement);
    	    			$("#replyContent").text(replyContent);
    	    			$("#replyDate").text(reply.replyDate);
    	    			$("#memberName").text(reply.memberName);
    	    			console.log(replyContent);
    	    			console.log(reply.replyDate);
    	    			console.log(reply.memberName);
    	    			
    	    			addReply(addElement,reply,'re');
    				
    	       }, //success end
    	       error : function(XHR, status, error) {
    	    	   alert("에러");
    	       
    	       }
    					            
    	    });//ajax end
    	    
    	 $("#replyContent").val("");
    	    
    	 location.reload();//새로고침
    });//기본 댓글 등록 버튼 클릭 이벤트 end



    /*------------ 댓글 삭제 이벤트 ------------*/

    $('.noticereply').on("click", '.reply-delete', function(){

    var replyNo	 =	$(this).data('deletere');
    var deep	 =	$(this).data('deep');
    var memberId = $('#memberId').val();
    var replyEle = $('#c' + replyNo);
    var textarea = replyEle.find('span:eq(1)');

    var ReplyVO = {
    		replyNo : replyNo,
    		memberId : memberId,
    		deep : deep
    }

    $.ajax({
           
           //요청 세팅
           url : "${pageContext.request.contextPath}/${clubId}/notice/deleteReply",
           type : "post",
           data : ReplyVO,
           
           //응답 세팅
           dataType : "json",
           success : function(jsonResult){
    			
        	   var data = jsonResult.data;
        	   console.log(data);
        	   //삭제했다는 거
        	   if(data == true){
        		   replyEle.remove();
        	   }else{
        		   textarea.text("삭제된 댓글입니다.")
        	   }

           }, //success end
           error : function(XHR, status, error) {
           console.error(status + " : " + error);
           }
    				            
        });//ajax end
    });

    /*------------ 리댓글 등록 클릭 이벤트 (댓글의 댓글) ------------*/

    $('.noticereply').on("click", ".add-reply2", function(){
    	var textbox = $(this).prev();
    	var content = textbox.val();
    	var groupNo = $(this).data('groupno');
    	var aboardNo = $(this).data('aboardno');
    	var memberId = $('#memberId').text();
    	
    	console.log('teest' +  content + '그룹 번호 : ' +  groupNo + '게시글 번호 :' + aboardNo + memberId);
    	
    	var ReplyVO = {
    			aboardNo : aboardNo,
    			memberId : memberId,
    			replyContent : content,
    			replyGroup : groupNo
    	}
    	
    	console.log(ReplyVO);

    	 $.ajax({
           
           //요청 세팅
           url : "${pageContext.request.contextPath}/${clubId}/notice/addReply_2",
           type : "post",
           data : ReplyVO,
           
           //응답 세팅
           dataType : "json",
           success : function(jsonResult){
        	   var data = jsonResult.data;
        	   console.log(data);
        	   
        	   addReply(null, data, 'rere');
        	   console.log(addReply);
        	   $('.write-comment2').remove();
        	   
           }, //success end
           error : function(XHR, status, error) {
           console.error(status + " : " + error);
           }
           	            
        });//ajax end
        location.reload();//새로고침	
    });

    /*------------리댓 등록 창 그리는 이벤트------------*/

    $('.noticereply').on("click",'.rreply-btn', function(){

    var writeCommentDiv = $(this).closest('.write-comment2');

    var replyEditDiv = $(this).closest('.reply-area');
    var groupNo = $(this).data('replyno');
    var aboardNo = $(this).data('aboardno');

    console.log('wth' + groupNo);	

    var tag = $(this).parent().siblings(".write-comment2").attr('class');

    console.log(tag);	

    if(tag == null){
    	var	rreply = '';	
    	
    	rreply += '<div style ="width:1030px; height:50px; margin-top:6px; " class="write-comment2" >';
    	rreply += '    <span ></span><div class="new-content2" style ="width: 1000px; height:50px; float: left;">';
    	rreply += '        <img src="${pageContext.request.contextPath }/assets/images/icon/re.png" style ="width:20px; height:20px; margin-top:-50px; margin-left:20px;"><textarea class= "comment-content" style ="width:900px; height:100%; border: 1px solid black; padding:10px; margin-left:10px;"></textarea><button class="add-reply2" style="margin-left:2%; width:30px; border-radius: 5px; background-color: #1eafcc; color: #fff; font-weight: bold;" data-aboardno = "' + aboardNo +'"  data-groupno ="' + groupNo +  '">OK</button></div>'
    	rreply += '    </div>'
    	rreply += '</div>'

    	replyEditDiv.append(rreply);
    }else {
    	$('.write-comment2').remove();
    } 

    });
    /*------------//리댓 등록 창 그리는 이벤트//------------*/


    /*------------ 댓글 쓰기 창 오픈 버튼 클릭 토글 ------------*/
    $('.noticereply').on("click",'.write-comment-btn',function(){
     var writeCommentDiv = $(this).closest('.board-comment').find('.write-comment');
      if (writeCommentDiv.is(':visible')) {
    	    writeCommentDiv.hide();
    	  } else {
    	    writeCommentDiv.show();
    	  }
    });


    /*좋아요 클릭 이벤트*/
    $('.noticereply').on("click",'.likecolor', function(){
    	var aboardNo = $('#aboardNo').text();
    	var likeNo = $(this).data('likeno');
    	var memberId = $('#memberId').text();
    	var element = $(this);
    	var likeCntEle =  $(this).next('span').children();
    	var likeCnt = likeCntEle.text();
    	console.log(aboardNo);
    	console.log(likeNo);
    	console.log(memberId);
    	console.log(element);
    	console.log(likeCntEle);
    	console.log(likeCnt);
    	
    	noticeboardVO = {
    			aboardNo : aboardNo,
    			memberId : memberId,
    			likeNo : likeNo
    	}
    	
    	$.ajax({
    	       
    	       //요청 세팅
    	       url : "${pageContext.request.contextPath}/${clubId}/notice/likeCnt",
    	       type : "post",
    	       data : noticeboardVO,
    	       
    	       //응답 세팅
    	       dataType : "json",
    	       success : function(jsonResult){
    				var result = jsonResult.data;
    				console.log(result);
    	    		//이미 좋아요가 눌러져 있었으면 좋아요에 있던 좋아요no 데이터로 좋아요 취소 + ♥ 가 ♡
    				if(result == null){
    					element.text('♡');
    					element.data('likeno',0);
    					likeCntEle.text(Number(likeCnt)-1);
    	    		//내가 누른 좋아요가 없었으면 좋아요 올리기 ♡ 가 ♥
    	    		}else{
    					element.text('♥');
    	    			element.data('likeno',result.likeNo);
    					likeCntEle.text(Number(likeCnt)+1);
    	    		}
    	       }, //success end
    	       error : function(XHR, status, error) {
    	       console.error(status + " : " + error);
    	       }
    					            
    	    });//ajax end
    	
    });//좋아요 이벤트 end

 });
    /*리댓글 html 그리는 거*/
    function addReply(element,reply, type){

    var add ="";
    add += '<div  class="reply-area group' + reply.replyGroup  + '" id = "c'+reply.replyNo + '">';
    if (reply.deep > 1) {
        add += '<span><b>&nbsp;&nbsp;&nbsp;<span class="re">↳</span> ' + reply.memberName + '님 : </b></span>';
    } else if (reply.deep === 1) {
        add += '<span><b>' + reply.memberName + '님 : </b></span>';
    }
    add += '<span>' + reply.replyContent + '</span>';
    if (reply.deep === 1) {
        add += '<span><button class= "rreply-btn" data-aboardno ="' + reply.aboardNo +  '"   data-replyno ="' + reply.replyNo + '">답글</button></span>';
    }
    add += '<div class="reply-edit">';
    add += '<span>' + reply.replyDate + '</span>';
    add += '<span class="reply-delete" data-deletere ="'+ reply.replyNo +'"  data-deep = "'+reply.deep+'">&nbsp;삭제</span>';
    add += '</div></div>';

    if(type == 're'){
    		element.append(add);
    }else{
    	   	var last = $('.group' + reply.replyGroup).last();
    	 	last.after(add);
    }

    }//리댓글 그리는 function end
    
//--------------------------------------------------------------------------------------------------------

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
		amount : $('#price').text(),//가격
		//customer_uid : buyer_name + new Date().getTime(),  //해당 파라미터값이 있어야 빌링 키 발급 시도
		buyer_email : $('.sessionuserID').text(),             //구매자 이메일
		buyer_name : 'buyer_name',                           //구매자 이름
		buyer_tel : 'hp',                                    //전화번호
		buyer_addr : 'addr',	                             //주소
	},function(data){
		if(data.success){
			console.log('빌링키 발급 성공', data)
			alert("결제가 완료되었습니다.")
			
				  var memberId = $('#memberId').text();
	  			  var meetNo = $('#meetNo').text();
	  			  var paycount = $('#paycount').text();
	  			  var payresultNo = $('#payresultNo').text();
					console.log('ㅎㅎ',memberId);
					console.log(meetNo);
					console.log('ㅎㅎ',paycount);
					console.log(payresultNo);
				var NoticeBoardVO ={
							memberId : memberId,
							meetNo :  meetNo,
							payresultNo : payresultNo,
							paycount : paycount
					}
					//통신  id////////////////////////////////////////////
					$.ajax({
			        url: '${pageContext.request.contextPath }/${clubId }/notice/pay', // 서버의 엔드포인트 URL을 적절하게 변경해야 합니다.
			        method: 'POST',
			        data: NoticeBoardVO,
			        dataType: 'json',
			        
			        success: function(jsonResult) {
			        	console.log(jsonResult)
			        	var data = jsonResult.data;
			        	
			        	if(jsonResult.result == 'success'){
			        		if(jsonResult.data != null){
			        			$("#memberId").val(data.memberId);
			        			$("#meetNo").val(data.meetNo);
			        			$("#paycount").text(data.paycount);
			        			data.paycount++;
			        			$("#payresultNo").text(data.payresultNo);
			        			console.log(data.memberId);
			        			console.log(data.meetNo);
			        			console.log(data.paycount);
			        			console.log(data.payresultNo); 
			        			$("#paybtn").hide();
			        			//window.location.href = '${pageContext.request.contextPath }/${clubId }/notice/payresult?memberId='+data.memberId+'&meetNo='+data.meetNo;
			        		}else{
			        			$("#x").html("사용불가");
			        		}
			        	}else {
							//메세지 출력
							var msg = jsonResult.failMsg;
							alert(msg);
						}
			        },
			        error: function(xhr, status, error) {
			            // 오류 처리
			            console.error('Error:', error);
			        }
			    });
				
		}else{
        	var msg = "결제 실패"
        	msg += "에러 내용" + data.error_msg;
        	alert(msg);
        	return false;
        }
		$("#paybtn").submit();
	});
 }
</script>
</html>