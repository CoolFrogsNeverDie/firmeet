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
					</div>		
					<!-- //diary-topbar -->
					
					<div class="diary-body">					
						<!-- 개인별코딩 ---------------------------------------------------------------->
						<form action="${pageContext.request.contextPath}/${clubId }/notice/editwrite" class="formleft" method="get">
							<div class="edittop">
		                        <select name="" id="" class="selectbox">
		                            <option value="notice">공지게시판</option>
		                        </select>
		                        <input type="radio" name="aboardVal" value="1" id="aboardVal" checked>일반 &nbsp;
		                        <input type="radio" name="aboardVal" value="2" id="aboardVal" style="margin-left: 20px;">모임(결제) &nbsp;
		                        <input type="radio" name="aboardVal" value="3" id="aboardVal" style="margin-left: 20px;">모임(일정)
		                            
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
		                        
		                        <button type="submit" class="btnbox">등록</button>
				                <input type="hidden" name="memberId" value="${member.memberId}">${memberId}
		                    </div>
							<div class="content-left">
				                <!-- 여기부터 작성 -->

				                    <div>
				                        <label for="firstName" style="font-weight: bold; font-size: 15px; margin-right: 5px;">제목</label>
				                        <input class="noticetitle1" type="text" id="title" name="title" placeholder="제목을 입력해주세요">
				                    </div>
				
				                    <div class="ababab">
				                        <textarea id="summernote" name="boardContent"></textarea>
				                        <div class="contentleftbox"></div>
				                    </div>
				
				         <!-- -------------------------------------------------일반투표-------------------------------------------------------->
				                <div class="modal" id="general">
				                    <div class="modal-dialog">
				                        <div class="modal-content">
				
				                            <!-- Modal Header -->
				                            <div class="modal-header">
				                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				                            </div>
				                            <!-- Modal body -->
				                            <div class="modal-body">
				                                  <span class="votespan">제목 : </span>
				                                  <input class="votetitle" type="text" id="voteTitle" name="voteTitle">
				                                  <div class="voteleft">
				                                      <span class="votespan">1.</span>
				                                      <input class="votetitle" type="date" id="vote1" name="vote1"><br>
				                                      <span class="votespan">2.</span>
				                                      <input class="votetitle" type="date" id="vote2" name="vote2"><br>
				                                      <span class="votespan">3.</span>
				                                      <input class="votetitle" type="date" id="vote3" name="vote3"><br>
				                                      <div class="voteplus">
				                                      </div>
				                                      <button type="button" class="plusbtn">+ 항목추가</button><br>
				                                  </div>
				                                  <div style="margin-bottom: 30px;">
				                                      <span class="votespan">최소 인원 : </span>
				                                      <input class="votemin" type="text" id="totalNum" name="totalNum"><br>
				                                      <span class="votespan">투표 종료 : </span>
				                                      <input class="voteend" type="date" id="finDate" name="finDate">
				                                  </div>
				                                  <div style="text-align: center; font-weight: bold;">
				                                      <button type="button" id="reset" class="modelbtnR">작성 취소</button>
				                                      <button type="button" class="modelbtnS" id="saveButton1" style="margin-left: 10px;">작성 완료</button>
				                                  </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				             </div>
				        </form>
	     <!-- 여기까지 -->
	            	
	            <!--/content-left-->
		            <div class="content-right">
		            	<h6 id="contentR" style="display: none;"> 미리보기 </h6>
		                <table id="dataTable" style="display: none;">
		                    <thead>
		                        <tr>
		                            <th class="nglist">
		                                <p id="voteTitle11"></p>
		                            </th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                        <tr>
		                            <td class="ngname">
		                                <p id="vote11"></p>
		                                <p id="vote22"></p>
		                                <p id="vote33"></p>
		                                <p id="vote44"></p>
		                                <p id="vote55"></p>
		                                <p id="totalNum11"></p>
		                                <p id="finDate11"></p>
		                            </td>
		                        </tr>
		                    </tbody>
		                    <!-- 지도 -->
		                </table>
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

$(document).ready(function() {
	
	  const today = new Date().toISOString().split('T')[0];
	  $('#vote1').attr('min', today);
	  $('#vote2').attr('min', today);
	  $('#vote3').attr('min', today);
	  $('#vote4').attr('min', today);
	  $('#vote5').attr('min', today);
	
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
        $("#general").hide();
        $(".modal-backdrop.show").css("display", "none");
    });
    
    let i = 4;

    $('.plusbtn').on("click", function() {
        if (i <= 5) {
            $('.voteplus').append(
                '<span class="votespan">' + i + '.</span>\
                  <input class="votetitle" type="date" id="vote' + i + '" name="vote' + i + '" min=' + today + '><br>'
            );
            i++;
        } else {
            $(".plusbtn").css("display", "none");
        }
    });

    $("#saveButton1").on("click", function() {
        var voteTitle = $("#voteTitle").val();
        var vote1 = $("#vote1").val();
        var vote2 = $("#vote2").val();
        var vote3 = $("#vote3").val();
        var vote4 = $("#vote4").val();
        var vote5 = $("#vote5").val();
        var totalNum = $("#totalNum").val();
        var finDate = $("#finDate").val();

        $("#dataTable").css("display", "block");
        $("#contentR").css("display", "block");
        $("#general").modal("hide");

        $("#voteTitle11").text("제목 : " + voteTitle);
        $("#vote11").text("투표1 : " + vote1);
        $("#vote22").text("투표2 : " + vote2);
        $("#vote33").text("투표3 : " + vote3);
        $("#vote44").text(vote4 ? "투표4 : " + vote4 : "");
        $("#vote55").text(vote5 ? "투표5 : " + vote5 : "");
        $("#totalNum11").text("최소인원 : " + totalNum);
        $("#finDate11").text("투표종료일 : " + finDate);
    });
});

$(document).ready(function() {

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

function CustomButton(context) {
    var ui = $.summernote.ui;
    var button = ui.button({
        contents: 'vote',
        tooltip: 'vote Button',
        click: function() {
            // 버튼을 클릭했을 때 수행할 동작을 여기에 작성합니다.
            //alert('Custom button clicked!');
            var modalContent = document.querySelector('.modal-body');
            // 모달 띄우기
            $('#general').modal('show');
        }
    });
    return button.render();
}

</script>

</html>
