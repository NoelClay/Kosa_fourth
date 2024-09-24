<%--
  User: 문현동
  Date: 2024-09-12
  Time: 오후 3:56
  유저 검색을 위한 페이지.
  유저 이메일아이디나 닉네임에 어떤 글자가 포함되있는지를 기준으로 하여 찾습니다.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>유저 검색</title>
	<link rel="stylesheet" href="/css/template-style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- 김남영 홈페이지 스타일 통일을 위한 커스텀 태그들 추가 -->
	<style>
		/* 홈페이지 관련 스타일 태그 추가 */
		.audio-player {
			text-align: center;
			align-content: center;
			align-items: center;
			margin: 30px;
			margin-left: 200px;
			width: 50px;
			height: 50px;
		}

		.guestbook {
			width: 100%;
			border-collapse: collapse;
		}

		.guestbook th,
		.guestbook td {
			border: 1px solid #ddd;
			padding: 10px;
			text-align: center;
		}

		.guestbook th {
			background-color: #34495e;
			color: white;
		}

		/*!* 모달 스타일 *!*/
		/*.modal {*/
		/*	display: none;*/
		/*	position: fixed;*/
		/*	z-index: 1;*/
		/*	left: 0;*/
		/*	top: 0;*/
		/*	width: 100%;*/
		/*	height: 100%;*/
		/*	overflow: auto;*/
		/*	background-color: rgba(0, 0, 0, 0.5);*/
		/*	padding-top: 60px;*/
		/*}*/
		
		/*.modal-content {*/
		/*	background-color: #fefefe;*/
		/*	margin: 5% auto;*/
		/*	padding: 20px;*/
		/*	border: 1px solid #888;*/
		/*	width: 60%;*/
		/*	border-radius: 10px;*/
		/*}*/
		
		/*.close {*/
		/*	color: #aaa;*/
		/*	float: right;*/
		/*	font-size: 28px;*/
		/*	font-weight: bold;*/
		/*}*/
		
		/*.close:hover,*/
		/*.close:focus {*/
		/*	color: black;*/
		/*	text-decoration: none;*/
		/*	cursor: pointer;*/
		/*}*/
		
		/*button {*/
		/*	border-radius: 4px;*/
		/*	transition: all 0.3s ease;*/
		/*}*/
		
		/*button:hover {*/
		/*	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);*/
		/*}*/

		.menu-icon svg:hover {
			transform: scale(1.1);
			/* 호버 시 확대 효과 */
			background-color: #1abc9c;
		}

		.menu-icon button:hover {
			transform: scale(1.1);
			/* 호버 시 확대 효과 */
			background-color: #1abc9c;
		}

		.menu-icon svg {
			width: 100%;
			height: 100%;
			border-radius: 50%;
			/* 동그랗게 만듦 */
			cursor: pointer;
			transition: transform 0.3s, background-color 0.3s;
		}

		.menu-icon button {
			width: 100%;
			height: 100%;
			border-radius: 50%;
			/* 동그랗게 만듦 */
			cursor: pointer;
			transition: transform 0.3s, background-color 0.3s;
		}
	</style>
