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

                        <form action="${contextPath}/edsm/edsmAddLine.do" method="post">
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
                            <div class="form-group">
                                <label>
                                    ${messageSource.getMessage('appr', null, locale)}${messageSource.getMessage('line', null, locale)} 
                                    ${messageSource.getMessage('name', null, locale)}
                                </label>
                                <input type="text" class="form-control" name="apprName">
                            </div>
                            <input type="submit" class="btn btn-info btn-fill" style="margin-left:10px" value="${messageSource.getMessage('register', null, locale)}">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${contextPath}/resources/js/jquery.min.js" type="text/javascript"></script>
<script src="${contextPath}/jstree/dist/jstree.min.js"></script>
<script>
    let seq = 1;

    $.ajax({
        type: 'GET',
        url: '${contextPath}/dept/getOrganization.do',
        data: 'deptCode=d0000',
        contentType: "application/json; charset=utf-8;",
        dataType: 'json',
        success: (resData) => {
            $('#jstree').jstree({
                'plugins': ["wholerow", "contextmenu"],
                'core': {
                    "check_callback": true,
                    'data': resData,
                    'themes': {
                        'name': 'proton',
                        'responsive': true
                    }
                },
                'contextmenu': {
                    "items": function(node) {
                        var tree = $('#jstree').jstree(true);
                        return {
                            "Menu1" : {
                                "label": "결재선 추가",
                                "_disabled": node.original.type == 'dept' || node.original.id == '${sessionScope.emp.empCode}',
                                action: function(obj) {
                                    let parentNode = $('#jstree').jstree(true).get_node(node.parents[0]);
                                    $('#appr-line').append(
                                        "<tr><td>" + seq++ + 
                                        "</td><td>" + node.text + 
                                        "</td><td>" + parentNode.text + 
                                        "</td><td>" + 
                                        "<input type='hidden' name='empCode' value='" + node.original.id + "'>" +
                                        "<i class='pe-7s-close-circle'></i>" + 
                                        "</td></tr>");
                                }
                            }
                        }
                    }
                }
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