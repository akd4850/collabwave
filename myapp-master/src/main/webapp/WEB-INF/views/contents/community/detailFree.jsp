<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<script>
//DOMContentLoaded 이벤트 핸들러 내에서 에디터 초기화
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

    ClassicEditor
        .create(document.querySelector("#editor"), {
            readOnly: true,
            toolbar: []
        })
        .then(editor => {
            console.log(editor);
        })
        .catch(error => {
            console.error(error);
        });

    fnCommentList(); // 초기 댓글 목록 불러오기
});

//편집 화면으로 이동
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
</script>

<style>
.comment-container {
    display: flex;
    align-items: center;
}

.comment-header {
    margin-right: 10px;
}

.table {
    width: 100%;
    border-collapse: collapse;
}

.table th, .table td {
    padding: 10px;
    border: 1px solid #ccc;
}

.comment-content {
    padding: 10px;
}

.comment-item th {
    width: 100px; /* 원하는 너비로 설정 */
    max-width: 300px; /* 최대 너비 설정 */
    word-wrap: break-word; /* 긴 단어를 줄바꿈 */
    white-space: nowrap; /* 공백을 줄바꿈하지 않도록 */
    overflow: hidden; /* 넘치는 텍스트를 숨김 */
    text-overflow: ellipsis; /* 넘치는 텍스트에 생략 기호(...) 추가 */
}

.comment-actions {
    width: 150px; /* 원하는 너비 값으로 설정 */
}

#paging {
	font-size: 18px;
	text-align: center;
}

</style>

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
    <c:when test="${sessionEmpCode == authorEmpCode || sessionEmpCode == 'admin'}">
        <!-- sessionEmpCode와 authorEmpCode가 같을 때(admin이 아닌 경우) 또는 admin일 때 -->
        <button onclick="editPost()" id="btn-edit" name="btn-edit" class="btn btn-info btn-fill" style="margin-right: 5px;">편집</button>
    </c:when>
</c:choose>
														<input type="hidden" name="brdCode" id="brdCode1"
																value="FREE"> <input type="hidden"
																id="contextPath" value="${contextPath}">
														<button type="button" onclick="backToList()"
																class="btn btn-info btn-fill">목록보기</button>
												</div>
										</td>
								</tr>
						</tbody>

						<!-- 댓글 개수 -->
						<tr>
								<th id="comment-count" style="width: 100px">댓글 ${commentCount}개</th>
								<td></td>
						</tr>

						<!-- 댓글 목록 -->
						<tr>
								<td colspan="2">
									<div id="comment-list"></div>
								</td>
						</tr>
						<tr>
								<td colspan="2">
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
														<input type="hidden" name="cmmtStatus" value="1">
														<input type="hidden" name="empCode" value="${emp.empCode}">
														<input type="hidden" name="empName" value="${emp.empName}">
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
// 페이징
const fnPaging = (p) => {
  page = p;
  fnCommentList();
}

var page = 1;
var sessionEmpCode = "${sessionScope.emp.empCode}";

function fnCommentList() {
    $.ajax({
        type: 'GET',
        url: '${contextPath}/community/detailFree/commentList.do',
        data: 'postNo=${post.postNo}&page=' + page,
        contentType: "application/json; charset=utf-8;",
        success: function(resData) {
            const commentList = $('#comment-list');
            const paging = $('#paging');
            commentList.empty();
            paging.empty();

            if (resData.commentList.length === 0) {
                commentList.append('<div>댓글이 없습니다</div>');
                $('#comment-count').html('댓글 0개');
                return;
            } else {
                let table = '<table class="table table-hover table-striped"><tbody>';
                for (let i = 0; i < resData.commentList.length; i++) {
                    let comment = resData.commentList[i];
                    let str = '<tr class="comment-item" data-comment-no="' + comment.cmmtNo + '">';
                    if (comment.cmmtStatus === 0) {
                        str += '<td colspan="2">삭제된 댓글입니다.</td>';
                    } else {
                        str += '<th>' + comment.emp.empName + ' (' + moment(comment.cmmtCreateDatetime).format('YYYY.MM.DD') + ')</th>';
                        str += '<td class="comment-content">' + comment.cmmtContent + '</td>';
                        if (sessionEmpCode === comment.emp.empCode) {
                            console.log("댓글 작성자 코드: " + comment.emp.empCode);
                            str += '<td class="comment-actions">';
                            str += '<button type="button" class="btn btn-info btn-fill btn-edit-comment" data-comment-no="' + comment.cmmtNo + '">수정</button>';
                            str += '<button type="button" class="btn btn-info btn-fill btn-remove-comment" data-comment-no="' + comment.cmmtNo + '">삭제</button>';
                            str += '</td>';
                        } else {
                            str += '<td style="width: 100px;"></td>'; // 수정 및 삭제 버튼이 없는 경우에도 공간 확보
                        }
                    }
                    str += '</tr>';
                    table += str;
                }
                table += '</tbody></table>';
                commentList.append(table);
                
                // 댓글 수(count) 업데이트
                const commentCount = resData.commentList.length;
                console.log(commentCount);
                $('#comment-count').html(`댓글 ${commentCount}개`);
            }
            
            // 페이징 표시
            paging.append(resData.paging);
        },
        error: function(jqXHR) {
            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
        }
    });
}


