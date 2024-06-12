<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

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
                    <th>조회수</th>
                    <td>${post.postHit}</td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>
                        <input type="text" name="postTitle" id="postTitle" class="form-control" value="${post.postTitle}" 
                            <c:if test="${sessionScope.emp.empCode != post.emp.empCode}">readonly="readonly"</c:if>>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="postContent" id="postContent" class="form-control" rows="10"
                            <c:if test="${sessionScope.emp.empCode != post.emp.empCode}">readonly="readonly"</c:if>>${post.postContent}</textarea>
                    </td>
                </tr>
				<tr>
				    <td colspan="2">
				        <form id="modifyForm" method="post" action="modifyPost.do"
				            <c:if test="${!isAuthor}">style="display:none;"</c:if>>
				            <input type="hidden" name="empCode" value="${sessionScope.emp.empCode}">
				            <input type="hidden" name="postNo" value="${post.postNo}">
				            <input type="hidden" name="postTitle" value="${post.postTitle}">
				            <input type="hidden" name="postContent" value="${post.postContent}">
				            <button type="submit" id="btn-modify" class="btn btn-info btn-fill">수정</button>
				            <button type="button" id="btn-delete" class="btn btn-info btn-fill">삭제</button>
				            <button onclick="history.back()" type="button" id="btn-cancel" class="btn btn-info btn-fill">취소</button>
				        </form>
				    </td>
				</tr>
                <tr>
                    <td colspan="2">
                    	<form id="frm-btn" method="post">
	                    	<input type="hidden" name="postNo" value="${post.postNo}">
	                        <button onclick="location.href = document.referrer" type="button" id="btn-cancel" class="btn btn-info btn-fill">목록보기</button>
                    	</form>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>


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

$(document).ready(function() {
    $('#btn-delete').click(function() {
        var postNo = $('input[name="postNo"]').val();

        if (confirm('정말 삭제하시겠습니까?')) {
            $.ajax({
                url: '${contextPath}/community/deletePost.do', // 삭제 API 엔드포인트
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ postNo: postNo }),
                success: function(response) {
                    alert('글이 삭제되었습니다.');
                    history.back(); // 이전 화면으로 이동
                    location.reload(); // 페이지 새로고침
                },
                error: function(error) {
                    alert('삭제 중 오류가 발생했습니다.');
                }
            });
        }
    });
});

</script>