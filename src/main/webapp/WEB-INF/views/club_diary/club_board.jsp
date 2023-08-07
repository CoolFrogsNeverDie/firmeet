<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>개인 게시판</title>
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/board_last.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/color_code/color${club.colorType}.css" rel="stylesheet" type="text/css" />
    <!--모달-->
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
						<img class="diary-topbar-img" src="${pageContext.request.contextPath}/upload/club/${club.img2}" alt="프로필사진" />
						<h2>${club.clubName}</h2>
  						
  						
						<div class= "search-board"> 
							<input type = "text" id = "search-keyword" value = "${keyword}" placeholder ="검색어를 입력하세요.">
							<button type ="button" class="board-search-btn"><img src = "${pageContext.request.contextPath}/assets/images/icon/search.png"></button>
						</div>						
						
					</div>		
					<!-- //diary-topbar -->
					
					
					<div class="diary-body">					
						<!-- 개인별코딩 ---------------------------------------------------------------->
						<div class= "edit-area">
							<div class= "edit-btn-area"><a class= "write-btn ct-color" href= "${pageContext.request.contextPath}/board/club/editpage/${club.clubId}">글쓰기</a></div>
						</div>
						<div class= "board-area club-board-area"><!-- AJAX로 게시글 그릴 공간 -->
						
											
						</div>
						<!-- //board-area club-board-area-->						
						

						
						
						
						<div id = "board-get"></div><!-- 무한 스크롤 감시용 div -->
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

 
	$('.board-area').on('keyup','.comment-content', function(){
		var textLength = $(this).val();
		console.log('바뀌는 댓글 정보' + textLength);
		console.log('바뀌는 댓글 정보' + textLength.length);
		if(textLength.length >40){
			alert('댓글은 40자 이내로 작성해주세요.');
			textLength = textLength.slice(0,50);
	        $(this).val(textLength);
		}
	});
	
	
	/*댓글 삭제 이벤트*/
	$('.board-area').on("click", '.reply-delete', function(){

		var replyNo	 =	$(this).data('deletere');
		var deep	 =	$(this).data('deep');
		var memberId = $('.diary-area').data('memid');
		var replyEle = $('#c' + replyNo);
		var textarea = replyEle.find('span:eq(1)');
		
		var ReplyVO = {
				replyNo : replyNo,
				memberId : memberId,
				deep : deep
		}
		
		
		$.ajax({
		       
		       //요청 세팅
		       url : "${pageContext.request.contextPath}/board/member/deleteReply",
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
	
	
	
	/*답글 등록 버튼 클릭 이벤트  --> 답글 등록창이 뜬다*/ 
	$('.board-area').on("click",'.rreply-btn', function(){
		
	    var writeCommentDiv = $(this).closest('.write-comment2');
		var replyEditDiv = $(this).closest('.reply-area');
		var groupNo = $(this).data('replyno');
		var boardNo = $(this).data('boardno');
		
		var tag = $(this).parent().siblings(".write-comment2").attr('class');
		console.log('태그 보기' + tag);	
		if(tag == null){
			var	rreply = '';	
			
			rreply += '<div class="write-comment2" >';
			rreply += '    <span ></span><div class="new-content2" >';
			rreply += '        <input type ="text" class= "comment-content" placeholder=" 댓글을 40자 이내로 작성해주세요." ></input><button class="add-reply2 ct-color" data-boardno = "' + boardNo +'"  data-groupno ="' + groupNo +  '">등록</button></div>'
			rreply += '    </div>'
	 		rreply += '</div>'
	
			replyEditDiv.append(rreply);
		}else {
	    	$('.write-comment2').remove();
		} 
	
	});

	/*리댓글 등록 클릭 이벤트(댓글의 댓글)*/
	$('.board-area').on("click", ".add-reply2", function(){
		
		var textbox = $(this).prev();
		var content = textbox.val();
		var groupNo = $(this).data('groupno');
		var boardNo = $(this).data('boardno');
		var memberId = $('.diary-area').data('memid');
		
		console.log('teest' +  content + '그룹 번호 : ' +  groupNo + '게시글 번호 :' + boardNo + memberId);
		
		var ReplyVO = {
				boardNo : boardNo,
				memberId : memberId,
				content : content,
				replyGroup : groupNo
		}
		
		console.log(ReplyVO);
		

		 $.ajax({
	       
	       //요청 세팅
	       url : "${pageContext.request.contextPath}/board/member/addReply_2",
	       type : "post",
	       data : ReplyVO,
	       
	       //응답 세팅
	       dataType : "json",
	       success : function(jsonResult){
				
	    	   var data = jsonResult.data;
	    	   console.log(data);
	    	   
	    	   addReply(null, data, 'rere');
	    	   $('.write-comment2').remove();
	    	   
	       }, //success end
	       error : function(XHR, status, error) {
	       console.error(status + " : " + error);
	       }
					            
	    });//ajax end
		
		
		
	});
	
	
	
	/*댓글 등록 버튼 클릭 이벤트*/
	$('.board-area').on("click",'.add-reply', function(){
		
		var textbox = $(this).prev();
		var content = textbox.val();
		var boardNo = $(this).data('boardno');
		var memberId = $('.diary-area').data('memid');
	
		var ReplyVO = {
				boardNo : boardNo,
				content : content,
				memberId : memberId
		}
		
		if(content.length < 5){
			alert('댓글을 다섯글자 이상 입력해주세요.');
			return;
		}
		

		 $.ajax({
	       
	       //요청 세팅
	       url : "${pageContext.request.contextPath}/board/member/addReply",
	       type : "post",
	       data : ReplyVO,
	       
	       //응답 세팅
	       dataType : "json",
	       success : function(jsonResult){
				var reply = jsonResult.data;
				var addElement = $('#r' +reply.boardNo);
				addReply(addElement,reply,'re');
				textbox.val("");
				
	       }, //success end
	       error : function(XHR, status, error) {
	       console.error(status + " : " + error);
	       }
					            
	    });//ajax end
		
	});

	/*리댓글 html 그리는 거*/
	function addReply(element,reply, type){
		
		var add ="";
	    add += '<div  class="reply-area group' + reply.replyGroup  + '" id = "c'+reply.replyNo + '">';
	    if (reply.deep > 1) {
            add += '<span><b><span class="re">↳</span> ' 
                add += '<img class="reply-img rreply-img" src="${pageContext.request.contextPath}/assets/images/icon/profile.png" alt="프로필사진" />';
                    add += reply.memberName + '님  </b></span><br>';
	    } else if (reply.deep === 1) {
                add += '<img class="reply-img" src="${pageContext.request.contextPath}/assets/images/icon/profile.png" alt="프로필사진" />';
	        add += '<span><b>' + reply.memberName + '님  </b></span><br>';
	    }
	    if (reply.deep > 1) {
            add += '<span class= "rereply-content">' + reply.content + '</span>';
	    } else if (reply.deep === 1) {
            add += '<span class= "reply-content">' + reply.content + '</span>';
	    }
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
 	
 	

/* 무한 스크롤용 JS */
 
 
/*document load*/
 
 	//board 불러오기 위한 rownum 
	let startNum = 1;
	let endNum = 10;
	

	/*무한 스크롤 감지*/
	const lastBoard = $('#board-get');    
    const lastBoardObserver = new IntersectionObserver((entries) => {
        const lastEntry = entries[entries.length - 1];
        if (!lastEntry.isIntersecting) return;

        getData();
    });
	//감시하는 객체
    lastBoardObserver.observe(lastBoard[0]);

	

    /*메뉴바 선택 */
    $("dt").on("click", function () {
        var _$self = $(this),
            isActive = _$self.hasClass("active");

        _$self.toggleClass("active");
        _$self.nextUntil("dt").slideToggle(!isActive);
    });
    
    /*댓글 쓰기 버튼 클릭 토글*/
    $('.board-area').on("click",'.write-comment-btn',function(){
    	 var writeCommentDiv = $(this).closest('.board-comment').find('.write-comment');
    	  if (writeCommentDiv.is(':visible')) {
    		    writeCommentDiv.hide();
    		    $('.comment-content').val("");
    		  } else {
    		    writeCommentDiv.show();
    		  }
    });
	
	/* 검색 버튼 이벤트 */
	$('.board-search-btn').on("click",function(){
		
 	 	var clubId = $('.diary-area').data('clubid');
 	 	var keyword = $('#search-keyword').val();
 	 	
		window.location.href = "${pageContext.request.contextPath}/board/club/" + clubId + "?keyword=" +keyword;
		
		
	});


    
 	//BoardList AJAX
 	function getData(){
 		 
 	 	var clubId = $('.diary-area').data('clubid');
		var keyword2 = $('.diary-area').data('memid');
 	 	var keyword = $('#search-keyword').val();
 	 	var memberId = $('.diary-area').data('memid');

 	 	
 	 	console.log(keyword + "키워드");

 	 	
 	 	var BoardVO = {
 	 		clubId : clubId,
 	 		startNum : startNum,
 	 		endNum : endNum,
 	 		keyword : keyword,
 	 		keyword2 : keyword2
 			}
 	 
 	 		console.log(BoardVO);
 	 	

 		 $.ajax({
 	       
 	       //요청 세팅
 	       url : "${pageContext.request.contextPath}/board/club/getboard",
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
 	    	   	
 	    		 render(boardList,memberId); 	    		   
 	    		 startNum +=10;
 	    		 endNum += 10;
 	    	   	
 	    	   
 	       }, //success end
 	       error : function(XHR, status, error) {
 	       console.error(status + " : " + error);
 	       }
 					            
 	    });//ajax end
 	 
 	}//get data end
 	
 	$('.board-area').on("click",'.delete-board-a', function(event){
		
		if(!confirm('삭제하시겠습니까?')){
			event.preventDefault();
		}
 		
 	});
 	
 	
	$('.board-area').on("click",'.likecolor', function(){
 		var boardNo = $(this).data('bno');
 		var likeNo = $(this).data('likeno');
 	 	var memberId = $('.diary-area').data('memid');
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
 	 	       url : "${pageContext.request.contextPath}/board/likeCnt",
 	 	       type : "post",
 	 	       data : BoardVO,
 	 	       
 	 	       //응답 세팅
 	 	       dataType : "json",
 	 	       success : function(jsonResult){
 	 				var result = jsonResult.data;
 	 				console.log(result);
 	 	    		//삭제 기능 수행한 거였으면?
 	 				if(result == null){
 	 					element.text('♡');
 	 					element.data('likeno',0);
 	 					likeCntEle.text(Number(likeCnt)-1);
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
 		
 		
 		
 	});
 	
 	
 	
 	/*AJAX로 불러온 데이터 그려주는 function*/
	   function render(boardList,memberId){
	   
		
		
     boardList.forEach(function(board) {
    	  
    	 console.log('찍힐 board들' + board);
    	 
         var add = '';
         add += '<div class="board">';
         add += '<div class="board-header">';
         add += '<div class="profile-pic">';
         add += '<img class="diary-topbar-img11" src="${pageContext.request.contextPath}/assets/images/icon/profile.png" alt="프로필사진" />';
         add += '</div>';
         add += '<div class="board-info" data-boardno ="' + board.boardNo +  '">';
         add += '<span class="board-group"><strong>' + board.memberName + '</strong> <b>@'+ board.memberId  +'</b></span><br>';
         add += '<span class= "board-date">작성일 : ' + board.boardDate + ' </span>';
         add += '</div></div>';
         add += '<div class="board-content">';
         add += '<p>' + board.content + '</p>';
         if(board.likeNo == 0){
         add += '<span class="likecolor" data-bno = "'+board.boardNo + '"   data-likeno = "' + board.likeNo  + '" >♡</span>';
         }else if(board.likeNo > 0){
         add += '<span class="likecolor" data-bno = "'+board.boardNo + '"   data-likeno = "' + board.likeNo  + '">♥</span>';
         }
         add += '<span>좋아요 (<span class= "likeCnt">' + board.likeCnt + '</span>)</span>';
         if(board.memberId == memberId){
             add += '<span class= "edit-board-spans">'
             add += '<a class="edit-board-a" href="${pageContext.request.contextPath}/board/club/editform?clubId=' + board.clubId + '&boardNo=' + board.boardNo + '">수정</a>';
             add += '<a class= "delete-board-a" href ="${pageContext.request.contextPath}/board/club/delete?clubId=' + board.clubId + '&boardNo=' + board.boardNo + '">삭제</a>'
             add += '</span>'
             }
         add += '</div><div class="board-comment-list">';
         add += '<div class="board-comment" >';
         add += '<h5>댓글</h5><span><button class="write-comment-btn ct-color">댓글 쓰기</button></span>';
         add +='<div class="comment-list" id = "r' + board.boardNo + '">'
         
         board.replyList.forEach(function(reply) {
             add += '<div class="reply-area group' + reply.replyGroup  + '" id = "c'+ reply.replyNo+'">';
             

             if (reply.deep > 1) {
                 add += '<span><b><span class="re">↳</span> ' 
             add += '<img class="reply-img rreply-img" src="${pageContext.request.contextPath}/assets/images/icon/profile.png" alt="프로필사진" />';
                 add += reply.memberName + '님  </b></span><br>';
             if(memberId == reply.memberId	& reply.stat == 1){
             add += '<span class="reply-delete" data-deletere ="'+ reply.replyNo +'"  data-deep = "'+reply.deep+'">&nbsp;삭제</span>';
             }
             } else if (reply.deep === 1) {
             add += '<img class="reply-img" src="${pageContext.request.contextPath}/assets/images/icon/profile.png" alt="프로필사진" />';
                 add += '<span><b>' + reply.memberName + '님  </b></span><br>';
             if(memberId == reply.memberId	& reply.stat == 1){
             add += '<span class="reply-delete" data-deletere ="'+ reply.replyNo +'"  data-deep = "'+reply.deep+'">&nbsp;삭제</span>';
             }
             }

             if (reply.deep > 1) {
                 add += '<span class= "rereply-content">' + reply.content + '</span>';
             } else if (reply.deep === 1) {
                 add += '<span class= "reply-content">' + reply.content + '</span>';
             }


             if (reply.deep === 1 & reply.stat == 1) {
                 add += '<span><button class= "rreply-btn ct-color" data-boardno ="' + board.boardNo +  '"  data-replyno ="' + reply.replyNo + '">답글</button></span>';
             }
             add += '<div class="reply-edit">';
             add += '<span>' + reply.replyDate + '</span>';
             add += '</div></div>';
         });
         add += '</div>'
         add += '<div class="write-comment">';
         add += '<div class="new-content"><input type ="text" class= "comment-content" placeholder= " 댓글을 40자 이내로 작성해주세요."></input><button class="add-reply ct-color"  data-boardno ="' + board.boardNo +  '">등록</button></div>';
         add += '</div></div></div></div>';
         
         $('.board-area').append(add);
     });
     
	   }
	
 	
 	
</script>
</html>
