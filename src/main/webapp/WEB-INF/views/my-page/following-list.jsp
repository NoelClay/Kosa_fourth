<%--
  User: 문현동
  Date: 2024-09-12
  Time: 오후 3:56
  유저가 팔로잉중인 리스트를 보여주는 페이지.
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
			<a href="${pageContext.request.contextPath}/baseleap/my-page/search" class="menu-icon" title="유저 검색"><img src="search-icon.png" alt="유저 검색"></a>
		</div>
		
		<!-- 유저 프로필 영역 -->
		<div class="user-profile">
			<a href="/baseleap/my-page/info">
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
			<a href="/baseleap/my-page/info" class="menu-icon" title="마이 페이지"><img src="settings-icon.png" alt="마이 페이지"></a>
		</div>
	</aside>
	
	<!-- 메인 콘텐츠 -->
	<main class="content">
		<div class="post-summary">
			<div>
				<c:choose>
					<%--팔로잉 리스트가 비어있을 때...--%>
					<c:when test="${empty userFollowStatusList}">
					<div class="d-flex justify-content-center align-items-center mb-0">
						아무도 팔로잉 하고 있지 않습니다.
					</div>
					</c:when>
					<%--리스트가 비어있지 않음.--%>
					<c:otherwise>
						<div>
							<table class="table table-hover table-bordered">
								<thead>
									<th>이미지</th>
									<th>이메일</th>
									<th>닉네임</th>
									<th>자기소개</th>
									<th>언팔로우</th>
								</thead>
								<tbody>
								<c:forEach var="userFollowStatus" items="${userFollowStatusList}" varStatus="status">
									<tr>
										<td><img class="profile-img" src="/image/${userFollowStatus.userDTO.profileImage}" alt=""></td>
										<td>${userFollowStatus.userDTO.email}</td>
										<td>${userFollowStatus.userDTO.nickname}</td>
										<td>${userFollowStatus.userDTO.userIntroduce}</td>
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
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="mt-3 d-flex justify-content-center align-items-center">
			<a href="/baseleap/my-page/info" class="btn btn-primary" type="button">돌아가기</a>
		</div>
	</main>
</div>
</body>
<script type="application/javascript" src="/js/follow.js"></script>
<script type="application/javascript" src="/js/message.js"></script>
</html>