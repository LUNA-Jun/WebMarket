//상품
function CheckAddProduct(){
	
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var price = document.getElementById("price");
	var stock = document.getElementById("stock");
	
	//상품아이디 체크
	if(!check(/^P[0-9]{4,11}$/, productId, "[상품 코드]\nP와 숫자를 조합하여 5에서 12자까지 입력하세요.\n" + 
		"첫 글자는 P로 시작해주세요.")){
			return false;
		}
	
	//상품명 길이 체크
	if(name.value.length < 2){
		alert("[상품명]\n최소 2자 이상 입력해주세요.")
		name.select();
		name.focus();
		return false;
	}
	
	//상품 가격 체크
	if(price.value.length == 0 || isNaN(price.value)){
		alert("[가격]\n가격을 입력해주세요.");
		price.select();
		price.focus();
		return false;
	}
	
	if(price.value < 0){
		alert("[가격]\n0보다 작게 입력할 수 없습니다.");
		price.select();
		price.focus();
		return false;
	}
	
	//재고 수량 체크
	if(price.value.length == 0 ||isNaN(stock.value)){
		alert("[재고 수량]\n재고 수량을 입력해주세요.");
		stock.select();
		stock.focus();
		return false;
	}
	
	if(stock.value < 0){
		alert("[재고 수량]\n0보다 작게 입력할 수 없습니다.");
		stock.select();
		stock.focus();
		return false;
	}
	
	//정규표현식, 유효성검사, 메시지 / 검증
	function check(regExp, e, msg){
		if(regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.newProduct.submit();
}

//회원가입
//회원가입 필수 입력
function m_checkForm(){
	if(!document.newMember.id.value){
		alert("아이디를 입력하세요");
		return false;
	}
	if(!document.newMember.IdDuplication.value != "IdCheck"){
		alert("아이디 중복체크를 해주세요");
		return false;
	}
	if(!document.newMember.password.value){
		alert("비밀번호를 입력하세요");
		return false;
	}
	if(!document.newMember.passowrd_confirm.value){
		alert("비밀번호 확인을 입력하세요");
		return false;
	}
	if(!document.newMember.name.value){
		alert("이름을 입력하세요");
		return false;
	}
	if(!document.newMember.email.value){
		alert("E-mail를 입력하세요");
		return false;
	}
	if(!document.newMember.phone.value){
		alert("전화번호를 입력하세요");
		return false;
	}
	if(!document.newMember.address.value){
		alert("주소를 입력하세요");
		return false;
	}					
}

//비밀번호 체크
function Check_pw() {
	var pw = document.getElementById('password').value;

	if (pw.length < 6 || pw.length > 16) {
		window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용가능합니다.');
		document.getElementById('password').value = '';
	}
	if (document.getElementById('password').value != ''
			&& document.getElementById('passowrd_confirm').value != '') {
		if (document.getElementById('password').value == document
				.getElementById('passowrd_confirm').value) {
			document.getElementById('check').innerHTML = '비밀번호가 일치합니다.';
			document.getElementById('check').style.color = 'blue';
		} else {
			document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
			document.getElementById('check').style.color = 'red';
		}
	}
}

//생년월일 자동 하이푼
function inputBirthday(obj) {
	
    var number = obj.value.replace(/[^0-9]/g, "");
    var day = "";

    if(number.length < 6) {
        return number;
    } else if(number.length < 9) {
        day += number.substr(0, 4);
        day += "-";
        day += number.substr(4, 2);
        day += "-";
        day += number.substr(6);
    }
    obj.value = day;
}

//전화번호 자동하이푼
function inputTel(obj) {
	
    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}

//아이디 중복 체크 화면이동
function Check_id(){
	window.name = "parentForm"
	window.open("./members/idCheck.jsp?openInit=true", "checkForm", "width=500, height=300, resizable=no, scrollbars=no");
}

// 다음 API 주소
function addr_api() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을
						// 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("addr_api_extraAddress").value = extraAddr;

					} else {
						document.getElementById("addr_api_extraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('addr_api_postcode').value = data.zonecode;
					document.getElementById("addr_api_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("addr_api_detailAddress").focus();
				}
			}).open();

}

//회원 탈퇴
function delete_member(){
	var result = confirm("정말 회원 탈퇴를 하시겠습니까?");
	if(result){
		location.href="./members/deleteMember.jsp";
		alert("탈퇴되었습니다.");
	}else{
		alert("취소되었습니다.");
		return;	
	}
}

//게시판
function w_checkForm(){
	if(!document.newWrite.subject.value){
		alert("제목을 입력하세요");
		return false;
	}
	if(!document.newWrite.content.value){
		alert("내용을 입력하세요");
		return false;
	}	
}
