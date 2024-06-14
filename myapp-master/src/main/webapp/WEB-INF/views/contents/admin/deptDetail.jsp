<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<div class="card">
    <div class="header">
        <h4 class="title">부서 수정</h4>
    </div>

    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#info">부서정보</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#member">부서원</a>
        </li>
    </ul>

    <div class="tab-content">

        <div class="container tab-pane active" id="info">
            <form>
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
            </div>

        <div class="container tab-pane fade" id="member">
            
            <form method= "POST"
                  action="${contextPath}/admin/dept/apppointLeader.do">


            <button type="submit" id="btn-dept-leader" class="btn btn-outline-primary">부서장 위임</button>
            <button type="button" id="btn-transfer" class="btn btn-outline-primary">부서이동</button>

            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>이름</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${memberList}" var="member" varStatus="vs">
                        <tr>
                            <th>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="flexRadio">
                                    <label class="form-check-label" for="flexCheck">
                                        ${member.empName}
                                    </label>
                                  </div>
                            </th>
                        </tr> 
                    </c:forEach>
                </tbody>
            </table>
        </form>
        </div>
        </div>
        <button type="submit" id="btn-update" class="btn btn-info btn-fill">수정</button>
        <button type="button" id="btn-cancel" class="btn btn-danger btn-fill">취소</button>
        <div class="clearfix"></div>
    </form>

</div>

<script>
    document.getElementById('btn-cancel').onclick = function() { 
        history.back();
    }

    const fnAppointDeptLeader = () => {
        $('#btn-dept-leader').on('click', (evt) => {
            $.ajax({
                //요청
                type: 'POST',
                url: '${contextPath}/admin/dept/apppointLeader.do',
                data: {deptCode: '${dept.deptCode}',
                        empCode: '${emp.empCode}'},

                //응답
                success: (resData) => {
                    alert('${emp.empName}님이 ${dept.deptName} 부서장으로 임명되었습니다.');
                },
                error: (jqXHR) => {
                    alert(jqXHR.statusText + '(' + jqXHR.status + ')');
                }
            })
        })
    }


</script>