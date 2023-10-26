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
	<h2>팀만들기</h2>
	<%-- <form action="${contextPath }/club/teamReg.do" method="post" enctype="multipart/form-data"> --%>
	<form action="#" method="post" enctype="multipart/form-data">
		<div>
			<div>
				<img src="#" id="thumbnail"  width="150px" height="150px">
			</div>
			<input type="file" id="imgInput" onchange="fileTypeCheck(this)" name="team_image_file" accept="image/png,image/jpeg"><br>
			<span>지역:</span><!-- https://myhappyman.tistory.com/215 -->
			<select name="city" id="city"></select>
			<select name="state" id="state"></select><br>
			<span>팀명:&nbsp;</span><input type="text" id="team_name">
			<button type="button" onclick="checkTeamNameDuplicate()">중복확인</button>
			<p id="error-msg"></p>
		</div>
		<!-- <button type="button" onclick="btnTeamReg()">팀 만들기</button> -->
		<button type="button" onclick="btnTeamReg()">팀 만들기</button>
		<button type="button">취소</button>
	</form>
</div>
</body>
<script type="text/javascript">
$(function(){
	areaSelectMaker("select[name=city]");
})
var areaSelectMaker = function(target){
if(target == null || $(target).length == 0){
	console.warn("Unknown Area Tag");
	return false;
}
var area = {"서울특별시" : [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ],
            "경기도" : [ "수원시 장안구", "수원시 권선구", "수원시 팔달구", "수원시 영통구", "성남시 수정구", "성남시 중원구", "성남시 분당구", "의정부시", "안양시 만안구", "안양시 동안구", "부천시", "광명시", "평택시", "동두천시", "안산시 상록구", "안산시 단원구", "고양시 덕양구", "고양시 일산동구",
                "고양시 일산서구", "과천시", "구리시", "남양주시", "오산시", "시흥시", "군포시", "의왕시", "하남시", "용인시 처인구", "용인시 기흥구", "용인시 수지구", "파주시", "이천시", "안성시", "김포시", "화성시", "광주시", "양주시", "포천시", "여주시", "연천군", "가평군",
                "양평군" ],
            "인천광역시" : [ "계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군" ],
            "강원도":[ "춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군" ],
            "충청북도" : [ "청주시 상당구", "청주시 서원구", "청주시 흥덕구", "청주시 청원구", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군" ],
            "충청남도" : [ "천안시 동남구", "천안시 서북구", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군" ],
            "대전광역시" : [ "대덕구", "동구", "서구", "유성구", "중구" ],
            "세종특별자치시" : [ "세종특별자치시" ],
            "전라북도" : [ "전주시 완산구", "전주시 덕진구", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군", "부안군" ],
            "전라남도" : [ "목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군", "영암군", "무안군", "함평군", "영광군", "장성군", "완도군", "진도군", "신안군" ],
            "광주광역시" : [ "광산구", "남구", "동구", "북구", "서구" ],			
            "경상북도" : [ "포항시 남구", "포항시 북구", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군" ],
            "경상남도" : [ "창원시 의창구", "창원시 성산구", "창원시 마산합포구", "창원시 마산회원구", "창원시 진해구", "진주시", "통영시", "사천시", "김해시", "밀양시", "거제시", "양산시", "의령군", "함안군", "창녕군", "고성군", "남해군", "하동군", "산청군", "함양군", "거창군", "합천군" ],
            "부산광역시" : [ "강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군" ],
            "대구광역시" : [ "남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군" ],
            "울산광역시" : [ "남구", "동구", "북구", "중구", "울주군" ],		
            "제주특별자치도" : [ "서귀포시", "제주시" ]
    };
for(i=0; i<$(target).length; i++){
	(function(z){
	    var a1 = $(target).eq(z); //z는 for문의 i
	    var a2 = a1.next();
	    var a3 = a2.next();
	
	    init(a1,true);
	
	    var areaKeys1 = Object.keys(area);
	    areaKeys1.forEach(function(City){
	        a1.append("<option value="+City+">"+City+"</option>");
	    });
	
	    $(a1).on("change",function(){
	        init($(this),false);
	        //var Region = region.target.value;
	        var City = $(this).val();
	        var keys = Object.keys(area[City]);
	        console.log(keys);
	        keys.forEach(function(SiGunGu){
	            console.log('City[Do]='+area[City][SiGunGu]);
	            a2.append("<option value="+area[City][SiGunGu]+">"+area[City][SiGunGu]+"</option>");
	        });
	    });
	    // $(a2).on("change",function(){
	    //     //a2는 두번째 select니까 변경할 때마다 
	    //     //다음 select를 초기화 시켜주고
	    //     //a3 목록을 셋팅함
	    //     a3.empty().append("<option value=''>선택</option>");
	    //     var Region = a1.val();
	    //     var Do = $(this).val();
	    //     var keys = Object.keys(area[Region][Do]);
	    //     keys.forEach(function(SiGunGu){
	    //         //json값을 가지고 옮 
	    //         a3.append("<option value="+area[Region][Do][SiGunGu]+">"+area[Region][Do][SiGunGu]+"</option>");
	    //     });
	    // });
	})(i);
	function init(target,flag){
			flag ? target.empty().append("<option>선택</option>"):"";
			target.next().empty().append("<option>선택</option>");
		}
	}
}

const imgInput = document.querySelector('#imgInput');
var duplicateFlag = false;
var i_team_name = document.getElementById('team_name');

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
	const file = this.files[0];
	if(file){
		const reader = new FileReader();
		reader.addEventListener('load', function(e) {
			thumbnail.src = reader.result;
			//thumbnail.style.display = 'block';
		});
	reader.readAsDataURL(file);
	}
}); */
//중복확인
function checkTeamNameDuplicate(){
	var teamName = document.getElementById('team_name');
	if(teamName.value == ''){
		alert('팀명을 입력해 주세요!');
		i_team_name.focus();
		return false;
	}
	$.ajax({
		type:"post",
		async:false,
		url:"${contextPath}/club/teamNameDup.do",
		data:{team_name:teamName.value},
		success:function(data,textStatus){
			if(data.trim()=='Y'){
				alert('사용가능한 팀이름입니다.');
				duplicateFlag = true;
			}else{
				alert('사용 불가능한 팀이름입니다.');
				duplicateFlag = false;
			}
		},
		error:function(data,textStatus){
			alert('에러가 발생했습니다.'+data);
		}
	});
}
//중복체크를 했는지 확인 후 form 전송
function btnTeamReg(){
	var formObj = $('form').attr('enctype','multipart/form-data')
							.attr('method','post')
							.attr('action','${contextPath}/club/teamReg.do');
	var i_team_name = $('#team_name');
	var i_img = $('#imgInput')[0];
	
	var h_team_name = $('<input>').attr('type','hidden').attr('name','team_name').val(i_team_name.val());
	//var h_img = $('<input>').attr('type','file').attr('name','team_image_file').val(i_img.val());
	alert(h_team_name.val());
	
	if(!duplicateFlag){
		alert('중복확인을 해주세요!');
		i_team_name.focus();
		return false;
	}
	formObj.append(h_team_name);
	formObj.submit();
}


/* function fileTypeCheck(obj){
	var pathpoint = obj.value.lastIndexOf('.');
	var filepoint = obj.value.substring(pathpoint+1,obj.length);
	var filetype = filepoint.toLowerCase();
	alert('실행');
	//만약 filetype이 gif이면 조건문이 true가 되어 실행 된다.
	//parentObj: 파일 입력 필드의 부모 요소를 가리키는 변수입니다.
	//node: 파일 입력 필드를 복제한 후 원래의 파일 입력 필드와 교체된 노드를 저장하는 변수입니다.
	//replaceChild(): 부모 요소에서 자식 요소를 교체하는 메서드입니다. 이 메서드를 사용하여 원래의 파일 입력 필드를 복제한 파일 입력 필드로 교체합니다.
	//obj.cloneNode(true): obj 변수로 참조되는 파일 입력 필드를 복제하여 새로운 파일 입력 필드 노드를 생성합니다. true 매개변수는 깊은 복사를 수행하도록 지정합니다.
	if(filetype !== 'jpg' && filetype !== 'png' && filetype !== 'jpeg' && filetype !== 'bmp'){
		var parentObj = obj.parentNode;
		var node = parentObj.replaceChild(createInvalidFileInput(),obj);
		alert('이미지 파일만 선택할 수 있습니다.');
		return false;
	}
}

function createInvalidFileInput(){
	var fileInput = document.createElement('input');
	fileInput.type = 'file';
	fileInput.id = 'imgInput';
	fileInput.onchange = function(){
		fileTypeCheck(this);
	};
	return fileInput;
} */
</script>
</html>