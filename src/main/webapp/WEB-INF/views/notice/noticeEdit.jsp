<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/topnav.jsp" %>

    <!----------------------------------------- // top navbar //----------------------------------------->
    <!-- Page Content -->

    <div class="wrap">
    	<div class="diary-area">
        	<div class="diary-topbar">
          		<img class="diary-topbar-img" src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" alt="프로필사진" />
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
            	<form action="${pageContext.request.contextPath }/notice/${memberId}/${clubId}/editwrite" method="get">
        			<div>
			            <select name="" id="" class="selectbox">
			                <option value="notice">공지게시판</option>
			            </select>
			            <input type="radio" name="aboardVal" value="1" id="aboardVal" checked>일반 &nbsp;
			            <input type="radio" name="aboardVal" value="2" id="aboardVal" style="margin-left: 10px;">모임
			            
			            <select name="monthbox" id="monthbox" class="monthbox" onchange="handleOnChange1(this)">
			                <option value="1월">1월</option>
			                <option value="2월">2월</option>
			                <option value="3월">3월</option>
			                <option value="4월">4월</option>
			                <option value="5월">5월</option>
			                <option value="6월">6월</option>
			                <option value="7월">7월</option>
			                <option value="8월">8월</option>
			                <option value="9월">9월</option>
			                <option value="10월">10월</option>
			                <option value="11월">11월</option>
			                <option value="12월">12월</option>
			            </select>
			            
			            <select id="groupbox" class="groupbox" onchange="handleOnChange2(this)">
			                <option value="정기모임">정기모임</option>
			                <option value="깜짝모임">깜짝모임</option>
			                <option value="번개모임">번개모임</option>
			                <option value="일반모임">일반모임</option>
			            </select>
            			
            			<button type="submit" class="btnbox" >등록</button>
        			</div>
        			
			        <div>
			            <label for="firstName" style="font-weight: bold; font-size: 15px; margin-right: 5px;">제목</label>
			            <input class="noticetitle" type="text" id="title" name="title">
			        </div>
			        
			        
			        <!-- 에디터 버튼 -->
					<div>
						<button type="button" class="iconbtn">
							<!-- <label for="chooseFile1"></label> -->
						    <img class="iconimg" src="${pageContext.request.contextPath }/assets/images/icon/image.png" alt="사진">
						</button>
						<input type="file" id="chooseFile1" name="chooseFile1" accept="image/*" onchange="imgshow(event)">
						
						<button type="button" class="iconbtn iconbtn1">
						    <!-- <label for="chooseFile2"></label> -->
						    <img class="iconimg" src="${pageContext.request.contextPath }/assets/images/icon/video.png" alt="영상">
						</button>
						<input type="file" id="chooseFile2" name="chooseFile2" accept="video/*" onchange="videoshow(event)">
						
						<button type="button" class="iconbtn iconbtn1" data-bs-toggle="modal" data-bs-target="#general" onchange="voteshow(event)">
							<img class="iconimg" src="${pageContext.request.contextPath }/assets/images/icon/vote.png" alt="투표">
						</button>
					</div>
       				
       				<!-- 에디터 --> 
					<div id="boardContent" contenteditable="true">
						<div id="image_container"></div>
						<div id="video_container"></div>
						<div id="vote_container"></div>
					</div>
   				 </form>

<!-- The Modal -->
<div class="modal" id="general">
    <div class="modal-dialog">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
          <form action="" method="post" style="margin-left: 20px;">
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
                <button type="button" class="btn btn-success btn-sm" id="saveButton" style="margin-left: 10px;">작성 완료</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <div class="modal" id="group">
    <div class="modal-dialog">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
          <form action="">
            <div class="grouptitle"><span id='result1'></span><span id='result2'></span></div>
            <div class="groupschedule">
                <input type="radio" name="groupschedule" value="" checked>결제 &nbsp;
                <input type="radio" name="groupschedule" value="" style="margin-left: 20px;">일정
            </div>
            <div>
                <span class="groupvotetitle">만남일 </span>
                <input class="groupvotedate" type="date" id="" value=""> ~
                <input class="groupvotedate" type="date" id="" value="">
                <input class="votemin" type="text" id="" value="">시<br>
                <span class="groupvotetitle1">장 소 </span>
                <input class="groupvotemeet" type="text" id="" value="">
                <button type="button" class="btn btn-secondary">지도등록</button><br>
                <span class="groupvotetitle1">회 비 </span>
                <input class="groupvotemeet" type="text" id="" value=""> 원(인당)<br>
                <span class="groupvotetitle2">투표종료 </span>
                <input class="groupvotedate" type="date" id="" value=""><br>
                <div class="groupminmax">
                    <span class="groupvotetitle3">최소인원</span>
                    <input class="votemin" type="text" id="" value="">명
                    / <span class="groupvotetitle3">최대인원</span>
                    <input class="votemin" type="text" id="" value="">명
                </div>
            </div>
            <div style="text-align: center; font-weight: bold; margin-top: 20px;">
                <button type="button" class="btn btn-success" style="margin-left: 10px;">등록하기</button>
            </div>
          </form>
        </div>
      </div>
    </div>
