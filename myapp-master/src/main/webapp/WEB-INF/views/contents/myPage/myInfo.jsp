<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
    h2{
    text-align: center;
}

/*모달 팝업 영역 스타일링*/
.modal{
/*팝업 배경*/
    position: absolute;
    top:0;
    left: 0;
    width: 100%;
    height: 100vh;
    overflow: hidden;
    background: rgba(0,0,0,0.5);
}
.modal .modal_popup {
/*팝업*/
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20px;
    background: #ffffff;
    border-radius: 20px;
}
.modal .modal_popup .close_btn {
    display: block;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    color: #fff;
    cursor: pointer;
    transition: box-shadow 0.2s;
}

#previewImg{
    max-width: 1000px;
    max-height: 500px;
}

#files{
    display: none;
}



</style>

<div class="main-content">
    <div class="container-fluid">
        <div class="row">
            <!-- 개인 정보 -->
            <div class="col-md-8">
                <div class="card">
                    <div class="header">
                        <h4 class="title">내 정보</h4>
                    </div>
                    <div class="content">
                        <form class="myInfoForm">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>이름</label>
                                        <input type="text" class="form-control" name="empName" placeholder="이름" value="${emp.empName}" readonly>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>사번</label>
                                        <input type="text" class="form-control" name="empCode"placeholder="사번" value="${emp.empCode}" readonly>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>직급</label>
                                        <input type="text" class="form-control" name="positionName" placeholder="직급" value="${emp.position.positionName}" readonly>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>부서</label>
                                        <input type="text" class="form-control" name="deptName" placeholder="부서" value="${emp.dept.deptName}" readonly>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>입사일자</label>
                                        <input type="text" class="form-control" name="joinDate" placeholder="입사일자" value="${emp.joinDate}" readonly>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>생년월일</label>
                                        <input type="text" class="form-control" name="birthdayDate" placeholder="생년월일" value="${emp.birthdayDate}" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>전화번호</label>
                                        <input type="text" class="form-control" name="phone" placeholder="전화번호" value="${emp.phone}">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>휴대전화</label>
                                        <input type="text" class="form-control" name="mobile" placeholder="휴대전화" value="${emp.mobile}">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>이메일</label>
                                        <input type="text" class="form-control" name="email" placeholder="이메일" value="${emp.email}">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>우편번호</label>
                                        <input type="text" class="form-control" name="zipCode" placeholder="우편번호" value="${emp.zipCode}">
                                    </div>
                                    <div class="form-group">
                                        <label>주소</label>
                                        <input type="text" class="form-control" name="address" placeholder="주소" value="${emp.address}">
                                    </div>
                                    <div class="form-group">
                                        <label>상세주소</label>
                                        <input type="text" class="form-control" name="detailAddress" placeholder="상세주소" value="${emp.detailAddress}">
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-info btn-fill pull-right" id="btn_modify">수정</button>
                            <div class="clearfix"></div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- 프로필 변경 -->
            <div class="col-md-4">
                <div class="card card-user">
                    <div class="image">
                        <img src="${contextPath}/resources/img/full-screen-image-3.jpg" alt="..."/>
                    </div>
                    <div class="content">
                        
                        <div class="author">
                            <form>
                                <c:choose>
                                    <c:when test="${emp.profileFileName == null}">
                                        <img class="avatar border-gray" src="${contextPath}/resources/img/new_logo.png" alt="기본 프로필" loading="lazy" onclick="onClickUpload();"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img class="avatar border-gray" src="${contextPath}${sessionScope.emp.profileFileName}"  alt="프로필 이미지" loading="lazy" onclick="onClickUpload();"/>
                                    </c:otherwise>
                                </c:choose> 
                                <input type="hidden" name="empCode" id="hiddenEmpCode" value="${sessionScope.emp.empCode}">
                                <input type="file" id="files" class="upload-hidden" name="profileFileName" onchange="onFileUpload();">
                            </form>
                                <h4 class="title">${emp.empName}<br/>
                                    <small>${emp.position.positionName}</small>
                                </h4>
                        </div>
                    </div>
                    <hr>
                    <div class="text-center">
                        <br>
                        <input type="button" class="btn btn-info btn-fill" id="password_modal_open" value="비밀번호 변경"/><br/>&nbsp;
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!--모달창-->
<!--패스워드 모달-->
<div class="modal" id="password_modal">
    <div class="modal_popup">
        <h3>패스워드 변경</h3>
            <br>
            <form action="${contextPath}/myPage/modifyPassword.page"
                  method="post"
                  id="frm-changepw">

                <div class="password">
                    <label for="pw">비밀번호</label>
                    <div id="msg-pw" class="signup-alert"></div>
                    <input type="password" class="form-control" name="password" id="pw" placeholder="8~15자 영문,숫자,특수문자 중 2개이상" style="width: 500px;" autocomplete="off"> 
                </div>
                <br>
                <div class="passwordRe">
                    <label for="pw2">비밀번호 확인</label>
                    <div id="msg-pw2" class="signup-alert"></div>
                    <input type="password" class="form-control" name="password2" id="pw2" placeholder="8~15자 영문,숫자,특수문자 중 2개이상" style="width: 500px;" autocomplete="off">
                </div>
                <br>
                <input type="hidden" name="empCode" value="${emp.empCode}">
                <button type="submit" class="btn btn-info btn-fill" id="password_modify">변경하기</button>
                <br>

            </form>
        <button type="button" class="btn btn-info btn-fill" id="password_modal_close">닫기</button>
    </div>

</div>


<!-- script -->

<script>

/* 개인 정보 수정 */

