<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        자산 관리
    </div>
    <div class="content table-responsive table-full-width">
        <input type="button"
                class="btn btn-info btn-fill"
                style="margin-left:10px"
                onclick="location.href='/reservation/addGoods.page'"
                value="자산 추가">
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>코드</th>
                    <th>이름</th>
                    <th>타입</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>room1</td>
                    <td>대회의실1</td>
                    <td>장소</td>
                    <td><button type="submit" class="btn btn-info btn-fill">수정</button></td>
                    <td><button type="submit" class="btn btn-info btn-fill">삭제</button></td>
                </tr>
                <tr>
                    <td>room2</td>
                    <td>소회의실1</td>
                    <td>장소</td>
                    <td><button type="submit" class="btn btn-info btn-fill">수정</button></td>
                    <td><button type="submit" class="btn btn-info btn-fill">삭제</button></td>
                </tr>
                <tr>
                    <td>room3</td>
                    <td>소회의실2</td>
                    <td>장소</td>
                    <td><button type="submit" class="btn btn-info btn-fill">수정</button></td>
                    <td><button type="submit" class="btn btn-info btn-fill">삭제</button></td>
                </tr>
                <tr>
                    <td>car1</td>
                    <td>그랜져 3.0</td>
                    <td>물품</td>
                    <td><button type="submit" class="btn btn-info btn-fill">수정</button></td>
                    <td><button type="submit" class="btn btn-info btn-fill">삭제</button></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>