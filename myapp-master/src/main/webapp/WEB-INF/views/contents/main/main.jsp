<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="main-content">
    <div class="container-fluid">
        <div class="row">

            <div class="col-md-4">
                <div class="card card-user">
                    <div class="image">
                        <img src="${contextPath}/resources/img/full-screen-image-3.jpg" alt="..."/>
                    </div>
                    <div class="content">
                        <div class="author">
                             <a href="#">
                            <img class="avatar border-gray" src="${contextPath}${sessionScope.emp.profileFileName}" alt="..."/>

                              <h4 class="title">
                                ${sessionScope.emp.empName}<br />
                                <small>${sessionScope.emp.dept.deptName}</small><br>
                                 <small>${sessionScope.emp.position.positionName}</small>
                              </h4>
                            </a>
                        </div>
                        <!--p class="description text-center"> "Lamborghini Mercy <br>
                                            Your chick she so thirsty <br>
                                            I'm in that two seat Lambo"
                        </p-->
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card">
                    <div class="header">
                        24 Hours Performance
                        <p class="category">Line Chart</p>
                    </div>
                    <div class="content">
                        <div id="chartPerformance" class="ct-chart "></div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card card-user">
                    <div class="header">
                        근태현황
                    </div>
                    <div class="content">
                        <p class="description">
                            보유 휴가 일수 : 15<br/>
                            사용한 휴가 일수 : 8<br/>
                            남은 휴가 일수 : 7
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card">
                    <div class="header">
                        공지사항
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th>제목</th>
                                <th>등록날짜</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>연말 정산 공지</td>
                                    <td>2023-12-26</td>
                                </tr>
                                <tr>
                                    <td>프로젝트 크런치 공지</td>
                                    <td>2023-11-20</td>
                                </tr>
                                <tr>
                                    <td>탕비실 이용 유의사항</td>
                                    <td>2023-10-30</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>