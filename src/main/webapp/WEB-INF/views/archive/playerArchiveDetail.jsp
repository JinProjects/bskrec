<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="">
</head>
<body>
<!-- playerRecordDetail -->
	<!-- 선수 평균 기록 -->
  <!-- boxsizing을 사용하여 테이블 크기를 맞춤
        부모크기가 없어서 그런지 반응이없어보임 -->
    <div class="content-wrap">
        <div class="content-header">
            <h2>선수 기록실</h2>
            <p>선수 기록을 확인할 수 있습니다.</p>
        </div>
        <div class="archive-player-table-wrap">
            <div class="archive-player-table">
                <table>
                    <thead>
                        <tr>
                            <th rowspan="2">순위</th>
                            <th rowspan="2">선수명</th>
                            <th rowspan="2">팀</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>자밀워니</td>
                            <td>서울 SK</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="top-scroll-table archive-player-table">
                <table>
                    <!-- 16개  -->
                    <thead>
                        <tr>
                            <th rowspan="2">PTS</th>
                            <th rowspan="2">FG</th>
                            <th rowspan="2">FGA</th>
                            <th rowspan="2">FG%</th>
                            <th rowspan="2">FT</th>
                            <th rowspan="2">FTA</th>
                            <th rowspan="2">FT%</th>
                            <th rowspan="2">PP</th>
                            <th rowspan="2">PPA</th>
                            <th rowspan="2">PP%</th>
                            <th colspan="3" class="rebound">REBOUND</th>
                            <th rowspan="2">AST</th>
                            <th rowspan="2">TO</th>
                            <th rowspan="2">STL</th>
                            <th rowspan="2">BS</th>
                            <th rowspan="2">PF</th>
                        </tr>
                        <tr>
                            <th>OFF</th>
                            <th>DEF</th>
                            <th>TOT</th>
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
        	<button id="btnRecReg" class="btnRecReg" onclick="btnRecReg()">기록등록</button>
        </div>
    </div>	
</body>
<script type="text/javascript">
	function btnRecReg(){
		/* var recReg = document.getElementById('btnRecReg'); */
		location.href = '${contextPath}/archive/playerArchiveForm.do';
	}
</script>
</html>