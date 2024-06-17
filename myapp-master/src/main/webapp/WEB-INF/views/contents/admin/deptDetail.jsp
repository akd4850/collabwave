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

        <!-- 탭1(부서정보) -->
        <div class="container tab-pane active" id="info">
            <form id="frm-deptInfo-modify"
                  method="POST"
                  action="${contextPath}/admin/dept/modify.do">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>부서명</label>
                            <input type="text" class="form-control" placeholder="부서명" id="deptName" name="deptName" value="${dept.deptName}">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                          <label>부서코드</label>
                          <input type="text" class="form-control" placeholder="부서코드" id="deptCode" name="deptCode" value="${dept.deptCode}" readonly>
                    </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>부서레벨</label>
                            <input type="text" class="form-control" placeholder="부서레벨" id="deptLevel" name="deptLevel" value="${dept.deptLevel}">
                        </div>
                    </div>
                </div>
        
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>상위부서</label>
                            <input type="text" class="form-control" placeholder="상위부서" name="deptUpstairCode" value="${dept.deptUpstairCode}">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>부서위치</label>
                            <input type="text" class="form-control" placeholder="부서위치" name="deptLocation" value="${dept.deptLocation}">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>생성일</label>
                            <input type="text" class="form-control" placeholder="생성일" name="deptCreatedate" value="${dept.deptCreatedate}" readonly>
                        </div>
                    </div>
                </div>
        
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>부서장 사원코드</label>
                            <input type="text" class="form-control" placeholder="부서장 사원코드" name="deptLeaderEmpCode" value="${dept.deptLeaderEmpCode}" readonly>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>사용여부</label>
                            <input type="text" class="form-control" placeholder="사용여부" name="useYn" value="${dept.useYn}">
                        </div>
                    </div>
                </div>
                <div style="text-align:right">
                <button type="submit" id="btn-update" class="btn btn-info btn-fill">수정</button>
                <button type="button" id="btn-cancel" class="btn btn-danger btn-fill">취소</button>
                </div>
            </form>
        </div>

        <!-- 탭2(부서원)-->
        <div class="container tab-pane fade" id="member">
            
            <form method= "POST">

                <button type="submit"
                        id="btn-dept-leader"
                        class="btn btn-outline-primary"
                        formaction="${contextPath}/admin/dept/appointLeader.do">부서장 위임</button>
                <button type="button"
                        id="btn-dept-transfer"
                        class="btn btn-outline-primary"
                        data-toggle="modal"
                        data-target="#myModal"
                        onclick="setModalValue();">부서이동</button>

                <input type="hidden" name="deptCode" value="${dept.deptCode}">

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
                                        <input class="form-check-input" type="radio" name="modifyEmpCode" value="${member.empCode}">
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
    <div class="clearfix"></div>
</div>


<!-- 모달(부서이동) -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form method="POST"
                  action="${contextPath}/admin/emp/deptTransfer.do">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">부서 이동</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <table style="border-collapse: separate; border-spacing: 10px 10px;">
                        <c:forEach items="${deptNameList}" var="dnl" varStatus="vs">
                            <tr>
                                <th><button type="button" class="btn btn-secondary" name="transferDeptCode" value="{dnl.deptCode}">${dnl.deptName}</button></th>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info btn-fill">이동</button>
                    <button type="button" class="btn btn-danger btn-fill" data-dismiss="modal">취소</button>
                </div>
                <input type="hidden" name="transferDeptCode" id="transferDeptCode">
                <input type="hidden" name="transferEmpCode" id="transferEmpCode">
            </form>
        </div>
    </div>
</div>


<script>

    document.getElementById('btn-cancel').onclick = function() { 
        history.back();
    }

    const setModalValue = () => {
        $("#transferEmpCode").val( $("input[name='modifyEmpCode']:checked").val() );
    }

</script>