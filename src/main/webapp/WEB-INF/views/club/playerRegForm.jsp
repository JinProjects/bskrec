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
<div id="outer-wrap">
	<h2>선수등록</h2>
	<form action="${contextPath }/club/playerReg.do" method="post" enctype="multipart/form-data">
		<div>
			<div>
				<img src="#" id="thumbnail" width="150" height="150">
			</div>
			<input type="file" name="player_image_file" id="imgInput" onchange="fileTypeCheck(this)"><br>
			<!-- 키,몸무게,포지션,발사이즈,윙스펜,서전트 -->
			<span>키:&nbsp;</span><input type="text" name="height" id=""><br>
			<span>몸무게:&nbsp;</span><input type="text" name="weight" id=""><br>
			<span>발사이즈:&nbsp;</span><input type="text" name="footSize" id=""><br>
			<span>윙스펜:&nbsp;</span><input type="text" name="wingspan" id=""><br>
			<span>서전트:&nbsp;</span><input type="text" name="sergeant" id=""><br>
			<input type="radio" name="member_position" value="center">센터
			<input type="radio" name="member_position" value="forward">포워드
			<input type="radio" name="member_position" value="guard">가드
		</div>
		<button type="submit">등록</button>
		<button type="button">취소</button>
	</form>
</div>
</body>
<script type="text/javascript">
const imgInput = document.querySelector('#imgInput');
function fileTypeCheck(obj) {
    var pathpoint = obj.value.lastIndexOf('.');
    var filepoint = obj.value.substring(pathpoint + 1, obj.length);
    var filetype = filepoint.toLowerCase();
    const thumbnail = document.querySelector('#thumbnail');
    if (filetype !== 'jpg' && filetype !== 'png' && filetype !== 'jpeg' && filetype !== 'bmp') {
        alert('이미지 파일만 선택할 수 있습니다.');
        obj.value = ''; // 선택한 파일을 비움
        thumbnail.src = '';
    } else {
        displayThumbnail(obj);
    }
}

function displayThumbnail(obj) {
    const thumbnail = document.querySelector('#thumbnail');
    const file = obj.files[0];
    if (file) {
        const reader = new FileReader();
        reader.addEventListener('load', function(e) {
            thumbnail.src = reader.result;
        });
        reader.readAsDataURL(file);
    }
}

/* imgInput.addEventListener('change', function(e) {
	const thumbnail = document.querySelector('#thumbnail');
	const file = this.files[0];
	//reader.readAsDataURL(file);를 실행하면
	//reader이벤트리스너가 실행되고
	//이미지데이터가 담긴 reader.result를 thumbnail.src에 대입한다.
	if(file){
		const reader = new FileReader();
		reader.addEventListener('load', function(e) {
			thumbnail.src = reader.result;//reader.result는 file의 데이터URL정보가 담겨있다
		});
		reader.readAsDataURL(file);
	}
})

function fileTypeCheck(obj){
	var pathpoint = obj.value.lastIndexOf('.');
	var filepoint = obj.value.substring(pathpoint+1,obj.length);
	var filetype= filepoint.toLowerCase();
	
	if(filetype != 'jpg' && filetype != 'png' && filetype != 'jpeg' && filetype != 'bmp'){
		var parentObj = obj.parentNode;
		var node = parentObj.replaceChild(createInvalidFileInput(), obj);
		alert('이미지 파일만 선택할 수 있습니다.');
		return false;
	}
}
function createInvalidFileInput(){
	var fileInput = document.createElement('input');
	fileInput.type='file';
	fileInput.id='invalidFileInput';
	fileInput.onchange = function(){
		fileTypeCheck(this);
	}
	return fileInput;
} */

</script>
</html>