<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-Enter">
<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-exit">

<title>Se So Neon</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>




<link href ="../css/index.css" rel ="stylesheet">
<link href ="../css/Join.css" rel ="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">








<script type="text/javascript">
	
	
	// 회원가입폼의 유효성 검사 및 모든 문항을 입력하였는지 검사
	function check_form() {
		
		
		var id = $("#id");
		var passwd = $("#passwd");
		var passwdck = $("#passwdck");
		var name = $("#name");
		var address = $("#sample4_postcode");
		var email = $("#email");
		var phone = $("#phone");
		
		
		var reg_id = /^[a-z0-9]{4,16}$/;
		var reg_pw = /^(?=.*[a-zA-Z0-9])(?=.*[a-zA-Z!@#$%^&*])(?=.*[0-9!@#$%^&*]).{8,16}$/;
		var reg_name = /^[가-힣]{2,5}$/;
		var reg_phone = /^[0-9]{2,11}$/;
		var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

		
		// 필수정보를 기입하였는지 확인, 기입하지 않았으면 다음 페이지로 넘어가지 않음
		
		if(id.val() == ""){
			alert("아이디를 입력하세요.");
			id.focus();
			return false;
		}
		
		else if(passwd.val() == ""){
			alert("비밀번호를 입력하세요.");
			passwd.focus();
			return false;
		}	
		
		else if(passwdck.val() == ""){
			alert("비밀번호 체크를 입력하세요.");
			passwdck.focus();
			return false;
		}
		
		// 비밀번호와 비밀번호 체크의 값이 다를 경우
		else if(passwd.val() != passwdck.val()){
			alert("비밀번호와 비밀번호 체크가 다릅니다.");
			passwdck.focus();
			return false;
			
		}
		
		else if(name.val() == ""){
			alert("이름을 입력하세요.");
			name.focus();
			return false;
		}
		
		else if(address.val() == ""){
			alert("주소를 입력하세요.");
			address.focus();
			return false;
		}
		
		else if(phone.val() == ""){
			alert("휴대폰 번호를 입력하세요.");
			phone.focus();
			return false;
		}
		
		else if(email.val() == ""){
			alert("이메일을 입력하세요.");
			email.focus();
			return false;
		}
		

		
		
		// 정규식 검사
		if (!reg_id.test($("#id").val())) {
			  alert("아이디는 영문 소문자/숫자 4~16자리로 입력해주세요.");
			  id.focus();
			  return false;
		}
		
		else if (!reg_pw.test($("#passwd").val())) {
			  alert("비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자로 입력해주세요.");
			  passwd.focus();
			  return false;
		}
		
		else if (!reg_name.test($("#name").val())) {
			  alert("이름은 2~5글자의 한글만 적어주세요.");
			  name.focus();
			  return false;
		}
		
		else if (!reg_phone.test($("#phone").val())) {
			  alert("휴대폰 번호에는 숫자만 적어주세요.");
			  phone.focus();
			  return false;
		}
		
		else if (!reg_email.test($("#email").val())) {
			  alert("이메일은 영어와 숫자만 가능하고 @과 .이 포함되어야 합니다.");
			  email.focus();
			  return false;
		}
		
	} // check_form 끝
	
	
	
	
	
	// 아이디 중복확인
	function Check_ID() {

		
		var input_id = $("#id").val();
		
		
		
		if( input_id == ""){
			
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return false;
		}

		
		
		$.ajax({
			
			
			type: "post",
			async: false,
			url: "./ID_Check.jsp",
			data: {id: input_id},
			dataType: "text",
			
			
			success: function(data, textStatus){

				var reg_id = /^[a-z0-9]{4,16}$/;

                if(data == 0 && reg_id.test($("#id").val())){
                	alert("사용할 수 있는 아이디입니다.");

                	// 사용할 수 있는 아이디면 id를 수정하지 못하게 함
                	$("#id").attr("readonly", "readonly");
         			
                }
                else if(!reg_id.test($("#id").val())){
                	
      			  alert("아이디는 영문 소문자/숫자 4~16자리로 입력해주세요.");
				  return false;
              	
                }
                
                else{
                	alert("사용할 수 없는 아이디입니다.");
                	return false;
                }
                
				
			}, // success 끝
			
			error: function(data, textStatus) {
				alert("에러!");
				console.log(data);

			}
			
			
		});
		
		
	}
		
	
	
	
</script>







</head>
<body>

<!-- 헤더 부분 -->
<jsp:include page="../Inc/top.jsp"></jsp:include>




<!-- 메인 부분 -->
<article id = "main" style="height: 1200px;">

	<div class = "title">
		<h2>JOIN</h2>
		<div class = "plz">Please enter * !</div>
	</div>
	
	
	<!-- 회원가입폼 -->
	<form action = "JoinPro.jsp" method = "post" class = "JoinForm" onsubmit="return check_form();">
		
		
		<div class = "JoinFormWrap">
			
			<table>
				
				<tr>
					<th class = "th1">* ID</th>
					<td class = "td1">
						<input type = "text" name = "id" class ="id" id = "id">
						<input type = "button" name = "checkID" class = "checkID" value ="ID CHECK!" onclick="Check_ID()">
						<p>* 영문 소문자/숫자, 4~16자</p>
					</td>
				</tr>
				
				<tr>
					<th>* PASSWORD</th>
					<td>
						<input type = "password" name = "passwd" class ="passwd" id = "passwd">
						<p>* 영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자</p>
					</td>
				</tr>	
						
				<tr>
					<th class = "pwdCheck">* PASSWORD CHECK</th>
					<td>
						<input type = "password" name = "passwdck" class ="passwdck" id = "passwdck">
					</td>
				</tr>
				
				<tr>
					<th>* NAME</th>
					<td>
						<input type = "text" name = "name" class ="name" id = "name">
					</td>
				</tr>
				
				<tr>
					<th>* ADDRESS</th>
					<td>
<!-- 					<input type = "text" name = "address" class ="address"> -->
						<input type="text" name = "address1" id = "sample4_postcode" placeholder="우편번호">
						<input type="button"  id = "sample4_button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name = "address2" id="sample4_roadAddress" placeholder="도로명주소" id = "address1">
						<input type="text"  name = "address3" id="sample4_jibunAddress" placeholder="지번주소"><br>
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text"  name = "address4"  id="sample4_detailAddress"  placeholder="상세주소">
						<input type="text"  name = "address5" id="sample4_extraAddress" placeholder="참고항목">
					</td>
				</tr>
				
				<tr>
					<th>* PHONE</th>
					<td>
						<input type = "text" name = "phone" class ="phone" id = "phone">
						<p>* 특수문자 제외 숫자</p>
					</td>
				</tr>
				
				<tr>
					<th>* EMAIL</th>
					<td>
						<input type = "text" name = "email" class ="email" id = "email">
						<p>* 이메일에는 @과 . 이 포함</p>
						
					</td>
				</tr>
			
			</table>
			<br> <br>
			
			<div class = "addInfo">
				
				<h3>추가 정보</h3>
				
				<table>
					<tr>
						<th>BIRTHDAY</th>
						<td>
							<input type = "text" name = "birth_year" id = "birth_year" class = "birth_year" size = 4 maxlength="4" > 년
							<input type = "text" name = "birth_month" id = "birth_month"class = "birth_month" size = 1 maxlength="2"> 월
							<input type = "text" name = "birth_day" id = "birth_day" class = "birth_day" size = 1 maxlength="2"> 일
							<span class = "Birthcal">
								<input type = "radio" id = "solar" name = "birth_radio" class = "birth_radio" checked="checked" value="양력"> 양력
								<input type = "radio" id = "luna" name = "birth_radio" class = "birth_radio"  value="음력"> 음력
					 		</span>
						</td>
					</tr>
					
					<tr>
						<th>가입 경로</th>
						<td>
							<label for = "sub1"><input type = "radio" name = "sub1" value = "검색">  검색  </label>
							<label for = "sub1"><input type = "radio" name = "sub1" value = "SNS"> SNS   </label>
							<label for = "sub1"><input type = "radio" name = "sub1" value = "꿈에나옴"> 꿈에 나옴  </label>
						</td>
					</tr>
					
				</table>
				
				<br><br>
				
				<div class = "clearButton">
						<input type="submit" name="submit" id="submit" class="submit"
							value="SUBMIT?" width="1000px;"
							onmouseover="this.value='SUBMIT!'"
							onmouseout="this.value='SUBMIT?'">
							<!-- 버튼 위에 마우스를 올리면 value 속성이 변하도록 설정 -->
					</div>
			
			</div>
	
	
		</div>
	</form>
	
			


	
</article>



<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>








<!-- 우편번호 넣기 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>






</body>
</html>