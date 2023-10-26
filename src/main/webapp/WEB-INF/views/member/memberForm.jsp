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
<section id="outter-join-wrap">
        <div id="inner-join-wrap">
            <h2><a href="">bskrec</a></h2>
            <!-- <p>회원가입</p> -->
            <form action="${contextPath }/member/addMember.do" id="myForm" method="post" enctype="multipart/form-data">
                <div class="user-id-wrap">
                    <h3>
                        <label for="id">아이디</label>
                    </h3>
                    <span>
                        <input type="text" name="member_id" id="id" class="int">
                    </span>
                    <span class="error-box" id="idMsg" aria-live="assertive">
                    	
                    </span>
                </div>
                <div class="user-pw-wrap">
                    <h3>
                        <label for="pw">비밀번호</label>
                    </h3>
                    <span class="ps-box">
                        <input type="password" name="member_pw" id="pw" class="int">
                    </span>
                    <span class="error-box" id="pw1Msg" aria-live="assertive">
                    	
                    </span>
                    <h3>
                        <label for="pw">비밀번호 확인</label>
                    </h3>
                    <span class="ps-box">
                        <input type="password" name="pw_check" id="pw_check" class="int">
                    </span>
                    <span class="error-box" id="pw2Msg" aria-live="assertive">
                    	
                    </span>
                </div>
                <div class="user-name-wrap">
                    <h3>이름</h3>
                    <span class="ps-box">
                        <input type="text" name="member_name" id="name" class="int">
                    </span>
                    <span class="error-box" id="nameMsg" aria-live="assertive">
                    	
                    </span>
                </div>
                <div class="user-birthday-wrap">
                    <h3>생년월일</h3>
                    <div class="bir-wrap">
                        <div class="bir-yy">
                            <span>
                                <input type="text" name="member_birth_y" id="yy" class="int" maxlength="4" placeholder="년(4자)">
                            </span>
                        </div>
                        <div class="bir-mm">
                            <span>
                                <select name="member_birth_m" id="mm" class="sel" aria-label="월">
                                    <option value>월</option>
                                    <option value="01">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                    <option value="07">7</option>
                                    <option value="08">8</option>
                                    <option value="09">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                            </span>
                        </div>
                        <div class="bir-dd">
                            <span class="ps-box">
                                <input type="text" name="member_birth_d" id="dd" class="int" placeholder="일">
                            </span>
                        </div>
                            <span class="error-box" id="birthdayMsg" aria-live="assertive">
                    	
                			</span>
                    </div>
                </div>
                    <div class="gender-wrap">
                        <h3>성별</h3>
                        <span class="ps-box">
                            <select name="member_gender" id="gender" class="sel">
                                <option value>성별</option>
                                <option value="male">남자</option>
                                <option value="female">여자</option>
                            </select>
                        </span>
                        <span class="error-box" id="genderMsg" aria-live="assertive">
                        </span>
                    </div>
                    <div class="hp-wrap">
                        <h3>휴대전화</h3>
                        <div class="hp1-wrap">
                            <select name="hp1" id="hp1" class="sel">
                                <option value>없음</option>
                                <option selected value="010">010</option>
                                <option value="011">011</option>
                                <option value="016" >016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                        </div>
                        <div class="hp2-wrap">    
                            <span class="ps-box">
                                <input type="text" name="hp2" id="hp2" class="int" placeholder="' - '없이 입력">
                            </span>
                        </div>
                            <span class="error-box" id="hpMsg" aria-live="assertive">
                      		 </span>
                    </div>
                    <div class="addr-wrap">
                    	<h3>주소</h3>
                    	<div class="addr1-wrap">
                    		<input type="text" id="zipcode" name="zipcode" class="addr-int" readonly>
                    		<button type="button" class="btn-addr" onclick="javascript:execDaumPostcode()"><span>우편번호검색</span></button>
                    	</div>
                        <div class="addr2-wrap">
                            <h4>도로명 주소</h4>
                    		<input type="text" id="roadAddress" name=roadAddress class="addr-int" readonly>
                            <h4>지번 주소</h4>
                    		<input type="text" id="jibunAddress" name="jibunAddress" class="addr-int" readonly>
                            <h4>나머지 주소</h4>
                    		<input type="text" id="namujiAddress" name="namujiAddress" class="addr-int">
                        </div>
                    </div>
                    <div class="profile-img-wrap">
                    	<h3>프로필 이미지</h3>
                    	<div class="thumbnail-wrap">
                    		<img id="thumbnail" src="#" >
                    		<input type="file" id="imgInput" name="imgInput">
                    	</div>
                    </div>
                    <div class="btn_wrap">
                    	<!-- <button type="submit"><span>가입하기</span></button> -->
                        <button type="button" id="btnFrom" onClick="btnAddMember()"><span>가입하기</span></button>
                    </div>
            </form>
        </div>
    </section>
