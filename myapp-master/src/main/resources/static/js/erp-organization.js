let apprSeq = 1;
let empArr = [];
let nameArr = [];
let myEmpCode = '';

let bIsSignTable = false;
let sampleContent;
let signTable;
let h2;

window.addEventListener('DOMContentLoaded', function(){
    $.ajax({
        type: 'GET',
        url: fnGetContextPath() + '/dept/getOrganization.do',
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
                                "_disabled": node.original.type == 'dept' || node.original.id == myEmpCode || empArr.includes(node.original.id) == true,
                                action: function(obj) {
									
                                    empArr.push(node.original.id);
                                    nameArr.push(node.text);
                                    let parentNode = $('#jstree').jstree(true).get_node(node.parents[0]);
                                    let dept = (parentNode.text === undefined) ? '' : parentNode.text;
                                    
                                    $('#appr-line').append(
                                        "<tr id=tr_" + node.original.id + "><td>" + apprSeq++ + 
                                        "</td><td>" + node.text + 
                                        "</td><td>" + dept + 
                                        "</td><td>" + 
                                        "<input type='hidden' name='empCode' value='" + node.original.id + "'>" +
                                        "<input type='button' onclick='deleteApprEmpcodeFromLine(\"" + node.original.id + "\", \"" + node.text + "\");" + 
                                        "deleteApprFromContent();' " +
                                        "value='삭제' class='btn btn-info btn-fill'>" +
                                        "</td></tr>");
                                        
                                    if(bIsSignTable) {
										$('#tr1').append('<td></td>');	
										$('#tr2').append('<td class="td-img">' + node.text + '</td>');
										$('#tr3').append('<td></td>');
									}								
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
});

function getOrganization(node) {
    $.ajax({
        type: 'GET',
        url: fnGetContextPath() + '/dept/getOrganization.do',
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

function deleteApprEmpcodeFromLine(empCode, empName) {
	let tdSeq = 1;
    $('#appr-line:last > #tr_' + empCode).remove();
    removeItem(empArr, empCode);
    removeItem(nameArr, empName);
    apprSeq -= 1;
    $('#appr-line:last > tr > td:nth-child(1)').each(function() {
		$(this).html(tdSeq++);
	});
}

function removeItem(arr, value) {
  var index = arr.indexOf(value);
  if (index > -1) {
    arr.splice(index, 1);
  }
  return arr;
}

function deleteApprFromContent() {
	if(bIsSignTable == false) return;
	
	$('#sampleContent').empty();
	$('#sampleContent').append(sampleContent);
	
	h2 = $('h2');
	$(signTable).appendTo(h2);
	
	let hWidth = 20;
    $('.appr-table').css('width', hWidth + 100);
    
    for(let i = 0; i < nameArr.length; i++) {
		$('#tr1').append('<td></td>');	
		$('#tr2').append('<td class="td-img">' + nameArr[i] + '</td>');
		$('#tr3').append('<td></td>');
	}
}