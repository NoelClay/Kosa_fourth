<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인트로 페이지</title>

    <!-- Bootstrap CSS CDN 추가 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 사용자 정의 CSS -->

    <!-- 사용자 정의 JavaScript -->
    <script src="modal.js"></script>

    <!-- jQuery, Popper.js, Bootstrap JS CDN 추가 -->
    <script
      src="https://code.jquery.com/jquery-3.7.1.js"
      integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
      crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container text-center mt-5">
        <h1>Welcome to the Website</h1>
        <button id="startButton" class="btn btn-primary mt-3">시작하기</button>
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
                            <form id="reset-form"  action="/find/passwordFind" method="post" class="mt-4">
                                <div class="form-group">
                                    <label>이메일:
                                    <input type="email" id="findEmail" class="form-control"  name="email" required>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label >질문:
                                    <select class="form-control" id = "findValidationQuizQuestion"  name="validationQuizQuestion">
                                        <option value='1'>졸업한 초등학교</option>
                                        <option value='2'>가장 좋아하는 영화</option>
                                        <option value='3'>가장 싫어하는 음식</option>
                                    </select>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label >답변:
                                    <input type="text" class="form-control" id="findValidationQuizAnswer" name="validationQuizAnswer" required >
                                    </label>
                                </div>
                                <button type="submit" id="resetButton" class="btn btn-primary btn-block">비밀번호 찾기</button>
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




	<a href = "/login/loginForm" >  {로그인(GET)}</a>
    <br>

    <a href = "/signup/signUpForm" >  {회원 가입(GET)}</a>
    <br>

    <a href = "/find/passwordFindForm" >  {비밀 번호 찾기(GET)}</a>
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
        })
        .then(response => response.json())
        .then(data => {
          if (data.success == 1){
            alert('로그인 성공!');
            // 로그인 성공 후 처리 (예: 메인 페이지 이동)
            window.location.href = '/test-main';
          } else {
            alert('로그인 실패: ' + data.success);
          }
        })
        .catch(error => {
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
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      if (data.success) {
        alert('회원가입 성공!');
        // 회원가입 후 처리 (메인 페이지 이동 등)
         window.location.href = '/demo';
      } else {
        alert('회원가입 실패: ' + data.message);
      }
    })
    .catch(error => {
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
    $('#resetButton').submit(function(event) {
        event.preventDefault(); // 기본 submit 행동 방지

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
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            if (data.success == 1) {
                alert('비밀번호 찾기 성공!');
               // window.location.href = '/find/passwordFindResultPage';
                res.redirect('/find/passwordFindResultPage');
            } else {
                alert('비밀번호 찾기 실패: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('비밀번호 찾기 중 오류 발생');
        });
    });
});
</script>

</html>
