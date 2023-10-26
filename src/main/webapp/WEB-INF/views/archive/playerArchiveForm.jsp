<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String modResult = String.valueOf(request.getAttribute("modResult"));
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>선수개인기록등록</h2>
<form action="${contextPath }/archive/addPlayerArchive.do" method="post">
	<div>
		<!--경기코드가 있어야 되는 이유 
			팀기록을 등록할 때 경기코드가 입력이 됨
			그 이후 선수기록을 입력해야하는데
			그 때 팀기록의 경기코드가 필요함 
			선수기록에서는 경기코드를 생성할 필요 없다.
		 -->
		<!-- 팀이름||날짜||순번 -->
		경기코드 <input type="text" name="gameCode" id="gameCode" readonly="readonly"> <button type="button" onclick="gameCodeSearch()">경기조회</button><br>
		팀원 <select name="member_id" id="member_id">
				<option value="" selected="selected">선택
			</select><br>
		2점슛 시도 <input type="text" name="twoPointCnt" id="twoPointCnt" >회<br>
		2점슛 <input type="text" name="twoPoint" id="twoPoint" >점<br>
		3점슛 시도 <input type="text" name="threePointCnt" id="threePointCnt" >회<br>
		3점슛 <input type="text" name="threePoint" id="threePoint" >점<br>
		자유투 <input type="text" name="freedraw" id="freedraw" >회<br>
		페인트존 시도 <input type="text" name="faintzoneCnt" id="faintzoneCnt" >회<br>
		페인트존 득점 <input type="text" name="faintzone" id="faintzone" >점<br>
		어시스트 <input type="text" name="assist" id="assist" >회<br>
		공격리바운드 <input type="text" name="offenseRebound" id="offenseRebound" >회<br>
		수비리바운드 <input type="text" name="defenseRebound" id="defenseRebound" >회<br>
		블록 <input type="text" name="block" id="block" >회<br>
		스틸 <input type="text" name="steal" id="steal" >회<br>
		파울 <input type="text" name="foul" id="foul" >회<br>
		턴오버 <input type="text" name="turnover" id="turnover" >회<br>
		<button type="button" onclick="btnArchiveSubmit()">저장하기</button>
		<button type="button" onclick="btnArchiveImport()">기록불러오기</button>
		<button type="button" onclick="modPlayerArchive()">수정하기</button>
		<button>초기화</button>
	</div>
