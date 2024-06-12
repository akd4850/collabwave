<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<style>
#cmmtContent{
	width: 80%;
}
</style>

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
                    <td>${post.postTitle}</td>                
                </tr>
				<tr>
				    <td colspan="2">
				        <div style="padding-left: 10px;">
				            ${post.postContent}
				        </div>
				    </td>
				</tr>
				<tr>
				    <td colspan="2">
				        <c:if test="${sessionScope.emp.empCode == post.emp.empCode}">
				            <form id="frm-btn" method="post" style="display: flex; justify-content: flex-end;">
				                <input type="hidden" name="postNo" value="${post.postNo}">
				                <button type="button" id="btn-modify" class="btn btn-info btn-fill" style="margin-right: 5px;">수정</button>
				                <button type="button" id="btn-delete" class="btn btn-info btn-fill" style="margin-right: 5px;">삭제</button>
				                <button onclick="location.href = document.referrer" type="button" id="btn-cancel" class="btn btn-info btn-fill">취소</button>
				            </form>
				        </c:if>
				    </td>
				</tr>
            </tbody>
        </table>
        
		<form id="frm-comment">
	        <table class="table table-hover table-striped">  
	        	<tr>
		        	<th style="width:100px">댓글 ${getCommentCount}개</th>
		        	<td></td>
	        	</tr>

				<!-- 댓글 목록 -->
				<tr id="comment-list"></tr>
				<tr id="paging"></tr>   

				<!-- 댓글 작성 창 -->
				<tr>
				    <th style="width:100px">${sessionScope.emp.empName}</th>
				    <td>
				        <div style="display: flex;">
				            <input type="hidden" name="postNo" value="${post.postNo}">
				            <input type="text" name="cmmtContent" id="cmmtContent" class="form-control" style="flex: 1;" placeholder="댓글을 입력하세요">
				            <button type="button" id="btn-comment-register" class="btn btn-info btn-fill">댓글등록</button>
				        </div>
				    </td>
				</tr>
					<c:if test="${not empty sessionScope.emp}">  
					  <input type="hidden" name="empCode" value="${sessionScope.emp.empCode}">
					</c:if>						
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
    

//댓글 등록
const fnRegisterComment = () => {
  $('#btn-comment-register').on('click', (evt) => {
    $.ajax({
      // 요청
      type: 'POST',
      url: '${contextPath}/community/registerComment.do',
      data: $('#frm-comment').serialize(),  // <form> 내부의 모든 입력을 파라미터 형식으로 보낼 때 사용, 입력 요소들은 name 속성을 가지고 있어야 함
      // 응답
      dataType: 'json',
      success: (resData) => {  // resData = {"insertCount": 1}
        if(resData.insertCount === 1) {
          alert('댓글이 등록되었습니다.');
          $('#cmmtContent').val('');
          fnCommentList();
        } else {
          alert('댓글 등록이 실패했습니다.');
        }
      },
      error: (jqXHR) => {
        alert(jqXHR.statusText + '(' + jqXHR.status + ')');
      }
    })
    
  })
}

// 전역 변수
var page = 1;

