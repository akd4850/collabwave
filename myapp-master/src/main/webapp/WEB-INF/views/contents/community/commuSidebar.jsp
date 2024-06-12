<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>


<style>
.subtab > li {
    padding-top: 10px;
}    
.subtab2 li {
    padding-left: 30px;
}
#btn-add-community {
	margin-left: 15px;
	margin-top: 10px;
}
</style>

<div class="card">
    <div class="header">커뮤니티 메뉴</div>
		<c:if test="${emp.empCode != null && emp.empCode == 'admin'}">
		    <div>
		    	<button type="button" class="btn btn-info btn-fill" id="btn-add-community" data-toggle="modal" data-target="#formModal">커뮤니티 추가</button>
		    </div>
	    </c:if>
    <div class="content">
        <ul class="list-unstyled subtab" id="community-list">
            <li><a href="/community/notice">공지사항</a></li>
            <li><a href="/community/free">자유게시판</a></li>
            <li><a href="/community/dept">부서별게시판</a></li>
            <li><a href="/community/ref">자료실</a></li>
        </ul>
    </div>    
</div>

<div class="modal fade" id="formModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">새로운 커뮤니티 추가</h4>
            </div>
        <div class="modal-body">
            <form>
                <div class="form-group">
                	<h6>커뮤니티 이름</h6>
                	<input type="text" id="community-name" name="community-name" class="form-control search-input" style="width: 400px;">
                </div>
                <hr>
                <div class="form-group">
                	<h6>커뮤니티 코드</h6>
                	<input type="text" id="community-code" name="community-code" class="form-control search-input" style="width: 400px;">
                </div>
                <hr>
                <div class="form-group">
                	<h6>커뮤니티 URL</h6>
                	<input type="text" id="community-url" name="community-url" class="form-control search-input" style="width: 400px;">
                </div>
            </form>
        </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info btn-fill" onclick="addAppr();">확인</button>
                <button type="button" class="btn btn-danger btn-fill" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<script>


</script>

