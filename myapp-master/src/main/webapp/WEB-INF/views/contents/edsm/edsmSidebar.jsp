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
</style>

<div class="card">
    <div class="header">
        전자 결재 메뉴
    </div>
    <div class="content">
        <div>
            <button type="button" class="btn btn-info btn-fill" data-toggle="modal" data-target="#formModal">새 결재 진행</button>
        </div>
        <ul class="list-unstyled subtab">
            <li><b>결제하기</b></li>
            <li>
                <ul class="list-unstyled subtab2">
                    <li><a href="${contextPath}/edsm/edsmWaiting.page">결재 대기 문서</a></li>
                    <li><a href="">결재 수신 문서</a></li>
                </ul>
            </li>
            <li><b>개인 문서함</b></li>
            <li>
                <ul class="list-unstyled subtab2">
                    <li><a href="${contextPath}/edsm/edsmDrafting.page">기안 문서함</a></li>
                    <li><a href="">결재 문서함</a></li>
                </ul>
            </li>
            <li><b>문서함</b></li>
            <li>
                <ul class="list-unstyled subtab2">
                    <li><a href="${contextPath}/edsm/edsmForm.do">전자결재 양식</a></li>
                </ul>
            </li>
            <li><b>결재 관리</b></li>
            <li>
                <ul class="list-unstyled subtab2">
                    <li><a href="${contextPath}/edsm/manageSign.page">내 사인 관리</a></li>
                    <li><a href="${contextPath}/edsm/manageLine.do">내 결재선 관리</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<div class="modal fade" id="formModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">결재양식 선택</h4>
            </div>
        <div class="modal-body">
            <form>
                <div class="form-group">
                    <select name="payform" class="selectpicker" data-title="--결재양식 선택--" data-style="btn-default btn-block" data-menu-style="dropdown-blue" id="payForm"
                    onchange="changeSample(this.value)">
                        <!--<option value="">업무협조</option>
                        <option value="">휴가신청</option>-->
                    </select>
                </div>
                <div class="form-group">
                    <div style="margin:10px;padding-bottom:100px;border:1px solid;" id="preview">
                    </div>
                </div>
            </form>
        </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info btn-fill" onclick="addAppr();">확인</button>
                <button type="button" class="btn btn-danger btn-fill" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<script>
let sampleList;
let sampleIndex = -1;
$('#formModal').on('show.bs.modal', function (event) {
    getSampleList();
});
function getSampleList() {
    $.ajax({
        type: 'GET',
        url: fnGetContextPath() + '/edsm/getSampleList.do',
        //data: 'deptCode=' + node.original.id,
        contentType: "application/json; charset=utf-8;",
        success: (resData) => {
            for(let i = 0; i < resData.sampleList.length; i++) {
                $('#payForm').append("<option value='" + i + "'>" + resData.sampleList[i].sampleTitle + "</option>");
            }
            
            $('#payForm').selectpicker('refresh');

            sampleList = resData.sampleList;
        },
        error: (jqXHR) => {
            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
        }
    });
}
function changeSample(index) {
    $('#preview').empty();
    $('#preview').append(sampleList[index].sampleContent);
    sampleIndex = index;
}
function addAppr() {
    if(sampleIndex == -1) return;
    location.href="${contextPath}/edsm/addAppr.page?sampleCode=" + sampleList[sampleIndex].sampleDotCode;
}
</script>

<!-- Default Modal 예제
    <button type="button" class="btn btn-info btn-fill" data-toggle="modal" data-target="#formModal">새 결재 진행</button>
<div class="modal fade" id="formModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">결재양식 선택</h4>
            </div>
        <div class="modal-body">
            <form>
                <div class="form-group">
                <label for="recipient-name" class="control-label">Recipient:</label>
                <input type="text" class="form-control" id="recipient-name">
                </div>
                <div class="form-group">
                <label for="message-text" class="control-label">Message:</label>
                <textarea class="form-control" id="message-text"></textarea>
                </div>
            </form>
        </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Send message</button>
            </div>
        </div>
    </div>
</div>
$('#formModal').on('show.bs.modal', function (event) {
    /*var button = $(event.relatedTarget) // Button that triggered the modal
    var recipient = button.data('whatever') // Extract info from data-* attributes
    var modal = $(this)
    modal.find('.modal-title').text('New message to ' + recipient)
    modal.find('.modal-body input').val(recipient)*/
});
-->