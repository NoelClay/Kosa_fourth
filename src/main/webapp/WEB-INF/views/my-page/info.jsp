<%--
  User: 문현동
  Date: 2024-09-22
  Time: 오후 8:43
  유저 정보를 볼 수 있는 마이페이지.
  유저가 받은 모든 알림들을 볼 수도 있습니다.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이 페이지</title>
	<link rel="stylesheet" href="/css/template-style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
			<a href="#" class="menu-icon" title="게시글 보기"><img src="post-icon.png" alt="게시글 보기"></a>
			<a href="#" class="menu-icon" title="방명록 보기"><img src="guestbook-icon.png" alt="방명록 보기"></a>
			<a href="${pageContext.request.contextPath}/my-page/search" class="menu-icon" title="유저 검색"><img src="search-icon.png" alt="유저 검색"></a>
		</div>
		
		<!-- 유저 프로필 영역 -->
		<div class="user-profile">
			<a href="/my-page/info">
				<img src="profile-picture.jpg" alt="Profile Picture" class="profile-picture">
			</a>
			<div class="user-info">
				<h1>블로그 주인의 닉네임</h1>
				<h2></h2>
			</div>
		</div>
		
		<!-- 하단 메뉴 -->
		<div class="menu-bottom">
			<a href="#" class="menu-icon" title="게시글 쓰기"><img src="write-icon.png" alt="게시글 쓰기"></a>
			<a href="#" class="menu-icon" title="방명록 쓰기"><img src="guestbook-write-icon.png" alt="방명록 쓰기"></a>
			<a href="/my-page/info" class="menu-icon" title="마이 페이지"><img src="settings-icon.png" alt="마이 페이지"></a>
		</div>
	</aside>
	
	<!-- 메인 콘텐츠 -->
	<main class="content">
		<div class="post-summary">
			<div class="d-flex justify-content-center align-items-center">
				<h1>My page</h1>
				<div class="alarm-button" data-bs-toggle="modal" data-bs-target="#alarmModal">
					<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
						<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2M8 1.918l-.797.161A4 4 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4 4 0 0 0-3.203-3.92zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5 5 0 0 1 13 6c0 .88.32 4.2 1.22 6"/>
					</svg>
				</div>
			</div>
			<hr>
			<div>
				<table class="table table-hover table-bordered">
					<tbody>
						<tr>
							<td>이메일</td>
							<td>${userInfo.email}</td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td><img class="profile-img" src="/image/${userInfo.profileImage}" alt=""> ${userInfo.nickname}</td>
						</tr>
						<tr>
							<td>자기소개</td>
							<td>${userInfo.userIntroduce}</td>
						</tr>
						<tr>
							<td>가입 일자</td>
							<td>${userInfo.createdTime}</td>
						</tr>
						<tr>
							<td>마지막 로그인 시각</td>
							<td>${userInfo.lastLoginTime}</td>
						</tr>
					</tbody>
				</table>
				<div class="d-flex justify-content-between">
					<div class="mb-2">
						<a href="${pageContext.request.contextPath}/my-page/new-messages" class="btn btn-outline-primary" type="button">받은 메세지함</a>
					</div>
					<div class="mb-2">
						<a href="${pageContext.request.contextPath}/my-page/follower-list" class="btn btn-outline-primary" type="button">나를 팔로우 중인 사람들</a>
					</div>
				</div>
				<div class="d-flex justify-content-between">
					<div class="mb-2">
						<a href="${pageContext.request.contextPath}/my-page/all-messages" class="btn btn-outline-primary" type="button">전체 메세지함</a>
					</div>
					<div class="mb-2">
						<a href="${pageContext.request.contextPath}/my-page/following-list" class="btn btn-outline-primary" type="button">내가 팔로잉 중인 사람들</a>
					</div>
				</div>
			</div>
			<hr>
			<div class="d-flex">
				<div class="me-auto">
					<a href="/update/updateForm" class="btn btn-primary" type="button">내 정보 수정</a>
				</div>
				<div>
					<a href="/loginMain/loginOut" class="btn btn-warning" type="button">로그 아웃</a>
					<a href="/signOut/signOutForm" class="btn btn-danger" type="button">회원 탈퇴</a>
				</div>
			</div>
		</div>
	</main>
</div>
<!-- 알림 아이콘 눌렀을 때 나오는 모달. -->
<div class="modal fade" id="alarmModal" tabindex="-1" aria-labelledby="alarmModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="alarmModalLabel">새 소식 확인</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div id="modal-body" class="modal-body">
				<%--알림 리스트가 비어있을 때...--%>
				<div id="empty" class="d-flex justify-content-center align-items-center mb-0">
					아직 새로운 소식이 없습니다.
				</div>
				<%--리스트가 비어있지 않음.--%>
				<div id="not-empty">
					<table class="mb-0 table table-hover table-bordered">
						<thead>
							<th>보낸사람</th>
							<th>내용</th>
							<th>읽음</th>
						</thead>
						<tbody id="not-empty-tbody">
						
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
</body>
<script type="application/javascript" src="/js/alarm.js"></script>
</html>