<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<div class="card">
    <div class="header">
        <h4 class="title">직원 수정</h4>
    </div>

    <form id = "frm-emp-modify"
          method = "POST"
          action = "${contextPath}/admin/emp/modify.do">

    <div class="content">
        <form>
            <div class="row">
                <div class="col-md-12">
                    <img class="avatar border-gray" src="${contextPath}/resources/img/avatar.jpg" style="width:100px;height:100px;" alt="..."/>
                    <div class="form-group">
                        <label>사진 변경</label>
                        <input type="file" name="" id="">
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>사번</label>
                        <input type="text" class="form-control" name="modifyEmpCode" placeholder="사번" value="${emp.empCode}" readonly>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>이름</label>
                        <input type="text" class="form-control" name="modifyEmpName" placeholder="이름" value="${emp.empName}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>직급</label>
                        <input type="text" class="form-control" name="modifyPositionName" placeholder="직급" value="${emp.position.positionName}">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>부서</label>
                        <input type="text" class="form-control" name="modifyDeptName" placeholder="부서" value="${emp.dept.deptName}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>입사일자</label>
                        <input type="date" class="form-control" name="modifyJoinDate" placeholder="입사일자" value="${emp.joinDate}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>생년월일</label>
                        <input type="date" class="form-control" name="modifyBirthdayDate" placeholder="생년월일" value="${emp.birthdayDate}">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>내선번호</label>
                        <input type="text" class="form-control" name="modifyPhone" placeholder="내선번호" value="${emp.phone}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>휴대전화</label>
                        <input type="text" class="form-control" name="modifyMobile" placeholder="휴대전화" value="${emp.mobile}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>이메일</label>
                        <input type="email" class="form-control" name="modifyEmail" placeholder="이메일" value="${emp.email}">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>우편번호</label>
                        <input type="number" class="form-control" name="modifyZipCode" placeholder="우편번호" value="${emp.zipCode}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>주소</label>
                        <input type="text" class="form-control" modify="modifyAddress" placeholder="주소" value="${emp.address}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>상세주소</label>
                        <input type="text" class="form-control" modify="modifyDetailAddress" placeholder="상세주소" value="${emp.detailAddress}">
                    </div>
                </div>
            </div>

            <input type="hidden" name="modifyPositionCode" value="${emp.position.positionCode}">

            <div style="text-align: right">
            <button type="submit" id="btn-modify" class="btn btn-info btn-fill">수정</button>
            <button type="button" id="btn-remove" class="btn btn-info btn-fill">삭제</button>
            <button type="button" id="btn-cancel" class="btn btn-danger btn-fill">취소</button>
            </div>
            <div class="clearfix"></div>
        </div>
    </form>
</div>

<script>
    document.getElementById('btn-cancel').onclick=function(){
        history.back();
    }

    const fnDeleteEmployee = () => {
        $('#btn-remove').on('click', (evt) => {
            if(confirm('${emp.empName}님을 삭제(퇴사처리)하시겠습니까?')){
                $.ajax({
                    
                    //요청
                    type: 'POST',
                    url: '${contextPath}/admin/emp/delete.do',
                    data: {empCode: '${emp.empCode}'},

                    //응답
                    success: (resData) => {
                        alert('${emp.empName}님이 퇴사처리되었습니다.');
                        location.href='${contextPath}/admin/emp/management.page';
                    },
                    error: (jqXHR) => {
                        alert(jqXHR.statusText + '(' + jqXHR.status + ')');
                    }
                })
            }
        })
    }

    fnDeleteEmployee();

</script>