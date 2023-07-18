<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>어푸어푸 보더</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <!--  -->
  <link href="${pageContext.request.contextPath }/assets/css/main2.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/content3.css" type="text/css" />
    <!--모달-->
  </head>

  <body>
    <!----------------------------------------- top Navigation ----------------------------------------->
    <nav class="navbar navbar-expand-lg navbar-dark $purple-100 static-top">
      <div class="container">
        <a class="navbar-brand" href="#">
          <img
            src="https://placeholder.pics/svg/150x50/888888/EEE/Logo"
            alt="..."
            height="36"
          />
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">홈</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">링크</a>
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                드롭다운
              </a>
              <ul
                class="dropdown-menu dropdown-menu-end"
                aria-labelledby="navbarDropdown"
              >
                <li><a class="dropdown-item" href="#">액션</a></li>
                <li><a class="dropdown-item" href="#">다른 액션</a></li>
                <li>
                  <hr class="dropdown-divider" />
                </li>
                <li>
                  <a class="dropdown-item" href="#">다른 항목</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!----------------------------------------- // 상단 내비게이션 바 //----------------------------------------->
    <!-- 페이지 콘텐츠 -->

    <div class="wrap">
      <div class="diary-area">
        <div class="diary-topbar">
          <img
            class="diary-topbar-img"
            src="../../../assets/image/pexels-photo-704569.jpeg"
            alt="프로필사진"
          />
          <h1>어푸어푸</h1>
        </div>
        <!--/diary-topbar-img-->
        <div class="diary-subbar">
          <h4>개시판</h4>
        </div>
        <!--/diary-subbar-->
        <div class="content-area">
          <div class="content-left">
            <dl>
              <dt><span></span>23년 7월</dt>
              <dd>- 어푸어푸 수영대회</dd>
              <dd>- 어푸어푸 수영대회</dd>
              <dd>- 어푸어푸 수영대회</dd>
              <dt><span></span>23년 6월</dt>
              <dd>- 어푸어푸 수영대회</dd>
              <dd>- 어푸어푸 수영대회</dd>
              <dd>- 어푸어푸 수영대회</dd>
              <dt><span></span>23년 5월</dt>
              <dd>- 어푸어푸 수영대회</dd>
              <dd>- 어푸어푸 수영대회</dd>
              <dd>- 어푸어푸 수영대회</dd>
              <dt><span></span>23년 4월</dt>
              <dd>- 어푸어푸 수영대회</dd>
              <dd>- 어푸어푸 수영대회</dd>
              <dd>- 어푸어푸 수영대회</dd>
              <dt><span></span>23년 3월</dt>
              <dd>- 어푸어푸 수영대회</dd>
              <dd>- 어푸어푸 수영대회</dd>
              <dd>- 어푸어푸 수영대회</dd>
            </dl>
          </div>
          <!--/content-left-->
          <div class="content-right">
            <div class="content-bnt">
              <button>개시글올리기</button>
            </div>
            <!--content-bnt-->

            <div class="board-area">
              <div class="border">
                <div class="border-main">
                  <div class="border-group">
                    <img src="./asset/pro.jpg" alt="유저프로필" />
                    <h4>어푸어푸</h4>
                  </div>
                  <!--border-group-->
                  <div class="border-title">
                    <span class="title">유퀴즈 600화 예고편</span>
                  </div>
                  <!--border-title-->
                  <div class="border-content">
                    <p>
                      현역시절 연느의 마인드 컨트롤 법 <br />
                      “이렇게 많은 경험과 좋은 성적을 쌓아 왔는데 한번의 실수로
                      이것들을 다 무너지지 않을거다”라고 생각 했다고<br />
                      아!! 멋있다 .. <br />
                    </p>
                    <button>댓글 v</button>
                  </div>
                  <!--border-content-->
                </div>
                <!--border-main-->
                <div class="share">
                  <button>댓글달기</button>
                  <button>공유하기</button>
                </div>
                <!--share-->
                <div class="comment">
                  <div class="comment-profile">
                      <img src="./asset/pro.jpg" alt="유저프로필" />
                      <p>김철수철철수</p>
                  </div>
                  <!--comment-profile-->
                  <div class="comment-content">
                    <p>
                      퍼가요^^
                    </p>
                    <button>사진올리기</button>
                  </div>
                  <!--comment-content"-->
                </div>
                <!--comment-->
              </div>
              <!--border-->
            </div>
            <!--board-area-->
          </div>
          <!--/content-right-->
        </div>
        <!--/content-area-->
      </div>
      <!--/diary-area-->
      <div class="menu-bar" name="사이드메뉴바">
        <div class="group-profile">
          <div class="group-profile-img-area">
            <img
              class="group-profile-img"
              src="../../../assets/image/pexels-photo-704569.jpeg"
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
  <!--아코디언 nav-->
  <script>
    var $target = $("dt"),
      isClass = null;

    $target.on("click", function () {
      var _$self = $(this),
        isActive = _$self.hasClass("active");

      _$self.toggleClass("active");
      _$self.nextUntil("dt").slideToggle(!isActive);
    });
  </script>
</html>
