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
   	<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.min.css"> --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/manager_page.css" rel="stylesheet" type="text/css" />
    <%-- <link href="${pageContext.request.contextPath}/assets/css/board2_test.css" rel="stylesheet"  type="text/css" /> --%>
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
						<img class="diary-topbar-img" src="${pageContext.request.contextPath}/upload/clubimg/${club.img2}" alt="프로필사진" />
						<h2>${club.clubName}</h2>
  						

					</div>		
					<!-- //diary-topbar -->
					
	
					<div class="manager-body">					
						<!-- 개인별코딩 ---------------------------------------------------------------->
						<div class= "topbar">
							<div class= "menu-btn-area">
								<a class="ct-color" href = "${pageContext.request.contextPath}/management/club/${club.clubId}">가입승인</a>
								<a class="ct-color"  href = "${pageContext.request.contextPath}/management/club/editgrade/${club.clubId}">권한설정</a>
								<a class="ct-color"  href = "${pageContext.request.contextPath}/management/club/qna/${club.clubId}">문의답변</a>
								<a class="ct-color"  href = "${pageContext.request.contextPath}/management/club/edit/${club.clubId}">정보수정</a>
							</div>
						</div>
						
						<div class= "list-area"><!-- AJAX로 게시글 그릴 공간 -->
						
						</div>
						
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
/* 
	$(document).ready(function(){
	
		colorSet();  //다이어리의 color 세팅함
		
		
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


	 */



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
		console.log('테스트');
    });
	//감시하는 객체
    lastBoardObserver.observe(lastBoard[0]);

	
	//가입 승인 버튼 클릭 이벤트
	$('.list-area').on("click",'.new-mem-btn', function(){
		var clubMemNo = $(this).data('clubmemno');
		var clubId = ${club.clubId}
		var memLevel = 2;
		
		
		var ClubVO = {
				clubMemNo : clubMemNo,
				memlevel : 	memLevel,
				clubId : clubId
		}
		
		joinrequest(ClubVO);	
		
	}); //가입 승인 이벤트 end
	
	
	//가입 거절 버튼 클릭 이벤트
	$('.list-area').on("click",'.no-mem-btn', function(){
		var clubMemNo = $(this).data('clubmemno');
		var memLevel = -99;
		var clubId = ${club.clubId}
		alert(clubMemNo);
		
		var ClubVO = {
				clubMemNo : clubMemNo,
				memlevel : 	memLevel,
				clubId : clubId
		}
		
		joinrequest(ClubVO);
		
		
	});
	
	//리스트 확인 후 없으면 html 리턴
	function checkList(){
		
		 var hasClass = $(".list-area .mem-info").length > 0;
		
		 if(!hasClass){
			 noData();
		 }
		 
	}
	
	
	//버튼 클릭 처리 AJAX
	function joinrequest(ClubVO){
		
		
		 $.ajax({
		       
		       //요청 세팅
		       url : "${pageContext.request.contextPath}/management/club/joinrequest",
		       type : "post",
		       data : ClubVO,
		       
		       //응답 세팅
		       dataType : "json",
		       success : function(jsonResult){
		    	   var data = jsonResult.data;
		    		   console.log(data);
		    	   
		    	   //1은 승인, 0은 거절, -99는 남은 인원 수 없음
		    	   switch(data){
		    	   	case 1: alert('가입승인이 완료되었습니다.');
		    	   			$('#c' +ClubVO.clubMemNo).remove();
    	   					console.log('c'+ ClubVO.clubMemNo + '가 삭제 되어야 함')
		    	   			checkList();
		    	   			break;
		    	   	case 0:	alert('거절이 완료되었습니다.');
    	   					$('#c' +ClubVO.clubMemNo).remove();
    	   					console.log('c'+ ClubVO.clubMemNo + '가 삭제 되어야 함')
    	   					checkList();
    	   					
		    	   			break;
		    	   	case -99: alert('승인 가능 인원을 초과하였습니다.');
		    	   }
					
		       }, //success end
		       error : function(XHR, status, error) {
		       console.error(status + " : " + error);
		       }
						            
		    });//ajax end
		}
		
	
	
	
	//가입요청한 유저 목록 볼 수 있는 
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
		       url : "${pageContext.request.contextPath}/management/club/requestlist",
		       type : "post",
		       data : MemberVo,
		       
		       //응답 세팅
		       dataType : "json",
		       success : function(jsonResult){
		    	   
		    	   var memberList = jsonResult.data;
					console.log(memberList);
					if(memberList.length >0){
						render(memberList);
						startNum +=10;
						endNum += 10;
						
					}else if(memberList.length == 0 & startNum ==1){
						checkList();
					}
					
		       }, //success end
		       error : function(XHR, status, error) {
		       console.error(status + " : " + error);
		       }
						            
		    });//ajax end
	}
	
	function noData(){
		
		var add = '';
		add += '<div class= "error-page">'
		add += '	<div>'
		add += '		<img class="error-icon" src ="${pageContext.request.contextPath}/assets/images/icon/error.png">'
		add += '	</div>'
		add += '	<div class= "clear-div">'
		add += '	</div>'
		add += '	<div>'
		add += '		<span>'
		add += '		 	<b>존재하는 가입 요청이 없습니다!</b>'
		add += '		</span>'
		add += '	</div>'
		add += '</div>'
		
		$('.list-area').append(add);
	}
	
	
	function render(memberList){
		
		memberList.forEach(function(member) {

			var add = '';
			add +=  '<div class= "mem-info" id = "c' + member.clubmemNo  + '" + >'
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
			add	+= '    		</div>'
			add += '    <div class= "info-btns-area">';
			add += '			<button type ="button" class= "new-mem-btn" data-clubmemno= "' + member.clubmemNo  + '">가입승인</button>';
			add += '   			<button type ="button" class= "no-mem-btn" data-clubmemno= "' + member.clubmemNo  + '">가입거절</button>';
			add += '	</div>'
			add += '</div>'
			
			
			
			$('.list-area').append(add);
		});
	}
	

</script>

</html>
