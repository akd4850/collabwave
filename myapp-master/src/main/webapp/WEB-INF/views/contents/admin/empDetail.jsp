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
                        <label>이름</label>
                        <input type="text" class="form-control" placeholder="이름" value="${emp.empName}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>사번</label>
                        <input type="text" class="form-control" placeholder="사번" value="${emp.empCode}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>부서</label>
                        <input type="text" class="form-control" placeholder="부서" value="${emp.dept.deptName}">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>휴대전화</label>
                        <input type="text" class="form-control" placeholder="휴대전화" value="${emp.mobile}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>이메일</label>
                        <input type="text" class="form-control" placeholder="이메일" value="${emp.email}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>생년월일</label>
                        <input type="text" class="form-control" placeholder="생년월일" value="${emp.birthdayDate}">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>우편번호</label>
                        <input type="text" class="form-control" placeholder="우편번호" value="${emp.zipCode}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>주소</label>
                        <input type="text" class="form-control" placeholder="주소" value="${emp.address}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>상세주소</label>
                        <input type="text" class="form-control" placeholder="상세주소" value="${emp.detailAddress}">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>직급</label>
                        <input type="text" class="form-control" placeholder="직급" value="${emp.position.positionName}">
                    </div>
                </div>
            </div>
            
            <div>
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

    const fnModifyEmpInfo = (evt) => {
        doucment.getElementById('frm-emp-modify').addEventListener('submit', (evt) => {
        
        })
    }
        

    fnDeleteEmployee();
    fnModifyEmpInfo();



</script>