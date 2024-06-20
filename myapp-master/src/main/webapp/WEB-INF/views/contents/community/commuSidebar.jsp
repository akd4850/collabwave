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
            <li><a href="/community/dept">부서게시판</a></li>
            <li><a href="/community/ref">자료실</a></li>
            <li><a href="/community/free">자유게시판</a></li>
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
            <form id="frm-new-brd"
                  method="post" 
                  action="${contextPath}/community/registerNewBrd.do">
                <div class="modal-body">
                        
                        <div class="form-group">
                            <h6>커뮤니티 이름</h6>
                            <input type="text" id="brdName" name="brdName" class="form-control search-input" style="width: 400px;">
                        </div>
                        <hr>
                        <div class="form-group">
                            <h6>커뮤니티 코드</h6>
                            <input type="text" id="brdCode" name="brdCode" class="form-control search-input" style="width: 400px;">
                        </div>
                        <hr>
                        <div class="form-group">
                            <h6>커뮤니티 URL</h6>
                            <input type="text" id="brdUrl" name="brdUrl" class="form-control search-input" style="width: 400px;">
                        </div>
                        <input type="hidden" id="cmmtAuthYn" name="cmmtAuthYn" value="N">
                </div>
                <div class="modal-footer">
                    <button type="submit" id="frm-new-brd" name="frm-new-brd" class="btn btn-info btn-fill">확인</button>
                    <button type="button" class="btn btn-danger btn-fill" data-dismiss="modal">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    $("#frm-new-brd").submit(function(event) {
        event.preventDefault(); // 폼 기본 제출 방지

        // 폼 데이터 가져오기
        var brdName = $("#brdName").val();
        var brdCode = $("#brdCode").val();
        var brdUrl = $("#brdUrl").val();

        // Ajax 요청
        $.ajax({
            url: $(this).attr('action'),
            type: $(this).attr('method'),
            data: {
                brdName: brdName,
                brdCode: brdCode,
                brdUrl: brdUrl,
                cmmtAuthYn: 'N' // 필요한 추가 데이터
            },
            success: function(response) {
                // 성공적인 응답을 받은 경우 새로운 리스트 아이템 추가
                var newItem = '<li><a href="/community/' + brdUrl + '">' + brdName + '</a></li>';
                $("#community-list").append(newItem);

                // 폼 초기화
                $("#brdName").val('');
                $("#brdCode").val('');
                $("#brdUrl").val('');

                // 모달 닫기 (모달을 사용하는 경우)
                $('#newBrdModal').modal('hide');
            },
            error: function(xhr, status, error) {
                // 에러 처리
                alert("게시판 생성에 실패했습니다. 다시 시도해 주세요.");
            }
        });
    });
});
</script>

