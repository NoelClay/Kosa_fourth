<%--
  User: 문현동/이원준
  Date: 2024-09-11
  Time: 오후 2:52
  인트로 페이지입니다.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Intro</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="/js/modal.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/css/intro-style.css">
</head>
<body>
<div class="title-box">
	<div class="container text-center mt-5">
		<h1 class="title">Welcome to the Kostory</h1>
		<button id="startButton" class="btn btn-primary mt-3">입장하기</button>
	</div>
</div>
<!-- 모달 창 -->
<div id="modal" class="modal" tabindex="-1" role="dialog" style="display: none;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">회원 관리</h5>
				<button type="button" class="close" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#login" role="tab">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#signup" role="tab">회원가입</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#reset" role="tab">비밀번호 찾기</a>
					</li>
				</ul>
				
				<!-- 탭 콘텐츠 -->
				<div class="tab-content">
					<div id="login" class="tab-pane fade show active" role="tabpanel">
						<h3 class="mt-3">로그인</h3>
						<form id="login-form" action="/loginMain/login" method="post" class="mt-4">
							<div class="form-group">
								<label>이메일(아이디):
									<input type="email" class="form-control" id="loginemail" name="email" required>
								</label>
							</div>
							<div class="form-group">
								<label >비밀번호:
									<input type="password" class="form-control" id="loginpassword" name="password" required>
								</label>
							</div>
							<button type="submit" id="loginBtn" class="btn btn-primary btn-block">로그인</button>
						</form>
					</div>
					
					
					<div id="signup" class="tab-pane fade" role="tabpanel">
						<h3 class="mt-3">회원가입</h3>
						<form id="signup-form" action="/signup/signup" method="post" class="mt-4">
							<div class="form-group">
								<label for="email">이메일(아이디):</label>
								<input type="email" class="form-control" id="email" name="email" required placeholder="email@address.com">
							</div>
							<div class="form-group">
								<label for="password">비밀번호:</label>
								<input type="password" class="form-control" id="password" name="password" required placeholder="영문 + 특수문자 + 숫자 포함 최소 8자리"
								       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
								       title="영문 + 특수문자 + 숫자 포함 최소 8자리">
							</div>
							<div class="form-group">
								<label for="password2">비밀번호 확인:</label>
								<input type="password" class="form-control" id="password2" name="password2" required placeholder="비밀번호 확인"
								       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$">
							</div>
							<div class="form-group">
								<label for="nickName">닉네임:</label>
								<input type="text" class="form-control" id="nickName" name="nickName" required minlength="3" maxlength="100">
							</div>
							<div class="form-group">
								<label id ="profileImage">프로필 케릭터:
									<input type="radio" class="btn-check"  name="profileImage" value="cupid.png" checked><img src=/image/cupid.png  width = 50>
									<input type="radio" class="btn-check" name="profileImage" value="groceries.png"><img src=/image/groceries.png width = 50>
									<input type="radio" class="btn-check" name="profileImage" value="sculpture.png"><img src=/image/sculpture.png width = 50>
								</label>
							</div>
							<div class="form-group">
								<label for="userIntroduce">간단한 소개:</label>
								<input type="text" class="form-control" id="userIntroduce" name="userIntroduce" >
							</div>
							<div class="form-group">
								<label for="validationQuizQuestion">질문:</label>
								<select class="form-control" id="validationQuizQuestion" name="validationQuizQuestion">
									<option value='1'>졸업한 초등학교</option>
									<option value='2'>가장 좋아하는 영화</option>
									<option value='3'>가장 싫어하는 음식</option>
								</select>
							</div>
							<div class="form-group">
								<label for="validationQuizAnswer">답변:</label>
								<input type="text" class="form-control" id="validationQuizAnswer" name="validationQuizAnswer" required >
							</div>
							<button type="submit" class="btn btn-primary btn-block" id="signupButton">회원가입</button>
						</form>
					</div>
          <div id="reset" class="tab-pane fade" role="tabpanel">
            <h3 class="mt-3">비밀번호 찾기</h3>
            <form id="reset-form" action="/find/passwordFind" method="post" class="mt-4">
              <div class="form-group">
                <label>이메일:
                <input type="email" id="findEmail" class="form-control" name="email" required>
                </label>
              </div>
              <div class="form-group">
                <label>질문:
                <select class="form-control" id="findValidationQuizQuestion" name="validationQuizQuestion">
                  <option value='1'>졸업한 초등학교</option>
                  <option value='2'>가장 좋아하는 영화</option>
                  <option value='3'>가장 싫어하는 음식</option>
                </select>
                </label>
              </div>
              <div class="form-group">
                <label>답변:
                <input type="text" class="form-control" id="findValidationQuizAnswer" name="validationQuizAnswer" required>
                </label>
              </div>
              <button type="submit" id="resetButton" class="btn btn-primary btn-block">비밀번호 찾기</button>
            </form>

            <!-- 새 비밀번호 설정 폼 (처음에는 숨겨져 있음) -->
            <form id="password-reset-form" style="display: none;" class="mt-4">
              <div class="form-group">
                <label>이메일:
                <input type="email" id="email-for-reset" class="form-control" readonly>
                </label>
              </div>
              <div class="form-group">
                <label>새 비밀번호:
                <input type="password" id="new-password" class="form-control" required>
                </label>
              </div>
              <button type="submit" class="btn btn-primary btn-block">새 비밀번호 설정</button>
            </form>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</body>
