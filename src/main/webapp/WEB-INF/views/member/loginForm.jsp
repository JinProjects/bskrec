<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${not empty message }">
	<script>
		window.onload=function(){
			result();
		}
		function result(){
			alert("아이디나 비밀번호가 틀립니다. 다시 로그인해주세요.");
		}
	</script>
</c:if>
</head>
<body>
	<header id="outer-logo-wrap">
        <div id="inner-logo-wrap">
            <a href="#"><h2>bskrec</h2></a>
        </div>
    </header>
    <section id="outer-login-wrap">
        <div class="inner-login-wrap">
        <form action="${contextPath }/member/login.do" method="post">
            <div class="login-area">
                <input type="text" name="member_id" id="id" class="tbox" placeholder="아이디입력">
                <input type="password" name="member_pw" id="pw" class="tbox" placeholder="패스워드입력">
            </div>
            <div class="btn-login-wrap">
                <button type="submit" class="btn-login">
                    <span>로그인</span>
                </button>
            </div>
        </form>
        </div>
        <div class="member-find-wrap">
            <ul class="find-wrap">
                <li><a href="${contextPath }/help/findPw.do" class="find-text" target="_blank">비밀번호 찾기</a></li>
                <li><a href="${contextPath }/help/findId.do" class="find-text" target="_blank">아이디 찾기</a></li>
                <li><a href="${contextPath }/member/memberForm.do" class="find-text" target="_blank">회원가입</a></li>
            </ul>
        </div>
    </section>
</body>
</html>