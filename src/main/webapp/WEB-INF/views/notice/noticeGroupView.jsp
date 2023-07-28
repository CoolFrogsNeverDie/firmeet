<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지 에디터</title>
    <c:import url="/WEB-INF/views/include/topnav.jsp"></c:import>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

<!----------------------------------------- top Navigation ----------------------------------------->
<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>

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
                    <button type="button" class="btn btn-warning" id="nlist">목록</a></button>
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
	                     </td>
	                 </tr>
	               </tbody>
               </table>
      	</div>
      	<div>
			<a class="text-dark heart" style="text-decoration-line: none;">
			<img id="heart" src="${pageContext.request.contextPath }/assets/images/icon/heart.svg">좋아요</a>
			<span class="likecount">0</span>
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
    <div class="noticereply">
       <h4 class="noticereplytitle">댓글</h4>
       <div>
            <input type="hidden" name="clubId" value="${clubId}">
         	<input type="hidden" name="aboardNo" id="aboardNo" value="${vo.aboardNo}">
         	<input type="hidden" name="memberId" id="memberId" value="${member.memberId}">${memberId}
           <img class="profileimg" src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" alt=""> 
           <span class="memberName">${member.memberName }</span>
           <input type="text" class="replyContent" id="replyContent" name="replyContent">
           <input type="text" class=replyDate id="replyDate" name="replyDate">
           <button type="button" class="add-reply">등록</button>
       </div>
       <div id="replylist">
	       <c:forEach items="${vo.replyList}" var = "reply">
	       		<span id="memberName">${reply.memberName}</span><span id="replyContent">${reply.replyContent}</span><span id="replyDate">${reply.replyDate}</span><button class="reply-btn">답글</button><br>
	       		<div class="rreply" style="height: 20px; display: none;">
				  <input type="text" id="replyInput" class="toggle-element" />
				  <button class="add-reply2">등록</button>
				</div>
	       		<%-- <span id="memberName">${reply.memberName}</span><span id="replyContent">${reply.replyContent}</span><span id="replyDate">${reply.replyDate}</span>${reply.replyGroup}${reply.deep}<br> --%>
	       	function addReply();
	       </c:forEach>
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
  
  function listReply(){
	$.ajax({
		type : "get",
		url : "${pageContext.request.contextPath}/${clubId}/notice/rlist",
		success : function(result){
			$("#listReply").html(result);
		}
	});
}
  
$(document).ready(function () {
	
	  $(".reply-btn").click(function() {
		    // 클릭한 답글 버튼에 해당하는 input 박스 보이기
		    //$(".rreply").show();
		    var target = $(this).data("target");

		    // 해당 요소를 보이도록 함
		    $("#" + target).show();

		    // 다른 요소는 숨김 처리
		    $(".toggle-element").not("#" + target).hide();
		  });

	// 좋아요가 있는지 확인한 값을 heartval에 저장
	       var heartval = ${vo.likeNo}
	       // heartval이 1이면 좋아요가 이미 되있는것이므로 heart-fill.svg를 출력하는 코드
	       if(heartval>0) {
	           console.log(heartval);
	           $("#heart").prop("src", "${pageContext.request.contextPath }/assets/images/icon/heart-fill.svg");
	           $(".heart").prop('name',heartval)
	       }
	       else {
	           console.log(heartval);
	           $("#heart").prop("src", "${pageContext.request.contextPath }/assets/images/icon/heart.svg");
	           $(".heart").prop('name',heartval)
	       }
	
	// 좋아요 버튼을 클릭 시 실행되는 코드
	console.log(${sessionScope.aboardNo});
	
	       $(".heart").on("click", function () {
	           var that = $(".heart");
	           
	           var memberId = $('#memberId').val();
	 			var aboardNo = $('#aboardNo').val();
				console.log('ㅎㅎ',memberId);
				console.log(aboardNo);
			var NoticeBoardVO ={
					memberId : memberId,
					aboardNo :  aboardNo
				}
	           
	    $.ajax({
	    	url :'${pageContext.request.contextPath }/${clubId}/notice/heart',
	        type :'POST',
	        data : NoticeBoardVO,
	    	success : function(data){
	    		that.prop('name',data);
	        	if(data==1) {
	            	     $('#heart').prop("src","${pageContext.request.contextPath }/assets/images/icon/heart-fill.svg");
	        	} else {
	                   	 $('#heart').prop("src","${pageContext.request.contextPath }/assets/images/icon/heart.svg");
	        	}
	            	}
	    	});
	       });
		$('#nlist').click(function() {
			  window.location.href = '${pageContext.request.contextPath }/${clubId }/notice/noticelist'	
		});
	     $("#lastvote").click(function() {
	         // 기존 내용과 대체 내용의 가시성(visibility)을 토글
	         $("#dataTable").toggle();
	         $("#dataTable1").toggle();
	       });
	});
  
