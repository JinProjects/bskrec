<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" 
    integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="${contextPath }/resources/css/common.css?after" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath }/resources/css/layout.css?after" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath }/resources/css/main.css?after" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath }/resources/css/header.css?after" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath }/resources/css/reset.css?after" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath }/resources/css/footer.css?after" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath }/resources/css/rank.css?after" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath }/resources/css/loginForm.css?after" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath }/resources/css/memberForm.css?after" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath }/resources/css/playerArctiveDetail.css?after" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath }/resources/css/teamArctiveDetail.css?after" rel="stylesheet" type="text/css" media="screen">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%-- <script src="${contextPath }/resources/jquery/jquery-1.6.2.min.js" type="text/javascript"></script> --%>

<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<div id="outer_wrap" style="">
		<div id="wrap"> <!-- 정해진 width가 없어서 자식요소가 막 커지는듯 width지정하기 -->
			<header>
				<tiles:insertAttribute name="header" />
			</header>
			<div class="clear"></div>
			<article>
				<tiles:insertAttribute name="body" />
			</article>
			<div class="clear"></div>
		</div>
	</div>
	<footer id="realfooter">
		<tiles:insertAttribute name="footer"/>
	</footer>
</body>
</html>