</form>
</body>
<script type="text/javascript">
	window.onload = function(){
		$.ajax({
			type: "POST",
			url: "${contextPath}/archive/playerList.do",
			success: function(data){
				var s_memberId  = $('#member_id');
				for(var i=0; i<data.length; i++){
					/* console.log(data[i].member_id); */
					var li = $("<option>").text(data[i].member_id);
					s_memberId.append(li);
				}
			},
			error:function(data){
				alert('에러가 발생했습니다.');
			} 
			/* 서브쿼리로 팀명알고 조회하면 됨  */
			
		})
	}
	var isBlurHandled = false;
		//변경 입력하기 버튼을 클릭하면
		//값체크하며 alert창 띄운다.
	$(document).ready(function(){
		var modResult = <%= modResult%>
		
		if(modResult!=""&&modResult!=null){
			alert(modResult+'수정되었습니다.');
		}
		//값 체크 작업
	});
	
	function resetBlurHandled() {
        isBlurHandled = false;
    }

    // 다른 입력 필드 클릭 시에 blur 이벤트 처리 초기화
    $("#shotCnt, #twoPoint, #threePoint, #freedraw, #faintzoneCnt, #faintzone, #assist, #offenseRebound, #defenseRebound, #block, #steal, #foul").click(function() {
        resetBlurHandled();
    });
	//마이너스 수 입력 방지
	function showErrorMsg(oMsg, msg){
		oMsg.show();
		oMsg.text(msg).css('color','red');
	}
	function hide(oMsg){
		oMsg.hide();
	}
	function checkTwoPointCnt(){
		var _twoPointCnt = $("#twoPointCnt").val();
		var oMsg = $("");
		/* if(_shotCnt == ""){
			showErrorMsg(oMsg,"필수 정보입니다.");
			return false;
		}else{
			hide(oMsg);
			return false;
		} */
		if(_twoPointCnt == ""){
			alert('필수 정보입니다.');
		}
	}
	function checkTwoPoint(){
		var _twoPoint = $("#twoPoint").val();
		if(_twoPoint == ""){
			alert('필수 정보입니다.');
			
		}
	}
	function checkThreePointCnt(){
		var _threePointCnt = $("#threePointCnt").val();
		if(_threePointCnt == ""){
			alert('필수 정보입니다.');
		}
	}
	function checkThreePoint(){
		var _threePoint = $("#threePoint").val();
		if(_threePoint == ""){
			alert('필수 정보입니다.');
		}
	}
	function checkFreedraw(){
		var _freedraw = $("#freedraw").val();
		if(_freedraw == ""){
			alert('필수 정보입니다.');
		}
	}
	function checkFaintzoneCnt(){
		var _faintzoneCnt = $("#faintzoneCnt").val();
		if(_faintzoneCnt == ""){
			alert('필수 정보입니다.');
		}
	}
	function checkFaintzone(){
		var _faintzone = $("#faintzone").val();
		if(_faintzone == ""){
			alert('필수 정보입니다.');
		}
	}
	function checkAssist(){
		var _assist = $("#assist").val();
		if(_assist == ""){
			alert('필수 정보입니다.');
			return false;
		}
	}
	function checkOffenseRebound(){
		var _offenseRebound = $("#offenseRebound").val();
		if(_offenseRebound == ""){
			alert('필수 정보입니다.');
			return false;
		}
	}
	function checkDefenseRebound(){
		var _defenseRebound = $("#defenseRebound").val();
		if(_defenseRebound == ""){
			alert('필수 정보입니다.');
			return false;
		}
	}
	function checkBlock(){
		var _block = $("#block").val();
		if(_block == ""){
			alert('필수 정보입니다.');
		}
	}
	function checkSteal(){
		var _steal = $("#steal").val();
		if(_steal == ""){
			alert('필수 정보입니다.');
		}
	}
	function checkFoul(){
		var _foul = $("#foul").val();
		if(_foul == ""){
			alert('필수 정보입니다.');
		}
	}
	function checkTurnover(){
		var _turnover = $("#turnover").val();
		if(_turnover == ""){
			alert('필수 정보입니다.');
		}
	}
	//서버 전송
	function btnArchiveSubmit(){
		//변수
		var _twoPointCnt = $("#twoPointCnt").val();
		var _twoPoint = $("#twoPoint").val();
		var _threePointCnt = $("#threePointCnt").val();
		var _threePoint = $("#threePoint").val();
		var _freedraw = $("#freedraw").val();
		var _faintzoneCnt = $("#faintzoneCnt").val();
		var _faintzone = $("#faintzone").val();
		var _assist = $("#assist").val();
		var _offenseRebound = $("#offenseRebound").val();
		var _defenseRebound = $("#defenseRebound").val();
		var _block = $("#block").val();
		var _steal = $("#steal").val();
		var _foul = $("#foul").val();
		var _turnover = $("#foul").val();
		var btnForm = $("form");
		var isValid = true;
		
		if(!_twoPointCnt){
			checkTwoPointCnt();
			isValid = false;
			return false;
		}
		if(!_twoPoint){
			checkTwoPoint();
			isValid = false;
			return false;
		}
		if(!_threePointCnt){
			checkThreePointCnt();
			isValid = false;
			return false;
		}
		if(!_threePoint){
			checkThreePoint();
			isValid = false;
			return false;
		}
		if(!_freedraw){
			checkFreedraw();
			isValid = false;
			return false;
		}
		if(!_faintzoneCnt){
			checkFaintzoneCnt();
			isValid = false;
			return false;
		}
		if(!_faintzone){
			checkFaintzone();
			isValid = false;
			return false;
		}
		if(!_assist){
			checkAssist();
			isValid = false;
			return false;
		}
		if(!_offenseRebound){
			checkOffenseRebound();
			isValid = false;
			return false;
		}
		if(!_defenseRebound){
			checkDefenseRebound();
			isValid = false;
			return false;
		}
		if(!_block){
			checkBlock();
			isValid = false;
			return false;
		}
		if(!_steal){
			checkSteal();
			isValid = false;
			return false;
		}
		if(!_foul){
			checkFoul();
			isValid = false;
			return false;
		}
		if(!_turnover){
			checkTurnover();
			isValid = false;
			return false;
		}
		//서버 전송
		if(isValid){
			btnForm.submit();
		}
		
	}
	function gameCodeSearch(){
		/* var s_member_name = document.getElementById('member_name').value;
		
		if(s_member_name !== ''){
			var member_id = document.getElementById("member_name").value;
			var url = "${contextPath}/archive/gameCodeData.do?member_id="+member_id;
			var name = "수정하기";
			var option ="width=500,height=500,top=200,left=500,location=no";
			window.open(url,name,option);
		}else{
			alert('팀원을 선택해주세요!');
		} */
		var member_id = document.getElementById("member_id").value;
		var url = "${contextPath}/archive/gameCodePopup.do?member_id="+member_id;
		var name = "게임코드찾기";
		var option ="width=500,height=500,top=200,left=500,location=no";
		window.open(url,name,option);
		
	}
	//팝업창이 닫히면 실행 됨
	function setResList(resArr){
		if(resArr.length !== 0){
			$("#gameCode").val(resArr[0].gameCode);
			$("#twoPointCnt").val(resArr[0].twoPointCnt);
			$("#twoPoint").val(resArr[0].twoPoint);
			$("#threePointCnt").val(resArr[0].threePointCnt);
			$("#threePoint").val(resArr[0].threePoint);
			$("#freedraw").val(resArr[0].freedraw);
			$("#faintzoneCnt").val(resArr[0].faintzoneCnt);
			$("#faintzone").val(resArr[0].faintzone);
			$("#assist").val(resArr[0].assist);
			$("#offenseRebound").val(resArr[0].offenseRebound);
			$("#defenseRebound").val(resArr[0].defenseRebound);
			$("#block").val(resArr[0].block);
			$("#steal").val(resArr[0].steal);
			$("#foul").val(resArr[0].foul);			
			$("#turnover").val(resArr[0].turnover);			
		}
		
	}
	function btnArchiveImport(){
		var member_id = document.getElementById('member_id').value;
		var gameCode = document.getElementById('gameCode').value;
		var sendData = {"member_id":member_id,
						"gameCode":gameCode};
		
		if(member_id!=''&&gameCode!=''){
			$.ajax({
				type:"post",
				url: "${contextPath}/archive/playerArchiveImport.do",
				contentType: "application/json; charset=UTF-8",
				data: JSON.stringify(sendData),
				success: function(data){
					var parsedData = JSON.parse(data);
					$("#twoPointCnt").val(parsedData[0].twoPointCnt);
					$("#twoPoint").val(parsedData[0].twoPoint);
					$("#threePointCnt").val(parsedData[0].threePointCnt);
					$("#threePoint").val(parsedData[0].threePoint);
					$("#freedraw").val(parsedData[0].freedraw);
					$("#faintzoneCnt").val(parsedData[0].faintzoneCnt);
					$("#faintzone").val(parsedData[0].faintzone);
					$("#assist").val(parsedData[0].assist);
					$("#offenseRebound").val(parsedData[0].offenseRebound);
					$("#defenseRebound").val(parsedData[0].defenseRebound);
					$("#block").val(parsedData[0].block);
					$("#steal").val(parsedData[0].steal);
					$("#foul").val(parsedData[0].foul);			
					$("#turnover").val(parsedData[0].turnover);
				},error: function(data){
					alert('에러가 발생했습니다.');
				}
			})
		}
		
		/* if(member_id!=''){
			var url = '${contextPath}/archive/modPlayerPopup.do?member_id='+member_id;
			var name = '기록수정';
			var option = 'width=500,height=500,top=200,left=500,location=no';
			window.open(url,name,option);
		}else{
			alert('팀원을 선택해주세요!');
		} */
		
	}
	
	function modPlayerArchive(){
		/* var twoPointCnt = $("#twoPointCnt").val();
		var twoPoint = $("#twoPoint").val();
		var threePointCnt = $("#threePointCnt").val();
		var threePoint = $("#threePoint").val();
		var freedraw = $("#freedraw").val();
		var faintzoneCnt = $("#faintzoneCnt").val();
		var faintzone = $("#faintzone").val();
		var assist = $("#assist").val();
		var offenseRebound = $("#offenseRebound").val();
		var defenseRebound = $("#defenseRebound").val();
		var block = $("#block").val();
		var steal = $("#steal").val();
		var foul = $("#foul").val();			
		var turnover = $("#turnover").val(); */
		
		//$("#twoPointCnt")[0] << 뒤에 [0]을 붙히면 javascript요소로 변경 됨
		//$("#twoPointCnt")[0].value로 값 확인 할 수 있다.
		var twoPointCnt = $("#twoPointCnt")[0];
		var twoPoint = $("#twoPoint")[0];
		var threePointCnt = $("#threePointCnt")[0];
		var threePoint = $("#threePoint")[0];
		var freedraw = $("#freedraw")[0];
		var faintzoneCnt = $("#faintzoneCnt")[0];
		var faintzone = $("#faintzone")[0];
		var assist = $("#assist")[0];
		var offenseRebound = $("#offenseRebound")[0];
		var defenseRebound = $("#defenseRebound")[0];
		var block = $("#block")[0];
		var steal = $("#steal")[0];
		var foul = $("#foul")[0];			
		var turnover = $("#turnover")[0];
		
		var member_id = $("#member_id")[0];
		var gameCode = $("#gameCode")[0];
		
		/* var i_twoPointCnt = document.createElement("input");
		var i_twoPoint = document.createElement("input");
		var i_threePointCnt = document.createElement("input");
		var i_threePoint = document.createElement("input");
		var i_freedraw = document.createElement("input");
		var i_faintzoneCnt = document.createElement("input");
		var i_faintzone = document.createElement("input");
		var i_assist = document.createElement("input");
		var i_offenseRebound = document.createElement("input");
		var i_defenseRebound = document.createElement("input");
		var i_block = document.createElement("input");
		var i_steal = document.createElement("input");
		var i_foul = document.createElement("input");
		var i_turnover = document.createElement("input");
		 */
		
		var formObj = document.createElement('form');
		formObj.appendChild(member_id);
		formObj.appendChild(gameCode);
		 
		formObj.appendChild(twoPointCnt);
		formObj.appendChild(twoPoint);
		formObj.appendChild(threePointCnt);
		formObj.appendChild(threePoint);
		formObj.appendChild(freedraw);
		formObj.appendChild(faintzoneCnt);
		formObj.appendChild(faintzone);
		formObj.appendChild(assist);
		formObj.appendChild(offenseRebound);
		formObj.appendChild(defenseRebound);
		formObj.appendChild(block);
		formObj.appendChild(steal);
		formObj.appendChild(foul);
		formObj.appendChild(turnover);
		
		document.body.appendChild(formObj);
		formObj.method = 'post';
		formObj.action = '${contextPath}/archive/modPlayerArchive.do';
		formObj.submit();
	}
	//날짜,팀명만 있으면 됨
	/* function gameSearch(){
		var url = "${contextPath}/archive/gameSearch.do";
		var name = "경기조회";
		var option ="width=500,height=500,top=200,left=500,location=no";
		window.open(url, name, option);
	} */
</script>
</html>