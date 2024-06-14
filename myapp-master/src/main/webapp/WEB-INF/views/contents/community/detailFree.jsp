<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<script>
//DOMContentLoaded 이벤트 핸들러 내에서 에디터 초기화
document.addEventListener("DOMContentLoaded", function() {
	//편집 버튼 숨기기	
	var sessionEmpCode = "${sessionScope.emp.empCode}"; // 세션에서 가져온 empCode
	var authorEmpCode = "${post.emp.empCode}"; // 작성자의 empCode
	
	// 세션의 empCode와 작성자의 empCode를 비교하여 버튼을 숨기기
	if (sessionEmpCode != authorEmpCode) {
	    var editButton = document.getElementById("btn-edit");
	        editButton.style.display = "none";
	}
	
	ClassicEditor
    .create(document.querySelector("#editor"), {
        readOnly: true, // 에디터를 읽기 전용으로 설정
        toolbar: [] // 툴바를 비활성화하여 사용자가 편집할 수 없도록 함
    })
    .then(editor => {
        console.log(editor);
    })
    .catch(error => {
        console.error(error);
    });
  
});

//편집 화면으로 이동
function editPost() {
var postNo = document.getElementById('postNo').value;
location.href = '${contextPath}/community/edit?postNo=' + postNo;
}

//목록화면으로 이동
function backToList() {
var brdCode = document.getElementById('brdCode').value;
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
        break;
}
location.href = destinationUrl; // 목적지 URL로 이동
}
</script>

<div class="card">
		<div class="content table-responsive table-full-width">
				<table class="table table-hover table-striped">
						<tbody>
								<tr>
										<th style="width: 100px">작성자</th>
										<td>${post.emp.empName}</td>
								</tr>
								<tr>
										<th>등록일</th>
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
										<td colspan="2"><textarea name="postContent" id="editor"
														class="form-control">
                           ${post.postContent}
                        </textarea></td>
								</tr>
								<tr>
										<td colspan="2">
												<div style="display: flex; justify-content: flex-end;">
														<input type="hidden" id="postNo" value="${post.postNo}">
														<c:choose>
																<c:when test="${sessionEmpCode == authorEmpCode}">
																		<button onclick="editPost()" id="btn-edit"
																				name="btn-edit" class="btn btn-info btn-fill"
																				style="margin-right: 5px;">편집</button>
																</c:when>
														</c:choose>
														<input type="hidden" name="brdCode" id="brdCode"
																value="FREE"> <input type="hidden"
																id="contextPath" value="${contextPath}">
														<button type="button" onclick="backToList()"
																class="btn btn-info btn-fill">목록보기</button>
												</div>
										</td>
								</tr>
						</tbody>
				</table>

				<table class="table table-hover table-striped">
						<tr>
								<th style="width: 100px">댓글 ${commentCount}개</th>
								<td></td>
						</tr>

						<!-- 댓글 목록 -->
						<tr>
								<th></th>
								<td>
										<div id="comment-list"></div>
										<div id="paging"></div>
								</td>
						</tr>

						<!-- 댓글 등록 창 -->
						<form id="frm-comment">
								<tr>
										<th style="width: 100px;">${sessionScope.emp.empName}</th>
										<td>
												<div style="display: flex;">
														<input type="text" name="cmmtContent" id="cmmtContent"
																class="form-control" style="flex: 1;"
																placeholder="댓글을 입력하세요"> <input type="hidden"
																name="postNo" value="${post.postNo}">
														<c:if test="${not empty sessionScope.emp.empCode}">
																<button type="submit" id="btn-comment-register"
																		class="btn btn-info btn-fill">댓글등록</button>
														</c:if>
												</div>
										</td>
								</tr>
						</form>

				</table>
		</div>
</div>

<script src="${contextPath}/ckeditor5/ckeditor.js"></script>
<script src="${contextPath}/ckeditor5/script.js"></script>
<script>

