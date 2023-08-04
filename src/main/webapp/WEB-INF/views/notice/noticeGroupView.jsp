<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>개인 게시판</title>
    <c:import url="/WEB-INF/views/include/topnav.jsp"></c:import>
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
						<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/clubimg/${club.img2}" alt="프로필사진" />
						<h2>${club.clubName}</h2>
			            <button type="button" class="listbtn" id="nlist">목록</button>
			            <button type="button" class="nextbtn">다음글</button>
					</div>		
					<!-- //diary-topbar -->
					
					<div class="diary-body">					
						<!-- 개인별코딩 ---------------------------------------------------------------->
													
			            <div class="noticeform">
			              <div class="noticeprofil">
			                  <img class="profileimg" src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" alt="">
			                  <span class="username">${vo.memberId }</span>
			                  <span class="userlevel">매니저</span><br>
			                  <div class="userp">
			                      <span>작성일 : </span>
			                      <span>${vo.aboardDate}</span>
			                      <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수 : </span>
			                      <span>${vo.aboardHit}</span>
			                  </div>
			              </div>
				          <div id="content_body">
				              <div>
				                  <p class="noticecontent">${vo.boardContent}</p>
				              </div>
				              
				                <table id="dataTableV" data-bs-toggle="modal" data-bs-target="#vote">
									<thead>
										<tr>
						                   <th class="nglist">
						                       <p><span>투표 제목 : </span>${vo.voteTitle}</p>
						                   </th>
						                </tr>
					               </thead>
					               <tbody>
					                   <tr>
					                     <td class="ngname">
					                         <p><span>투표1 : </span>${vo.vote1}</p>
					                         <p><span>투표2 : </span>${vo.vote2}</p>
					                         <p><span>투표3 : </span>${vo.vote3}</p>
					                         <p><span>투표4 : </span>${vo.vote4}</p>
					                         <p><span>투표5 : </span>${vo.vote5}</p>
					                         <p><span>최소인원 : </span>${vo.totalNum}</p>
					                         <p><span>투표종료일 : </span>${vo.finDate}</p>
					                         <input type="hidden" name="clubId" value="${clubId}">
				                        	 <input type="hidden" name="aboardNo" id="aboardNo" value="${vo.aboardNo}">
				                        	 <input type="text" name="voteNo" id="voteNo" value="${vo.voteNo}">
				                        	 <input type="hidden" name="memberId" id="memberId" value="${member.memberId}">${memberId}
					                     </td>
					                 </tr>
					               </tbody>
				               </table>
				               	<form action="${pageContext.request.contextPath }/${clubId }/notice/elmodifyform">
					                  <input type="hidden" name="aboardNo" value="${vo.aboardNo }">
					                  <button type="submit" id="modify">수정</button>
				                </form>
				                <form action="${pageContext.request.contextPath }/${clubId }/notice/eldelete">
					                  <input type="hidden" name="aboardNo" value="${vo.aboardNo }">
					                  <input type="hidden" name="voteNo" value="${vo.voteNo }">
					                  <button type="submit" id="delete">삭제</button>
				                </form>
			               <!-- 댓글 -->
			                  <div class="noticereply">
			        			<div class="board-area2" >
					    			<div class="board">
									    <div class="board-header">
					
									    	<div class="board-info" data-aboardno = "${vo.aboardNo}" ></div>
										    </div>
										    <div class="board-content" style="margin-top: 40px;">
										    <c:if test="${vo.likeNo == 0 }">
											    <span class="likecolor" data-bno = "${vo.aboardNo }"   data-likeno = "${vo.likeNo }" >♡</span>
											</c:if>
											<c:if test="${vo.likeNo > 0 }">
											    <span class="likecolor" data-bno = "${vo.aboardNo }"   data-likeno = "${vo.likeNo }">♥</span>
										    </c:if>
										    <span>좋아요 (<span class= "likeCnt">${vo.likeCnt}</span>)</span>
										    </div>
										    <div class="board-comment-list" style="margin-top: 40px; width: 900px;">
											    <div class="board-comment" >
											   
											    <h4>댓글</h4><span><button class="write-comment-btn">댓글 쓰기</button></span>
											    
											    <c:forEach items="${vo.replyList}" var = "reply">
											    
													<div class="comment-list" id = "r${vo.aboardNo}" style="height: 50p; margin-bottom: 10px;">
													
													    <div class="reply-area group${reply.replyGroup}" id = "c${reply.replyNo}">
													    	<c:if test="${reply.deep > 1 }">
													            <span style="padding-left:80px;"><b>&nbsp;&nbsp;&nbsp; <span class="re">↳</span>
													            <img class="diary-topbar-img1111" src="${pageContext.request.contextPath }/assets/images/testimg/img.jpg" alt="프로필사진" />
													            ${reply.memberName}님 : </b></span>
													        </c:if>
													        <c:if test="${reply.deep == 1 }">
													        	<img class="diary-topbar-img111" src="${pageContext.request.contextPath}/assets/images/testimg/img.jpg" alt="프로필사진" />
													            <span><b>${reply.memberName}님 :</b></span>
													        </c:if>
													        
													        <span>${reply.replyContent}</span><span style="float: right;">${reply.replyDate}</span>
													        <c:if test="${reply.deep == 1 && reply.stat == 1 }">
													           <span><button class= "rreply-btn" style="margin-left:2%; width:30px; border-radius: 5px; background-color: #1eafcc; color: #fff; font-weight: bold;" data-aboardno = "${vo.aboardNo}"  data-replyno = "${reply.replyNo}">답글</button></span>
													        </c:if>
													        <c:if test="${member.memberId == reply.memberId && reply.stat == 1 }">
														        	<span class="reply-delete" data-deletere = "${reply.replyNo}" data-deep = "${reply.deep}" style="float: right; margin-right: -16%; color:#ff6969;">&nbsp;삭제</span>
														    </c:if>
													    </div>
													</div>
													
											    </c:forEach>
						
												<div class="write-comment">
													<div class="new-content">
														<img class="diary-topbar-img11" src="${pageContext.request.contextPath}/assets/images/testimg/img.jpg" alt="프로필사진" />
										            	<textarea class= "comment-content" id="replyContent" name="replyContent" style="border: 1px solid #000; width: 750px; margin-top: 10px; "></textarea>
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
              
			        <div class="modal" id="vote">
			          <div class="modal-dialog">
			              <div class="modal-content">
			                  <div class="modal-header">
			                      <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			                  </div>
			                  <div class="modal-body">
			                  	<form action="${pageContext.request.contextPath }/${clubId }/notice/vote?aboardNo=${vo.aboardNo}" method="get">
									<div class="modalvotetitle">${vo.voteTitle}</div>
			                        <div class="voteleft">
			                        	<input type="hidden" name="clubId" value="${clubId}">
			                        	<input type="hidden" name="voteNo" value="${vo.voteNo}">
			                        	<input type="hidden" name="aboardNo" id="aboardNo" value="${vo.aboardNo}">
			                        	<input type="hidden" name="memberId" id="memberId" value="${member.memberId}">${memberId}
				                        <input type="radio" name="choice" id="1" value="1"><span class="votespan">${vo.vote1}</span><br>
				                        <input type="radio" name="choice" id="2" value="2"><span class="votespan">${vo.vote2}</span><br>
				                        <input type="radio" name="choice" id="3" value="3"><span class="votespan">${vo.vote3}</span><br>
				                        <input type="radio" name="choice" id="4" value="4"><span class="votespan">${vo.vote4}</span><br>
				                        <input type="radio" name="choice" id="5" value="5"><span class="votespan">${vo.vote5}</span><br>
			                        </div>
			                        <div style="text-align: center; font-weight: bold;">
			                			<button type="submit" class="modelbtnS" id="lastvote">투표완료</button>
			                        </div>
			                    </form>
			                   </div>
			              </div>
			          </div>
		      	</div>
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
    
