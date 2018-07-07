<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				url:"<%=request.getContextPath() %>/getGoodById.action",
				data:{gid:gid},
				type:"post",
				dataType:"json",
				success:function(obj){
					var good=obj.good;
					$("#gid").val(good.gid);
					$("#gname").val(good.gname);
					$("#place").val(good.place);
					$("#store").val(good.store);
				}
			});
			
			
			//==========================
			$("#tj").click(function(){
				var chu=$("#chu").val();
				$.ajax({
					url:"<%=request.getContextPath() %>/chuku.action",
					data:$("#form").serialize(),
					type:"post",
					dataType:"json",
					success:function(msg){
						if(msg){
							alert("出库成功");
							location.href="<%=request.getContextPath() %>/list.action";
						}else{
							alert("出库失败");
						}
					}
				});
				
				
			});
	});
	
	
	
</script>
</head>
<body>
	<h1 class="h1" align="center">商品出库</h1>
	<hr>
	<form action="" id="form">
		<table class="table table-striped table-bordered">
			<tr align="center">
				<td>商品编号</td>
				<td><input type="text" name="gid" id="gid"></td>
			</tr>
			<tr align="center">
				<td>商品名称</td>
				<td><input type="text" name="gname" id="gname"></td>
			</tr>
			<tr align="center">
				<td>商品产地</td>
				<td><input type="text" name="place" id="place"></td>
			</tr>
			<tr align="center">
				<td>当前库存</td>
				<td><input type="text" name="store" id="store"></td>
			</tr>
			<tr align="center">
				<td>出库数量</td>
				<td><input type="text" name="chu" id="chu"></td>
			</tr>
			<tr align="center">
				<td></td>
				<td><input type="button" id="tj" value="提交"></td>
			</tr>
		</table>
	
	
	
	
	</form>
</body>
</html>