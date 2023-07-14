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
        <!--  -->
        
        <div>
            <div>
                <input class="noticecontent" type="text" id="" value="" maxlength="50">
            </div>
            <div class="noticevotebox">
                <div class="noticevotetitle">
                    <p class="noticevotetitle1">ex([7월 1일 투표 마감])</p>
                    <p>ex(7월 정모 가능한 날짜를 알려주세요)</p>
                </div>
                <div class="noticevotecontent">
                    <ul>
                        <li>ex(2023-07-08)</li>
                        <li>ex(2023-07-15)</li>
                        <li>ex(2023-07-22)</li>
                    </ul>
                </div>
            </div>
        </div>

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

</html>