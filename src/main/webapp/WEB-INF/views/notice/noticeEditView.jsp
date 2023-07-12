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
           
            <form>
        <div>
            <select name="" id="" class="selectbox">
                <option value="notice">공지게시판</option>
            </select>
            <input type="radio" name="group" value="" checked>일반 &nbsp;
            <input type="radio" name="group" value="" style="margin-left: 10px;">모임
            <select name="" id="" class="monthbox">
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
            <select id="" class="groupbox">
                <option value="">정기모임</option>
                <option value="">깜짝모임</option>
                <option value="">번개모임</option>
                <option value="">일반모임</option>
            </select>
            <button class="btnbox" onclick="" type="button">등록</button>
        </div>
        <div>
            <label for="firstName" style="font-weight: bold; font-size: 15px; margin-right: 5px;">제목</label>
            <input class="noticetitle" type="text" id="" name="">
        </div>
        <div>
            <button type="button" class="iconbtn">
                <label for="chooseFile1">
                    <img class="iconimg" src="${pageContext.request.contextPath }/assets/images/icon/image.png" alt="사진">
                </label>
            </button>
            <input type="file" id="chooseFile1" name="chooseFile1" accept="image/*" onchange="imgshow(event)">

            <button type="button" class="iconbtn iconbtn1">
                <label for="chooseFile2">
                	<img class="iconimg" src="${pageContext.request.contextPath }/assets/images/icon/video.png" alt="영상">
                </label>
            </button>
            <input type="file" id="chooseFile2" name="chooseFile2" accept="video/*" onchange="videoshow(event)">
            
            <button type="button" class="iconbtn iconbtn1" data-bs-toggle="modal" data-bs-target="#groupmeet">
            	<img class="iconimg" src="${pageContext.request.contextPath }/assets/images/icon/vote.png" alt="투표">
            </button>
        </div>
    </form>

    <div id="framebox" contenteditable="true" contenteditable>
        <div id="image_container"></div>
        <div id="video_container"></div>
         <div>
            <div>
                <input class="noticecontent" type="text" id="" value="" maxlength="50">
            </div>
            <c:forEach var="elist" items="${elist }">
            <div class="noticevotebox">
                <div class="noticevotetitle">
                    <p class="noticevotetitle1">${elist.voteTitle }</p>
                    <p>${elist.voteTitle }</p>
                </div>
                <div class="noticevotecontent">
                    <ul>
                        <li>${elist.vote1 }</li>
                        <li>${elist.vote2 }</li>
                        <li>${elist.vote3 }</li>
                    </ul>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>

    <script>

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
