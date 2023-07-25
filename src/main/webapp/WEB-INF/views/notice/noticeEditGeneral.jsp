<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지 에디터</title>
    <%@ include file="../include/topnav.jsp" %>
</head>
<body>

<!----------------------------------------- top Navigation ----------------------------------------->
<%@ include file="../include/nav.jsp" %>

<div class="wrap">
    <div class="diary-area">
        <div class="diary-topbar">
            <img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg"
                alt="프로필사진" />
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
                <form action="${pageContext.request.contextPath}/${clubId }/notice/editwrite" class="formleft" method="get">
                    <div>
                        <select name="" id="" class="selectbox">
                            <option value="notice">공지게시판</option>
                        </select>
                        <input type="radio" name="aboardVal" value="1" id="aboardVal" checked>일반 &nbsp;
                        <input type="radio" name="aboardVal" value="2" id="aboardVal" style="margin-left: 20px;">모임
                            
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
                  <input type="text" name="memberId" value="${member.memberId}">${memberId}
                        <button type="submit" class="btnbox">등록</button>
                    </div>

                    <div>
                        <label for="firstName" style="font-weight: bold; font-size: 15px; margin-right: 5px;">제목</label>
                        <input class="noticetitle" type="text" id="title" name="title" placeholder="제목을 입력해주세요">
                    </div>

                    <div class="ababab">
                        <textarea id="summernote" name="summernote"></textarea>
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
                                      <button type="reset" class="btn btn-warning btn-sm">작성 취소</button>
                                      <button type="button" class="btn btn-success btn-sm" id="saveButton1" style="margin-left: 10px;">작성 완료</button>
                                  </div>
                            </div>
                        </div>
                    </div>
                </div>
         </form>
     <!-- 여기까지 -->
            </div>
            <!--/content-left-->
            <div class="content-right">
                <table id="dataTable1" style="display: none;">
                    <thead>
                        <tr>
                            <th class="noticegrouplist">
                                <p class="noticegroupname" id="voteTitle11"></p>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="noticegrouplist1">
                                <p class="noticegroupname" id="vote11"></p>
                                <p class="noticegroupname" id="vote22"></p>
                                <p class="noticegroupname" id="vote33"></p>
                                <p class="noticegroupname" id="vote44"></p>
                                <p class="noticegroupname" id="vote55"></p>
                                <p class="noticegroupname" id="totalNum11"></p>
                                <p class="noticegroupname" id="finDate11"></p>
                            </td>
                        </tr>
                    </tbody>
                    <!-- 지도 -->
                </table>
            </div>
        </div>
        <!--/content-area-->
    </div>
    <!--/diary-area-->
    <div class="menu-bar">
        <div class="group-profile">
            <div class="group-profile-img-area">
                <img class="group-profile-img"
                    src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg" alt="프로필사진" />
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


<script>


$(document).ready(function() {
    // 라디오 버튼 변경 시 페이지를 바꿔주는 jQuery 이벤트 처리
    $('input[name="aboardVal"]').on('change', function() {
        // 페이지 전환을 위해 선택된 라디오 버튼의 값을 GET 파라미터로 넘깁니다.
        window.location.href = "noticeEditGroup";
    });
   
    let i = 4;

    $('.plusbtn').on("click", function() {
        if (i <= 5) {
            $('.voteplus').append(
                '<span class="votespan">' + i + '.</span>\
                  <input class="votetitle" type="date" id="vote' + i + '" name="vote' + i + '"><br>'
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

        $("#dataTable1").css("display", "block");
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
        height: 390, // set editor height
        width: 700,
        minHeight: null, // set minimum height of editor
        maxHeight: null, // set maximum height of editor
        focus: true, // set focus to editable area after initializing summernote
        toolbar: [
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['paragraph']],
            ['insert', ['picture', 'link', 'video']],
            ['view', ['codeview']],
            ['custom', ['vote']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana', 'Tahoma', 'Courier New', '맑은 고딕', '굴림', '돋움'],
        fontNamesIgnoreCheck: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana', 'Tahoma', 'Courier New', '맑은 고딕', '굴림', '돋움'],
        buttons: {
            vote: CustomButton // 버튼 동작을 처리하는 함수
        },
        callbacks: {
        	onImageUpload: function(files, editor, welEditable){
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

			     var imageUrl = 'http://localhost:8000/firmeet/upload/' + jsonResult.data ;
			     var style = 'width: 25%';
			     
			     
			     $img = $('<img>').attr({ src: imageUrl }).css("width", "25%")
                 $(editor).summernote('insertNode', $img[0]);
			     
			     
			     //$(editor).summernote('editor.insertImage', imageUrl);
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