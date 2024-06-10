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
    <div class="content">
        <form>
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                  <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-dept-info" type="button" role="tab" aria-controls="nav-home" aria-selected="true">부서정보</button>
                  <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-dept-member" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">부서원</button>
                </div>
            </nav>

            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-dept-info" role="tabpanel" aria-labelledby="nav-home-tab">
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
            </div>

            <div class="tab-pane fade" id="nav-dept-member" role="tabpanel" aria-labelledby="nav-profile-tab">

                <c:forEach items="${memberList}" var="member" varStatus="vs">
                    <div>
                        <div>${member.empName}</div>    
                    </div>
                </c:forEach>
                
            </div>

            <button type="submit" id="btn-update" class="btn btn-info btn-fill">수정</button>
            <button type="button" id="btn-cancel" class="btn btn-danger btn-fill">취소</button>
            <div class="clearfix"></div>
        </form>
    </div>
</div>

    



<script>
    document.getElementById('btn-cancel').onclick = function() { 
        history.back();
    }

</script>