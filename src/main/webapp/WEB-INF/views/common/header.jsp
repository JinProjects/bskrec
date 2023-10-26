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
<div class="container">
    <h1>
        <a href="${contextPath }/main/main.do">bskrec</a>
    </h1>
    <nav>
        <ul class="menu">
          <li><a href="#">랭킹</a></li>
          <li><a href="#">기록</a>
	       	<ul>
	       		<li><a href="${contextPath}/archive/teamArchiveDetail.do">팀기록</a></li>
	       		<li><a href="${contextPath}/archive/playerArchiveDetail.do">선수기록</a></li>
        	</ul>
          </li>
          		<!-- 일반회원 : 0, 선수 : 1, 팀장 : 2 매니저 : 3 -->
          <li><a href="#">커뮤니티</a></li>
          <c:choose>
          	<c:when test="${isLogOn==true and not empty memberInfo }">
          		<c:choose>
          			<c:when test="${memberInfo.member_kind eq '0'}">
          				<c:if test="${memberInfo.member_kind eq '0' || memberInfo.member_kind eq '2'}">
			          		<li class="right"><a href="${contextPath }/club/teamRegForm.do">팀등록</a></li>      				
          				</c:if>
          				<c:if test="${memberInfo.member_kind eq '0' || memberInfo.member_kind eq '1'}">
		          			<li class="right"><a href="${contextPath }/club/playerRegForm.do">선수등록</a></li>          			          				
          				</c:if>
          			</c:when>
          		</c:choose>
          		<li class="right"><a href="${contextPath }/member/loginForm.do">내정보</a></li>
          		<li class="right"><a href="${contextPath }/member/logout.do">로그아웃</a></li>
          	</c:when>
          	<c:otherwise>
	          <li class="right"><a href="${contextPath }/member/loginForm.do">로그인</a></li>
          	</c:otherwise>
          </c:choose>
        </ul>
    </nav>
</div>
</body>
</html>