//댓글 목록 가져오기
window.addEventListener('DOMContentLoaded', function(){	
	const fnCommentList = () => {
	  $.ajax({
			type: 'GET',
			url: fnGetContextPath() + '/community/detailFree/commentList.do',
			data: 'postNo=${postNo}', // postNo를 쿼리 파라미터로 전달
			contentType: "application/json; charset=utf-8;",
			success: (resData) => {  
				const commentList = $('#comment-list');
				commentList.empty();
				
				// 댓글이 비어있는 경우
				if (resData.length === 0) {
					commentList.append('<div>댓글이 없습니다</div>');
				} else {
							for(let i = 0; i < resData.commentList.length; i++) {
								let comment = resData.commentList[i];

								// 댓글이 있는 경우		        $.each(resData.commentList, (i, comment) => {
								let str = '<div class="comment-item" data-comment-no="' + comment.cmmtNo + '">';

								// 댓글 내용 표시
								if (comment.cmmtStatus === 0) {
									str += '<div>삭제된 댓글입니다.</div>';
								} else {									
									str += '<span>';
									str += comment.emp.empName;
									str += '(' + moment(comment.cmmtCreateDatetime).format('YYYY.MM.DD.') + ')';
									str += '</span>';
									str += '<div class="comment-content">' + comment.cmmtContent + '</div>';

									// 삭제 버튼 (내가 작성한 댓글에만 삭제 버튼이 생성됨)
									if (Number('${sessionScope.emp.empCode}') === comment.emp.empCode) {
										str += '<button type="button" class="btn btn-info btn-fill btn-edit-comment" data-comment-no="' + comment.cmmtNo + '">수정</button>';
										str += '<button type="button" class="btn btn-info btn-fill btn-remove-comment" data-comment-no="' + comment.cmmtNo + '">삭제</button>';
									}
								}

								// 댓글 닫는 <div>
								str += '</div>';
								// 목록에 댓글 추가
								commentList.append(str);
							}						
				}
			}
		});
	}
		      
	
	fnCommentList();

	    
				
		// 댓글 수정 함수
		const modifyComment = () => {
		  const commentItem = $(this).closest('.comment-item');
		  const commentNo = commentItem.data('comment-no');
		  const commentContent = commentItem.find('.comment-content').text().trim();
		
		  // 기존 댓글 내용을 입력 상자로 변경
		  commentItem.find('.comment-content').html(`
		    <input type="text" class="form-control modify-comment-input" value="${commentContent}">
		    <button type="button" class="btn btn-primary btn-save-comment" data-comment-no="${commentNo}">저장</button>
		  `);
		
		  // 저장 버튼 클릭 이벤트 핸들러 추가
		  $(document).on('click', '.btn-save-comment', function() {
			  const commentItem = $(this).closest('.comment-item');
			  const newCommentContent = commentItem.find('.modify-comment-input').val().trim();
			  const commentNo = $(this).data('comment-no');
		
		    if (newCommentContent !== '') {
		      $.ajax({
		        type: 'PUT',
		        url: fnGetContextPath() + '/community/detailFree/registerComment.do',
		        data: JSON.stringify({ cmmtNo: commentNo, cmmtContent: newCommentContent }),
		        contentType: 'application/json',
		        dataType: 'json',
		        success: (resData) => {
		          if (resData.modifyCount === 1) {
		            alert('댓글이 수정되었습니다.');
		            // 댓글 목록 다시 불러오기
		            fnCommentList();
		          } else {
		            alert('댓글 수정이 실패했습니다.');
		          }
		        },
		        error: (jqXHR) => {
		          alert(jqXHR.statusText + '(' + jqXHR.status + ')');
		        }
		      });
		    }
		  });
		}

		// 댓글 수정 버튼 이벤트 핸들러 추가
		$('.btn-edit-comment').on('click', modifyComment);
  
});

//댓글 등록
const fnRegisterComment = () => {
  $('#btn-comment-register').on('click', (evt) => {
    evt.preventDefault(); // 폼의 기본 동작 방지    
    $.ajax({
      // 요청
      type: 'POST',
      url: '${contextPath}/community/detailFree/registerComment.do', // 수정된 부분
      data: $('#frm-comment').serialize(),
      // 응답
      dataType: 'json',
      success: (resData) => {  // resData = {"insertCount": 1}
        if(resData.insertCount === 1) {
          alert('댓글이 등록되었습니다.');
          fnCommentList();
          $('#contents').val('');
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


// 댓글 삭제
const fnRemoveComment = () => {
  $(document).on('click', '.btn-remove-comment', (evt) => {
    if (!confirm('해당 댓글을 삭제할까요?')) {
      return;
    }
    $.ajax({
        // 요청
        type: 'post',
        url: '${contextPath}/detailFree/removeComment.do',
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
//fnCommentList();
//fnRegisterComment();
//fnRemoveComment();

</script>