</body>
<script>
  
$(document).ready(function () {
	
	$('.write-comment').hide();
	
	$('#nlist').click(function() {
		  window.location.href = '${pageContext.request.contextPath }/${clubId }/notice/noticelist'	
	});
   $("#lastvote").click(function() {
       // 기존 내용과 대체 내용의 가시성(visibility)을 토글
       $("#dataTable").toggle();
       $("#dataTable1").toggle();
   });

$('.noticereply').on("click",'.add-reply', function(){
	
	var replyContent = $('#replyContent').val();
	var memberName = $('.memberName').text();
	var memberId = $('#memberId').val();
	var aboardNo = $('#aboardNo').val();
	var replyDate = $('#replyDate').val();
	console.log(replyContent);
	console.log(memberName);
	console.log(memberId);
	console.log(aboardNo);
	console.log(replyDate);

	var aReplyVO = {
			aboardNo : aboardNo,
			replyContent : replyContent,
			memberId : memberId,
			memberName : memberName,
			replyDate : replyDate
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
	       console.error(status + " : " + error);
	       }
					            
	    });//ajax end
	    
	 $("#replyContent").val("");
	    
	 location.reload();//새로고침
});//기본 댓글 등록 버튼 클릭 이벤트 end

/*좋아요 클릭 이벤트*/
$('.noticereply').on("click",'.likecolor', function(){
	var aboardNo = $('#aboardNo').val();
	var likeNo = $(this).data('likeno');
	var memberId = $('#memberId').val();
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
	var memberId = $('#memberId').val();
	
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
	
	rreply += '<div style ="width:1000px; height:50px; margin-top:6px; " class="write-comment2" >';
	rreply += '    <span ></span><div class="new-content2" style ="width: 900px; height:50px; float: left; margin-left:40px;">';
	rreply += '        <img src="${pageContext.request.contextPath }/assets/images/icon/re.png" style ="width:20px; height:20px; margin-left:20px;"><textarea class= "comment-content" style ="width:800px; height:100%; border: 1px solid black; padding:10px; margin-left:10px;margin-bottom: -20px;"></textarea><button class="add-reply2" style="margin-left:2%; width:30px; border-radius: 5px; background-color: #1eafcc; color: #fff; font-weight: bold;" data-aboardno = "' + aboardNo +'"  data-groupno ="' + groupNo +  '">OK</button></div>'
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
	var aboardNo = $('#aboardNo').val();
	var likeNo = $(this).data('likeno');
	var memberId = $('#memberId').val();
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
	
	add += '<div  class="reply-area group' + reply.replyGroup  + '"id = "c'+reply.replyNo + '" >';
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
	
	window.history.forward();
	function noBack(){
		window.history.forward();
	}

  </script>
</html>