</head>
<body>
<div class="container">
<!--
			Sidebar 메뉴를 담당하는 aside 요소
			상단에는 게시글 보기, 방명록 보기, 유저 검색 버튼
			중간에는 유저 프로필과 소개 (프로필 사진 클릭 시 페이지 이동)
			하단에는 게시글 쓰기, 방명록 쓰기, 페이지 설정 버튼
	-->
	<aside class="sidebar">
		<!-- 상단 메뉴 -->
		<div class="menu-top">
			<a href="/baseleap/postlist" class="menu-icon" title="게시글 보기">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-columns-reverse" viewBox="0 0 16 16">
					<path fill-rule="evenodd"
					      d="M0 .5A.5.5 0 0 1 .5 0h2a.5.5 0 0 1 0 1h-2A.5.5 0 0 1 0 .5m4 0a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1h-10A.5.5 0 0 1 4 .5m-4 2A.5.5 0 0 1 .5 2h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m4 0a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m-4 2A.5.5 0 0 1 .5 4h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m4 0a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5m-4 2A.5.5 0 0 1 .5 6h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m4 0a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5m-4 2A.5.5 0 0 1 .5 8h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m4 0a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5m-4 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m4 0a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1h-10a.5.5 0 0 1-.5-.5m-4 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m4 0a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5m-4 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m4 0a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5"></path>
				</svg>
			</a>
			<!-- <form action="/baseleap/home/page" method="get" class="menu-icon" title="방명록 보기">
				<input type="hidden" name="pageUserId" value="${sessionScope.homePageId}">
				<button type="submit">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal-text" viewBox="0 0 16 16">
						<path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5"></path>
						<path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2"></path>
						<path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z"></path>
					</svg>
				</button>

			</form> -->
			<a href="/baseleap/home/page?pageUserId=${sessionScope.homePageId}" class="menu-icon" title="방명록 보기">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal-text" viewBox="0 0 16 16">
					<path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5m0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5"></path>
					<path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2"></path>
					<path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z"></path>
				</svg>
			</a>
			<a href="/baseleap/my-page/search" class="menu-icon" title="유저 검색">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
				</svg>
			</a>
		</div>
		
		<!-- 유저 프로필 영역 -->
		<div class="user-profile">
			<a href="/baseleap/home/page?pageUserId=${sessionScope.homePageId}">
				<img src="${profileImg}" alt="Profile Picture" class="profile-picture">
			</a>
			<div class="user-info">
				<h2>${nickName}'s HomePage</h2>
				<hr>
				<p>${userIntroduce}</p>
			</div>
		</div>
		
		<!-- 하단 메뉴 -->
		<div class="menu-bottom">
			<a href="#" class="menu-icon" title="게시글 쓰기">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
					<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"></path>
					<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"></path>
				</svg>
			</a>
			
			<!-- 현재 로그인한 유저가 페이지 소유자인 경우 홈피 꾸미기 버튼이 보이도록 설정 -->
			<c:if test="${sessionScope.loginUserId == sessionScope.homePageId}">
				<a class="menu-icon" id="openSettings">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-brush" viewBox="0 0 16 16">
						<path d="M15.825.12a.5.5 0 0 1 .132.584c-1.53 3.43-4.743 8.17-7.095 10.64a6.1 6.1 0 0 1-2.373 1.534c-.018.227-.06.538-.16.868-.201.659-.667 1.479-1.708 1.74a8.1 8.1 0 0 1-3.078.132 4 4 0 0 1-.562-.135 1.4 1.4 0 0 1-.466-.247.7.7 0 0 1-.204-.288.62.62 0 0 1 .004-.443c.095-.245.316-.38.461-.452.394-.197.625-.453.867-.826.095-.144.184-.297.287-.472l.117-.198c.151-.255.326-.54.546-.848.528-.739 1.201-.925 1.746-.896q.19.012.348.048c.062-.172.142-.38.238-.608.261-.619.658-1.419 1.187-2.069 2.176-2.67 6.18-6.206 9.117-8.104a.5.5 0 0 1 .596.04M4.705 11.912a1.2 1.2 0 0 0-.419-.1c-.246-.013-.573.05-.879.479-.197.275-.355.532-.5.777l-.105.177c-.106.181-.213.362-.32.528a3.4 3.4 0 0 1-.76.861c.69.112 1.736.111 2.657-.12.559-.139.843-.569.993-1.06a3 3 0 0 0 .126-.75zm1.44.026c.12-.04.277-.1.458-.183a5.1 5.1 0 0 0 1.535-1.1c1.9-1.996 4.412-5.57 6.052-8.631-2.59 1.927-5.566 4.66-7.302 6.792-.442.543-.795 1.243-1.042 1.826-.121.288-.214.54-.275.72v.001l.575.575zm-4.973 3.04.007-.005zm3.582-3.043.002.001h-.002z">
						</path>
					</svg>
				</a>
				<a href="/baseleap/my-page/info" class="menu-icon" title="페이지 설정">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
						<path
								d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492M5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0">
						</path>
						<path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115z"></path>
					</svg>
				</a>
			</c:if>
			<!-- 로그인 유저가 페이지 소유자가 아닌 경우 '나의 한마디' 버튼이 보이도록 설정 -->
			<c:if test="${sessionScope.loginUserId != sessionScope.homePageId}">
				<a class="menu-icon" id="openGuestBookForm">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
						<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001m-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708z"></path>
					</svg>
				</a>
				<a href="#" class="menu-icon" title="페이지 설정">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
						<path
								d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492M5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0">
						</path>
						<path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115z"></path>
					</svg>
				</a>
			</c:if>
		</div>
	</aside>
	
	<!-- 메인 콘텐츠 -->
	<main class="content">
		<div class="post-summary">
			<div class="mt-3">
				<div class="mb-3 d-flex justify-content-center align-items-center">
					<form action="${pageContext.request.contextPath}/baseleap/my-page/search-result" method="post">
						<div class="row g-3 align-items-center">
							<div class="col-auto">
								<label for="keyword" class="form-label">유저 검색</label>
							</div>
							<div class="col-auto">
								<input type="text" class="form-control" id="keyword" name="keyword">
							</div>
							<div class="col-auto">
								<button type="submit" class="btn btn-primary">검색하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<hr>
			<div>
				<div class="d-flex justify-content-center align-items-center">
					<c:choose>
						<%--검색 결과가 없을 때...--%>
						<c:when test="${empty userFollowStatusList}">
							결과가 없습니다.
						</c:when>
						<%--검색 결과 있음...--%>
						<c:otherwise>
							<div>
								<table class="mb-0 table table-hover table-bordered">
									<thead>
                  <th>홈페이지</th>
									<th>프로필 이미지</th>
									<th>이메일</th>
									<th>닉네임</th>
									<th>자기소개</th>
									<th>팔로우</th>
									<th>메세지 전송</th>
									</thead>
									<tbody>
									<c:forEach var="userFollowStatus" items="${userFollowStatusList}" varStatus="status">
										<tr>
                      <td><form action="/baseleap/home/page">
                        <input type="hidden" name="pageUserId" value="${userFollowStatus.userDTO.id}">
                        <button class="btn btn-secondary" type="submit">방문</button>
                      </form></td>
											<td><img class="profile-img" src="/image/${userFollowStatus.userDTO.profileImage}" alt=""></td>
											<td>${userFollowStatus.userDTO.email}</td>
											<td>${userFollowStatus.userDTO.nickname}</td>
											<td>${userFollowStatus.userDTO.userIntroduce}</td>
											<c:choose>
												<c:when test="${!userFollowStatus.userDTO.id.equals(sessionScope.userId)}">
													<c:choose>
														<c:when test="${!userFollowStatus.follow}">
															<td>
																<form id="following-form-${status.count}" onsubmit="submitFollowingForm(event)">
																	<input type="hidden" value="${userFollowStatus.userDTO.id}">
																	<button class="btn btn-primary" type="submit">팔로잉</button>
																</form>
															</td>
														</c:when>
														<c:otherwise>
															<td>
																<form id="unfollow-form-${status.count}" onsubmit="submitUnfollowForm(event)">
																	<input type="hidden" value="${userFollowStatus.userDTO.id}">
																	<button class="btn btn-primary" type="submit">언팔로우</button>
																</form>
															</td>
														</c:otherwise>
													</c:choose>
													<td>
														<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#message-modal-${status.count}">메세지 보내기</button>
														<div class="modal fade" id="message-modal-${status.count}" tabindex="-1" aria-hidden="true">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<h1 class="modal-title fs-5">메세지 보내기</h1>
																		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
																	</div>
																	<div class="modal-body">
																		<form id="send-message-form-${status.count}" onsubmit="submitSendMessageForm(event)">
																			<input type="hidden" class="receiver-id" value="${userFollowStatus.userDTO.id}">
																			<div class="mb-3">
																				<label for="target-user-${status.count}" class="col-form-label">받는 사람: </label>
																				<input type="text" class="form-control" id="target-user-${status.count}" value="${userFollowStatus.userDTO.nickname}" readonly>
																			</div>
																			<div class="mb-3">
																				<label for="message-text-${status.count}" class="col-form-label">메세지 내용: </label>
																				<textarea class="form-control" id="message-text-${status.count}"></textarea>
																			</div>
																		</form>
																	</div>
																	<div class="modal-footer">
																		<button form="send-message-form-${status.count}" type="submit" class="btn btn-primary">보내기</button>
																		<button form="send-message-form-${status.count}" type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
																	</div>
																</div>
															</div>
														</div>
													</td>
												</c:when>
												<c:otherwise>
													<td></td>
													<td></td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="mt-3 d-flex justify-content-center align-items-center">
			<a href="${pageContext.request.contextPath}/baseleap/my-page/info" class="btn btn-primary" type="button">돌아가기</a>
		</div>
	</main>
</div>
</body>
<script type="application/javascript" src="/js/follow.js"></script>
<script type="application/javascript" src="/js/message.js"></script>
</html>