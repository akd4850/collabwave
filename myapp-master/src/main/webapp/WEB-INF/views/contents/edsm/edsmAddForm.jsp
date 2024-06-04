<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        ${messageSource.getMessage('add', null, locale)}
    </div>
    <div class="content table-responsive table-full-width">
        <form action="/edsm/registerForm.do" method="post">
            <div class="form-group">
                <label>
                    ${messageSource.getMessage('form', null, locale)} 
                    ${messageSource.getMessage('number', null, locale)}
                </label>
                <input type="text" class="form-control" placeholder="e0001" name="sampleDotCode">
            </div>
            <div class="form-group">
                <label>
                    ${messageSource.getMessage('formName', null, locale)} 
                </label>
                <input type="text" class="form-control" placeholder="${messageSource.getMessage('formName', null, locale)}" name="sampleTitle">
            </div>
            <div class="form-group">
                <label>
                    ${messageSource.getMessage('useYn', null, locale)} 
                    <input type="checkbox" name="useYn">
                </label>
            </div>
            <textarea name="sampleContent" id="editor">
            </textarea>
            <br>
            <input type="submit" class="btn btn-info btn-fill" style="margin-left:10px" value="${messageSource.getMessage('register', null, locale)}">
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