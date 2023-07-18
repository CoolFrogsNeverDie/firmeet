<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/topnav.jsp" %>

<!----------------------------------------- // top navbar //----------------------------------------->
<!-- Page Content -->

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
                <form action="${pageContext.request.contextPath}/notice/${clubId}/${memberId}/editwritegroup" class="formleft" method="get">
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

                        <button type="submit" class="btnbox">등록</button>
                    </div>

                    <div>
                        <label for="firstName" style="font-weight: bold; font-size: 15px; margin-right: 5px;">제목</label>
                        <input class="noticetitle" type="text" id="title" name="title" placeholder="제목을 입력해주세요">
                    </div>

                    <div class="ababab">
                        <textarea id="summernote" name="boardContent"></textarea>
                        <div class="contentleftbox"></div>
                    </div>
                
	      <!-- -------------------------------------------------결제투표-------------------------------------------------------->
	                 
 	             <div class="modal" id="group">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                 <div class="grouptitle" id="result"></div>
                                 <div class="groupschedule">
                                     <input type="radio" name="groupschedule" value="" id="pay" checked>결제 &nbsp;
                                     <input type="radio" name="groupschedule" value="" style="margin-left: 20px;">일정
                                 </div>
                                  <div>
                                     <span class="groupvotetitle">만남일 </span>
                                     <input class="groupvotedate" type="date" id="startDate" name="startDate"> ~
                                     <input class="groupvotedate" type="date" id="endDate" name="endDate">
                                     <input class="votemin" type="text" id="meetTime" name="meetTime">시<br>
                                     <span class="groupvotetitle1">장 소 </span>
                                     <input class="groupvotemeet" type="text" id="meetPlace" name="meetPlace">
                                     <button type="button" class="btn btn-secondary" id="popupBtn">지도등록</button><br>
                                     
                                     <!------------------------------------- 팝업창 ----------------------------------> 
										<div id="modalWrap">
										  <div id="modalContent">
										    <div id="modalBody">
										      <span id="closeBtn">&times;</span> 
										      <%@ include file="test.jsp" %>
										    </div>
										  </div>
										</div>
									<!------------------------------------- 팝업창 ----------------------------------> 
									
                                     <span class="groupvotetitle1">회 비 </span>
                                     <input class="groupvotemeet" type="text" id="price" name="price"> 원(인당)<br>
                                     <span class="groupvotetitle2">투표종료 </span>
                                     <input class="groupvotedate" type="date" id="voteEnd" name="voteEnd"><br>
                                    <div class="groupminmax">
                                         <span class="groupvotetitle3">최소인원</span>
                                         <input class="votemin" type="text" id="minPerson" name="minPerson">명
                                         / <span class="groupvotetitle3">최대인원</span>
                                         <input class="votemin" type="text" id="maxPerson" name="maxPerson">명
                                     </div>
                                 </div>
                                 <div style="text-align: center; font-weight: bold; margin-top: 20px;">
                                     <button type="button" class="btn btn-success" id="saveButton2" style="margin-left: 10px;">등록하기</button>
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
	      <!---------------------------------------------------결제일반------------------------------------------------------ -->
                <div class="modal" id="groupmeet">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <div class="grouptitle" id=""></div>
                                <div class="groupschedule">
                                    <input type="radio" name="groupschedule" value="" checked>결제 &nbsp;
                                    <input type="radio" name="groupschedule" value=""
                                        style="margin-left: 20px;">일정
                                </div>
                                <div>
                                    <span class="groupvotetitle">만남일 </span>
                                   	<input class="groupvotedate" type="date" id="startDate" name="startDate"> ~
                                    <input class="groupvotedate" type="date" id="endDate" name="endDate">
									<input class="votemin" type="text" id="meetTime" name="meetTime">시<br>
                                    <span class="groupvotetitle1">장 소 </span>
                                    <input class="groupvotemeet" type="text" id="meetPlace" name="meetPlace">
                                    <button type="button" class="btn btn-secondary" id="searchButton">지도등록</button><br>
                                </div>
                                <div style="text-align: center; font-weight: bold; margin-top: 20px;">
                                    <button type="button" class="btn btn-success"
                                        style="margin-left: 10px;">등록하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			</form>
			<script>
			/* 팝업창 띄우기 */
			  const btn = document.getElementById('popupBtn');
			  const modal = document.getElementById('modalWrap');
			  const closeBtn = document.getElementById('closeBtn');
			  
			  modal.style.display = 'none';
			
			  btn.onclick = function() {
			    modal.style.display = 'block';
			  }
			  closeBtn.onclick = function() {
			    modal.style.display = 'none';
			  }
			
			  window.onclick = function(event) {
			    if (event.target == modal) {
			      modal.style.display = "none";
			    }
			  }
			/* 팝업창 띄우기 끝 */
			</script>
     <!-- 여기까지 -->
            </div>
            <!--/content-left-->
            <div class="content-right">
                <table id="dataTable2" style="display: none;">
                    <thead>
                        <tr>
                            <th class="noticegrouplist">
                                <p class="noticegroupname" id="result1"></p>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="noticegrouplist1">
                                <span class="noticegroupname" id="startDate1"></span> ~ <span class="noticegroupname" id="endDate1"></span>
                                <p class="noticegroupname" id="meetTime1"></p>
                                <p class="noticegroupname" id="meetPlace1"></p>
                                <p class="noticegroupname" id="price1"></p>
                                <p class="noticegroupname" id="voteEnd1"></p>
                                <p class="noticegroupname" id="minPerson1"></p>
                                <p class="noticegroupname" id="maxPerson1"></p>
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

    $("#saveButton2").on("click", function() {
	    var meetYearValue = $('#meetYear').val();
	    var meetMonValue = $('#meetMon').val();
	    var meetNameValue = $('#meetName').val();
	    var combinedValue = meetYearValue + ' ' + meetMonValue+ ' ' + meetNameValue;
    	var result = $("#result").val();
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
        var meetTime = $("#meetTime").val();
        var meetPlace = $("#meetPlace").val();
        var price = $("#price").val();
        var voteEnd = $("#voteEnd").val();
        var minPerson = $("#minPerson").val();
        var maxPerson = $("#maxPerson").val();

        $("#dataTable2").css("display", "block");
        $("#group").modal("hide");

        $("#result1").text(combinedValue);
        $("#startDate1").text("시작일 : " + startDate);
        $("#endDate1").text("종료일 : " + endDate);
        $("#meetTime1").text("시간 : " + meetTime+" 시");
        $("#meetPlace1").text("장소 : " + meetPlace);
        $("#price1").text("price회비 : " + price);
        $("#voteEnd1").text("투표종료일 : " + voteEnd);
        $("#minPerson1").text("최소인원 : " + minPerson);
        $("#maxPerson1").text("최대인원 : " + maxPerson);
    });
    
  	$('#group').on("click", function() {
	    var meetYearValue = $('#meetYear').val();
	    var meetMonValue = $('#meetMon').val();
	    var meetNameValue = $('#meetName').val();
	    var combinedValue = meetYearValue + '년 ' + meetMonValue+ '월 ' + meetNameValue;

	    $('#result').text(combinedValue);
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
        }
    });
});

var setting = {
    height: 500,
    minHeight: null,
    maxHeight: null,
    focus: true,
    lang: 'ko-KR',
    toolbar: toolbar,
    //콜백 함수
    callbacks: {
        onImageUpload: function(files, editor, welEditable) {
            // 파일 업로드(다중업로드를 위해 반복문 사용)
            for (var i = files.length - 1; i >= 0; i--) {
                upload(files[i], this);
            }
        }
    }
};

function upload(file, editor) {
    var data = new FormData();
    data.append("file", file);
    $.ajax({
        url: 'upload',
        type: "POST",
        enctype: 'multipart/form-data',
        data: data,
        contentType: false,
        processData: false,
        success: function(data) {
            $(editor).summernote('editor.insertImage', data.url);
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
            $('#group').modal('show');
        }
    });
    return button.render();
}

</script>

</html>
