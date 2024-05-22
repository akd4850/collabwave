<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<!-- Page Wrapping (start) : Style retention -->
<div id="divCustomWrapper" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 10pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px;"><!-- 1. Title Section (start) -->
<div class="titleSection" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 20pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px;">업무협조</div><!-- 1. Title Section (end) --><!-- 2. Draft Section (Start) -->
<div class="partition" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 10pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px;"><!-- 2.1 Drafter Information (Start) -->
<div class="left" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 10pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px;">
<table style="width:1190px; height:131px;"><colgroup><col width="65"><col width="200"></colgroup>
    <tbody>
        <tr>
            <td class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
                문서번호
            </td>
            <td class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
                <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="0" data-dsl="{{label:docNo}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;">문서번호</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="0" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
            </td>
            <td rowspan="4" class="noneborder"></td>
            <td rowspan="4" style="width:20px;" class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">결재선</td>
            <td style="width:60px;" class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">사원</td>
            <td style="width:60px;" class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">팀장</td>
        </tr>
        <tr>
            <td class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
                작 성 일
            </td>
            <td class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
                <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDate}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;">기안일</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
            </td>
            <td rowspan="2" class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">서명</td>
            <td rowspan="2" class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">서명</td>
        </tr>
        <tr>
            <td class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
                작성부서
            </td>
            <td class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
                <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="2" data-dsl="{{label:draftDept}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;">기안부서</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
            </td>
        </tr>
        <tr>
            <td class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
                작 성 자
            </td>
            <td class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
                <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="3" data-dsl="{{label:draftUser}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;">기안자</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>
            </td>
            <td class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"></td>
            <td class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"></td>
        </tr>
    </tbody>
</table>
</div>
<!-- Page Wrapping (end) -->
<!----------------------------------------Style Start---------------------------------------->
<style type="text/css">
#divCustomWrapper { word-break: break-all; font-family: malgun gothic, dotum, arial, tahoma; /*width:802px !important;*/ }
#divCustomWrapper * { /*max-width: 800px !important;*/ }
#divCustomWrapper .titleSection { text-align: center; font-size: 20pt; font-weight: bold; margin-bottom: 30px !important; margin-top: 20px !important; }
#divCustomWrapper .detailSection > * { margin-bottom: 10px; }
#divCustomWrapper .detailSection { /*width:800px*/ !important; clear:both; margin-top: 10px !important; vertical-align: middle; }
#divCustomWrapper table { border-collapse: collapse; word-break:break-all; }
#divCustomWrapper div.partition { display: flex; }
#divCustomWrapper div.partition.left { flex:1; }
#divCustomWrapper div.inaRowRight { flex:1; text-align: right;}
#divCustomWrapper td.BCel { font-size: 9pt !important; height:28px; border: 1px solid black !important; padding: 3px 5px 3px 5px; /*top right bottom left*/}
#divCustomWrapper td.ACel { font-size: 9pt !important; height:28px; border: 1px solid black !important; padding: 3px 5px 3px 5px; text-align: center !important; background: #eee; font-weight: bold;}
#divCustomWrapper td.noneborder { border: none !important; }
#divCustomWrapper td.center { text-align: center; }
#divCustomWrapper td.right { text-align: right; }
#divCustomWrapper td.editor { height: 300px; vertical-align: top;}
#divCustomWrapper td.area { height: 120px; vertical-align: middle;}
#divCustomWrapper .div_button { word-break:break-all; padding: 3px; margin-top:2px; margin-bottom:2px !important; height: 22px; vertical-align: middle; }
#divCustomWrapper a.button { background: rgb(102, 102, 102); color: rgb(255, 255, 255); padding: 2px 5px; border-radius: 3px; }
p.freeP{font-weight: normal; font-size: 9pt; margin: 3px 1px 3px 5px;}
</style>
<style type="text/css">
@media print {
.viewModeHiddenPart {display: none;}
h1,h2,h3,h4,h5,dl,dt,dd,ul,li,ol,th,td,p,blockquote,form,fieldset,legend,div,body {-webkit-print-color-adjust:exact;}
#divCustomWrapper {margin-left:auto !important; margin-right:auto !important;}
/*#divCustomWrapper td.ACel {border:none\9 !important; outline:black solid 0.5px\9 !important;}
#divCustomWrapper td.BCel {border:none\9 !important; outline:black solid 0.5px\9 !important;}*/
}
</style>