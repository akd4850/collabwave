<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>CKEDITOR TEST</title>

<script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/classic/ckeditor.js"></script>

</head>

<body>
    <h1>Classic editor</h1>
    <form action="/reference/register.do" method="post">
        <textarea name="content" id="editor">
        </textarea>
        <p><input type="submit" value="test"></p>
    </form>
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

    // Assuming there is a <button id="submit">Submit</button> in your application.
    /*document.querySelector( '#test' ).addEventListener( 'click', () => {
        const editorData = editor.getData();
    } );*/
    </script>
</body>

</html>