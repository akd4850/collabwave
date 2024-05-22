<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="main-content">
    <div class="container-fluid">
        <div class="row">

            <div class="col-md-8">
                <div class="card">
                    <div class="header">
                        <h4 class="title">내 정보</h4>
                    </div>
                    <div class="content">
                        <form>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>이름</label>
                                        <input type="text" class="form-control" placeholder="이름" value="홍길동" disabled>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>사번</label>
                                        <input type="text" class="form-control" placeholder="사번" value="07-73222320" disabled>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>부서</label>
                                        <input type="text" class="form-control" placeholder="부서" value="인사팀" disabled>
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

                            <button type="submit" class="btn btn-info btn-fill pull-right">수정</button>
                            <div class="clearfix"></div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Profile -->
            <div class="col-md-4">
                <div class="card card-user">
                    <div class="image">
                        <img src="${contextPath}/resources/img/full-screen-image-3.jpg" alt="..."/>
                    </div>
                    <div class="content">
                        <div class="author">
                             <a href="#">
                            <img class="avatar border-gray" src="${contextPath}/resources/img/avatar.jpg" alt="..."/>

                              <h4 class="title">홍길동<br />
                                 <small>사원</small>
                              </h4>
                            </a>
                        </div>
                    </div>
                    <hr>
                    <div class="text-center">
                        <input type="button" class="btn btn-info btn-fill" value="프로필 변경"/><br/><br/>
                        <input type="button" class="btn btn-info btn-fill" value="비밀번호 변경"/><br/>&nbsp;
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>