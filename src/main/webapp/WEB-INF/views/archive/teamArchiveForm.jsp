<%@page import="com.bskrec.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");
	HttpSession sessoin = request.getSession();
	MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
	String member_id = memberVO.getMember_id();
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>팀기록등록</h2>
<form name="frm_teamArchive">
	<div>
		경기시작시간: <input type="time" id="gameStartTime" name="gameStartTime" value="">
		경기종료시간: <input type="time" id="gameEndTime" name="gameEndTime">
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>팀명</th>
					<th>1쿼터</th>
					<th>2쿼터</th>
					<th>3쿼터</th>
					<th>4쿼터</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" name="homeTeamName" id="homeTeamName" readonly="readonly">
					<td><input type="text" name="home1q" id="home1q" class="i_score" value="0">점</td>
					<td><input type="text" name="home2q" id="home2q" class="i_score" value="0">점</td>
					<td><input type="text" name="home3q" id="home3q" class="i_score" value="0">점</td>
					<td><input type="text" name="home4q" id="home4q" class="i_score" value="0">점</td>
				</tr>
				<tr>
					<td><input type="text" name="awayTeamName" id="awayTeamName" readonly="readonly">
					<a href="#" class="btn-modal" id="open-modal" data-toggle="modal" data-target="#searchModal" onclick="return false;"><i class="fa fa-search"></i></a></td></td>
					<td><input type="text" name="away1q" id="away1q" class="i_score" value="0">점</td>
					<td><input type="text" name="away2q" id="away2q" class="i_score" value="0">점</td>
					<td><input type="text" name="away3q" id="away3q" class="i_score" value="0">점</td>
					<td><input type="text" name="away4q" id="away4q" class="i_score" value="0">점</td>
				</tr>
			</tbody>
		</table>
		<div id="hidden_wrap">
			<input type="hidden" id="h_gameStartTime" name="h_gameStartTime">
			<input type="hidden" id="h_gameEndTime" name="h_gameEndTime">
		</div>
		<button type="button" onclick="btnTeamArchiveSubmit()">등록하기</button>
		<button type="button" onclick="teamArchivePopup()">불러오기</button>
		<button type="button" onclick="modTeamArchive()">수정하기</button>
	</div>
	<input type="hidden" id="h_gameCode" name="gameCode">
</form>
	<div id="modalContainer" style="display: none;">
		<div id="modalContent">
			<h3>팀 검색하기</h3>
			<div>
				어웨이 팀 <input type="text" id="team_name" >
				<button type="button" onclick="btnAwayTeamSearch()">검색</button>
			</div>
			<!-- <div>
				<h3>검색결과</h3>
				<ul id="teamSearchResult">
				</ul>
			</div> -->
			<div id="close-content"><a href="#" id="close-modal">닫기</a></div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:"post",
		url:"${contextPath}/archive/homeTeamSearch.do",
		data:{member_id:'<%=member_id%>'}
	}).done(function(data) {
		console.log(data);
		var homeTeamName = document.getElementById("homeTeamName");
		homeTeamName.value = data;
	}).fail(function() {
		alert('에러가 발생했습니다.');
	})
})
	var time = document.getElementById("gameStartTime");
	time.addEventListener("blur", function(e) {
		alert(e.target.value);	
	})
	
function scoreHap(score1q,score2q,score3q,score4q){
	var hap = parseInt(score1q)+parseInt(score2q)+parseInt(score3q)+parseInt(score4q);
	return hap;
}

function teamArchivePopup(){
		var homeTeamName = document.getElementById("homeTeamName").value;
		var awayTeamName = document.getElementById("awayTeamName").value;
		console.log("awayTeamName="+awayTeamName);
		if(awayTeamName===''){
			alert('어웨이팀을 입력해주세요!');
			return false;
		}
		var url = "${contextPath}/archive/teamArchivePopup.do?awayTeamName="+awayTeamName+"&homeTeamName="+homeTeamName;
		var name = "팀기록수정";
		var option = "width=500,height=500,top=200,left=500,location=no";
		
		window.open(url,name,option);
	}
	
