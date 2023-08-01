<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지 에디터</title>
    <c:import url="/WEB-INF/views/include/topnav.jsp"></c:import>
    <link href="${pageContext.request.contextPath}/assets/css/main2_test.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/assets/css/noticestyle.css" rel="stylesheet" type="text/css" />
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();">

<!----------------------------------------- top Navigation ----------------------------------------->
<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>

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
              
                <table id="dataTable" data-bs-toggle="modal" data-bs-target="#vote">
					<thead>
					<tr>
	                     <th class="noticegrouplist">
	                         <p class="noticegroupname"><span>투표 제목 : </span>${vo.voteTitle}</p>
	                     </th>
	                   </tr>
	               </thead>
	               <tbody>
	                   <tr>
	                     <td class="noticegrouplist1">
	                     	<input type="text" name="clubId" hidden="hidden" value="${clubId}">
                        	<input type="text" name="aboardNo" hidden="hidden" id="aboardNo" value="${vo.aboardNo}">
                        	<input type="text" name="memberId" hidden="hidden" id="memberId" value="${member.memberId}">${memberId}<br>
	                         <p class="noticegroupname"><span>투표1 : </span>${vo.vote1}</p>
	                         <p class="noticegroupname"><span>투표2 : </span>${vo.vote2}</p>
	                         <p class="noticegroupname"><span>투표3 : </span>${vo.vote3}</p>
	                         <p class="noticegroupname"><span>투표4 : </span>${vo.vote4}</p>
	                         <p class="noticegroupname"><span>투표5 : </span>${vo.vote5}</p>
	                         <p class="noticegroupname"><span>최소인원 : </span>${vo.totalNum}</p>
	                         <p class="noticegroupname"><span>투표종료일 : </span>${vo.finDate}</p>
	                     </td>
	                 </tr>
	               </tbody>
               </table>
               
               <table id="dataTable1" style="display: none;">
					<thead>
					<tr>
	                     <th class="noticegrouplist">
	                         <p class="noticegroupname"><span>투표 제목 : </span>${vo.voteTitle}</p>
	                     </th>
	                   </tr>
	               </thead>
	               <tbody>
	                   <tr>
	                     <td class="noticegrouplist1">
	                         <p class="noticegroupname"><span>투표1 : </span>${vo.vote1}<span id="Count">${vo.vote1Cnt }</span></p>
	                         <p class="noticegroupname"><span>투표2 : </span>${vo.vote2}<span id="Count">${vo.vote2Cnt }</span></p>
	                         <p class="noticegroupname"><span>투표3 : </span>${vo.vote3}<span id="Count">${vo.vote3Cnt }</span></p>
	                         <p class="noticegroupname"><span>투표4 : </span>${vo.vote4}<span id="Count">${vo.vote4Cnt }</span></p>
	                         <p class="noticegroupname"><span>투표5 : </span>${vo.vote5}<span id="Count">${vo.vote5Cnt }</span></p>
	                         <p class="noticegroupname"><span>최소인원 : </span>${vo.totalNum}</p>
	                         <p class="noticegroupname"><span>투표종료일 : </span>${vo.finDate}</p>
	                         <p>${vo.clubId}${vo.aboardNo}${member.memberId}${vo.aboardNo}</p>
	                     </td>
	                 </tr>
	               </tbody>
               </table>
               
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
              
        <div class="modal" id="vote">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                  </div>
                  <div class="modal-body">
                  	<form action="${pageContext.request.contextPath }/${clubId }/notice/vote?aboardNo=${vo.aboardNo}" method="get">
						${vo.voteTitle}
                        <div class="voteleft">
                        	<input type="text" name="clubId" value="${clubId}"><br>
                        	<input type="text" name="voteNo" value="${vo.voteNo}"><br>
                        	<input type="text" name="aboardNo" id="aboardNo" value="${vo.aboardNo}"><br>
                        	<input type="text" name="memberId" id="memberId" value="${member.memberId}">${memberId}<br>
                            <input type="radio" name="choice" id="1" value="1"><span class="votespan">${vo.vote1}</span><br>
                            <input type="radio" name="choice" id="2" value="2"><span class="votespan">${vo.vote2}</span><br>
                           	<input type="radio" name="choice" id="3" value="3"><span class="votespan">${vo.vote3}</span><br>
                           	<input type="radio" name="choice" id="4" value="4"><span class="votespan">${vo.vote4}</span><br>
                           	<input type="radio" name="choice" id="5" value="5"><span class="votespan">${vo.vote5}</span><br>
                        </div>
                        <div style="text-align: center; font-weight: bold;">
                			<button type="submit" class="btn btn-success btn-sm" id="lastvote">투표완료</button>
                        </div>
                    </form>
                   </div>
              </div>
          </div>
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
<script>
  
$(document).ready(function () {
	
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

window.history.forward();
function noBack(){
	window.history.forward();
}

  </script>
</html>