function fnRegisterComment() {
    $('#btn-comment-register').on('click', function(evt) {
        evt.preventDefault();
        $.ajax({
            type: 'POST',
            url: '${contextPath}/community/registerComment.do',
            dataType: 'json',
            data: $('#frm-comment').serialize(),
            success: function(resData) {
                if (resData.insertComment === 1) {
                    alert('댓글이 등록되었습니다.');
                    $('#cmmtContent').val('');
                    location.reload();  // Add this line to refresh the page
                } else {
                    alert('댓글 등록이 실패했습니다.');
                }
            },
            error: function(jqXHR) {
                alert(jqXHR.statusText + '(' + jqXHR.status + ')');
            }
        });
        fnCommentList();
    });
}

function fnModifyComment() {
    $(document).on('click', '.btn-edit-comment', function() {
        const commentItem = $(this).closest('.comment-item');
        const commentNo = commentItem.data('comment-no');
        console.log("commentNo:" + commentNo);
        const commentContent = commentItem.find('.comment-content').text().trim();
        console.log("commentContent:" + commentContent);

        commentItem.find('.comment-content').html(`
            <div style="display: flex;">
                <input type="text" class="form-control modify-comment-input" value="${commentContent}" style="flex: 1;">
                <button type="button" class="btn btn-primary btn-save-comment" data-comment-no="${commentNo}">저장</button>
            </div>
        `);

        // 다른 편집 중인 행이 있다면 이전 편집 상태를 초기화
        $('.btn-save-comment').not($(this)).each(function() {
            const $row = $(this).closest('.comment-item');
            const originalContent = $row.find('.modify-comment-input').data('original-content');
            $row.find('.comment-content').text(originalContent);
        });
    });

    $(document).on('click', '.btn-save-comment', function() {
        const commentItem = $(this).closest('.comment-item');
        const newCommentContent = commentItem.find('.modify-comment-input').val().trim();
        const commentNo = commentItem.data('comment-no');
        
        if (newCommentContent !== '') {
            $.ajax({
                type: 'PUT',
                url: '${contextPath}/community/modifyComment.do',
                data: {
                    cmmtNo: commentNo,
                    cmmtContent: newCommentContent
                },
                success: function(resData) {
                    if (resData.modifyComment === 1) {
                        alert('댓글이 수정되었습니다.');
                        fnCommentList();
                    } else {
                        alert('댓글 수정이 실패했습니다.');
                    }
                },
                error: function(jqXHR) {
                    alert(jqXHR.statusText + '(' + jqXHR.status + ')');
                }
            });
        } else {
            alert("댓글 내용을 입력해주세요.");
        }
    });
}


function fnRemoveComment() {
    $(document).on('click', '.btn-remove-comment', function() {
        if (!confirm('해당 댓글을 삭제할까요?')) {
            return;
        }
        $.ajax({
            type: 'POST',
            url: '${contextPath}/community/detailFree/removeComment.do',
            data: { cmmtNo: $(this).data('comment-no') },
            dataType: 'json',
            success: function(resData) {
                alert(resData.removeResult);
                location.reload();  // Add this line to refresh the page
            },
            error: function(jqXHR) {
                alert(jqXHR.statusText + '(' + jqXHR.status + ')');
            }
        });
    });
}



$(document).ready(function() {
    fnRegisterComment();
    fnCommentList();
    fnModifyComment();
    fnRemoveComment();
});

</script>