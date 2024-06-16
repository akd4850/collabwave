<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<script>
document.addEventListener("DOMContentLoaded", function() {

    //에디터
	let editor;
	ClassicEditor
	.create( document.querySelector( '#editor' ) )
	.then( newEditor => {
	    editor = newEditor;
	} )
	.catch( error => {
	    console.error( error );
	} );

});

</script>

<style>
.remove-attach {
  color: black;
}
</style>

<form id="frm-post-modify"
      method="POST"
      enctype="multipart/form-data"
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
                        <textarea name="postContent" id="editor" >${post.postContent}</textarea>
                    </td>
                </tr>
				<tr  id="ifFree" class="ifFree" >
				    <th>중요공지여부</th>
				    <td  id="notFree" class="notFree">
				      <input type="checkbox" id="postOpenYn" name="postOpenYn" value="Y" ${post.postOpenYn == 'Y' ? 'checked' : ''}>
				      <input type="hidden" name="postOpenYn" value="N">
				    </td>
				</tr>

                <tr>
                    <td colspan="2">
                        <input type="hidden" id="contextPath" value="${contextPath}">
                        <div style="display: flex; justify-content: flex-end;">
                            <form id="frm-modify" method="post" action="${contextPath}/community/modifyPost.do">
                                <input type="hidden" name="empCode" value="${sessionScope.emp.empCode}">
                                <input type="hidden" name="deptCode" id="deptCode" value="${post.emp.deptCode}">
                                <input type="hidden" name="postNo" value="${post.postNo}">
                                <input type="hidden" id="brdCode" value="${brdCode}">
                                <button type="submit" id="btn-modify" class="btn btn-info btn-fill" style="margin-right: 5px;">수정</button>
                            </form>
							<c:choose>
							    <c:when test="${sessionEmpCode == authorEmpCode || sessionEmpCode == 'admin'}">
							        <!-- sessionEmpCode와 authorEmpCode가 같거나 admin인 경우에만 삭제 버튼 표시 -->
							        <form id="frm-delete" method="post" action="${contextPath}/community/deletePost.do">
							            <input type="hidden" name="postNo" value="${post.postNo}">
							            <button type="submit" id="btn-delete" class="btn btn-info btn-fill" style="margin-right: 5px;" onclick="backToList()">삭제</button>
							        </form>
							    </c:when>
							</c:choose>
                            <button type="button" id="btn-cancel" class="btn btn-info btn-fill">취소</button>
                        </div>
                    </td>
                </tr>
                
			    <tr  id="ifFree" class="ifFree">
			        <th>첨부파일</th>
			        <td colspan="3"  id="ifFree" class="ifFree">
			            <div id="attach-list">
			                <c:if test="${empty attachList}">
			                    <div>첨부 없음</div>
			                </c:if>
			                <c:if test="${not empty attachList}">
			                    <div class="attach" data-attach-no="${attach.attachNo}"></div>
			                </c:if>
			            </div>
			        </td>
			    </tr>
				<tr  id="ifFree" class="ifFree">
				    <td colspan="4"  id="ifFree" class="ifFree">
				        <c:if test="${sessionScope.emp.empCode == post.emp.empCode}">
				            <div style="display: flex; align-items: center;">
				                <input type="file" name="files" id="files" multiple style="margin-right: 500px;">
				                <button type="submit" class="btn btn-info btn-fill" id="btn-add-attach" style="margin-left: 120px;">첨부추가</button>
				            </div>
				        </c:if>
				    </td>
				</tr>
                <tr  id="ifFree" class="ifFree">
                    <td colspan="4" id="new-attach-list"  id="notFree" class="notFree"></td>
                </tr>

                
            </tbody>
        </table>
    </div>
</div>
</form>


<script src="${contextPath}/ckeditor5/ckeditor.js"></script>
<script src="${contextPath}/ckeditor5/script.js"></script>
<script>

// 중요공지여부수정
document.getElementById('frm-post-modify').addEventListener('submit', function(event) {
    var checkbox = document.getElementById('postOpenYnCheckbox');
    checkbox.value = checkbox.checked ? 'Y' : 'N';
});

