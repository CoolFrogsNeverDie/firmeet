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
           
            <form class="noticeform" action="">
              <div>
                  <p class="noticetitle" id="">${vo.title }</p>
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
              <hr class="line">
      
              <div class="noticecontentbox">
                  <div>
                      <p class="noticecontent" id=""> ${vo.boardContent}</p>
                  </div>
                  <table id="dataTable" style="display: none;">
					<thead>
						<tr>
	                      <th class="noticegrouplist">
	                          <p class="noticegroupname" id="voteTitle1"></p>
	                      </th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                      <td class="noticegrouplist1">
	                          <p class="noticegroupname" id="vote1"></p>
	                          <p class="noticegroupname" id="vote2"></p>
	                          <p class="noticegroupname" id="vote3"></p>
	                          <p class="noticegroupname" id="totalNum"></p>
	                          <p class="noticegroupname" id="finDate"></p>
	                      </td>
	                  </tr>
	                </tbody>
              	 </table>
              </div>
      
              <div>
                  <span class="likecolor">♡</span><span>좋아요</span><span class="likecount" id="" value="">0</span>
              </div>
              <hr class="line">
              <div>
                  <h4 class="noticereplytitle">댓글</h4>
                  <div>
                      <img class="profileimg" src="${pageContext.request.contextPath }/assets/images/testimg/dog1.jpg" alt=""> 
                      <span class="username" id="" name="" value="">홍순이</span>
                      <input class="noticereply" type="text" id="" value="">
                      <span class="userdate">작성일 : </span>
                      <input class="usertext" type="text" id="" value="">
                  </div>
              </div>
          </form>
            
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
</html>