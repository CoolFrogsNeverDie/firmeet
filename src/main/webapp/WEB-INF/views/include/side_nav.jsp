<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <!--/diary-area-->
      <div class="menu-bar" name="사이드메뉴바">
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
          <li><a href ="${pageContext.request.contextPath}/${club.clubId}/notice/noticelist">공지사항</a></li>  
          <li><a href ="${pageContext.request.contextPath }/gallery/list/${club.clubId}">갤러리</a></li>
          <li><a href ="${pageContext.request.contextPath }/calendar/club/${club.clubId}">달력</a></li>
          <li><a href ="${pageContext.request.contextPath }/board/club/${club.clubId}">자유 게시판</a></li>
          <li><a href ="#">멤버</a></li>
          <li><a href ="${pageContext.request.contextPath }/accountBook/main/${club.clubId}">가계부</a></li>
        </ul>
        <!--/side-nav-->
      </div>
      <!--/menu-bar-->
    </div>
    <!--/wrap-->
  </body>
  <script src="${pageContext.request.contextPath }/assets/js/imgSlider.js"></script>
</html>
    