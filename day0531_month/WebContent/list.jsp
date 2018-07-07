<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>展示页面</title>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
 <script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/jquery-1.8.2.min.js"></script>
  <body>
  <script type="text/javascript">
  	function checkAll(flag){
  		$(".ck").attr("checked",flag);
  	}
  	
  	function goodIn(gid){
  		location.href="<%=request.getContextPath() %>/toadd.action?gid="+gid;
  	}
  	
	function goodOut(gid){
  		location.href="<%=request.getContextPath() %>/toOut.action?gid="+gid;
  	}
	
	function checkIn(gid){
		location.href="<%=request.getContextPath() %>/checkIn.action?gid="+gid;
	}
	
	function checkOut(gid){
		location.href="<%=request.getContextPath() %>/checkOut.action?gid="+gid;
	}
  
  
  </script>
  <h1 class="h1" align="center">沃尔玛超市-进销存管理系统</h1>
 
		<table class="table table-striped table-bordered">
			<tr align="center">
				<td><input type="checkbox" onclick="checkAll(this.checked)"></td>
				<td>商品编号</td>
				<td>商品名称</td>
				<td>商品产地</td>
				<td>商品库存</td>
				<td>重量</td>
				<td>包装单位</td>
				<td>最近入库日期</td>
				<td>最近出库日期</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${list}" var="s" >
			<tr align="center">
				<td><input type="checkbox" value="${s.gid}" name="ids" class="ck"></td>
				<td>${s.gid}</td> 
				<td>${s.gname}</td>
				<td>${s.place}</td>
				<td>${s.store}</td>
				<td>${s.weight}</td>
				<td>${s.unit}</td>
				<td>${s.intime}</td>
				<td>${s.outtime}</td>
				<td>
					<button class="btn" type="button"  onclick="goodIn(${s.gid})">商品入库</button>
					<button class="btn" type="button"  onclick="goodOut(${s.gid})">商品出库</button>
					 <button class="btn" type="button"  onclick="checkIn(${s.gid})">查看商品入库记录</button>
  <button class="btn" type="button"  onclick="checkOut(${s.gid})">查看商品出库记录</button>
				
				</td>
			</tr>
			</c:forEach>
			
			
		</table>
		
  </body>
</html>
