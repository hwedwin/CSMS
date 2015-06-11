<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!-- AUI Documentation -->
<!DOCTYPE html>
<html>
<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>仓库管理</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<!-- Favicons -->

		<link rel="stylesheet" href="css/bootstrap.min.css">

		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/manage/documentation/assets/images/icons/apple-touch-icon-144-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/manage/documentation/assets/images/icons/apple-touch-icon-114-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/manage/documentation/assets/images/icons/apple-touch-icon-72-precomposed.png">
		<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/manage/documentation/assets/images/icons/apple-touch-icon-57-precomposed.png">
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/manage/documentation/assets/images/icons/favicon.png">

		<!--[if lt IE 9]>
          <script src="${pageContext.request.contextPath}/manage/documentation/assets/js/minified/core/html5shiv.min.js"></script>
          <script src="${pageContext.request.contextPath}/manage/documentation/assets/js/minified/core/respond.min.js"></script>
        <![endif]-->

		<!-- Fides Admin CSS Core -->

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/manage/documentation/assets/css/minified/aui-production.min.css">

		<!-- Theme UI -->

		<link id="layout-theme" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/manage/documentation/assets/themes/minified/fides/color-schemes/dark-blue.min.css">

		<!-- Fides Admin Responsive -->

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/manage/documentation/assets/themes/minified/fides/common.min.css">

		<link id="theme-animations" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/manage/documentation/assets/themes/minified/fides/animations.min.css">

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/manage/documentation/assets/themes/minified/fides/responsive.min.css">

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/manage/documentation/css/style.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/manage/documentation/css/DialogBySHF.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/manage/documentation/css/bootstrap.min.css">
		<!-- Fides Admin JS -->

		<script type="text/javascript" src="${pageContext.request.contextPath}/manage/documentation/assets/js/minified/aui-production.min.js"></script>

		<script type="text/javascript" src="${pageContext.request.contextPath}/manage/documentation/assets/js/minified/core/raphael.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/manage/documentation/assets/js/minified/widgets/charts-justgage.min.js"></script>

		<script type="text/javascript" src="${pageContext.request.contextPath}/manage/documentation/assets/js/DialogBySHF.js"></script>
		<script src="${pageContext.request.contextPath }/manage/documentation/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/manage/documentation/js/jquery.min.js"></script>
	

	</head>
