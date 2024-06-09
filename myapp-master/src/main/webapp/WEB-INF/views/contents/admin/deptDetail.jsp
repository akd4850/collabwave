<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        <h4 class="title">부서 수정</h4>
    </div>
    <div class="content">
        <form>
            <div class="row">
                <button type="button" id="info" class="btn btn-info btn-fill">부서정보</button>
                <button type="button" id="member" class="btn btn-info btn-fill">부서원 목록</button>
            </div>
            
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>부서명</label>
                        <input type="text" class="form-control" placeholder="부서명" value="${dept.deptName}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>부서코드</label>
                        <input type="text" class="form-control" placeholder="부서코드" value="${dept.deptCode}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>부서레벨</label>
                        <input type="text" class="form-control" placeholder="부서레벨" value="${dept.deptLevel}">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>상위부서</label>
                        <input type="text" class="form-control" placeholder="상위부서" value="${dept.deptUpstairCode}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>부서위치</label>
                        <input type="text" class="form-control" placeholder="부서위치" value="${dept.deptLocation}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>생성일</label>
                        <input type="text" class="form-control" placeholder="생성일" value="${dept.deptCreatedate}">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>부서장 사원코드</label>
                        <input type="text" class="form-control" placeholder="부서장 사원코드" value="${dept.deptLeaderEmpCode}">
                    </div>
                </div>
            </div>

            <button type="submit" id="update" class="btn btn-info btn-fill">수정</button>
            <button type="button" id="cancel" class="btn btn-danger btn-fill">취소</button>
            <div class="clearfix"></div>
        </form>
    </div>
</div>

<script>
    document.getElementById('cancel').onclick = function() { 
        history.back();
    }
    document.getElementById('member').onclick = function() { 
        fnGetDeptMember();
    }

    const fnGetDeptMember = () => {
        $.ajax({
            //요청
            type: 'GET',
            url: '${contextPath}/admin/dept/getDeptMember.do',
            data: deptCode,
            //응답
            dataType: 'json',
            success: (resData) => {
                memberList = resData.memberList;
                $.each(resData.memberList, (i, member) => {
                    let str = '<div class="member" data-emp-code="';
                    str += '<span>' + member.empName + '</span>';
                    str += '</div>';
                    $('#')
                })
            },
            error: (jqXHR) => {
                alert(jqXHR.statusText + '(' + jqXHR.status + ')');
            }
        });
    }


</script>