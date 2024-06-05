<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<link rel="stylesheet" href="${contextPath}/jstree/dist/themes/proton/style.css" />

<div class="card">
    <div class="header">
        ${messageSource.getMessage('appr', null, locale)}${messageSource.getMessage('line', null, locale)} 
        ${messageSource.getMessage('add', null, locale)}
    </div>
    <div class="content table-responsive table-full-width">
        <div id="jstree"></div>
    </div>
</div>

<script src="${contextPath}/resources/js/jquery.min.js" type="text/javascript"></script>
<script src="${contextPath}/jstree/dist/jstree.min.js"></script>
<script>
    $.ajax({
        type: 'GET',
        url: '${contextPath}/dept/getOrganization.do',
        data: 'deptCode=d0000',
        contentType: "application/json; charset=utf-8;",
        dataType: 'json',
        success: (resData) => {
            $('#jstree').jstree({
                'plugins': ["wholerow"],
                'core': {
                    "check_callback": true,
                    'data': resData,
                    'themes': {
                        'name': 'proton',
                        'responsive': true
                    }
                },
            }).on('changed.jstree', function (e, data) {
                var i, j, r = [];
                for(i = 0, j = data.selected.length; i < j; i++) {
                    let node = data.instance.get_node( data.selected[i] );
                    if(node.original.type === 'dept' && node.original.isAjaxOpen !== true) {
                        getOrganization(node);
                    } else if(node.original.type === 'person') {
                    }
                }
            });
        },
        error: (jqXHR) => {
            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
        }
    });

    function getOrganization(node) {
        $.ajax({
            type: 'GET',
            url: '${contextPath}/dept/getOrganization.do',
            data: 'deptCode=' + node.original.id,
            contentType: "application/json; charset=utf-8;",
            success: (resData) => {
                var arr = $.parseJSON(resData);
                for(let i in arr) {
                    let myNode = arr[i];
                    $('#jstree').jstree(true).create_node(node, myNode, "last", () => {});
                }
                node.original.isAjaxOpen = true;
                $('#jstree').jstree("open_node", node);
            },
            error: (jqXHR) => {
                alert(jqXHR.statusText + '(' + jqXHR.status + ')');
            }
        });
    }
</script>