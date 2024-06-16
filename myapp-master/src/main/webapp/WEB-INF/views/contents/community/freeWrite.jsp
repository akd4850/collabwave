<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<style>
.ck-editor__editable {
  min-height: 500px;
}
</style>

<div class="card">
    <div class="content table-responsive table-full-width">
    
    <form id="frm-post-register"
    	  method="POST"
    	  enctype="multipart/form-data"
          action="${contextPath}/community/registerPost.do">
        
        <input type="hidden" name="brdCode" id="brdCode" value="FREE">
        <table class="table table-hover table-striped">
            <tbody>
                <tr>
                    <th style="width:100px">작성자</th>
                    <td>${sessionScope.emp.empName}</td>
                </tr>
                <tr>
                    <th>작성날짜</th>
                    <td id="current-date"></td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>
                        <input type="text" name="postTitle" id="postTitle" class="form-control" placeholder="제목을 입력해주세요">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="postContent" id="editor"  placeholder="내용을 입력해주세요"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                      <input type="hidden" id="postOpenYn" name="postOpenYn" value="N">
                      <input type="hidden" name="empCode" id="empCode" value="${sessionScope.emp.empCode}">
                      <input type="hidden" name="empName" id="empName" value="${sessionScope.emp.empName}">
                      <input type="hidden" name="deptCode" id="deptCode" value="${sessionScope.emp.deptCode}">
                      <input type="hidden" name="postState" id="postState" value="1">
					  <input type="file" name="files" id="files" style="display: none;">
                      <button type="submit" class="btn btn-info btn-fill" id="submit">작성</button>
                      <button onclick="history.back()" type="button" class="btn btn-info btn-fill" id="cancel">취소</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
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

// 현재 일시 구현
function insertCurrentDate() {
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2); // 두 자리수로 만들기
    var day = ('0' + today.getDate()).slice(-2); // 두 자리수로 만들기
    var hours = ('0' + today.getHours()).slice(-2);
    var minutes = ('0' + today.getMinutes()).slice(-2);
    var formattedDate = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes;
    document.getElementById('current-date').textContent = formattedDate;
}

// 제목 입력 필수
function validateForm(evt) {
    if (document.getElementById('postTitle').value === '') {
        alert('제목 입력은 필수입니다.');
        evt.preventDefault();
    }
}


    
//등록
function register() {
	
    document.getElementById('frm-post-register').addEventListener('submit', validateForm);
    
    document.getElementById('postOpenYn').addEventListener('change', function() {
        this.value = this.checked ? 'Y' : 'N';
    });
}

//등록 확인
function validateForm(event) {
    event.preventDefault();

    const confirmSubmission = confirm('글을 작성하시겠습니까?');

    if (confirmSubmission) {
        document.getElementById('frm-post-register').removeEventListener('submit', validateForm);
        document.getElementById('frm-post-register').submit();
    }
}


// 호출
insertCurrentDate();
register();

</script>