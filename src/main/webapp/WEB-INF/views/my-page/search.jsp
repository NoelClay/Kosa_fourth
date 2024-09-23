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