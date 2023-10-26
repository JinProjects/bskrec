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
    <section class="team-versus-wrap">   
        <div class="team-img-wrap">
            <div class="team-home"><i class="fa-solid fa-users"></i></div>
            <div class="versus"><i class="fa-solid fa-basketball"></i></div>
            <div class="team-away"><i class="fa-solid fa-users"></i></div>
        </div>
        <div class="team-name">
            <p>팀1</p>
            <p>팀2</p>
        </div>
        <div class="team-score-wrap">
            <div class="team-home-score"><p>85</p></div>
            <div class="colon"><p>:</p></div>
            <div class="team-away-score"><p>92</p></div>
        </div>
    </section>
    <section id="swipe-wrap">
        <div class="member-swipe-wrap">
            <div class="member-rank">
                <div class="member-img">
                    <i class="fa-solid fa-user"></i>
                </div>
                <div class="member-info">
                    <p>1위</p>
                    <p>이름|등번호</p>
                    <p>기록|소속</p>
                    <p>생년월일</p>
                    <p>신장/몸무게</p>
                </div>
            </div>            
            <ul class="member-rec">
                <li><h5>득점</h5><p>24.2</p></li>
                <li><h5>어시스트</h5><p>2.1</p></li>
                <li><h5>리바운드</h5><p>11.2</p></li>
            </ul>
        </div>
        <div class="arrow">
            <!-- 화살표 이미지 -->
            <a href="#" class="btn_left"><img src="${contextPath }/resources/images/btn_prev.gif" alt=""></a>
            <a href="#" class="btn_right"><img src="${contextPath }/resources/images/btn_next.gif" alt=""></a>
        </div>
    </section>
    <!-- 신생팀 , 최근 등록선수 -->
    <section id="team-member-wrap">
        <!-- 신생팀 -->
        <div class="team-register">
            <div>
                <img src="${contextPath }/resources/images/lalakers.png" alt="">
            </div>
            <div class="team-info">
                <p class="tit">팀명</p>
                <p class="content">블루</p>
                <p class="tit">지역</p>
                <p class="content">인천 서구</p>
            </div>
        </div>
        <!-- 최근 등록선수 -->
        <div class="member-register">
            <div class="member-img">
                <i class="fa-solid fa-user"></i>
            </div>
            <div class="member-info">
                <p class="tit">이름</p>
                <p class="content">최영진</p>
                <p class="tit">포지션</p>
                <p class="content">F</p>
            </div>
        </div>
    </section>
    <!-- 중고거래 글-->
    <section id="article-wrap">
        <div class="used-article">
            <h4>중고거래</h4>
            <div>
                <ul>
                    <li><a href="">농구공 팝니다.</a></li>
                    <li><a href="">신발 팝니다.</a></li>
                    <li><a href="">보호대 팝니다.</a></li>
                    <li><a href="">양말 팝니다.</a></li>
                    <li><a href="">신발 팝니다.</a></li>
                </ul>
            </div>
        </div>
        <!-- 최신글 -->
        <div class="comm-article">
            <h4>최신글</h4>
            <div>
                <ul>
                    <li><a href="">안녕하세요!</a></li>
                    <li><a href="">질문있어요!</a></li>
                    <li><a href="">반갑습니다.</a></li>
                    <li><a href="">농구 초보에요</a></li>
                    <li><a href="">농구 어떻게 잘하나요?</a></li>
                </ul>
            </div>
        </div>
    </section>
</body>
</html>