// 댓글/답글 목록
const fnCommentList = () => {
  $.ajax({
    type: 'get',
    url: '${contextPath}/community/free/comment/list.do',
    data: 'postNo=${post.postNo}&page=' + page,
    dataType: 'json',
    success: (resData) => {  // resData = {"commentList": [], "paging": "< 1 2 3 4 5 >"}
      console.log(resData.commentList);  
      const commentList = $('#comment-list');
      const paging = $('#paging');
      commentList.empty();
      paging.empty();

      $.each(resData.commentList, (i, comment) => {
        let str = '';
        // 댓글은 들여쓰기 (댓글 여는 <div>)
        if(comment.depth === 0) {
          str += '<div>';
        } else {
          str += '<div style="padding-left: 32px;">';
        }
        str += '<hr>';
        
        // 댓글 내용 표시
        if(comment.state === 0){
          str += '<div>삭제된 댓글입니다.</div>';
        } else {
          str += '<span>';
          str += comment.emp.empName;
          str += '(' + moment(comment.cmmtCreateDatetime).format('YYYY.MM.DD.') + ')';
          str += '</span>';
          str += '<div>' + comment.cmmtContent + '</div>';
          
          // 답글 버튼 (원글에만 답글 버튼이 생성됨)
          if(comment.depth === 0) {
            str += '<button type="button" class="btn btn-info btn-fill">댓글</button>';
          }
          
          // 삭제 버튼 (내가 작성한 댓글에만 삭제 버튼이 생성됨)
          if(Number('${sessionScope.emp.empCode}') === comment.emp.empCode) {
            str += '<button type="button" class="btn btn-info btn-fill" data-comment-no="' + comment.cmmtNo + '">삭제</button>';
          }
        }
        /************************ 답글 입력 화면 ************************/
        if(comment.depth === 0) {          
          str += '<div class="div-frm-reply blind">';
          str += '  <form class="frm-reply">';
          str += '    <input type="hidden" name="cmmtGroup" value="' + comment.cmmtGroup + '">';
          str += '    <input type="hidden" name="postNo" value="${post.postNo}">';
          str += '    <input type="hidden" name="empCode" value="${sessionScope.emp.empCode}">';
          str += '    <textarea name="cmmtContent" class="cmmtContent" placeholder="댓글 입력"></textarea>';
          str += '    <button type="button" class="btn btn-info btn-fill btn-register-reply">작성완료</button>';
          str += '  </form>';
          str += '</div>';
        }
        /****************************************************************/
        // 댓글 닫는 <div>
        str += '</div>';
        // 목록에 댓글 추가
        commentList.append(str);
      })
      // 페이징 표시
      paging.append(resData.paging);
    },
    error: (jqXHR) => {
      alert(jqXHR.statusText + '(' + jqXHR.status + ')');
    }
  })
}

// 페이징
const fnPaging = (p) => {
  page = p;
  fnCommentList();
}

//전역 객체
var frmBtn = $('#frm-btn');

// 블로그 편집 화면으로 이동
const fnEditBlog = () => {
  $('#btn-edit-blog').on('click', (evt) => {
    frmBtn.attr('action', '${contextPath}/community/free/modifyPost.do');
    frmBtn.submit();
  })
}

// 블로그 수정 결과 메시지
const fnModifyResult = () => {
  const modifyResult = '${modifyResult}';
  if(modifyResult !== '') {
    alert(modifyResult);
  }
}

// 블로그 삭제
const fnRemoveBlog = () => {
  $('#btn-remove-blog').on('click', (evt) => {
    fnCheckSignin();
    if(confirm('블로그를 삭제하면 모든 댓글이 함께 삭제됩니다. 삭제할까요?')){
      frmBtn.attr('action', '${contextPath}/blog/removeBlog.do');
      frmBtn.submit();
    }
  })
}

// 댓글 삭제
const fnRemoveComment = () => {
  $(document).on('click', '.btn-remove-comment', (evt) => {
    fnCheckSignin();
    if(!confirm('해당 댓글을 삭제할까요?')){
      return;
    }
    $.ajax({
      // 요청
      type: 'post',
      url: '${contextPath}community/free/removeComment.do',
      data: 'cmmtNo=' + $(evt.target).data('cmmtNo'),
      // 응답
      dataType: 'json',
      success: (resData) => {  // resData = {"removeResult": "댓글이 삭제되었습니다."}
        alert(resData.removeResult);
        fnCommentList();
      }
    })
  })
}

// 호출
$('#contents').on('click', fnCheckSignin);
$(document).on('click', '.reply-contents', fnCheckSignin);
fnRegisterComment();
fnCommentList();
fnSwitchingReplyInput();
fnEditBlog();
fnModifyResult();
fnRemoveBlog();
fnRemoveComment();

</script>