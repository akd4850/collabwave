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
                <div class="col-md-3">
                    <div class="form-group">
                        <label>부서코드</label>
                        <input type="text" id="deptCode" name="deptCode" class="form-control" placeholder="부서코드">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>부서명</label>
                        <input type="text" id="deptName" name="deptName" class="form-control" placeholder="부서명">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>부서장</label>
                        <select type="select" class="form-control" id="deptLeader" name="deptLeaderEmpCode">
                            <option selected disabled>-- 부서장을 임명하세요 --</option>
                            <c:forEach items="${waitingPersons}" var="wpl" varStatus="vs">
                                <option value="${wpl.empCode}">${wpl.empName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>부서레벨</label>
                        <select type="select" class="form-control" placeholder="부서레벨" name="deptLevel">
                            <option selected disabled>-- 부서레벨을 선택하세요 --</option>
                            <option value="0">Level.0</option>
                            <option value="1">Level.1</option>
                            <option value="2">Level.2</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>상위부서</label>
                        <select type="select" class="form-control" name="deptUpstairCode">
                            <option value="" selected disabled>-- 상위부서를 선택하세요 --</option>
                            <c:forEach items="${deptSelectList}" var="dsl" varStatus="vs">
                                <option value="${dsl.deptCode}">${dsl.deptName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>부서위치</label>
                        <select type="select" class="form-control" placeholder="부서위치" name="deptLocation">
                            <option selected disabled>-- 부서위치를 선택하세요 --</option>
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

            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>생성일</label>
                        <input type="date" id="deptCreatedate" name="deptCreatedate" class="form-control" placeholder="생성일">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>사용여부</label>
                        <select type="select" class="form-control" placeholder="사용여부" name="useYn" id="useYn">
                            <option value="Y" selected>사용</option>
                            <option value="N">미사용</option>
                        </select>
                    </div>
                </div>
            </div>
            
            <div style="margin-left:850px">
            <button type="submit" class="btn btn-info btn-fill">등록</button>
            <button type="button" class="btn btn-danger btn-fill">취소</button>
            </div>
            <div class="clearfix"></div>
        </form>
    </div>
</div>
