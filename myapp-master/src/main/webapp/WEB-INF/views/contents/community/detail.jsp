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
                    <th>등록일</th>
                		<td class="postCreateDatetime">${post.postCreateDatetime}</td>
                </tr>
                <tr>
                    <th>조회수</th>
                    <td>${post.postHit}</td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>${post.postTitle}</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="postContent" id="editor" class="form-control">
                           ${post.postContent}
                        </textarea>
                    </td>
                </tr>
				<tr>
				    <th>첨부파일</th>
				    <td colspan="3">
				        <c:if test="${empty attachList}">
				            <div>첨부 없음</div>
				        </c:if>
				        <c:if test="${not empty attachList}">
				            <c:forEach items="${attachList}" var="attach" >
			                <div data-attach-no="${attach.attachNo}">
			                  <a class="attach" href="${contextPath}/community/download?attachNo=${attach.attachNo}">${attach.attachOrgName}</a><br>
			                </div>
				            </c:forEach>
				            <hr>
				            <div>
				                <a id="download-all" href="${contextPath}/community/downloadAll?postNo=${post.postNo}">모두 다운로드</a>
				            </div>
				        </c:if>
				    </td>
				</tr>
				
				<tr>
				    <td colspan="2">
				        <div style="display: flex; justify-content: flex-end;">
					        <input type="hidden" id="postNo" value="${post.postNo}">
<c:choose>
    <c:when test="${sessionEmpCode == authorEmpCode || sessionEmpCode == 'admin'}">
        <!-- sessionEmpCode와 authorEmpCode가 같을 때(admin이 아닌 경우) 또는 admin일 때 -->
        <button onclick="editPost()" id="btn-edit" name="btn-edit" class="btn btn-info btn-fill" style="margin-right: 5px;">편집</button>
    </c:when>
</c:choose>
							<input type="hidden" name="brdCode" id="brdCode1" value="${post.brd.brdCode}">		
							<input type="hidden" id="contextPath" value="${contextPath}">
							<button type="button" onclick="backToList()" class="btn btn-info btn-fill">목록보기</button>				        
						</div>
				    </td>
				</tr>

            </tbody>
        </table>
    </div>
</div>


<script src="${contextPath}/ckeditor5/ckeditor.js"></script>
<script src="${contextPath}/ckeditor5/script.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var dateElements = document.querySelectorAll('.postCreateDatetime');
    dateElements.forEach(function(element) {
        var originalDate = element.textContent.trim();
        var formattedDate = moment(originalDate).format('YYYY-MM-DD HH:mm');
        element.textContent = formattedDate;
    });
});


ClassicEditor
.create(document.querySelector("#editor"), {
    toolbar: [], // 툴바를 비활성화하여 사용자가 편집할 수 없도록 함
})
.then(editor => {
    console.log(editor);
    // 편집기를 읽기 전용으로 설정
    editor.isReadOnly = true;
})
.catch(error => {
    console.error(error);
});

// 편집 버튼 숨기기
document.addEventListener("DOMContentLoaded", function() {
    var sessionEmpCode = "${sessionScope.emp.empCode}";
    var authorEmpCode = "${post.emp.empCode}";

    // 작성자가 아닌 경우 편집 버튼 숨기기
    if (sessionEmpCode !== authorEmpCode && sessionEmpCode !== 'admin') {
        var editButton = document.getElementById("btn-edit");
        if (editButton) {
            editButton.style.display = "none";
        }
    }
});

// 편집 화면으로 이동
function editPost() {
    var postNo = document.getElementById('postNo').value;
    location.href = '${contextPath}/community/edit?postNo=' + postNo;
}

//목록화면으로 이동
function backToList() {
var brdCode = document.getElementById('brdCode1').value;
console.log("brdCode:",brdCode);
var destinationUrl = ''; // 목적지 URL 초기화

switch (brdCode) { // brdCode 값에 따라 목적지 URL 설정
    case 'NOTI':
        destinationUrl = '${contextPath}/community/notice';
        break;
    case 'DEPT':
        destinationUrl = '${contextPath}/community/dept';
        break;
    case 'FREE':
        destinationUrl = '${contextPath}/community/free';
        break;
    case 'REFE':
        destinationUrl = '${contextPath}/community/ref';
        break;
    default:
        return;
}
location.href = destinationUrl; // 목적지 URL로 이동
console.log(destinationUrl);
}

const fnDownload = () => {
  $('.attach').on('click', (evt) => {
	confirm('해당 첨부 파일을 다운로드 할까요?')
  })
}

const fnDownloadAll = () => {
  document.getElementById('download-all').addEventListener('click', (evt) => {
    if(!confirm('모두 다운로드 할까요?')) {
      evt.preventDefault();
      return;
    }
  })
}

// 호출
fnDownload();
fnDownloadAll();

</script>