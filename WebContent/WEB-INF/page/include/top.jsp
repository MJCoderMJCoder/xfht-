<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page" /> 
<div class="top">
	<div class="top-login">
		<p>供应商评价平台<span>V 1.0</span></p>
	</div>
	<ul class="top-nav">
		<li class="admin"><a href="#"><img src="${path}/static/images/index_admin.png" class="admin_img"/><span>${sessionScope.user.username}</span></a></li>
		<li class="home"><a href="/go_helpcenter_1"><img src="${path}/static/images/index_bangzh.png"/><span>帮助中心</span></a></li>
		<li class="signout"><a href="/cm_logout"><img src="${path}/static/images/index_tuichu.png"/><span>退出</span></a></li>
	</ul>
</div>
<div class="top_nav">
	<ul>
		
		<li><a href="javascript:mainMenu(${sessionScope.user.id });" class="top_nav_01">主控制台</a></li>
		
		<c:forEach items="${sessionScope.user.role.roleModulars}" var="rms" varStatus="status">
			<c:if test="${empty rms.functionModular.personId }">
				<li>
					<a href="${rms.functionModular.moduleUrl }" class="${rms.functionModular.imageUrl }">${rms.functionModular.moduleName }</a>
				</li>
			</c:if>
 		</c:forEach>
	</ul>
</div>
<script type="text/javascript">
function mainMenu(id){
	var form = $("<form>");   //定义一个form表单
    form.attr('style', 'display:none');   //在form表单中添加查询参数
    form.attr('target', '');
    form.attr('method', 'post');
    form.attr('action', "/cm_index");
	
	var bookingId = $('<input>');
	bookingId.attr('type', 'hidden');
	bookingId.attr('name', 'personId');
	bookingId.attr('value', id);
	form.append(bookingId);
	$(document.body).append(form);
	form.submit();
}

</script>
