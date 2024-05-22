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
        <form>
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
                        <label>이름</label>
                        <input type="text" class="form-control" placeholder="이름" value="홍길동">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>사번</label>
                        <input type="text" class="form-control" placeholder="사번" value="07-73222320">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>부서</label>
                        <input type="text" class="form-control" placeholder="부서" value="인사팀">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>휴대전화</label>
                        <input type="text" class="form-control" placeholder="휴대전화" value="010-1111-2222">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>이메일</label>
                        <input type="text" class="form-control" placeholder="이메일" value="abc@collabwave.com">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>생년월일</label>
                        <input type="text" class="form-control" placeholder="생년월일" value="1986-09-02">
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-info btn-fill pull-right">등록</button>
            <div class="clearfix"></div>
        </form>
    </div>
</div>