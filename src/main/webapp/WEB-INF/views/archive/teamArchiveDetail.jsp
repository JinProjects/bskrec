<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!-- tiles로 불러오지말고 컨트롤러로 불러오자! -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="content-wrap">
	<div class="content-header">
		<h2>팀 기록실</h2>
		<p>팀 기록을 확인할 수 있습니다.</p>
	</div>
	<div class="archive-team-table-wrap">
		<div class="archive-team-table">
			<table>
				<thead>
					<tr>
						<th rowspan="2">순위</th>
						<th rowspan="2">팀</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>서울 SK</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="top-scroll-table archive-team-table">
			<table>
				<thead>
					<tr>
						<th rowspan="2">PTS</th><!-- 총득점 twoPoint+threePoint+freedraw-->
						<th rowspan="2">FG</th><!-- 필드골(자유투 제외) twoPoint+threePoint-->
						<th rowspan="2">FGA</th><!-- 필드골시도 twoPointCnt+threePointCnt -->
						<th rowspan="2">FG%</th><!-- 필드 골 성공률 twoPoint+threePoint/twoPointCnt+threePointCnt*100-->
						<th rowspan="2">FT</th><!-- 자유투 freedraw -->
						<th rowspan="2">FTA</th><!-- 자유투 시도 freedrawCnt -->
						<th rowspan="2">FT%</th><!-- 자유투 성공률 freedraw/freedrawCnt*100-->
						<th rowspan="2">PP</th><!-- 페인트 영역 득점 점수 faintzone -->
						<th rowspan="2">PPA</th><!-- 페인트 영역 득점 시도 faintzoneCnt-->
						<th rowspan="2">PP%</th><!-- 페인트 영역 득점 성공률 faintzone/faintzoneCnt*100-->
						<th colspan="3" class="rebound">REBOUND</th>
						<th rowspan="2">AST</th><!-- 어시스트 횟수 assist-->
						<th rowspan="2">TO</th><!-- 턴오버(상대방에게 공을 잡히게 되거나 패스를 실패하게 된 경우) turnover-->
						<th rowspan="2">STL</th><!-- 스틸성공 횟수 steal -->
						<th rowspan="2">BS</th><!-- 블록 성공 횟수 block-->
						<th rowspan="2">PF</th><!-- 개인파울 foul-->
					</tr>
					<tr>
						<th>OFF</th><!-- 공격리바운드 횟수 offenseRebound-->
						<th>DEF</th><!-- 수비리바운드 횟수 defenseRebound-->
						<th>TOT</th><!-- 총 리바운드 횟수 offenseRebound+defenseRebound-->
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
						<td>43</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
		<div>   
			<button id="TeamRecReg" class="TeamRecReg" onclick="btnTeamRecReg()">팀 기록등록</button>
		</div>
</div>
</body>
<script type="text/javascript">
	function btnTeamRecReg(){
		location.href='${contextPath}/archive/teamArchiveForm.do'
	}
</script>
</html>