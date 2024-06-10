<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        <h4 class="title">부서 등록</h4>
    </div>
    <div class="content">
        <form method="POST"
              action="${contextPath}/admin/dept/add.do"
              id="frm-addDept">
            
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>부서명</label>
                        <input type="text" id="deptName" name="deptName" class="form-control" placeholder="부서명">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>부서코드</label>
                        <input type="text" id="deptCode" name="deptCode" class="form-control" placeholder="부서코드">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>상위부서코드</label>
                        <input type="text" id="deptUpstairCode" name="deptUpstairCode" class="form-control" placeholder="상위부서코드">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>부서위치</label>
                        <input type="text" id="deptLocation" name="deptLocation" class="form-control" placeholder="부서위치">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>생성일</label>
                        <input type="date" id="deptCreateDate" name="deptCreateDate" class="form-control" placeholder="생성일">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>부서장 사원코드</label>
                        <input type="text" id="deptLeaderEmpCode" name="deptLeaderEmpCode" class="form-control" placeholder="부서장 사원코드">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>부서레벨</label>
                        <input type="number" id="deptLevel" name="deptLevel" class="form-control" placeholder="부서레벨">
                    </div>
                </div>
            </div>
            
            <button type="submit" class="btn btn-info btn-fill pull-right">등록</button>
            <div class="clearfix"></div>
        </form>
    </div>
</div>