function btnTeamArchiveSubmit(){
	var form = document.frm_teamArchive;
	var gameStartTime = document.getElementById("gameStartTime").value;
	var gameEndTime = document.getElementById("gameEndTime").value;
	
	var home1q = document.getElementById("home1q").value;
	var home2q = document.getElementById("home2q").value;
	var home3q = document.getElementById("home3q").value;
	var home4q = document.getElementById("home4q").value;
	
	var away1q = document.getElementById("away1q").value;
	var away2q = document.getElementById("away2q").value;
	var away3q = document.getElementById("away3q").value;
	var away4q = document.getElementById("away4q").value;
	
	var homeTeamName = document.getElementById("homeTeamName").value;
	var awayTeamName = document.getElementById("awayTeamName").value;
	
	var isValid = true;
	if(!(gameStartTime&&gameEndTime)){
		alert("경기시간을 입력해주세요!");
		return false;
	}
	if(!awayTeamName){
		alert("어웨이팀명을 입력해주세요!");
		return false;
	}
	if(!(home1q&&home2q&&home3q&&home4q&&away1q&&away2q&&away3q&&away4q)){
		alert('점수가 입력되지 않았습니다.');
		return false;
	}
	if(isValid){
		var homeTeamNameScore = document.createElement("input");
		homeTeamNameScore.type = 'hidden';
		homeTeamNameScore.name = 'homeTeamScore';
		homeTeamNameScore.value = scoreHap(home1q,home2q,home3q,home4q); 
		
		var awayTeamNameScore = document.createElement("input");
		awayTeamNameScore.type = 'hidden';
		awayTeamNameScore.name = 'awayTeamScore';
		awayTeamNameScore.value = scoreHap(away1q,away2q,away3q,away4q); 
		
		var hidden_wrap = document.getElementById("hidden_wrap");
		hidden_wrap.appendChild(homeTeamNameScore);
		hidden_wrap.appendChild(awayTeamNameScore);
		
		form.action = '${contextPath }/archive/teamArchiveSubmit.do';
		form.method = 'post';
		form.submit();
	}	
	
}
var scores = document.querySelectorAll(".i_score");
scores.forEach(function(score){
	score.addEventListener("blur", function(e) {
		var inputValue = e.target.value;
		if(!(inputValue>=0)){
			alert('정수를 입력하세요');
			e.target.value = 0;
		}
	})
})
/* score.addEventListener("click", function(e) {
	alert('클릭');
}) */
function btnAwayTeamSearch(){
	var teamName = document.getElementById("team_name").value;
	$.ajax({
		type: "get",
		url: "${contextPath}/archive/awayTeamSearch.do",
		data:{teamName:teamName}
	}).done(function(data){
		if(data!=0){
			alert('팀이 확인되었습니다.'+teamName);
			var awayTeamName = document.getElementById("awayTeamName");
			awayTeamName.value = teamName;
			/* 검색결과 코드 */
			/* var ul = $("#teamSearchResult");
			var li = //$("li").text(teamName); 
				document.createElement('li');
			li.textContent = teamName;
			ul.append(li); */
		}else{
			alert('팀이 존재하지 않습니다.');
		}
	}).fail(function(data) {
		alert('에러가 발생했습니다.');
	});
}

	var btnOpenModal = document.getElementById('open-modal');
	var btnCloseModal = document.getElementById('close-modal');
	var viewModal = document.getElementById('modalContainer');
	
	btnOpenModal.addEventListener('click', function(e) {
		viewModal.style.display = 'block';
	})
	btnCloseModal.addEventListener('click', function(e) {
		viewModal.style.display = 'none';
	})
	
	function setResList(resArr,index){
		/* $("#gameCode").val(0);
		$("#homeTeamName").val(0);
		$("#awayTeamName").val(0);
		$("#homeTeamScore").val(0);
		$("#awayTeamScore").val(0);
		$("#home1q").val(0);
		$("#home2q").val(0);
		$("#home3q").val(0);
		$("#home4q").val(0);
		$("#away1q").val(0);
		$("#away2q").val(0);
		$("#away3q").val(0);
		$("#away4q").val(0);
		$("#gameStartTime").val(0);			
		$("#gameEndTime").val(0); */
		//배열의 index를 사용해서 해결해보자..
		if(resArr.length !== 0){
			resArr.forEach(function(item) {
				alert('item.gameStartTime='+item.gameStartTime);	
				$("#gameCode").val(item.gameCode);
				$("#h_gameCode").val(item.gameCode);
				$("#homeTeamName").val(item.homeTeamName);
				$("#awayTeamName").val(item.awayTeamName);
				$("#homeTeamScore").val(item.homeTeamScore);
				$("#awayTeamScore").val(item.awayTeamScore);
				$("#home1q").val(item.home1q);
				$("#home2q").val(item.home2q);
				$("#home3q").val(item.home3q);
				$("#home4q").val(item.home4q);
				$("#away1q").val(item.away1q);
				$("#away2q").val(item.away2q);
				$("#away3q").val(item.away3q);
				$("#away4q").val(item.away4q);
				$("#gameStartTime").val(item.gameStartTime);			
				$("#gameEndTime").val(item.gameEndTime);			
				$("#h_gameStartTime").val(item.h_gameStartTime);			
				$("#h_gameEndTime").val(item.h_gameEndTime);			
			})
		}
		/* if(resArr.length !== 0){
			$("#gameCode").val(resArr[index].gameCode);
			$("#h_gameCode").val(resArr[index].gameCode);
			$("#homeTeamName").val(resArr[index].homeTeamName);
			$("#awayTeamName").val(resArr[index].awayTeamName);
			$("#homeTeamScore").val(resArr[index].homeTeamScore);
			$("#awayTeamScore").val(resArr[index].awayTeamScore);
			$("#home1q").val(resArr[index].home1q);
			$("#home2q").val(resArr[index].home2q);
			$("#home3q").val(resArr[index].home3q);
			$("#home4q").val(resArr[index].home4q);
			$("#away1q").val(resArr[index].away1q);
			$("#away2q").val(resArr[index].away2q);
			$("#away3q").val(resArr[index].away3q);
			$("#away4q").val(resArr[index].away4q);
			$("#gameStartTime").val(resArr[index].gameStartTime);			
			$("#gameEndTime").val(resArr[index].gameEndTime);			
			$("#h_gameStartTime").val(resArr[index].h_gameStartTime);			
			$("#h_gameEndTime").val(resArr[index].h_gameEndTime);			
		} */
	}
	function modTeamArchive(){
		var form = document.frm_teamArchive;
		var gameStartTime = document.getElementById("gameStartTime").value;
		var gameEndTime = document.getElementById("gameEndTime").value;
		
		var home1q = document.getElementById("home1q").value;
		var home2q = document.getElementById("home2q").value;
		var home3q = document.getElementById("home3q").value;
		var home4q = document.getElementById("home4q").value;
		
		var away1q = document.getElementById("away1q").value;
		var away2q = document.getElementById("away2q").value;
		var away3q = document.getElementById("away3q").value;
		var away4q = document.getElementById("away4q").value;
		
		var homeTeamName = document.getElementById("homeTeamName").value;
		var awayTeamName = document.getElementById("awayTeamName").value;
		
		var gameCode = document.getElementById("h_gameCode").value;
		alert("gameCode="+gameCode);
		var isValid = true;
		if(!(gameStartTime&&gameEndTime)){
			alert("경기시간을 입력해주세요!");
			return false;
		}
		if(!awayTeamName){
			alert("어웨이팀명을 입력해주세요!");
			return false;
		}
		if(!(home1q&&home2q&&home3q&&home4q&&away1q&&away2q&&away3q&&away4q)){
			alert('점수가 입력되지 않았습니다.');
			return false;
		}
		
		var homeTeamNameScore = document.createElement("input");
		homeTeamNameScore.type = 'hidden';
		homeTeamNameScore.name = 'homeTeamScore';
		homeTeamNameScore.value = scoreHap(home1q,home2q,home3q,home4q); 
		
		var awayTeamNameScore = document.createElement("input");
		awayTeamNameScore.type = 'hidden';
		awayTeamNameScore.name = 'awayTeamScore';
		awayTeamNameScore.value = scoreHap(away1q,away2q,away3q,away4q); 
		
		var hidden_wrap = document.getElementById("hidden_wrap");
		hidden_wrap.appendChild(homeTeamNameScore);
		hidden_wrap.appendChild(awayTeamNameScore);
		alert("home1q="+home1q+"awayTeamNameScore="+awayTeamNameScore.value);
		
		document.body.appendChild(form);
		
		if(isValid){
			form.method = 'post';
			form.action = '${contextPath}/archive/modTeamArchive.do';
			form.submit();
		}
	}
</script>
</html>