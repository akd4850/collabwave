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
          action="${contextPath}/community/registerPost.do">
          
        <input type="hidden" name="boardId" id="boardId" value="3"> <!-- 이 부분에 boardId 값을 설정 -->
        <input type="hidden" name="brdCode" id="brdCode" value="DEPT">
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
                        <input type="file" name="attach" id="attach">
                    </td>
                </tr>
                <tr >
                	<th>상단노출여부</th>
                	<td>
	                    <input type="checkbox" id="postOpenYn" name="postOpenYn" value="${postOpenYn}">
                	</td>
                </tr>
                <tr>
                    <td colspan="2">
                      <input type="hidden" name="empCode" id="empCode" value="${sessionScope.emp.empCode}">
                      <input type="hidden" name="empName" id="empName" value="${sessionScope.emp.empName}">
                      <input type="hidden" name="postState" id="postState" value="1">
                      <button type="submit" class="btn btn-info btn-fill" id="submit">작성</button>
                      <button onclick="history.back()" type="button" class="btn btn-info btn-fill" id="cancel">취소</button></a>
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

// 등록
function register() {
    document.getElementById('frm-post-register').addEventListener('submit', validateForm);
}

let editor;

// 에디터
ClassicEditor
    .create( document.querySelector( '#editor' ) )
    .then( newEditor => {
        editor = newEditor;
    } )
    .catch( error => {
        console.error( error );
    } );

// 체크박스 
document.getElementById('postOpenYn').addEventListener('change', function() {
    if (this.checked) {
        this.value = 'Y';
    } else {
        this.value = 'N';
    }
});


// 호출
insertCurrentDate();
register();

</script>