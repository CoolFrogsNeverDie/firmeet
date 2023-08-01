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
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/main2_test.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/board2_test.css" rel="stylesheet"  type="text/css" />
    <!--모달-->
</head>

<body>

    <!-- // 상단 내비게이션 바 -->
<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>
    <!-- 페이지 콘텐츠 -->
    <div class="wrap">
        <div class="diary-area" data-memid = "${member.memberId}" data-clubid ="${club.clubId}">
            <div class="diary-topbar">
                <img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg"
                    alt="프로필사진" />
                <h1>${club.clubName}</h1>
                <div class= "board-edit">
                 <div class= "search-board"> 
             	<input type = "text" id = "search-keyword" value = "${keyword}" placeholder ="검색어를 입력하세요.">
             	<button type ="button" class="board-search-btn"><img src = "${pageContext.request.contextPath}/assets/images/icon/search.png"></button>
             </div>
             
             </div>
            </div>
            <!--/diary-topbar-img-->
            <div class="diary-subbar">
            	<div class= "manage-menu">
				<a href = "${pageContext.request.contextPath}/management/club/${club.clubId}">가입승인</a>
				<a href = "${pageContext.request.contextPath}/management/club/editgrade/${club.clubId}">권한설정</a>
				<a href = "#">정보수정</a>
            	</div>
            </div>
            <!--/diary-subbar-->
            <div class="content-area admin-content">

                <div class="content-right">
                    <div class="board-area">
						<div class= "club-category">
						<!--
						<h4><strong>&#128221;&nbsp;&nbsp;자유게시판</strong></h4> 
						 -->
						</div>
                        <div class="list-area" >
                        	
                        	<!-- 반복될 곳 -->
                        	
                        	

						
                        	
                        	<div class= "mem-info clubMem-info" id = "c"><!--에이잭스로 삭제해야해서 아이디 줄 예정-->
                        		<div class= "mem-pic"><img class="diary-topbar-img11" src="${pageContext.request.contextPath}/assets/images/icon/profile.png" alt="프로필사진" /></div>
                        		<div class= "mem-deinfo">
                        			<span><b>김세영</b> <strong>@seyoung2020</strong></span><br>
                        			<span>010-3782-2337</span><br>
                        			<span class= "tag-list">#intp #취미부자 #집돌이</span>
                        			<span class= "mem-level-name">매니저</span>
                        		</div>
                        		<div class= "info-btns-area editPage-btns">
                        			<button type ="button" class= "new-mem-btn" data-clubmemno>등급변경</button>
                        			<button type ="button" class= "no-mem-btn" data-clubmemno>회원강퇴</button>
                        		</div>
                        	</div>
						
						
                        	<!-- 반복될 곳 -->
                        </div>
					  <div id = "board-get"></div>
                    </div>
                    <!--board-area-->
                </div>
                <!--/content-right-->
            </div>
            <!--/content-area-->
        </div>
        <!--/diary-area-->
<c:import url="/WEB-INF/views/include/side_nav_update.jsp"></c:import>
    <!--/wrap-->
       <!-- 모달창 -->
    	  <div class="modal fade" id="edit-grade-modal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document" style="max-width: 900px;">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="imageModalLabel">등급 수정</h5>
	        </div>
	        <div class="modal-body">
	          <!-- 이미지가 표시될 곳 -->
	          <div class= "edit-pic-area">
		         <img class="edit-modal-pic" src="${pageContext.request.contextPath}/assets/images/icon/profile.png" alt="프로필사진" />
				 	<input type= "hidden" name= "clubMemNo" id = "clubMemNo">
			  </div>
			  <div class= "edit-info-area">
				 	<span id = "mem-name"><b>김세영님</b></span>
					<span id = "mem-id">@seyoung2020</span>
					<br> 
					<select name = "memlevel" id = "memlevel">
						<option value =2>일반</option>
						<option value =1>매니저</option>
						<option value =0>호스트</option>
					</select>
			  </div>
	          <!-- 좋아요 버튼 -->
	          <div class= "edit-modal-btn-area">
	          <button id="grade-edit-btn" class="btn btn-primary">수정</button>
	          <button id="cancel-btn" class="btn btn-danger">취소</button>
	          </div>
	          <span id="likeCount"></span>
	        </div>
	      </div>
	    </div>
	  </div>
    <!-- 모달창 -->
    
</body>

<script>
	

