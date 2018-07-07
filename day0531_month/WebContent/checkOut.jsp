<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
 <script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/jquery-1.8.2.min.js"></script>
 
<title>商品入库</title>
<script type="text/javascript">
	var gid="${param.gid}";
	
	$(function(){
			$.ajax({
				url:"<%=request.getContextPath() %>/getGoodInById.action",
				data:{gid:gid},
				type:"post",
				dataType:"json",
				success:function(obj){
					var g=obj.good;
					$("#gid").val(g.gid);
					$("#gname").val(g.gname);
					$("#place").val(g.place);
				}
			});
	});
	
	
	
</script>
</head>
<body>
	<h1 class="h1" align="center">商品出库记录</h1>
	<hr>
		商品编号
		<input type="text" name="gid" id="gid">
		商品名称
		<input type="text" name="gname" id="gname">
		商品产地
		<input type="text" name="place" id="place">

	<table class="table table-striped table-bordered">
			<tr align="center">
				<td>出库日期</td>
				<td>出库数量</td>
			</tr>
			<c:forEach items="${list}" var="c">
				<tr>
					<td>${c.outtime}</td>
					<td>${c.chu}</td>
				</tr>
			</c:forEach> 
			
	</table>
</body>
</html>