// 취소 상세보기로 돌아가기
document.getElementById('btn-cancel').addEventListener('click', function() {
  // 서버에서 postNo 값을 JSP로 전달받아 JavaScript에서 사용할 수 있게 합니다.
  const postNo = '${post.postNo}';
  const contextPath = '${contextPath}';
  // URL 생성 및 페이지 이동
  window.location.href = contextPath + '/community/detail?postNo=' + postNo;
  
  // 페이지 이동 후 새로고침
  window.addEventListener('pageshow', function(event) {
    if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
      // 페이지가 캐시에서 복원된 경우 새로고침
      window.location.reload();
    }
  });
});



// 첨부 파일 목록을 가져와서 표시하는 함수 <div id="attach-list"></div> 에 표시
const fnAttachList = () => {
  fetch('${contextPath}/community/attachList?postNo=${post.postNo}', {
    method: 'GET'
  })
  .then(response => response.json())
  .then(resData => {  // resData = {"attachList": []}
    let divAttachList = document.getElementById('attach-list');
    divAttachList.innerHTML = '';
    const attachList = resData.attachList;
    for(let i = 0; i < attachList.length; i++) {
      const attach = attachList[i];
      let str = '<div class="attach" data-attach-no="' + attach.attachNo + '">';
      str += '<span>' + attach.attachOrgName + '</span>';
      if('${sessionScope.emp.empCode}' === '${post.emp.empCode}') {
        str += '<a style="margin-left: 10px;" class="remove-attach" data-attach-no="' + attach.attachNo + '">x</a>';
      }
      str += '</div>';
      divAttachList.innerHTML += str;
    }
  });
}

// 첨부 파일 추가 함수
const fnAddAttach = () => {
  $('#btn-add-attach').on('click', () => {
    let formData = new FormData();
    let files = $('#files').prop('files');
    $.each(files, (i, file) => {
      formData.append('files', file);
    });
    formData.append('postNo', '${post.postNo}');
    
    $.ajax({
      type: 'POST',
      url: '${contextPath}/community/addAttach.do',
      data: formData,
      contentType: false,
      processData: false,
      dataType: 'json',
      success: (resData) => {
        if (resData.attachResult) {
          alert('첨부 파일이 추가되었습니다.');
          fnAttachList();
          $('#files').val('');
          $('#new-attach-list').html('');
        } else {
          alert('첨부 파일이 추가되지 않았습니다.');
        }
      }
    });
  });
}

// 첨부 파일 삭제 함수
const fnRemoveAttach = () => {
  $(document).on('click', '.remove-attach', (evt) => {
    if(!confirm('해당 첨부 파일을 삭제할까요?')) {
      return;
    }
    fetch('${contextPath}/community/removeAttach.do', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        'attachNo': evt.target.dataset.attachNo
      })
    })
    .then(response => response.json())
    .then(resData => {  // resData = {"deleteCount": 1}
      if(resData.deleteCount === 1) {
        alert('첨부 파일이 삭제되었습니다.');
        fnAttachList();
      } else {
        alert('첨부 파일이 삭제되지 않았습니다.');
      }
    });
  });
}

//크기 제한 스크립트 + 첨부 목록 출력 스크립트
const fnAttachCheck = () => {
  document.getElementById('files').addEventListener('change', (evt) => {
    const limitPerSize = 1024 * 1024 * 10;
    const limitTotalSize = 1024 * 1024 * 100;
    let totalSize = 0;
    const files = evt.target.files;
    const newAttachList = document.getElementById('new-attach-list');
    newAttachList.innerHTML = '';
    for(let i = 0; i < files.length; i++){
      if(files[i].size > limitPerSize){
        alert('각 첨부 파일의 최대 크기는 10MB입니다.');
        evt.target.value = '';
        newAttachList.innerHTML = '';
        return;
      }
      totalSize += files[i].size;
      if(totalSize > limitTotalSize){
        alert('전체 첨부 파일의 최대 크기는 100MB입니다.');
        evt.target.value = '';
        newAttachList.innerHTML = '';
        return;
      }
      newAttachList.innerHTML += '<div>' + files[i].name + '</div>';
    }
  })
}


//목록화면으로 이동
function backToList() {
	
    // 삭제 확인
    var confirmDeletion = confirm('삭제하시겠습니까?');
    if (!confirmDeletion) {
        return; // 취소하면 함수 종료
    }
}

// 함수 호출
fnAttachList();
fnRemoveAttach();
fnAddAttach();

</script>