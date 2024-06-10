<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        <h4 class="title">직원 등록</h4>
    </div>
    <div class="content">
        <form method="POST"
              action="${contextPath}/admin/emp/add.do"
              id="frm-addEmployee">

            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label>사진</label>
                        <input type="file" name="" id="">
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>사번</label>
                        <input type="text" id="empCode" name="empCode" class="form-control" placeholder="사번">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>이름</label>
                        <input type="text" id="empName" name="empName" class="form-control" placeholder="이름">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>비밀번호</label>
                        <input type="text" id="password" name="password" class="form-control" placeholder="비밀번호">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>휴대전화</label>
                        <input type="text" id="mobile" name="mobile" class="form-control" placeholder="휴대전화">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>이메일</label>
                        <input type="email" id="email" name="email" class="form-control" placeholder="이메일">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>생년월일</label>
                        <input type="date" id="birthdayDate" name="birthdayDate" class="form-control" placeholder="생년월일">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>우편번호</label>
                        <input type="number" id="zipCode" name="zipCode" class="form-control" placeholder="우편번호">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>자택주소</label>
                        <input type="text" id="address" name="address" class="form-control" placeholder="자택주소">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>상세주소</label>
                        <input type="text" id="detailAddress" name="detailAddress" class="form-control" placeholder="상세주소">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>직급코드</label>
                        <input type="text" id="positionCode" name="positionCode" class="form-control" placeholder="직급코드">
                    </div>
                </div>
            </div>
            
            <button type="submit" class="btn btn-info btn-fill pull-right">등록</button>
            <div class="clearfix"></div>
        </form>
    </div>
</div>