<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/topnav.jsp" %>
    <!----------------------------------------- // top navbar //----------------------------------------->
    <!-- Page Content -->

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
                    <button type="button" class="btn btn-warning">목록</button>
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
                      <span class="usertext"></span>
                  </div>
              </div>
              <hr>
              <div>
                  <p class="noticecontent"> ${vo.boardContent}</p>
              </div>
                <table id="dataTable">
					<thead>
					<tr>
	                     <th class="noticegrouplist">
	                         <p class="noticegroupname"><span>투표 제목 : </span>${vo.meetYear}<span>년&nbsp;</span>${vo.meetMon}<span>월&nbsp;</span>${vo.meetName}</p>
	                     </th>
	                   </tr>
	               </thead>
	               <tbody>
	                   <tr>
                       	  <td class="noticegrouplist1">
                             <span class="noticegroupname" id="startDate1"><span>만남일 : </span>${vo.startDate}</span> ~ <span class="noticegroupname" id="endDate1"><span>종료일 : </span>${vo.endDate}</span>
                             <p class="noticegroupname" id="meetTime1"><span>만남시간 : </span>${vo.meetTime}</p>
                             <p class="noticegroupname" id="meetPlace1"><span>만남장소 : </span>${vo.meetPlace}</p>
                             <p class="noticegroupname" id="price1"><span>회비 : </span>${vo.price}</p>
                             <p class="noticegroupname" id="voteEnd1"><span>투표종료일 : </span>${vo.voteEnd}</p>
                             <p class="noticegroupname" id="minPerson1"><span>최소인원 : </span>${vo.minPerson}</p>
                             <p class="noticegroupname" id="maxPerson1"><span>최대인원 : </span>${vo.maxPerson}</p>
                             <button>dfdsfs</button>
                          </td>
	                 </tr>
	               </tbody>
               </table>
      
              <div class="like">
                  <span class="likecolor">♡</span><span>좋아요</span><span class="likecount">0</span>
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
           <img class="profileimg" src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" alt=""> 
           <span class="username">홍순이</span>
           <p class="noticereplytext"></p>
           <span class="userdate">작성일 : </span>
           <p class="usertext"></p>
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
		$(document).ready(function() {
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
  </script>
</html>