<body>
	<div class="rm-from-production">
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/manage/_assets/syntax-highlighter/scripts/shCore.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/manage/_assets/syntax-highlighter/scripts/shBrushPhp.js"></script>
		<link type="text/css" rel="stylesheet"
			href="${pageContext.request.contextPath}/manage/_assets/syntax-highlighter/styles/shCoreDefault.css">
		<script type="text/javascript">
			SyntaxHighlighter.all();
		</script>
	</div>

	<div id="loading"
		class="ui-front loader ui-widget-overlay bg-white opacity-100">
		<img src="${pageContext.request.contextPath}/manage/documentation/assets/images/loader-dark.gif" alt="">
	</div>
			<div id="page-title">
				<h3>
					Welcome to 仓库管理 <small></small>
				</h3>

			</div>
	
			<div id="page-content">

				<!-- 主要表格 -->
				<!-- 表格 -->
				<div class="example-box">
					<div class="example-code">
						<form action="${pageContext.request.contextPath }/storage_query.do" method="post">
							<div class="form-row">
								<div class="form-label col-md-1 labelstyle" style="margin-right:5px;">
								<label for="queryNumber">仓库编号: </label>
								</div>
								<div class="form-input col-md-3 textstyle">
									<input style="width:200px;height:28px;" type="text" name="number" id="queryNumber">
								</div>
								<div class="form-label col-md-1 labelstyle" style="margin-right:5px;">
									<label for="queryName"> 仓库名称: </label>
								</div>
								<div  class="form-input col-md-3 textstyle">
									<input style="width:200px;height:28px;" type="text" name="name" id="queryName">
								</div>
								<button type="submit"class="btn medium primary-bg" style="margin-left:10px;" title="">
								<span class="button-content">查询</span></button>
								
							</div>
						
							
						</form>
					</div>
					<div class="example-code">
					
						<a data-toggle="modal"  data-target="#addModal" title=".icon-plus-square-o" class="tooltip-button btn small bg-yellow" title="添加" href="#">
							<i class="glyph-icon icon-plus-square-o"></i>
						</a><br><br>

						<table class="table table-condensed">
							<thead>
								<tr>
									<th>序号</th>
									<th>仓库编号</th>
									<th>仓库名称</th>
									<th>存储量</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="list" status="status" >
									<tr>
									<td>${(pageNum-1)*10+status.count }</td>
									<td id="numberText_${id }">${number }</td>
									<td id="nameText_${id }">${name }</td>
									<td id="storageNumText_${id }">${storage_num }</td>
									<td>
									<a data-toggle="modal"  data-target="#updateModal" href="#" class="btn small bg-blue-alt tooltip-button" data-placement="top" title="更新" onclick="showText(${id},'${contacts }','${contacts_phone }')">  
									<i class="glyph-icon icon-edit"></i> </a>
									<a data-toggle="modal"  data-target="#deleteModal" href="#" class="btn small bg-red tooltip-button" data-placement="top" title="删除" onclick="showId(${id})">
									<i class="glyph-icon icon-remove"></i> </a>
									</td>
									</tr>
								</s:iterator>
								
							</tbody>
						</table>
						<!-- 如果是查询结果 -->
						<s:if test="#querystatue != null">
							<!-- start分页,有数据的时候才显示分页. -->
							<s:if test="totalRecord>0">
								<div class="col-md-3" style="float:right; margin-bottom:20px; width:500px;">
									<div class="button-group center-div">
										<a href="${pageContext.request.contextPath }/storage_query.do?pageNum=${pageNum-1}&name=${name}&number=${number}" class="btn large ui-state-default" <s:if test="pageNum == 1 ">disabled="disabled"</s:if>>
										<i class="glyph-icon icon-chevron-left"></i> </a>
										<s:iterator begin="%{startPage}" end="%{endPage}" var="i">
											<a href="${pageContext.request.contextPath }/storage_query.do?pageNum=${i}&name=${name}&number=${number}" class="btn large ui-state-default" <s:if test="pageNum==#i">disabled="disabled"</s:if>>${i }</a>
										</s:iterator>
										<a href="${pageContext.request.contextPath }/storage_query.do?pageNum=${pageNum+1}&name=${name}&number=${number}" class="btn large ui-state-default" <s:if test="pageNum == totalPage">disabled="disabled"</s:if>>
										<i class="glyph-icon icon-chevron-right"></i> </a>
									</div>
								</div>
							</s:if>
							<!-- end 分页 -->
						</s:if>
						<!-- 如果不是查询结果，而是原始分页 -->
						<s:else>
							<!-- start分页,有数据的时候才显示分页. -->
							<s:if test="totalRecord>0">
								<div class="col-md-3" style="float:right; margin-bottom:20px; width:500px;">
									<div class="button-group center-div">
										<a href="${pageContext.request.contextPath }/storage_list.do?pageNum=${pageNum-1}" class="btn large ui-state-default" <s:if test="pageNum == 1 ">disabled="disabled"</s:if>>
										<i class="glyph-icon icon-chevron-left"></i> </a>
										<s:iterator begin="%{startPage}" end="%{endPage}" var="i">
											<a href="${pageContext.request.contextPath }/storage_list.do?pageNum=${i}" class="btn large ui-state-default" <s:if test="pageNum==#i">disabled="disabled"</s:if>>${i }</a>
										</s:iterator>
										<a href="${pageContext.request.contextPath }/storage_list.do?pageNum=${pageNum+1}" class="btn large ui-state-default" <s:if test="pageNum == totalPage">disabled="disabled"</s:if>>
										<i class="glyph-icon icon-chevron-right"></i> </a>
									</div>
								</div>
							</s:if>
							<!-- end 分页 -->
						</s:else>
						
					</div>

				</div>
			</div>
			<!-- #page-content -->
			
			
					
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  >
  <div class="modal-dialog">
    <div class="modal-content">
      <form class="form-horizontal" action="${pageContext.request.contextPath }/storage_add.do" method="post">
      <div class="modal-header" >
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加仓库</h4>
      </div>
      <div class="modal-body" style="margin:20px;">
      	<input type="hidden" name="pageNum" value="${pageNum }" >
		  <div class="form-group">
		    <label for="storageNum">仓库编号</label>
		    <input type="text" class="form-control" id="storageNum" name="number" placeholder="请输入仓库编号">
		  </div>
		  <div class="form-group">
		    <label for="storageName">仓库名称</label>
		    <input type="text" class="form-control" id="storageName" name="name" placeholder="请数据仓库名称">
		  </div>
		   <div class="form-group">
		    <label for="contactsName">联系人</label>
		    <input type="text" class="form-control" id="contactsName" name="contacts" placeholder="请输入联系人姓名">
		  </div>
		   <div class="form-group">
		    <label for="contacts_phone">联系电话</label>
		    <input type="text" class="form-control" id="contacts_phone" name="contacts_phone" placeholder="请输入联系电话">
		  </div>
		    <div class="form-group">
		    <label for="storage_num">仓储量</label>
		    <input type="text" class="form-control" id="storage_num" name="storage_num" placeholder="请输入仓库容量">
		  </div> 
      </div>
      <div class="modal-footer">
       	<button type="submit"class="btn medium primary-bg" style="margin-left:10px;" title="">
		<span class="button-content">添加 </span></button>
		<button type="reset"class="btn medium primary-bg" style="margin-left:10px;" data-dismiss="modal" aria-label="Close">
		<span class="button-content">取消</span></button>
      </div>
      </form>
    </div>
  </div>
