<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="main-content">
    <div class="container-fluid">
        <div class="row">

            <div class="col-md-2">
                <div class="card">
                    <div class="header">
                        근퇴 관리
                    </div>
                    <div class="contents">
                        <div>
                            <h4 style="padding-left:10px">2024-05-22</h4>
                        </div>
                        <table class="table table-hover table-striped">
                            <tbody>
                                <tr>
                                    <th>현재 시간</th>
                                    <td>15:30:00(카운트한다)</td>
                                </tr>
                                <tr>
                                    <th>출근 시간</th>
                                    <td>08:50:10</td>
                                </tr>
                                <tr>
                                    <th>퇴근 시간</th>
                                    <td>18:00:05</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="text-center">
                            <hr>
                            <input type="button" class="btn btn-info btn-fill" value="출근 하기" disabled/> 
                            <input type="button" class="btn btn-info btn-fill" value="퇴근 하기"/>
                            <br/>&nbsp;
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-10">
                <div class="card">
                    <div class="header">
                        근퇴 현황
                    </div>
                    <div class="text-center">
                        <h4><a href="#"><</a> 2023.05 <a href="#">></a></2023.05></h4>
                    </div>
                    <div class="content table-responsive table-full-width">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th>일차</th>
                                <th>업무시작</th>
                                <th>업무종료</th>
                                <th>총 근무시간</th>
                                <th>비고</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>3일</td>
                                    <td>09:00:33</td>
                                    <td>18:00:50</td>
                                    <td>8h 54m 30s</td>
                                    <td>정상 근무</td>
                                </tr>
                                <tr>
                                    <td>2일</td>
                                    <td>09:10:30</td>
                                    <td>18:10:50</td>
                                    <td>8h 54m 30s</td>
                                    <td>지각</td>
                                </tr>
                                <tr>
                                    <td>1일</td>
                                    <td>00:00:00</td>
                                    <td>00:00:00</td>
                                    <td>0h 0m 0s</td>
                                    <td>휴가</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>