window.history.forward();
function noBack(){
	window.history.forward();
}

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
			var data = jsonResult.data;
			if(jsonResult.data != null){
    			$("#replyContent").text(replyContent);
    			$("#replyDate").text(data.replyDate);
    			$("#memberName").text(data.memberName);
    			console.log(replyContent);
    			console.log(data.replyDate);
    			console.log(data.memberName);
    			$("#replylist").append("<span id=memberName>"+data.memberName+"</span><span id=replyContent>"+data.replyContent+"</span><span id=replyDate>"+data.replyDate+"</span><button class=add-reply2>답글</button><br>");
    		}else{
    			$("#x").html("사용불가");
    		}
			
		   // 
			
       }, //success end
       error : function(XHR, status, error) {
       console.error(status + " : " + error);
       }
				            
    });//ajax end
    
	 $("#replyContent").val("");
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
	
	var replyContent = $('#replyContent').val();
	var memberName = $('.memberName').text();
	var memberId = $('#memberId').val();
	var aboardNo = $('#aboardNo').val();
	var replyDate = $('#replyDate').val();
	var replyGroup = $('#replyGroup').val();
	var deep = $('#deep').val();
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
	
console.log(ReplyVO);


 $.ajax({
   
   //요청 세팅
   url : "${pageContext.request.contextPath}/${clubId}/notice/addReply_2",
   type : "post",
   data : ReplyVO,
   
   //응답 세팅
   dataType : "json",
   success : function(jsonResult){
		console.log(jsonResult);
		var data = jsonResult.data;
		if(jsonResult.data != null){
			$("#replyContent").text(data.replyContent);
			$("#replyDate").text(data.replyDate);
			$("#memberName").text(data.memberName);
			$("#replyDate").text(data.replyDate);
			$("#replyGroup").text(data.replyGroup);
			$("#deep").text(data.deep);
			console.log(replyContent);
			console.log(data.replyDate);
			console.log(data.memberName);
			console.log(data.replyDate);
			console.log(data.replyGroup);
			console.log(data.deep);
		}else{
			$("#x").html("사용불가");
		}
		
	   // 
		
  }, //success end
   error : function(XHR, status, error) {
   console.error(status + " : " + error);
   }
			            
});//ajax end

});
/*------------// 리댓글 등록 클릭 이벤트 (댓글의 댓글) //------------*/








/*------------ 댓글 쓰기 창 오픈 버튼 클릭 토글 ------------*/
$('.board-area').on("click",'.write-comment-btn',function(){
 var writeCommentDiv = $(this).closest('.board-comment').find('.write-comment');
  if (writeCommentDiv.is(':visible')) {
	    writeCommentDiv.hide();
	  } else {
	    writeCommentDiv.show();
	  }
});