const fnModifyInfo = () => {
    $(document).on('click', '#btn_modify', (evt) => {
        $.ajax({
            type: 'POST',
            url: '${contextPath}/myPage/modifyInfo.page',
            data: $(evt.target).closest('.myInfoForm').serialize(), // form 데이터를 직렬화
            dataType: 'json',
            success: (resData) => {
                if (resData.modifyInfoCount === 1) {
                    alert('개인 정보가 수정되었습니다.');
                } else {
                    alert('개인 정보 수정이 실패했습니다.');   
                }
            },
            error: (jqXHR) => {
                alert(jqXHR.statusText + '(' + jqXHR.status + ')');
            }
        });
    });
};

fnModifyInfo();

/* 프로필 사진 변경 */

$(document).ready(function(){
        $('.filebox .upload-hidden').on('change', function(){  			
            if(window.FileReader){
                var filename = $(this)[0].files[0].name;
                if(!validFileType(filename)){
                    alert("허용하지 않는 확장자 파일입니다.");
                    return false;
                }else{
                    if(!validFileSize($(this)[0].files[0])){
                        alert("파일 사이즈가 10MB를 초과합니다.");
                        return false;
                    }else{
                        if(!validFileNameSize(filename)){
                            alert("파일명이 30자를 초과합니다.");
                            return false;
                        }
                    }
                }
            } else {
                var filename = $(this).val().split('/').pop().split('\\').pop();
            }
            $(this).prev().val(filename);

            readImage($(this)[0]); 
        });
    });

    function validFileType(filename) {
        const fileTypes = ["png", "jpg", "jpeg"];
		return fileTypes.indexOf(filename.substring(filename.lastIndexOf(".")+1, filename.length).toLowerCase()) >= 0;
	}
	
    function validFileSize(file){
        if(file.size > 10000000){ 
            return false;
        }else{
            return true;
        }
    }

    function validFileNameSize(filename){
        if(filename.length > 30){ 
            return false;
        }else{
            return true;
        }
    }

    function readImage(input) {
	    if(input.files && input.files[0]) {
	        const reader = new FileReader();
	        reader.onload = function(e){
	            const previewImage = document.getElementById("previewImg");
	            previewImage.src = e.target.result;
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}  

    const onClickUpload = () => {
  $('#files').click();
}

const onFileUpload = () => {
  var formData = new FormData();
  formData.append('profileFileName', $('#files')[0].files[0]);
  formData.append('empCode', $('#hiddenEmpCode').val());

  $.ajax({
      enctype: 'multipart/form-data',
      processData: false,
      contentType: false,
      type: 'POST',
      url: '${contextPath}/myPage/modifyProfile.page',
      data: formData,
      dataType: 'json',
      success: (resData) => {
          if(resData.ModifyProfileCount === true) {
              alert('프로필 사진이 변경되었습니다.');
              location.href = '${contextPath}/myPage/myInfo.page?empCode=';
          }
          else if(resData.ModifyProfileCount === false) {
             alert('프로필 사진 변경에 실패했습니다.')
          }
      },
      error: (jqXHR) => {
          alert(jqXHR.statusText + '(' + jqXHR.status + ')');
      }
  });
}

/* 비밀번호 변경 */

    /* 비밀번호 검증 */
let passwordCheck = false;
let passwordConfirm = false;

    const fnCheckPassword = () => {
            // 비밀번호 8~15자, 영문/숫자/특수문자 중 2개 이상 포함
            let inpPw = document.getElementById('pw');

            let passwordResult = checkPassword(inpPw.value);

            let msgPw = document.getElementById('msg-pw');
            passwordCheck = passwordResult.result;
            msgPw.innerHTML = passwordResult.msg;
        }
    
    const checkPassword = (passwordValue) => {
    // 비밀번호 8~15자, 영문/숫자/특수문자 중 2개 이상 포함
    let validCount = /[A-Za-z]/.test(passwordValue)     // 영문 포함되어 있으면 true (JavaScript 에서 true 는 숫자 1 같다.)
                   + /[0-9]/.test(passwordValue)        // 숫자 포함되어 있으면 true
                   + /[^A-Za-z0-9]/.test(passwordValue) // 영문/숫자가 아니면 true

    let passwordLength = passwordValue.length;
    let passwordCheck = passwordLength >= 8
                      && passwordLength <= 15
                      && validCount >= 2;

    if(passwordCheck) return { result : true, msg : '사용 가능한 비밀번호입니다.'};
    else return { result : false, msg : '비밀번호 8~15자, 영문/숫자/특수문자 중 2개 이상 포함' };
  }

    /* 비밀번호 확인 동일 여부 */   
    const fnConfirmPassword = () => {
            let inpPw = document.getElementById('pw');
            let inpPw2 = document.getElementById('pw2');

            let confirm = confirmPassword(inpPw.value, inpPw2.value);
            passwordConfirm = confirm.result;

            let msgPw = document.getElementById('msg-pw2');
            msgPw.innerHTML = confirm.msg;
    }

    const confirmPassword = (value1, value2) => {
    let passwordConfirm = (value1 !== '')
                         && (value1 === value2);

    if(passwordConfirm) return { result : true, msg : '' };
    else return { result : false, msg : '비밀번호 입력을 확인하세요.' };
}





fnCheckPassword();
fnConfirmPassword();

/* 모달창 */

const modal = document.querySelector('#password_modal');
const modalOpen = document.querySelector('#password_modal_open');
const modalClose = document.querySelector('#password_modal_close');

/* 패스워드 */
modalOpen.addEventListener('click',function(){
    modal.style.display = 'block';
});
modalClose.addEventListener('click',function(){
    modal.style.display = 'none';
});




</script>