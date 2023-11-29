function duplicationcheck() {
    let userId = $('#id').val();
    $.ajax({
        url: "idduplcheck.jsp",
        type: "post",
        data: {
            "userId": userId
        },
        async: false,
        success: function (result) {
            if (!/^[a-zA-Z0-9]+$/.test(userId)) {
            	$("#checkIdResult").html("8~16자리의 영어 및 숫자만 가능합니다.");
                $("#checkIdResult").css('color', 'red');
                $("#id").css('background-color', '#FF6666');
                $("#forjoinajaxtext").val("1");
            } else if (result == 0 && userId.length >= 8 && userId.length <= 16) {
                if (!userId.match(/^[a-zA-Z0-9]+$/)) {
                	$("#checkIdResult").html("8~16자리의 영어 및 숫자만 가능합니다.");
                    $("#checkIdResult").css('color', 'red');
                    $("#id").css('background-color', '#FF6666');
                    $("#forjoinajaxtext").val("1");
                } else {
                    $("#checkIdResult").html("사용가능합니다.");
                    $("#checkIdResult").css('color', 'green');
                    $("#id").css('background-color', '#99FF99');
                    $("#forjoinajaxtext").val("0");
                }
            } else {
                if (userId.length < 8 || userId.length > 16) {
                    if (!userId.match(/^[a-zA-Z0-9]+$/)) {
                    	$("#checkIdResult").html("8~16자리의 영어 및 숫자만 가능합니다.");
                        $("#checkIdResult").css('color', 'red');
                        $("#id").css('background-color', '#FF6666');
                        $("#forjoinajaxtext").val("1");
                    } else {
                        $("#checkIdResult").html("8~16자리의 영어 및 숫자만 가능합니다.");
                        $("#checkIdResult").css('color', 'red');
                        $("#id").css('background-color', '#FF6666');
                        $("#forjoinajaxtext").val("1");
                        
                    }
                } else {
                    $("#checkIdResult").html("이미 사용중인 아이디입니다.");
                    $("#checkIdResult").css('color', 'red');
                    $("#id").css('background-color', '#FF6666');
                    $("#forjoinajaxtext").val("1");
                }
            }
        },
        error: function (error) {
            console.error("Request error", error);
        }
    });
}
function pwcheck() {
	var check_pw = document.getElementById("pw");
	var pass_pw = check_pw.value.length;
	if (pass_pw < 8) {
		alert("8~20자 사이의 비밀번호만 유효합니다.");
		join.pw.value = "";
		join.pw.focus();
	} else {
		pw2check();
	}
}
function pw2check() {
	var pw_check = document.getElementById("pw").value;
	var pw_check2 = document.getElementById("pw2").value;
	if (pw_check == (pw_check2)) {
		namecheck();
	} else {
		alert("비밀번호가 일치하지 않습니다.");
		join.pw.value = "";
		join.pw2.value = "";
		join.pw.focus();
	}
}
function namecheck() {
	var check_name = document.getElementById("name");
	var pass_name = check_name.value.length;
	if ((pass_name < 2) || (pass_name > 6)) {
		alert("이름을 정확히 입력해 주세요");
		join.name.value = "";
		join.name.focus();
	} else {
		cpcheck();
	}
}
function cpcheck() {
	var cp_check = document.getElementById("cp1").value;
	if (cp_check == "") {
		alert("연락처를 입력해 주세요");
		join.cp1.value = "";
		join.cp1.focus();
	} else {
		cp2check();
	}
}
function cp2check() {
	var cp2_check = document.getElementById("cp2").value;
	if (cp2_check == "") {
		alert("연락처를 입력해 주세요")
		join.cp2.value = "";
		join.cp2.focus();
	} else {
		postcodecheck();
	}
}
function postcodecheck() {
	var postcodecheck = document.getElementById("sample6_postcode").value;
	if (postcodecheck == "") {
		alert("우편번호를 입력해주세요")
	} else {
		addresscheck();
	}
}
function addresscheck() {
	var addresscheck = document.getElementById("sample6_address").value;
	if (addresscheck == "") {
		alert("주소를 입력해주세요");
	} else {
		detailaddresscheck();
	}
}
function detailaddresscheck() {
	var detailaddresscheck = document.getElementById("sample6_detailAddress").value;
	if (detailaddresscheck == "") {
		alert("상세주소를 입력해주세요");
	} else {
		ajaxcheck();
	}
}

function ajaxcheck() {
	var idc = document.getElementById("forjoinajaxtext").value;
	if (idc == "0") {
		document.forms['join'].submit();
	} else {
		alert("아이디 중복체크를 완료해주세요");
		return;
	}
}
	$(document).ready(
		function() {
			var now = new Date();
			var year = now.getFullYear();
			var mon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1)
					: '0' + (now.getMonth() + 1);
			var day = (now.getDate()) > 9 ? '' + (now.getDate()) : '0'
					+ (now.getDate());         
			for (var i = 1900; i <= year; i++) {
				$('#year').append(
						'<option value="' + i + '">' + i + '</option>');
			}
         
			for (var i = 1; i <= 12; i++) {
				var mm = i > 9 ? i : "0" + i;
				$('#month').append(
						'<option value="' + mm + '">' + mm + '</option>');
			}

			for (var i = 1; i <= 31; i++) {
				var dd = i > 9 ? i : "0" + i;
				$('#day').append(
						'<option value="' + dd + '">' + dd + '</option>');
			}
			$("#year  > option[value=" + year + "]").attr("selected", "true");
			$("#month  > option[value=" + mon + "]").attr("selected", "true");
			$("#day  > option[value=" + day + "]").attr("selected", "true");

		})
function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
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
						document.getElementById("sample6_extraAddress").value = extraAddr;

					} else {
						document.getElementById("sample6_extraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_detailAddress").focus();
				}
			}).open();
}