</div>
  <div class="modal" id="groupmeet">
    <div class="modal-dialog">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
          <form action="">
            <div class="grouptitle" id="" value=""></div>
            <div class="groupschedule">
                <input type="radio" name="groupschedule" value="" checked>결제 &nbsp;
                <input type="radio" name="groupschedule" value="" style="margin-left: 20px;">일정
            </div>
            <div>
                <span class="groupvotetitle">만남일 </span>
                <input class="groupvotedate" type="date" id="" value=""> ~
                <input class="groupvotedate" type="date" id="" value="">
                <input class="votemin" type="text" id="" value="">시<br>
                <span class="groupvotetitle1">장 소 </span>
                <input class="groupvotemeet" type="text" id="" value="">
                <button type="button" class="btn btn-secondary">지도등록</button><br>
            </div>
            <div style="text-align: center; font-weight: bold; margin-top: 20px;">
                <button type="button" class="btn btn-success" style="margin-left: 10px;">등록하기</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    </div>

  
    <script>

        $(document).ready(function() {
        	
            let i = 4;
            
            $('.plusbtn').on("click", function(){
                if(i<=5){
                    $('.voteplus').append(
                        '<span class="votespan">'+i+'.</span>\
                        <input class="votetitle" type="date" id="" name="" value=""></br>'
                    );
                    i++;
                }else{
                    $(".plusbtn").css("display" ,"none");
                }
            });
            
            $('#saveButton').on("click", function() {
            	  var voteTitle = $('#voteTitle').val();
            	  var vote1 = $('#vote1').val();
            	  var vote2 = $('#vote2').val();
            	  var vote3 = $('#vote3').val();
            	  var vote4 = $('#vote4').val();
            	  var vote5 = $('#vote5').val();
            	  var totalNum = $('#totalNum').val();
            	  var finDate = $('#finDate').val();
            	  
            	// 모달 닫기
            	  $('#general').modal('hide');

            	  $('#vote_container').html('제목: ' + voteTitle + '<br>1. ' + vote1+ '<br>2. ' + vote2
            			  + '<br>3. ' + vote3
            			  + '<br>최소인원: ' + totalNum+ '<br>투표종료일: ' + finDate);
            });
            
        });
        
        function handleOnChange1(e) {
        	const value = e.value;
        	document.getElementById('result1').innerText = value;
        }
        function handleOnChange2(e) {
        	const value = e.value;
        	document.getElementById('result2').innerText = value;
        }

        //사진파일 보이기
        function imgshow(event) {
            var reader = new FileReader();

            reader.onload = function(event) {
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            document.querySelector("div#image_container").appendChild(img);
            };
            reader.readAsDataURL(event.target.files[0]);
        }
        
        function videoshow(event) {
            var reader = new FileReader();

            reader.onload = function(event) {
            var video = document.createElement("video");
            video.setAttribute("src", event.target.result);
            document.querySelector("div#video_container").appendChild(video);
            };
            reader.readAsDataURL(event.target.files[0]);
        }
        
        
        function voteshow(event) {
            var reader = new FileReader();

            reader.onload = function(event) {
            var vote = document.createElement("vote");
            vote.setAttribute("src", event.target.result);
            document.querySelector("div#vote_container").appendChild(vote);
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>

          <!-- 여기까지 -->

            </div>
          <!--/content-left-->
        </div>
        
        <!--/content-area-->
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
		$(document).ready(function() {
		    $.ajax({
				url: '/edit/images',
				processData : false,
				contentType : false,
				data : formData,
				datatype : JSON,
				type : "POST",
				success : function(data){
					if(data == "f"){
						alert("파일 업로드 실패");
					}
					else{
						$("#formsub").submit();
					}
				}
			});
		});
</script>
</html>