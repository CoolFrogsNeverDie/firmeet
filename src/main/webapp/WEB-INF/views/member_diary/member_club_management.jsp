<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${member.memberName} 동아리 관리</title>
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
						<img class="diary-topbar-img" src="/firmeet/assets/images/icon/profile.png" alt="프로필사진" />
						<h2>${member.memberName} 의 다이어리</h2>
  						
  						
						<div class= "search-board"> 
							<input type = "text" id = "search-keyword" value = "${keyword}" placeholder ="검색어를 입력하세요.">
							<button type ="button" class="board-search-btn"><img src = "${pageContext.request.contextPath}/assets/images/icon/search.png"></button>
						</div>						
						
					</div>		
					<!-- //diary-topbar -->
					
	
					<div class="manager-body">					
						<!-- 개인별코딩 ---------------------------------------------------------------->
						<div class= "topbar">
							<div class= "menu-btn-area">
								<a href = "${pageContext.request.contextPath}/management/club/${club.clubId}">클럽관리</a>
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
				<c:import url="/WEB-INF/views/include/side_nav_per_update.jsp"></c:import>
			</div>
		</div>
		<!-- container -->
	</div>
    <!-- //중간 콘텐츠 -->
    
    
    <!--/wrap-->

        <!-- 모달창 -->
    	  <div class="modal fade" id="qna-modal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document" style="max-width: 900px;">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="imageModalLabel">답변하기</h5>
	        </div>
	        <div class="modal-body">
	          <!-- 이미지가 표시될 곳 -->
			  <div class= "qna-answer-area">
				<textarea class= "qna-answer" id = "qna-answer"></textarea>
			  </div>
	          <!-- 수정 , 취소 버튼-->
	          <div class= "edit-modal-btn-area">
	          <button id="answer-insert-btn" class="btn">수정</button>
	          <button id="cancel-btn" class="btn">취소</button>
	          </div>
	          <span id="likeCount"></span>
	        </div>
	      </div>
	    </div>
	  </div>
    <!-- 모달창 -->
    
    
</body>

 <script>
    // 클릭 이벤트 처리
  	$(document).ready(function(){
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
                    var intro1 = list[i].intro1;
					var add = '';
					add +=  '<div class= "mem-info clubMem-info" id = "c' + clubId  + '" + >'
					add += 	'	<div class= "mem-pic">'
					add +=			'<img class="diary-topbar-img11" src="${pageContext.request.contextPath}/assets/images/icon/profile.png" alt="프로필사진" />'
					add +=     '</div>';
					add += '    		<div class= "mem-deinfo">';
					add += '				<span><b>'+  name  +'</b></span><br>';
					add += '				<span>'+ intro1+'</span><br>';	
					add += '    		</div>'
					add += '    <div class= "info-btns-area editPage-btns edit-page">';
					add += '   			<button type ="button" class= "no-mem-btn" data-clubmemno= "' + clubId  + '"style="background-color: #ff6969;">클럽탈퇴</button>';
					
					add += '	</div>'
					add += '</div>'

					$('.list-area').append(add);
                }
            },
            error: function (error) {
                // AJAX 에러 시 실행되는 코드
                console.error('Error:', error)
            }
        });
    });
</script>

<script>
//회원 강퇴 버튼 클릭 이벤트
$('.list-area').on("click",'.no-mem-btn', function(){
	var clubId = $(this).data('clubmemno');
	var memberId = $('.diary-area').data('memid');
	
		if(!confirm("정말 강퇴시키겠습니까?")){
			return false;
		}	
	
	
		var ClubVO = {
		     clubId : clubId,
		     memberId : memberId
		 }
	
	 $.ajax({
	       
	       //요청 세팅
	       url : "${pageContext.request.contextPath}/management/club/myClubDel",
	       type : "post",
	       data : ClubVO,
	       
	       //응답 세팅
	       dataType : "json",
	       success : function(jsonResult){
			
	    	   var data = jsonResult.data;
	    	   
	    	   if(data==true){
	    		   $('#c'+clubId).remove();
	    		   $('#edit-grade-modal').modal('hide');
	    	   }else{
	    		   alert('삭제에 실패했습니다.');
	    	   }
	    	   
	       }, //success end
	       error : function(XHR, status, error) {
	       console.error(status + " : " + error);
	       }
					            
	    });//ajax end
	
	
});
</script>

</html>
