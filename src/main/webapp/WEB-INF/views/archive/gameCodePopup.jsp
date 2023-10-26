<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="gameDataMap" value="${gameDataMap}" />
<%
	request.setCharacterEncoding("UTF-8");
	String member_id = request.getParameter("member_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>경기검색</h2>
	경기날짜: <input type="date" id="gameDate">
	<button id="gameSearch" onClick="btnGameSearch()">검색</button>
	<div>
		<h3>검색결과</h3>
		<ul id="searchResult">
			
		</ul>
	</div>
</body>
<script type="text/javascript">
	function btnGameSearch(){
		//2023-07-07
		/* alert(${gameDataMap.member_id});
		alert(${gameDataMap.captain_id});
		alert(${gameDataMap.team_name}); */
		var i_gameDate = document.getElementById('gameDate').value;
		var create_li = document.createElement('li');
		console.log(i_gameDate);
		var member_id = '<%= member_id%>';
		var captain_id = '${gameDataMap.captain_id}';
		var team_name = '${gameDataMap.team_name}';
		//참고 https://yejip.com/web/2020-12-14-ajax1/
		var sendData = {"gameDate":i_gameDate,
				 "captain_id":captain_id,
				  "member_id":member_id,
				  "team_name":team_name};
		$.ajax({
			type: "post",
			url: "${contextPath}/archive/gameCodeSearch.do",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(sendData),
			/* {gameDate:i_gameDate
				 gameDataMap:{member_id:"player01", 
				captain_id:"captain", 
				team_name:"테스트"} 
			}, */
				  /* captain_id:${gameDataMap.captain_id},
				  member_id:${gameDataMap.member_id},
				  team_name:${gameDataMap.team_name} */
			success: function(data){
				var parsedData = JSON.parse(data);
				console.log(parsedData.length);
				if(parsedData==""||parsedData.length==0){
					alert('데이터가 없습니다.');
					return false;
				}
				var resArr = new Array();
				var ul = document.getElementById("searchResult");
				for(var i=0; i<parsedData.length; i++){
					//클로저 내가 이해하기로는
					//비동기를 동기화 시켜서 실행한 것
					(function(index){
					//var li = $("<li>").text(data[i].creDate);
					//var a = $("<a>").attr('href','#').append(li);
					//var a = $("<a>").attr('href','#').text('객체 확인');
					/* a.on("click", function() {
						alert('클릭');
					}) */
					var li = document.createElement('li');
					var a = document.createElement('a');
						a.href = '#';
						a.textContent = parsedData[index].gameCode;
						li.appendChild(a);
						ul.appendChild(li);
						a.addEventListener('click', function() {
						  var resObj = new Object();
						  //경기코드 2023-08-04 16:10:23(1)을 가공해서
						  //20230804161023 으로 바꾸기
						  //resObj.gameCode = parsedData[index].gameCode;
						  resObj.gameCode = parsedData[index].gameCode.replace(/[-:]/g, '').replace(/\s/g, '').replace(/\(\d+\)/,'');
						  /* resObj.twoPointCnt = data[index].twoPointCnt;
						  resObj.twoPoint = data[index].twoPoint;
						  resObj.threePointCnt = data[index].threePointCnt;
						  resObj.threePoint = data[index].threePoint;
						  resObj.freedraw = data[index].freedraw;
						  resObj.assist = data[index].assist;
						  resObj.rebound = data[index].rebound;
						  resObj.block = data[index].block;
						  resObj.steal = data[index].steal;
						  resObj.foul = data[index].foul; */
						  
						  resArr.push(resObj);
				//참고 https://chobopark.tistory.com/5
				//팝업창이 닫히면 실행 됨
						  window.opener.setResList(resArr);
						  window.close();
						});
					//$("#searchResult").append(a);
					})(i)
				}
			},
			error : function(data, textStatus){
				alert("에러가 발생했습니다."+data);
			}
		});
	}
</script>
</html>