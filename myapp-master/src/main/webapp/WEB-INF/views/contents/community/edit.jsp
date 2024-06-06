<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<form id="frm-blog-modify"
      method="POST"
      action="${contextPath}/community/modifyPost.do">

<div class="card">
    <div class="content table-responsive table-full-width">
        <table class="table table-hover table-striped">
            <tbody>
                <tr>
                    <th style="width:100px">작성자</th>
                    <td>${post.emp.empName}</td>
                </tr>
                <tr>
                    <th>작성일시</th>
                    <td>${post.postCreateDatetime}</td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>
                    <input type="text" name="postTitle" id="postTitle" class="form-control" value="${post.postTitle}">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="postContent" id="editor"  placeholder="내용을 입력해주세요">
                        ${post.postContent}
                        </textarea>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                      <c:if test="${sessionScope.emp.empCode == post.emp.empCode}">
	                    	<input type="hidden" name="empCode" value="${sessionScope.emp.empCode}">
	                    	<input type="hidden" name="postNo" value="${post.postNo}">
	                        <button type="submit" id="btn-modify" class="btn btn-info btn-fill">수정</button>
	                        <button type="button" id="btn-delete" class="btn btn-info btn-fill">삭제</button>
	                        <button onclick="history.back()" type="button" id="btn-cancel" class="btn btn-info btn-fill">취소</button>
                      </c:if>
                    </td>
                </tr>
                
            </tbody>
        </table>
    </div>
</div>
</form>

<script src="${contextPath}/ckeditor5/ckeditor.js"></script>
<script src="${contextPath}/ckeditor5/script.js"></script>
<script>

let editor;
ClassicEditor
.create( document.querySelector( '#editor' ) )
.then( newEditor => {
    editor = newEditor;
} )
.catch( error => {
    console.error( error );
} );

const fnEditBlog = () => {
	$('#btn-edit-post').on('click', (evt) => {
	  frmBtn.attr('action', '${contextPath}/community/modifyPost.do');
	  frmBtn.submit();
	})
}
    


</script>