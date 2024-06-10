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
            //event.preventDefault();
            $('#edsmContent').val($('#sampleContent').html());
            //$('#add-appr').submit();
        });
    });
</script>