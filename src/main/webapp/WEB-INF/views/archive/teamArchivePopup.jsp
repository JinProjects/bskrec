<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String awayTeamName = request.getParameter("awayTeamName");
	String homeTeamName = request.getParameter("homeTeamName");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h2>경기검색</h2>
		경기날짜 <input type="date" id="gameDate">
		<button type="button" onclick="btnGameDateSearch()">검색</button>
	</div>
	<div>
		<h3>검색결과</h3>
		<ul id="searchResult">
			
		</ul>
	</div>
</body>
<script type="text/javascript">
//시간가공해야함 20230804 1413 43
//시간가공전 원본도 같이 보내주자.. 
//게임시간 수정할때 원본날짜와 결합하여 저장하면 됨
	function fn_gameTime(gameTime){
		var hour = gameTime.substr(8, 2);
		var minute = gameTime.substr(10,2);
		return hour+":"+minute;
	}
	function btnGameDateSearch(){
		var gameDate = document.getElementById("gameDate").value;
		var sendData = {'gameDate':gameDate,
						'awayTeamName':'<%= awayTeamName%>',
						'homeTeamName':'<%= homeTeamName%>'}
		var resArr = new Array();
		$.ajax({
			type: "post", 
			url: "${contextPath}/archive/teamArchiveGameDate.do",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(sendData),
			success:function(data){
				var parsedData = JSON.parse(data);
				var ul = document.getElementById("searchResult");
				for(var i=0; i<parsedData.length; i++){
					(function(index){
						var li = document.createElement("li");
						var a = document.createElement("a");
						a.href='#';
						a.textContent = parsedData[index].gameCode;
						//a태그의 id를 index부여해서 
						li.appendChild(a);
						ul.appendChild(li);
							//시간가공해야함 20230804 1413 43
							//alert(parsedData[index].gameStartTime);
							var resObj = new Object();
							resObj.gameCode = parsedData[index].gameCode.replace(/[-:]/g, '').replace(/\s/g, '').replace(/\(\d+\)/,'');
							resObj.homeTeamName = parsedData[index].homeTeamName;
							resObj.awayTeamName = parsedData[index].awayTeamName;
							resObj.homeTeamScore = parsedData[index].homeTeamScore;
							resObj.awayTeamScore = parsedData[index].awayTeamScore;
							resObj.home1q = parsedData[index].home1q;
							resObj.home2q = parsedData[index].home2q;
							resObj.home3q = parsedData[index].home3q;
							resObj.home4q = parsedData[index].home4q;
							resObj.away1q = parsedData[index].away1q;
							resObj.away2q = parsedData[index].away2q;
							resObj.away3q = parsedData[index].away3q;
							resObj.away4q = parsedData[index].away4q;
							resObj.gameStartTime = fn_gameTime(parsedData[index].gameStartTime);//parsedData[index].gameStartTime;
							resObj.gameEndTime = fn_gameTime(parsedData[index].gameEndTime);//parsedData[index].gameEndTime;
							resObj.h_gameStartTime = parsedData[index].gameStartTime;
							resObj.h_gameEndTime = parsedData[index].gameEndTime;
							alert('resObj.gameStartTime='+resObj.gameStartTime);
						a.addEventListener("click", function(e) {
							var clickedResObj = resArr[index];
							window.opener.setResList([clickedResObj],index);
							//window.opener.setResList(resArr,index);
							//window.close();
						})
							resArr.push(resObj);
					})(i)
				}
			},
			error: function(data,textStatus){
				alert("에러가 발생헀습니다."+data);
			}
		})
	}
</script>
</html>