</div>






<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form class="form-horizontal" action="${pageContext.request.contextPath }/storage_edit.do" method="post">
      <div class="modal-header" >
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">更新仓库</h4>
      </div>
      <div class="modal-body" style="margin:20px;">
		 <input type="hidden" name="pageNum" value="${pageNum }" >
		 <input type="hidden" name="id" id="editId">
		  <div class="form-group">
		    <label for="storageNum">仓库编号</label>
		    <input type="text" class="form-control" id="shownumber" name="number" placeholder="请输入仓库编号">
		  </div>
		  <div class="form-group">
		    <label for="storageName">仓库名称</label>
		    <input type="text" class="form-control" id="showname" name="name" placeholder="请数据仓库名称">
		  </div>
		   <div class="form-group">
		    <label for="contactsName">联系人</label>
		    <input type="text" class="form-control" id="showcontactsName" name="contacts" placeholder="请输入联系人姓名">
		  </div>
		   <div class="form-group">
		    <label for="contacts_phone">联系电话</label>
		    <input type="text" class="form-control" id="showphone" name="contacts_phone" placeholder="请输入联系电话">
		  </div>
		    <div class="form-group">
		    <label for="storage_num">仓储量</label>
		    <input type="text" class="form-control" id="shownum" name="storage_num" placeholder="请输入仓库容量">
		  </div> 
      </div>
      <div class="modal-footer">
       	<button type="submit"class="btn medium primary-bg" style="margin-left:10px;" title="">
		<span class="button-content">更新</span></button>
		<button type="reset"class="btn medium primary-bg" style="margin-left:10px;" data-dismiss="modal" aria-label="Close">
		<span class="button-content">取消</span></button>
      </div>
      </form>
    </div>
  </div>
</div>




<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form class="form-horizontal" action="${pageContext.request.contextPath }/storage_delete.do">
      <div class="modal-header" >
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">删除仓库</h4>
      </div>
      <div class="modal-body" style="margin:20px;">
       <input type="hidden"  name="pageNum" value="${pageNum }" >
        <input type="hidden" name="id" id="deleteId" >
		  <p>确认删除吗？</p>
      </div>
      <div class="modal-footer">
       	<button type="submit"class="btn medium primary-bg" style="margin-left:10px;" title="">
		<span class="button-content">确定</span></button>
		<button type="reset"class="btn medium primary-bg" style="margin-left:10px;" data-dismiss="modal" aria-label="Close">
		<span class="button-content">取消</span></button>
      </div>
      </form>
    </div>
  </div>
</div>

</body>
<script type="text/javascript">
	function showId(id){
		$("#deleteId").val(id);
	}
	function showText(id,contacts,contacts_phone){
		var number = $("#numberText_"+id).text();
		var name = $("#nameText_"+id).text();
		var storage_num = $("#storageNumText_"+id).text();
		$("#shownumber").val(number);
		$("#showname").val(name);
		$("#shownum").val(storage_num);
		$("#editId").val(id);
		$("#showcontactsName").val(contacts);
		$("#showphone").val(contacts_phone);
	}
</script>

</html>
