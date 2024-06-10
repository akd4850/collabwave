<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<link rel="stylesheet" href="${contextPath}/jstree/dist/themes/proton/style.css" />

<form action="${contextPath}/edsm/addAppr.do" method="post" id="add-appr">
    <div class="card">
        <div class="header">
            ${messageSource.getMessage('new', null, locale)} 
            ${messageSource.getMessage('appr', null, locale)} 
            ${messageSource.getMessage('progress', null, locale)}
        </div>
        <div class="content table-responsive table-full-width">
            <div class="row" style="margin-left: 10px;">
                <div class="col-md-3">
                    <div class="card">
                        <div class="header">
                            ${messageSource.getMessage('organizationChart', null, locale)}
                        </div>
                        <div class="content table-responsive table-full-width">
                            <div id="jstree"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="card">
                        <div class="header">
                            ${messageSource.getMessage('appr', null, locale)}${messageSource.getMessage('line', null, locale)}
                        </div>
                        <div class="content">
                            <p class="text-info">
                                ${messageSource.getMessage('apprLineHelpMessage', null, locale)}
                            </p>
                            <button type="button" class="btn btn-info btn-fill" data-toggle="modal" data-target="#formModalLine">내 결재선</button>
                            <table class="table table-hover table-striped">
                                <thead>
                                    <th>${messageSource.getMessage('turn', null, locale)}</th>
                                    <th>${messageSource.getMessage('name', null, locale)}</th>
                                    <th>${messageSource.getMessage('dept', null, locale)}</th>
                                    <th>${messageSource.getMessage('delete', null, locale)}</th>                                
                                </thead>
                                <tbody id="appr-line">
                                </tbody>
                            </table>
                            <br>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="제목" name="edsmTitle"/>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control datetimepicker" placeholder="기안 시작 일자" name="edsmStartDatetime"/>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control datetimepicker" placeholder="기안 만료 일자" name="edsmExpireDatetime"/>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-left:10px;margin-right:10px;">
                <div class="col-md-12">
                    <div class="card">                        
                        <div class="content" id="sampleContent">                        
                        </div>
                        <div class="content">
                            <input type="hidden" name="sampleDotCode" value="${sample.sampleDotCode}">
                            <input type="hidden" id="edsmContent" name="edsmContent">
                            <input type="submit" class="btn btn-info btn-fill" style="margin-left:10px" value="${messageSource.getMessage('register', null, locale)}">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<style>
.appr-table > tbody > tr > td { font-size: 15px; text-align: center; height:20px; }
.td-img { min-width: 100px; }
.appr-table { min-width: 120px; }
</style>
<script>
    window.addEventListener('DOMContentLoaded', function(){
        myEmpCode = '${sessionScope.emp.empCode}';
        sampleContent = '${sample.sampleContent}';

        $('#sampleContent').append('${sample.sampleContent}');
        
        h2 = $('h2');
        
        signTable = `
            <br/><br/>
            <table class="table table-bordered table-condensed appr-table">
                <tbody>
                    <tr id="tr1">
                        <td rowspan="3" style="width:20px;">결<br/>재</td>
                        <td></td>
                    </tr>
                    <tr id="tr2">
                        <td class="td-img">${sessionScope.emp.empName}</td>
                    </tr>
                    <tr id="tr3">
                        <td></td>
                    </tr>
                </tbody>
            </table>
        `;

        $(signTable).appendTo(h2);

        let hWidth = 20;
        $('.appr-table').css('width', hWidth + 100);

        bIsSignTable = true;
        
        $('#add-appr').submit(function(event){
            $('#edsmContent').val($('#sampleContent').html());
        });
    });
</script>

<div class="modal fade" id="formModalLine" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">내 결재선 선택</h4>
            </div>
        <div class="modal-body">
            <table class="table table-hover table-striped" id="tr-line">
                <tr>
                    <th>결재선 이름</th>
                    <th>선택</th>
                </tr>
            </table>
        </div>
            <div class="modal-footer">
                <!--<button type="button" class="btn btn-info btn-fill" onclick="">확인</button>-->
                <button type="button" class="btn btn-danger btn-fill" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<script>
let aprrNo = -1;

$('#formModalLine').on('show.bs.modal', function (event) {
    getLineList();
});
$('#formModalLine').on('hidden.bs.modal', function (event) {
    if(apprNo != -1) {
        $.ajax({
            type: 'GET',
            url: fnGetContextPath() + '/edsm/getMyLineDetail.do',
            data: 'apprNo=' + apprNo,
            contentType: "application/json; charset=utf-8;",
            success: (resData) => {
                console.log(resData);
                let list = resData.itemList;
                for(let i = 0; i < list.length; i++) {
                    empArr.push(list[i].customAppr.emp.empCode);
                    nameArr.push(list[i].customAppr.emp.empName);
                    let dept = (list[i].customAppr.emp.dept.deptName === undefined) ? '' : list[i].customAppr.emp.dept.deptName;
                    
                    $('#appr-line').append(
                        "<tr id=tr_" + list[i].customAppr.emp.empCode + "><td>" + apprSeq++ + 
                        "</td><td>" + list[i].customAppr.emp.empName + 
                        "</td><td>" + dept + 
                        "</td><td>" + 
                        "<input type='hidden' name='empCode' value='" + list[i].customAppr.emp.empCode + "'>" +
                        "<input type='button' onclick='deleteApprEmpcodeFromLine(\"" + list[i].customAppr.emp.empCode + "\", \"" + list[i].customAppr.emp.empName + "\");" + 
                        "deleteApprFromContent();' " +
                        "value='삭제' class='btn btn-info btn-fill'>" +
                        "</td></tr>");
                        
                    if(bIsSignTable) {
                        $('#tr1').append('<td></td>');	
                        $('#tr2').append('<td class="td-img">' + list[i].customAppr.emp.empName + '</td>');
                        $('#tr3').append('<td></td>');
                    }			
                }
            },
            error: (jqXHR) => {
                alert(jqXHR.statusText + '(' + jqXHR.status + ')');
            }
        })
    }
})
function setLineNumber(lineNumber) {
    apprNo = lineNumber;
}

function getLineList() {
    $.ajax({
        type: 'GET',
        url: fnGetContextPath() + '/edsm/getLineList.do',
        data: 'empCode=${sessionScope.emp.empCode}',
        contentType: "application/json; charset=utf-8;",
        success: (resData) => {
            //customApprNo, lineName
            for(let i = 0; i < resData.lineList.length; i++) {
                $('#tr-line').append(`
                    <tr>
                        <td>` + resData.lineList[i].lineName + `</td>
                        <td><button type="button" class="btn btn-xs btn-fill" style="background-color:green;border:none" data-dismiss="modal" onclick="setLineNumber(` + resData.lineList[i].customApprNo + `)">선택</button></td>
                    </tr>
                `);
            }
        },
        error: (jqXHR) => {
            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
        }
    });
}
</script>