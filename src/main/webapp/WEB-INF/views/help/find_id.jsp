<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<h2>아이디 찾기</h2>
				<form action="#" id="idForm">
					이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="member_name" id="name"><br>
					이메일 주소 <input type="text" id="email1" >@<input type="text" id="email2">
					<select id="s_email">
						<option selected="selected">직접입력</option>
						<option>naver.com</option>
						<option>nate.com</option>
						<option>dreamwiz.com</option>
						<option>yahoo.co.kr</option>
						<option>hotmail.com</option>
						<option>gmail.com</option>
						<option>hanmail.net</option>
					</select>
					<button type="button" onclick="btnCertify()"><h4>인증번호 받기</h4></button>
				</form>
			<a href="${contextPath }/help/findPw.do">비밀번호 찾기</a>
		</div>
	</div>
</body>
<script type="text/javascript">
	var s_email = document.getElementById('s_email');
	s_email.addEventListener('change', function(e) {
		var email1 = document.getElementById('email1');
		var email2 = document.getElementById('email2');
		alert(email2.value);
		if(s_email.value == '직접입력'){
			email2.value = '';
			email2.removeAttribute('disabled');
		}else{
			email2.setAttribute('disabled', 'disabled');
			email2.value = s_email.value;
		}
	})
	/* 데이터 처리 */
	function btnCertify(){
		// email1 input 요소 생성
		//var email1Input = $('<input>').attr('type', 'hidden').attr('name', 'email1').val(email1.value);
		// email2 input 요소 생성
		//var email2Input = $('<input>').attr('type', 'hidden').attr('name', 'email2').val(email2.value);
		// 폼에 input 요소 추가
		//btnCertify.append(email1Input).append(email2Input);
		var name = document.getElementById('name').value;
		var email1 = document.getElementById('email1');
		var email2 = document.getElementById('email2');
		var email_select = document.getElementById('s_email').value;
		//폼 작성 다시하기....
		var btnCertify = $('form');
		var _email1 = $('<input>').attr('type', 'hidden').attr('name','email1').val(email1.value);
		var _email2 = $('<input>').attr('type', 'hidden').attr('name','email2').val(email2.value);
		var _id = $('<input>').attr('type', 'hidden').attr('name','member_id');
		btnCertify.append(_email1).append(_email2);
		var isValid = true;
		console.log("name="+name);
		if(name != null && name == ''){
			alert('이름을 입력해주세요!');
			isValid = false;
		}
		if(email1.value != null && email1.value == ''){
			alert('이메일을 입력해주세요!');
			isValid = false;
		}
		if(email2.value != null && email2.value == ''){
			alert('이메일을 입력해주세요!');
			isValid = false;
		}
		alert(email2.value);
		$.ajax({
			type:'get',
			async:false,
			url:'${contextPath}/help/find_id.do',
			data:{
				member_name:name,
				email1:email1.value,
				email2:email2.value
			},
			success:function(data,textStatus){	
				if(isValid){
					alert('메일을 확인해주세요!');
					//btnCertify.attr('name','email1').val(email1.value);
					//btnCertify.attr('name','email2').val(email2.value);
					_id.val(data.trim());
					btnCertify.append(_id);
					btnCertify.attr('method','post');
					btnCertify.attr('action','${contextPath}/find/sendMail.do');
					btnCertify.submit();
				}else{
					alert('회원이 존재하지 않습니다.');
				}
			},
			error:function(data,textStatus){
				alert("에러가 발생했습니다.!!"+data);
			},
			complete:function(){
				//location.href='${contextPath}/member/loginForm.do';
			}
		})
		/* if(isValid){
			alert("실행");
			btnCertify.attr('method','get');
			btnCertify.attr('action','${contextPath}/find/sendMail.do');
			btnCertify.submit();
		} */
	}
</script>
</html>