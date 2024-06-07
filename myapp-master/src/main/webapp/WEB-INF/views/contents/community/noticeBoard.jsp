<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<div class="card">
    <div class="header">공지사항</div>
    
    <div class="content table-responsive table-full-width">
        <input type="button"
               class="btn btn-info btn-fill"
               style="margin-left:10px"
               onclick="location.href='/community/notice/write.do'"
               value="글쓰기">
                
        <table class="table table-hover table-striped" id="list">       
            <thead>
                <tr>
                    <th>글 제목</th>
                    <th>작성자</th>
                    <th>작성일자</th>
                    <th>조회수</th>
                </tr>
            </thead>          
            <tbody>
                <c:forEach items="${postList}" var="post" varStatus="vs">
	                <tr>
	                    <td><a href="/community/detail.do?postNo=${post.postNo}">${post.postTitle}</a></td>
	                    <td>${post.emp.empName}</td>
	                    <td>${post.postCreateDatetime}</td>
	                    <td>${post.postHit}</td>
	                </tr>
                </c:forEach>
                
			<form action="${contextPath}/community/notice/search.do" method="get">
			    <tr>
			        <td colspan="3">
			            <input type="text" name="query" class="form-control" placeholder="검색어를 입력해주세요">
			        </td>
			        <td style="width:100px">
			            <button type="submit" class="btn btn-info btn-fill" id="btn-search">검색</button>
			        </td>
			    </tr>
			</form>

            </tbody>      
        </table>
		
    </div>

	<div>${paging}</div>

</div>
