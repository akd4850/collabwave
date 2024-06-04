<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<style>
    .ck-editor__editable {
        min-height: 500px;
    }
</style>

<div class="card">
    <div class="header">
        ${messageSource.getMessage('edsm', null, locale)} 
        ${messageSource.getMessage('form', null, locale)} 
        ${messageSource.getMessage('modify', null, locale)}
    </div>
    <div class="content table-responsive table-full-width">
        <form action="/edsm/modifyForm.do" method="post">
            <div class="form-group">
                <label>
                    ${messageSource.getMessage('form', null, locale)} 
                    ${messageSource.getMessage('number', null, locale)}
                </label>
                <input type="text" class="form-control" value="${sample.sampleDotCode}" disabled>
                <input type="hidden" name="sampleDotCode" value="${sample.sampleDotCode}">
            </div>
            <div class="form-group">
                <label>
                    ${messageSource.getMessage('formName', null, locale)} 
                </label>
                <input type="text" class="form-control" placeholder="${messageSource.getMessage('formName', null, locale)}" name="sampleTitle" value="${sample.sampleTitle}">
            </div>
            <div class="form-group">
                <label>
                    ${messageSource.getMessage('useYn', null, locale)} 
                    <c:if test="${fn:contains(sample.useYn, 'Y')}">
                        <input type="checkbox" name="useYn" checked>
                    </c:if>
                    <c:if test="${fn:contains(sample.useYn, 'N')}">
                        <input type="checkbox" name="useYn">
                    </c:if>
                </label>
            </div>
            <textarea name="sampleContent" id="editor">
                ${sample.sampleContent}
            </textarea>
            <br>
            <input type="submit" class="btn btn-info btn-fill" style="margin-left:10px" value="${messageSource.getMessage('modify', null, locale)}">
            <input type="button" class="btn btn-info btn-fill" value="${messageSource.getMessage('delete', null, locale)}" onclick="location.href='/edsm/removeForm.do?code=${sample.sampleDotCode}'">
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
</script>