<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>어푸어푸 가계부</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/accountbook.css"
        rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/assets/css/main2.css"
        rel="stylesheet" type="text/css" />
    <!--모달-->
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" />
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>

<body>
    <!-- top Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark $purple-100 static-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/assets/images/logo/logo_b.png" alt="..." height="36" />
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">홈</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">링크</a></li>
                    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                            role="button" data-bs-toggle="dropdown" aria-expanded="false">드롭다운</a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">액션</a></li>
                            <li><a class="dropdown-item" href="#">다른 액션</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="#">다른 항목</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- // top Navigation -->

    <div class="wrap">
        <div class="diary-area">
            <div class="diary-topbar">
                <img class="diary-topbar-img" src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg"
                    alt="프로필사진" />
                <h1>어푸어푸</h1>
            </div>
            <!--/diary-topbar-img-->
            <div class="diary-subbar">
                <h4>가계부</h4>
            </div>
            <!--/diary-subbar-->
            <div class="content-area">
                <div class="content-left">
                    <div class="content-bnt">
                        <form method="POST">
                            <input type="date"> ~ <input type="date"> <input type="text"
                                placeholder="검색어를 입력하세요." /> <input
                                style="background-color: black; color: white; width: 100px; height: 50px;"
                                type="submit" value="검색" />
                        </form>
                        <button
                            style="background-color: black; color: white; width: 100px; height: 50px; float: right;">+</button>
                    </div>
                    <!--/content-bnt-->
                    <div class="table">
                        <div class="table-header">
                            <div class="header_item">
                                <a id="memberId" class="filter_link filter_link-number" href="#">결제자</a>
                            </div>
                            <div class="header_item">
                                <a id="dateTime" class="filter_link" href="#">일시</a>
                            </div>
                            <div class="header_item">
                                <a id="purpose" class="filter_link" href="#">용도</a>
                            </div>
                            <div class="header_item">
                                <a id="category" class="filter_link" href="#">수입/지출</a>
                            </div>
                            <div class="header_item">
                                <a id="income_expense" class="filter_link" href="#">카테고리</a>
                            </div>
                            <div class="header_item">
                                <a id="amount" class="filter_link" href="#">금액</a>
                            </div>
                            <div class="header_item">
                                <a id="meetNo" class="filter_link" href="#">모임명</a>
                            </div>
                        </div>
                        <div class="table-content-wrapper">
                            <div class="table-content" id="target"></div>
                        </div>
                    </div>
                    <!--/table-->
					<script src="${pageContext.request.contextPath}/assets/js/accountbook_data.js"></script>
                    <script src="${pageContext.request.contextPath}/assets/js/accountbook.js"></script>
                </div>
                <!--/content-left-->
            </div>
            <!--/content-area-->
        </div>
        <!--/diary-area-->
        <div class="menu-bar" name="사이드메뉴바">
            <div class="group-profile">
                <div class="group-profile-img-area">
                    <img class="group-profile-img"
                        src="${pageContext.request.contextPath}/assets/images/testimg/dog1.jpg"
                        alt="프로필사진" />
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
    <footer>
        Copyright (C) 2023 어리쥬 all rights reserved.
    </footer>
</body>
</html>
