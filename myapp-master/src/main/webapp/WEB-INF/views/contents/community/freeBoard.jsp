<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">
        자유게시판
    </div>
    <div class="content table-responsive table-full-width">
        <input type="button"
                class="btn btn-info btn-fill"
                style="margin-left:10px"
                onclick="location.href='/community/write.page'"
                value="글쓰기">
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>글 번호</th>
                    <th>글 제목</th>
                    <th>작성자</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>안녕하세요</td>
                    <td>관리자</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="text" value="" class="form-control" placeholder="검색어를 입력해주세요">
                    </td>
                    <td style="width:100px">
                        <button type="button" class="btn btn-info btn-fill">검색</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>