</body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript">
    	const imgInput = document.querySelector('#imgInput');
    	const thumbnail = document.querySelector('#thumbnail');
    	
    	imgInput.addEventListener('change', function(e) {
    		const file = this.files[0];
    		if(file){
    			const reader = new FileReader();
    			reader.addEventListener('load', function(e) {
    				thumbnail.src = reader.result;
    				//thumbnail.style.display = 'block';
    			});
    		reader.readAsDataURL(file);
    		}
    	});
    	//버튼 클릭 시 form 전송을 막아야 함
    	//값체크
    	 function btnAddMember(){
    		var _id = document.getElementById('id').value;
			var _pw = document.getElementById('pw').value;
			var _name = document.getElementById('name').value;
			var _yy = document.getElementById('yy').value;
			var _mm = document.getElementById('mm').value;
			var _dd = document.getElementById('dd').value;
			var btnForm = $('form');
			var img = document.getElementById('thumbnail');
			console.log("img-"+img.src);
			var form = document.getElementById('myForm');
			var formData = new FormData(form);
			console.log(btnForm);
			var isValid = true;
			
    		if(!_id){
	    		checkId("first");
	    		isValid = false;
    		}
    		if(!_pw){
    			checkPw1("first");
    			isValid = false;
    		}
    		if(!_name){
    			checkName("first");
    			isValid = false;
    		}
    		if(!_yy){
    			checkBirthdayValidity("first");
    			isValid = false;
    		}
    		if(!_mm){
    			checkBirthdayValidity("first");
    			isValid = false;
    		}
    		if(!_dd){
    			checkBirthdayValidity("first");
    			isValid = false;
    		}
    		//true
    		if(isValid){
    			btnForm.submit();
   				 /* var xhr = new XMLHttpRequest();
	   			  xhr.open("POST", '${contextPath }/member/addMember.do', true);
	   			  xhr.send(formData); */
	   			  /* fetch('${contextPath }/member/addMember.do',{
	   				  method:'POST',
	   				  body : formData
	   			  }) */
    		}
    	} 
    	//우편번호
    	 function execDaumPostcode(){
    		 new daum.Postcode({
    			//클릭시 실행하는 코드
    			 oncomplete: function(data){
    				var fullRoadAddr = data.roadAddress; 
    				
    				var extraRoadAddr = '';
    				
    				//data.bname 동이름
    				//동이름이 공백이 아니고 동이름이 동 또는 로 또는 가 가 포함되는지
    				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
    					extraRoadAddr += data.bname;
    				}
    				//건물명이 있고, 공동주택일 경우 추가한다.
    				if(data.buildingName !== '' && data.apartment === 'Y'){
    					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName)
    				}
    				//도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
    				if(extraRoadAddr !== ''){
    					extraRoadAddr = ' ('+extraRoadAddr+')';
    				}
    				//도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
    				if(fullRoadAddr !== ''){
    					fullRoadAddr += extraRoadAddr;
    				}
    				document.getElementById('zipcode').value = data.zonecode;
    				document.getElementById('roadAddress').value = fullRoadAddr;
    				document.getElementById('jibunAddress').value = data.jibunAddress;
    				//원본 자바스크립트에서 jquery로 변경 후 동작 됨
    				var guideTextBox = $('#guide');
    				
    				//사용안함을 클릭하면 
    				 if(data.autoRoadAddress){
    					var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
    					guideTextBox.innerHTML = '(예상 도로명 주소 : '+ expRoadAddr + ')';
    					guideTextBox.css('display','block');
    				}else if(data.autoJibunAddress){
    					var expJibunAddr = data.autoJibunAddress;
    					guideTextBox.innerHTML = '(예상 지번 주소 : '+ expJibunAddr + ')';
    					guideTextBox.css('display','block');
    				}else {
    					guideTextBox.innerHTML = '';
    					guideTextBox.css('display','none');
    				} 
    			} 
    		 }).open();
    	 }
    	/*  아이디
    		1.아이디에 공백이면 '필수정보입니다.' 보이게 하기 o
			2. 아이디가 중복되면 '이미 사용중이거나 탈퇴한 아이디입니다.'
			3. 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.
				표현식으로 만들기	
			4. 아이디 중복검사 ajax로 구현
    	*/
    	var idFlag = false;
    	var pwFlag = false;
    	var pw2Flag = false;
    	var nameFlag = false;
    	$(document).ready(function(){
    		$("#id").blur(function(){
    			idFlag = false;
    			checkId("first");
    		});
    		$("#pw").blur(function(){
    			pwFlag = false;
    			checkPw1();
    		});
    		$("#pw_check").blur(function(){
    			pw2Flag = false;
    			checkPw2();
    		});
    		$("#name").blur(function(){
    			nameFlag = false;
    			checkName();
    		});
    		$("#yy").blur(function(){
    			checkBirthdayValidity();
    		});
    		$("#mm").blur(function(){
    			checkBirthdayValidity();
    		});
    		$("#dd").blur(function(){
    			checkBirthdayValidity();
    		})
    		$("#gender").blur(function(){
    			checkGenderValidity();
    		})
    		$("#hp1").blur(function(){
    			checkHp1Validity();
    		})
    		$("#hp2").blur(function(){
    			checkHp2Validity();
    		}) 
    		
    	});
    	/* function checkAddrValidity(){
    		//도로명,지번, 나머지 셋 중 하나라도 입력되야함
    		if(){
    			
    		}
    	} */
    	 function checkHp2Validity(){
    		var _hp2 = $("#hp2").val();
    		var oMsg = $("#hpMsg");
    		//(?=.*[^A-Za-z0-9]) << 이 코드에 문제가 있는 듯
    		var regex = /^\d{3,4}\d{4}$/;
    		console.log(oMsg);

			console.log(regex.test('0101234567#')); // true
			console.log(regex.test('0311234567$%')); // true
			console.log(regex.test('02-1234-5678&')); // true
			console.log(regex.test('0101234567')); // false
			console.log(regex.test('02-1234-5678')); // false
			console.log(regex.test('0311234567%')); // false
    		var hpID = /^\d{3,4}\d{4}$/;
    		if(!hpID.test(_hp2)){
    			showErrorMsg(oMsg, "형식에 맞지 않는 번호입니다.");
    			return false;
    		}
    		if(_hp2 == ""){
    			showErrorMsg(oMsg, "필수 정보입니다.");
    			return false;
    		}else{
    			hideMsg(oMsg);
    			return false;
    		}
    		//형식에 맞지 않는 번호입니다. 특수문자 사용할 때
    		//휴대폰 번호를 정확히 입력하세요. 앞 3자리 없는 번호를 입력했을 때
    		//
    	}
    	function checkHp1Validity(){
    		var _hp1 = $("#hp1").val();
    		var oMsg = $("#hpMsg");
    		console.log(_hp1);
    		if(_hp1 == ""){
    			showErrorMsg(oMsg, "필수 정보입니다.");
    			return false;
    		}else{
    			hideMsg(oMsg);
    			return false;
    		}
    	}
    	function checkGenderValidity(){
    		var _gender = $("#gender").val();
    		var oMsg = $("#genderMsg");
    		if(!_gender){
    			showErrorMsg(oMsg,"필수 정보입니다.");
    			oMsg.show();
    			return false;
    		}else{
    			oMsg.hide();
    		}
    	}
    	function checkBirthdayValidity(){
    		var _yy = $("#yy").val();
    		var _mm = $("#mm").val();
    		var _dd = $("#dd").val();
    		var oMsg = $("#birthdayMsg");
    		console.log("#birthdayMsg="+oMsg);
    		//윤년이고 2월이면서 1~28 또는 29일 모두 만족할 때 true
    		//현재 년도 2월의 첫날과 마지막 날을 받고 입력한 날이 존재하는지 체크
    		//true이면 hide()
    		//false이면 날을 정확하게 입력해주세요. 출력
	   		var leafYearFlag = false;//true, false 리턴
	   		if(_mm == '02'){
	   			leafYearFlag = leafYear(_yy,_mm,_dd);
	   			//true이면 숨김
	   			if(leafYearFlag){	   				
	   				oMsg.hide();
	   			}else{
	   				showErrorMsg(oMsg, "생년월일을 다시 확인해주세요.");
	   			}
	   		}
    		if(_yy == ""){
    			oMsg.text("태어난 년도 4자리를 정확하게 입력하세요.");
    			oMsg.show();
    			return false;
    		}
    		if(_mm == ""){
    			oMsg.text("태어난 월을 선택하세요.");
    			oMsg.show();
    			return false;
    		}
    		console.log(_dd);
    		if(!_dd){
    			oMsg.text("태어난 일을 입력해주세요.");
    			oMsg.show();
    			return false;
    		}
    		if(_yy&&_mm&&_dd){
    			oMsg.hide();
    		}
    		
    	};
    	/* 
    		1.select에서 2월 이어야 함
    		2.날짜에서 28일 또는 29일까지만 받아야 함
    		3.기원년도로부터 4년의 배수이고 100년단위의 배수가 아닌 || 400년 윤년
    	*/
    	function leafYear(_yy,_mm,_dd){
	   		if((_yy%4==0)&&(_yy%100!=0)||(_yy%400==0)){
	   			if(isDayCheck(_yy,_mm,_dd)){//입력날 일이 2월 사이에 존재하는지 판별
	   				return true;
	   			}else{	   				
	   				return false;	
	   			}
	   		}					
    	}
    	
    	function isDayCheck(_yy,_mm,_dd){
    		const firstDay = new Date(_yy,_mm).getDate();
    		const lastDay = new Date(_yy,_mm,0).getDate();
    		/* 1일부터 말일 사이 */
			if(1<=_dd&&29>=_dd){
				console.log("_dd="+_dd);
				return true;
			}else{
				return false;
			}
    	}    	
    	function checkName(){
    		var _name = $("#name").val();
    		var oMsg = $("#nameMsg");
    		var oInput = $("#name");
    		
    		if(_name == ""){
    			showErrorMsg(oMsg, "필수 정보입니다.");
    			return false;
    		}else{
    			hideMsg(oMsg);
    		}
    		/* 한글 또는 영어 대소문자만 입력 특수기호 공백불가*/
    		var isName = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣0-9]*$/;
    		if(!isName.test(_name)){
    			showErrorMsg(oMsg, "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
    		}
    	}
    	function checkId(event){
    		var _id = $("#id").val();
    		var oMsg = $("#idMsg");
    		var oInput = $("#id");
    		if(_id == ""){
    			showErrorMsg(oMsg,"필수 정보입니다.");
    			setFocusToInputObject(oInput);
    			return false;
    		}
    		var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
    		
    		if(!isID.test(_id)){
    			showErrorMsg(oMsg,"5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용가능합니다.");
    			return false;
    		}
    		
    		$.ajax({
    			type:"POST",
    			url: "${contextPath}/member/idCheck.do",
    			dataType:"text",
    			data:{id:_id},
    			success: function(data){
    				var result = data;

    				if(result == 'Y'){
    					if(event == 'first'){
    						showSuccessMsg(oMsg,"멋진 아이디네요!");
    					}else{
    						hideMsg(oMsg);
    					}
    				}else{
    					showErrorMsg(oMsg,"이미 사용중이거나 탈퇴한 아이디입니다.");
    				} 
    			}
    		});
    		return true;
    	}
    	function checkPw1(){
    		var pw = $("#pw").val();
    		var oMsg = $("#pw1Msg"); 
    		if(pw == ""){
    			showErrorMsg(oMsg,"필수 정보입니다.");
    			return false;
    		}
    		/* 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요. */
			//var isPw = /^[a-zA-Z\\d`~!@#$%^&*()-_=+]{8,24}$/;
			//var isPw = /^(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})$/
			let isPw = new RegExp('(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})');
			//aD4%%%%%%^%
			//let isPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})$/;
			//let isPw1 = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})$/;
			//let isPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})$/;

			// 검증
			console.log("pw="+pw);
			console.log(isPw.toString()); // true
			console.log(isPw.test("Abc1234!")); // true
    		//a1a2@Fa4a5
			console.log(isPw.test(pw));
    		if(!isPw.test(pw)){
    			showErrorMsg(oMsg, "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
    			return false;
    		}else{
    			oMsg.hide();
    		}
					
    	}
    	/* 비밀번호 체크 */
    	function checkPw2(){
    		var pw1 = $("#pw").val();
    		var pw2 = $("#pw_check").val();
    		var oMsg = $("#pw2Msg");
    		if(pw2 == ""){
    			showErrorMsg(oMsg,"필수 정보입니다.");
    			return false;
    		}
    		if(pw1 == pw2){
    			showSuccessMsg(oMsg, "비밀번호가 일치합니다.");
    		}else{
    			showErrorMsg(oMsg, "비밀번호가 일치하지 않습니다.");
    		}
    	}
    	/* 에러 메세지 보여주는 함수 */
    	function showErrorMsg(oMsg,msg){
    		oMsg.show();
    		oMsg.text(msg).css('color','red');
    	};
    	function showSuccessMsg(oMsg,msg){
    		oMsg.text(msg).css('color','green');
    	}
    	function hideMsg(oMsg){
    		oMsg.hide();
    	}
    	/* 포커스 다시 해당 위치로  */
    	function setFocusToInputObject(obj){
    		obj.focusin;
    	};
    	
    </script>
</html>