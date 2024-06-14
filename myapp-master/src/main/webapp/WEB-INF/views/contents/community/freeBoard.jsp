<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<style>
    .search-input {
        width: 140%; /* 원하는 너비로 조정 */
        font-size: 16px; /* 글꼴 크기 조정 */
        padding: 10px; /* 패딩 조정 */
    }
    
  .postTitleCell {
    padding-left: 10px; /* Adjust the spacing as needed */
  }
</style>

<div class="card">
    <div class="header">자유게시판</div>
    
    <div class="content table-responsive table-full-width">
        <input type="button"
               class="btn btn-info btn-fill"
               style="margin-left:10px"
               onclick="location.href='/community/free/write'"
               value="글쓰기">
                
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>글 제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${postList}" var="post" varStatus="vs">
	                <tr>
	                    <td class="postTitleCell"><a href="/community/detailFree?postNo=${post.postNo}">${post.postTitle}</a></td>
	                    <td>${post.emp.empName}</td>
	                    <td>${post.postCreateDatetime}</td>
	                    <td>${post.postHit}</td>
	                </tr>
                </c:forEach>
                
				<form action="${contextPath}/community/free/search" method="get">
				    <tr>
				        <td colspan="4">
				            <div style="display: flex; justify-content: flex-end; align-items: center;">
				                <input type="text" id="search" name="query" class="form-control search-input" placeholder="검색어를 입력해주세요" style="width: 400px; margin-right: 10px;">
				                <input type="hidden" name="brdCode" id="brdCode" value="FREE">
				                <button type="submit" class="btn btn-info btn-fill" id="btn-search">검색</button>
				            </div>
				        </td>
				    </tr>
				</form>
			
            </tbody>
        </table>
    </div>

	<div>${paging}</div>

</div>