<script>
  // 로그인
  $(document).ready(function() {
    $('#loginBtn').click(function(event) {
      event.preventDefault();
      console.log("로그인 버튼 클릭");
      const email = $('#loginemail').val();
      const password = $('#loginpassword').val();
      const data = {
        email,
        password
      };

      console.log("로그인 fetch 바로 전");

      fetch('/loginMain/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
      }).then(response => response.json()
      ).then(data => {
        if (data.success === 1){
          alert('로그인 성공!');
          // 로그인 성공 후 처리 (예: 메인 페이지 이동)
          // window.location.href = '/test-main';
          window.location.href = `/baseleap/home/page?userId=`+data.userId;
        } else {
          alert('로그인 실패: ' + data.success);
        }
      }).catch(error => {
        alert('로그인 중 오류 발생');
        console.error(error);
      });
    });
  });

  // 회원 가입
  $(document).ready(function() {
    $('#signupButton').click(function(event) {
      event.preventDefault();

      // 입력 값 가져오기
      const email = $('#email').val();
      const password = $('#password').val();
      const password2 = $('#password2').val();
      const nickName = $('#nickName').val();
      const profileImage = $('input[name="profileImage"]:checked').val();
      const userIntroduce = $('#userIntroduce').val();
      const validationQuizQuestion = $('#validationQuizQuestion').val();
      const validationQuizAnswer = $('#validationQuizAnswer').val();

    const data = {
      email,
      password,
      nickName,
      profileImage,
      userIntroduce,
      validationQuizQuestion,
      validationQuizAnswer
    };
		  
    // Fetch 요청
    fetch('/signup/signup', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    }).then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    }).then(data => {
      if (data.success) {
        alert('회원가입 성공!');
        // 회원가입 후 처리 (메인 페이지 이동 등)
        window.location.href = '/intro';
      } else {
        alert('회원가입 실패: ' + data.message);
      }
    }).catch(error => {
      console.error('Error:', error);
      alert('회원가입 중 오류가 발생했습니다.');
    });
  });

  // 유효성 검사 함수 (예시)
  function validateForm(data) {
    // 이메일, 비밀번호, 닉네임 등 유효성 검사
    // ...

    return isValid; // 모든 검사 통과 시 true 반환
  }
});

// 비밀번호 찾기
$(document).ready(function() {
  $('#reset-form').submit(function(event) {
    event.preventDefault();

    const email = $('#findEmail').val();
    const validationQuizQuestion = $('#findValidationQuizQuestion').val();
    const validationQuizAnswer = $('#findValidationQuizAnswer').val();

    const data = {
      email,
      validationQuizQuestion,
      validationQuizAnswer
    };

    fetch('/find/passwordFind', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
      if (data.success == 1) {
        alert('비밀번호 찾기 성공! 새 비밀번호를 설정해주세요.');
        // 비밀번호 재설정 폼 표시 (이 부분은 HTML에 해당 폼이 있다고 가정)
        $('#password-reset-form').show();
        $('#reset-form').hide();
        $('#email-for-reset').val(email);  // 이메일 필드에 값 설정
      } else {
        alert('비밀번호 찾기 실패 ');
      }
    })
    .catch(error => {
      alert('비밀번호 찾기 중 오류 발생');
      console.error(error);
    });
  });

  // 새 비밀번호 설정
  $('#password-reset-form').submit(function(event) {
    event.preventDefault();

    const email = $('#email-for-reset').val();
    const newPassword = $('#new-password').val();

    const data = {
      email,
      password: newPassword
    };

    fetch('/find/passwordFindResult', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
      if (data.success == 1) {
        alert('비밀번호가 성공적으로 변경되었습니다.');
        window.location.href = '/demo';
      } else {
        alert('비밀번호 변경 실패');
      }
    })
    .catch(error => {
      alert('비밀번호 변경 중 오류 발생');
      console.error(error);
    });
  });
});
</script>
</html>
