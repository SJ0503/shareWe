src="https://developers.kakao.com/sdk/js/kakao.js"
	
Kakao.init('2bc6b3bd3fef80118728da5119ebd261');
console.log(Kakao.isInitialized()); // sdk초기화여부판단

//카카오로그인
function kakaoLogin() {
	Kakao.Auth.loginForm({
		scope: "profile_nickname, account_email",
		success: function(response) {
			Kakao.API.request({
				url: '/v2/user/me',
				success: function(response) {
					console.log(response)
				},
				fail: function(error) {
					console.log(error)
				},
			})
		},
		fail: function(error) {
			console.log(error)
		},
	})
}

