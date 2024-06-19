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
                <div class="row" style="margin-left:10px">
                    <div class="col-md-3">
                        <div class="form-group">
                          <label>부서코드</label>
                          <input type="text" class="form-control" placeholder="부서코드" id="deptCode" name="deptCode" value="${dept.deptCode}" readonly>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>부서명</label>
                            <input type="text" class="form-control" placeholder="부서명" id="deptName" name="deptName" value="${dept.deptName}">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>부서장</label>
                            <select type="select" class="form-control" id="deptLeader" name="deptLeaderEmpCode">
                                <c:forEach items="${memberList}" var="ml" varStatus="vs">
                                    <option value="${ml.empCode}">${ml.empName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
        
                <div class="row" style="margin-left:10px">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>부서레벨</label>
                            <input type="text" class="form-control" placeholder="부서레벨" id="deptLevel" name="deptLevel" value="${dept.deptLevel}">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>상위부서</label>
                            <select type="select" class="form-control" id="upstairDept" name="deptUpstairCode">
                                <c:forEach items="${deptSelectList}" var="dsl" varStatus="vs">
                                    <option value="${dsl.deptCode}">${dsl.deptName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>부서위치</label>
                            <select type="select" class="form-control" placeholder="부서위치" name="deptLocation" id="deptLocation">
                                <option value="1층 A구역">1층 A구역</option>
                                <option value="1층 B구역">1층 B구역</option>
                                <option value="1층 C구역">1층 C구역</option>
                                <option value="2층 A구역">2층 A구역</option>
                                <option value="2층 A구역">2층 B구역</option>
                                <option value="2층 A구역">2층 C구역</option>
                                <option value="3층 A구역">3층 A구역</option>
                                <option value="3층 A구역">3층 B구역</option>
                                <option value="3층 A구역">3층 C구역</option>
                            </select>
                        </div>
                    </div>
                </div>
        
                <div class="row" style="margin-left:10px">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>생성일</label>
                            <input type="text" class="form-control" placeholder="생성일" name="deptCreatedate" value="${dept.deptCreatedate}" readonly>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>사용여부</label>
                            <select type="select" class="form-control" placeholder="사용여부" name="useYn" id="useYn">
                                <option value="Y">사용</option>
                                <option value="N">미사용</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div style="margin-left:760px">
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
                                <th>
                                    <input class="form-check" type="radio" name="transferDeptCode" value="${dnl.deptCode}">
                                    <label class="btn btn-dark btn-fill" for="flexCheck">${dnl.deptName}</label>
                                </th>
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

    document.getElementById("deptLocation").value="${dept.deptLocation}";
    document.getElementById("useYn").value="${dept.useYn}";
    document.getElementById("upstairDept").value="${dept.deptUpstairCode}";
    document.getElementById("deptLeader").value="${dept.deptLeaderEmpCode}";

</script>