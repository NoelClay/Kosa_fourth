<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%><!-- JSTL -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITEST DEMO</title>
</head>
<body>
<h1>정보 수정. </h1>
	<form action="/demo" method="Get">
		{데모)} : <input type="submit" value="전송">
	</form>
<br>
<br>
	<form action="/find/passwordFindResult" method="post">
		<table>
			<tr>
				<td>email:</td>
				<td	><input type="email" name="email"  value = "${userFind.email}" readonly > </td>
			</tr>
			<tr>
				<td>패스워드:</td>
				<td><input type="password" name="password"></td>
			</tr>

		    <input type="submit" value="등록"><input type="reset" value="취소">
		</table>
	</form>
</body>

  <script>
        $(document).ready(function() {
            $('#reset-password-form').submit(function(event) {
                event.preventDefault(); // Prevent default form submission

                // Implement password validation logic here (optional)

                // Assuming you have a hidden field to store the email from previous step
                const email = $('#hiddenEmail').val(); // Replace with your mechanism
                const newPassword = $('#newPassword').val();

                const data = {
                    email,
                    newPassword
                };

                fetch('/resetPassword', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(data)
                })
                .then(response => {
                    if (!response.ok)
 {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    if (data.success)
 {
                        alert('비밀번호 재설정 성공!');
                        // Redirect to login page or other appropriate location
                        window.location.href = '/login';
                    } else {
                        alert('비밀번호 재설정 실패: ' + data.message);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('비밀번호 재설정 중 오류 발생');
                });
            });
        });
    </script>
</html>




