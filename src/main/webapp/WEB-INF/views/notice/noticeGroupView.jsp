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
                <table id="dataTable" data-bs-toggle="modal" data-bs-target="#vote">
					<thead>
					<tr>
	                     <th class="noticegrouplist">
	                         <p class="noticegroupname"><span>투표 제목 : </span>${vo.voteTitle}</p>
	                     </th>
	                   </tr>
	               </thead>
	               <tbody>
	                   <tr>
	                     <td class="noticegrouplist1">
	                         <p class="noticegroupname"><span>투표1 : </span>${vo.vote1}</p>
	                         <p class="noticegroupname"><span>투표2 : </span>${vo.vote2}</p>
	                         <p class="noticegroupname"><span>투표3 : </span>${vo.vote3}</p>
	                         <p class="noticegroupname"><span>투표4 : </span>${vo.vote4}</p>
	                         <p class="noticegroupname"><span>투표5 : </span>${vo.vote5}</p>
	                         <p class="noticegroupname"><span>최소인원 : </span>${vo.totalNum}</p>
	                         <p class="noticegroupname"><span>투표종료일 : </span>${vo.finDate}</p>
	                     </td>
	                 </tr>
	               </tbody>
               </table>
      
              <div class="like">
                  <span class="likecolor">♡</span><span>좋아요</span><span class="likecount">0</span>
              </div>
              
        <div class="modal" id="vote">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                  </div>
                  <div class="modal-body">
                  	<form action="${pageContext.request.contextPath }/notice/${aboardNo}/${memberId}/${voteNo}/vote" method="get">
						${vo.voteTitle}
                        <div class="voteleft">
                        	
                            <input type="radio" name="choice" id="1" value="1"><span class="votespan">${vo.vote1}</span><br>
                            <input type="radio" name="choice" id="2" value="2"><span class="votespan">${vo.vote2}</span><br>
                           	<input type="radio" name="choice" id="3" value="3"><span class="votespan">${vo.vote3}</span><br>
                           	<input type="radio" name="choice" id="4" value="4"><span class="votespan">${vo.vote4}</span><br>
                           	<input type="radio" name="choice" id="5" value="5"><span class="votespan">${vo.vote5}</span><br>
                        </div>
                        <div style="text-align: center; font-weight: bold;">
                			<button type="submit" class="btn btn-success btn-sm">투표완료</button>
                        </div>
                    </form>
                   </div>
              </div>
          </div>
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
			
		});
  </script>
</html>