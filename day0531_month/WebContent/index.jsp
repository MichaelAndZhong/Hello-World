<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>展示页面</title>
    

 <link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css"></link>
 <script type="text/javascript" src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/jquery-1.8.2.min.js"></script>
  <script type="text/javascript">
  		//分页
  		function fenye(current){
				$("#current").val(current);
				$("#myfrom").submit();
			}
		//添加
		function add(){
			location.href="<%=request.getContextPath() %>/toAdd.action";
		}
		
		//删除的功能
		function delete(id){
			if(confirm("确认删除编号为"+id+"的信息？")){
				alert("删除成功");
				location.href="<%=request.getContextPath() %>/delete.action?id="+id;
			}			
		}
		
		//修改的功能
		function update(id){
			if (confirm("确认要修改"+id+"的数据吗？")){
					location.href="<%=request.getContextPath() %>/update.action?id="+id;		
				}
		}
		
		
		//全选，全不选
		function checkAll(flag){
			$(".ck").attr("checked",flag);
		
		}
		
		//实现批量删除
		function delAll(){
			var ids="";
			$(".ck:checked").each(function(){
				ids+=","+$(this).val();
			});
			if (ids.length>0){
				//进行批量删除
				ids=ids.substring(1);
				//alert(ids);
				//ajax进行批量删除
				$.ajax({
					url:"<%=request.getContextPath() %>/deleteAll.action",
					type:"post",
					data:{ids:ids},
					dataType:"json",
					success:function(flag){
							if (flag){
								alert("删除成功");
								location.herf="<%=request.getContextPath() %>/list.action";
							
							}else{
								alert("亲，删除失败哟");
							}
					
					
					}
							
				});
			}else{
				alert("亲，请选择要删除的数据");
			
			}
		
		
		}
  </script>
  <body>
    	 <form action="<%=request.getContextPath() %>/list.action" method="post" id="myfrom">
					<input type="hidden" name="current" value="${page.currentPage}" id="current" />
					<input type="text" name="mohu" value="${mohu}" id="mohu" />
					<input type="submit" value="查询" />
					
		</form>
		<table>
			<tr>
				<td><input type="checkbox" onclick="checkAll(this.checked)"></td>
				<td>员工编号</td>
				<td>员工姓名</td>
				<td>员工年龄</td>
				<td>员工所在部门</td>
				<td>所属领导</td>
				<td>领导电话</td>
				<td>
					<input type="button" value="" onclick="add()" />
					操作
					<input type="button" value="" onclick="delAll()" />
				</td>
			</tr>
			<c:forEach items="${list}" var="s" >
			<tr>
				<td><input type="checkbox" value="${s.id}" name="ids" class="ck"></td>
				<td>${s.id}</td> 
				<td>${s.name}</td>
				<td>${s.age}</td>
				<td>${s.dname}</td>
				<td>${s.lname}</td>
				<td>${s.tel}</td>
				<td>
					<input type="button" value="" onclick="deleteEmp(${s.id})" />||
					<input type="button" value="" onclick="updateEmp(${s.id})" />
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="11">
					<input type="button" value="首页" onclick="fenye(1)"/>
					<input type="button" value="上一页" onclick="fenye(${page.previousPage})"/>
					<input type="button" value="下一页" onclick="fenye(${page.nextPage})"/>
					<input type="button" value="末页" onclick="fenye(${page.pageCount})"/>
				</td>
			</tr>
			
		</table>
		
  </body>
</html>