/*좋아요 클릭 이벤트*/
$('.board-area').on("click",'.likecolor', function(){
	var aboardNo = $('#aboardNo').val();
	var likeNo = $(this).data('likeno');
	var memberId = $('#memberId').val();
	var element = $(this);
	var likeCntEle =  $(this).next('span').children();
	var likeCnt = likeCntEle.text();
	
	BoardVO = {
			boardNo : boardNo,
			memberId : memberId,
			likeNo : likeNo
	}
	
	$.ajax({
	       
	       //요청 세팅
	       url : "${pageContext.request.contextPath}/${clubId}/notice/likeCnt",
	       type : "post",
	       data : BoardVO,
	       
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


/*BoardList 받아오는 기능*/
function getData(){
	 
	var memberId = $('#memberId').val();
	var clubId = $('#clubId').val();
	
	console.log(memberId);
	console.log(clubId);

	var BoardVO = {
		memberId : memberId,
		clubId : clubId,
	}
		console.log(BoardVO);
	

	 $.ajax({
    
    //요청 세팅
    url : "${pageContext.request.contextPath}/${clubId}/notice/getboard",
    type : "post",
    data : BoardVO,
    
    //응답 세팅
    dataType : "json",
    success : function(jsonResult){
			
 	   let boardList = jsonResult.data;
 	   console.log(boardList);
		
 	   	if(boardList.length < 1){
 	   		alert('게시물이 없습니다.');
 	   	}
 	   	
 	   	 //가져온 게시물 리스트를 그려준다.
 		 render(boardList,memberId); 	    		   
 		 startNum +=10;
 		 endNum += 10;
 	   	
 	   
    }, //success end
    error : function(XHR, status, error) {
    console.error(status + " : " + error);
    }
				            
 });//ajax end

}//get data end




/*리댓글 html 그리는 거*/
function addReply(element,reply, type){

var add ="";
add += '<div  class="reply-area group' + reply.replyGroup  + '" id = "c'+reply.replyNo + '">';
if (reply.deep > 1) {
    add += '<span><b>&nbsp;&nbsp;&nbsp;<span class="re">↳</span> ' + reply.memberName + '님 : </b></span>';
} else if (reply.deep === 1) {
    add += '<span><b>' + reply.memberName + '님 : </b></span>';
}
add += '<span>' + reply.content + '</span>';
if (reply.deep === 1) {
    add += '<span><button class= "rreply-btn" data-boardno ="' + reply.boardNo +  '"   data-replyno ="' + reply.replyNo + '">답글</button></span>';
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




/*AJAX로 불러온 데이터 그려주는 function*/
function render(editlist,memberId){

	
	
	editlist.forEach(function(board) {
    var add = '';
    add += '<div class="board">';
    add += '<div class="board-header">';
    add += '<div class="profile-pic">';
    add += '<img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="프로필사진" />';
    add += '</div>';
    add += '<div class="board-info" data-boardno ="' + vo.boardNo +  '">';
    add += '<span class="board-group"><strong>' + vo.clubName + '</strong></span><br>';
    add += '<span>작성일 : ' + vo.boardDate + ' </span>';
    add += '</div></div>';
    add += '<div class="board-content">';
    add += '<p>' + vo.content + '</p>';
    if(vo.likeNo == 0){
    add += '<span class="likecolor" data-bno = "'+vo.boardNo + '"   data-likeno = "' + vo.likeNo  + '" >♡</span>';
    }else if(vo.likeNo > 0){
    add += '<span class="likecolor" data-bno = "'+vo.boardNo + '"   data-likeno = "' + vo.likeNo  + '">♥</span>';
    }
    add += '<span>좋아요 (<span class= "likeCnt">' + vo.likeCnt + '</span>)</span>';
    if(vo.memberId == memberId){
        add += '<span class= "edit-board-spans">'
        add += '<a class="edit-board-a" href="${pageContext.request.contextPath}/${clubId}/notice/editform?clubId=' + '&aboardNo=' + vo.aboardNo + '">수정</a>';
        add += '<a class= "delete-board-a" href ="${pageContext.request.contextPath}/${clubId}/notice/delete?clubId=' + '&aboardNo=' + vo.aboardNo + '">삭제</a>'
        add += '</span>'
        }
    add += '</div><div class="board-comment-list">';
    add += '<div class="board-comment" >';
    add += '<h5>댓글</h5><span><button class="write-comment-btn">댓글 쓰기</button></span>';
    add +='<div class="comment-list" id = "r' + vo.boardNo + '">'
    
    board.replyList.forEach(function(reply) {
        add += '<div class="reply-area group' + reply.replyGroup  + '" id = "c'+ reply.replyNo+'">';
        if (reply.deep > 1) {
            add += '<span><b>&nbsp;&nbsp;&nbsp; <span class="re">↳</span> ' + reply.memberName + '님 : </b></span>';
        } else if (reply.deep === 1) {
            add += '<span><b>' + reply.memberName + '님 : </b></span>';
        }
        add += '<span>' + reply.content + '</span>';
        if (reply.deep === 1 & reply.stat == 1) {
            add += '<span><button class= "rreply-btn" data-aboardno ="' + vo.aboardNo +  '"  data-replyno ="' + vo.replyNo + '">답글</button></span>';
        }
        add += '<div class="reply-edit">';
        add += '<span>' + reply.replyDate + '</span>';
        if(memberId == reply.memberId	& reply.stat == 1){
        add += '<span class="reply-delete" data-deletere ="'+ reply.replyNo +'"  data-deep = "'+reply.deep+'">&nbsp;삭제</span>';
        }
        add += '</div></div>';
    });
    add += '</div>'
    add += '<div class="write-comment">';
    add += '<div class="new-content"><textarea class= "comment-content"></textarea><button class="add-reply"  data-aboardno ="' + vo.aboardNo +  '">등록</button></div>';
    add += '</div></div></div></div>';
    
    $('.board-area2').append(add);
});

}
  </script>
</html>