/* 무한 스크롤용 JS */
 
 
/*document load*/
 
 	//board 불러오기 위한 rownum 
	let startNum = 1;
	let endNum = 12;
	

	/*무한 스크롤 감지*/
	const lastBoard = $('#board-get');    
    const lastBoardObserver = new IntersectionObserver((entries) => {
        const lastEntry = entries[entries.length - 1];
        if (!lastEntry.isIntersecting) return;

        getData();

    });
	//감시하는 객체
    lastBoardObserver.observe(lastBoard[0]);

	
	//등급변경(1차) 버튼 클릭 시
	$('.list-area').on("click",'.edit-mem-btn', function(){
		var clubMemNo = $(this).data('clubmemno');
		var memLevel = $(this).data('memlevel')		
		var memName = $(this).data('membername')
		var memId = $(this).data('memberid')
		
		console.log('테스트 클럽 넘버 :' + clubMemNo+ '  레벨 : ' + memLevel + '  이름' + memName + ' 아이디 ' + memId);
        
 		$('#memlevel').val(memLevel);
		$('#mem-id').text('@' + memId);
		$('#mem-name').text(memName + '님');
		$('#grade-edit-btn').data('clubmemno', clubMemNo);
		$('#edit-grade-modal').modal('show');
	}); //가입 승인 이벤트 end
		
	//등급변경(2차) 버튼 클릭
	$('#grade-edit-btn').on("click",function(){
		 var memberLevel =  $('#memlevel').val();
		 var clubmemNo = $('#grade-edit-btn').data('clubmemno');
		
		 var MemberVo = {
			 memLevel: memberLevel,
			 clubmemNo : clubmemNo
		 }
		 
		 
		 $.ajax({
		       
		       //요청 세팅
		       url : "${pageContext.request.contextPath}/management/club/changegrade",
		       type : "post",
		       data : MemberVo,
		       
		       //응답 세팅
		       dataType : "json",
		       success : function(jsonResult){
			
		    	   
		    	   
		       }, //success end
		       error : function(XHR, status, error) {
		       console.error(status + " : " + error);
		       }
						            
		    });//ajax end
		 
	});
	
	
	//회원 강퇴 버튼 클릭 이벤트
	$('.list-area').on("click",'.no-mem-btn', function(){
		var clubMemNo = $(this).data('clubmemno');
		var memLevel = -99;
		var clubId = ${club.clubId}
		
		var ClubVO = {
				clubMemNo : clubMemNo,
				memlevel : 	memLevel,
				clubId : clubId
		}
		
		
	});
	
	//모달창 닫는 이벤트
	$('#cancel-btn').on("click", function(){
		$('#edit-grade-modal').modal('hide');
	})
	
	
	//가입되어 있는 유저 목록 볼 수 있는
	function getData(){
		var clubId = $('.diary-area').data('clubid');
	
		var MemberVo = {
				clubId : clubId,
				startNum : startNum,
				endNum : endNum
		}
		
		console.log(MemberVo + '에이젝스로 넘어갈 값 확인' + clubId);
		 $.ajax({
		       
		       //요청 세팅
		       url : "${pageContext.request.contextPath}/management/club/memberlist",
		       type : "post",
		       data : MemberVo,
		       
		       //응답 세팅
		       dataType : "json",
		       success : function(jsonResult){
		    	   var memberList = jsonResult.data;
		    	   console.log(memberList);
					startNum +=12;
					endNum += 12;
					render(memberList);
					
		       }, //success end
		       error : function(XHR, status, error) {
		       console.error(status + " : " + error);
		       }
						            
		    });//ajax end
	}
	
	
	
	
	function render(memberList){
		
		memberList.forEach(function(member) {

			var add = '';
			add +=  '<div class= "mem-info clubMem-info" id = "c' + member.clubmemNo  + '" + >'
			add += 	'	<div class= "mem-pic">'
			add +=			'<img class="diary-topbar-img11" src="${pageContext.request.contextPath}/assets/images/icon/profile.png" alt="프로필사진" />'
			add +=     '</div>';
			add += '    		<div class= "mem-deinfo">';
			add += '				<span><b>'+  member.memberName  +'</b> <strong>@'+ member.memberId +'</strong></span><br>';
			add += '				<span>'+ member.memberPhone+'</span><br>';
			add += '    			<span class= "tag-list">';
				member.tagList.forEach(function(tag){
					add += '#' + tag.tagName + ' '
				})
			add += '				</span>'		
			add += '                 <span class= "mem-join-date">'
			add += 					member.joinDate
			add += '                 </span>'
			add += '				<span class= "mem-level-name"><b>'
				switch(member.memLevel){
				case 0: add += '호스트'; break; 
				case 1: add += '매니저'; break;
				case 2: add += '베이직'; break;
				}
			add += ' 				</b></span> '
			add += '    		</div>'
			add += '    <div class= "info-btns-area editPage-btns">';
			if(member.memLevel != 0){
			add += '			<button type ="button" class= "edit-mem-btn" data-clubmemno= "' + member.clubmemNo  + '" data-memberid = "'+member.memberId +'" data-membername = "'+ member.memberName+'" data-memlevel= "'+member.memLevel+'">등급변경</button>';
			add += '   			<button type ="button" class= "no-mem-btn" data-clubmemno= "' + member.clubmemNo  + '">회원강퇴</button>';
			}
			add += '	</div>'
			add += '</div>'
			
			$('.list-area').append(add);
			
				switch(member.memLevel){
				case 0:	$('#c'+member.clubmemNo + ' .mem-level-name').css("color","#ff6969");
						break;
				case 1:	$('#c'+member.clubmemNo + ' .mem-level-name').css("color","rgb(106 116 255)");
				}
		});
	}
	
 
 	
</script>
</html>
