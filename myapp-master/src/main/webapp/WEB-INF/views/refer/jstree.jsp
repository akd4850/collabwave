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

<title>JSTree TEST</title>

<!--link href="${contextPath}/resources/jstree/style.min.css" rel="stylesheet" />
<style>
    .demo { overflow:auto; border:1px solid silver; min-height:100px; }
</style>-->

<link rel="stylesheet" href="${contextPath}/jstree/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${contextPath}/jstree/dist/themes/proton/style.css" />
<!--link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" /-->

<link rel="icon" href="${contextPath}/jstree/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon-precomposed" href="${contextPath}/jstree/apple-touch-icon-precomposed.png" />

<script src="${contextPath}/resources/js/jquery.min.js" type="text/javascript"></script>
<script src="${contextPath}/jstree/jstree.min.js"></script>

<style>
    .proton-demo{
        max-width: 100%;
        padding: 10px;
        border-radius: 3px;
    }
</style>

</head>

<body>
    <h1>JS Tree</h1>
    <h2>일반 JSON 데이터로 테스트</h2>
    <h3>jsp 파일에서 id 가 data 인 부분을 참고바람 - jquery 포함</h3>
    <h4>JSON 데이터가 어떻게 구성되는지 참고할 것</h4>
	<div id="data" class="proton-demo"></div>
    
    <script>
        $('#data').jstree({
            'plugins': ["wholerow", "dnd"],
            'core' : {
                'themes': {
                    'name': 'proton',
                    'responsive': true
                },
                'data' : [
                    { 
                        "text" : "Root node", 
                        "state" : { "opened" : true },
                        "children" : [
                            { "text" : "Child node 1" },
                            { 
                                "text" : "Child node 2" ,
                                "state" : { "opened" : true },
                                "children" : [
                                    { "text" : "Child sub nod 1" },
                                    { "text" : "Child sub nod 2" }
                                ]
                            }
                    ]}
                ]
            },
            //'plugins' : [ "dnd"],       // 드래그 앤 드랍 가능 플러그인
            //'plugins' : [ "checkbox"]   // 노드마다 체크박스 추가 플러그인
        });
    </script>

    <h2>클릭 이벤트 테스트</h2>
    <div id="evts" class="proton-demo"></div>
    <script>
        $('#evts')
		.on("changed.jstree", function (e, data) {
			if(data.selected.length) {
				alert('The selected node is: ' + data.instance.get_node(data.selected[0]).text);
			}
		})
		.jstree({
            'plugins': ["wholerow"],
			'core' : {
                'themes': {
                    'name': 'proton',
                    'responsive': true
                },
				'multiple' : false,
				'data' : [
					{   "text" : "Root node",
                        "state" : { "opened" : true },
                        "children" : [
							{ "text" : "Child node 1", "id" : 1 },
							{ "text" : "Child node 2" }
					]}
				]
			}
		});
    </script>

    <h2>우클릭 메뉴 테스트</h2>
    <div id="jstree_menu" class="proton-demo"></div>
    <script>
        $('#jstree_menu').jstree({
            'plugins': ["wholerow"],
            'core' : {
                'themes': {
                    'name': 'proton',
                    'responsive': true
                },
				'multiple' : false,
				'data' : [
					{   "text" : "Root node",
                        "state" : { 
                            "opened" : true,
                            "depth" : 0
                        },
                        "children" : [
							{ 
                                "text" : "Child node 1",
                                "depth" : 1
                            },
							{ 
                                "text" : "Child node 2",
                                "depth" : 1
                            }
					]}
				]
			},
            'plugins' : ["contextmenu"],
            'contextmenu' : {
                "items": function($node) {
                    var tree = $('#jstree_menu').jstree(true);
                    return {
                        "Menu1" : {
                            "label" : "수정하기",
                            "icon" : "menu1",
                            "_disabled" : $node.state.depth == 0,
                            action: function(obj) {
                                // 해당 메뉴 클릭시 행동(액션)
                                alert('이 메뉴를 눌렀군');
                            }
                        }
                    }
                }
            }
        });
    </script>

    <h2>조직도</h2>
    <div id="jstree-proton-3" style="margin-top:20px;" class="proton-demo"></div>
    <script>
    $('#jstree-proton-3').jstree({
        'plugins': ["wholerow"],
        'core': {
            'data': [{
                    "text": "COLLABWAVE",
                    "state": {
                            "opened": true
                        },
                    "icon": "${contextPath}/jstree/images/management-4-16.png",
                    "children": [{
                        "text": "경영지원실",
                        "icon": "${contextPath}/jstree/images/management-4-16.png",
                        "state": {
                            "opened": true
                        }
                        }, {
                            "text": "김민식",
                            "icon": "${contextPath}/jstree/images/user-128-16.png"
                        }, {
                            "text": "인사과",
                            "state": {
                                "opened": true
                            },
                            "children": [{
                                    "text": "김다래",
                                    "icon": "${contextPath}/jstree/images/user-128-16.png"
                                }]
                        }, {
                            "text": "김영찬",
                            "icon": "${contextPath}/jstree/images/user-128-16.png"
                        }, {
                            "text": "염상훈",
                            "icon": "${contextPath}/jstree/images/user-128-16.png"
                        }]
                }, {
                    "text": "최홍석",
                    "icon": "${contextPath}/jstree/images/user-128-16.png"
                }
            ],
            'themes': {
                'name': 'proton',
                'responsive': true
            }
        }
    });
    </script>
</body>

</html>