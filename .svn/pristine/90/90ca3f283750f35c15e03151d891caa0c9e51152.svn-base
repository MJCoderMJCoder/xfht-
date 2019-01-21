<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="pubilc_left fl">
	<div class="public_tittle">系统管理<span></span></div>
	<div class="left_nav_list">
   	  <c:forEach items="${sessionScope.user.role.roleModulars}" var="rms" varStatus="status">
			<c:if test="${rms.functionModular.id==6}">
			<c:forEach items="${rms.functionModular.childs}" var="child1" varStatus="status">
				<c:choose> 
				<c:when test="${empty child1.moduleUrl}">
					<div class="nav_on subNav">
			        	<h3 class="left_nav_icon1 on">
			        		<a href="#">${child1.moduleName }</a>
			        	</h3>
			      	</div>
			      	<ul class="navContent">
			  		<c:forEach items="${child1.childs}" var="child2" varStatus="status">
			  			<c:forEach items="${sessionScope.user.role.roleModulars}" var="rms" varStatus="status">
				  			<c:if test="${rms.functionModular.id==child2.id}">
          						<li><a href="${child2.moduleUrl }"><span>${child2.moduleName }</span></a></li>
          					</c:if>
          				</c:forEach>
		  			</c:forEach>
		  			</ul>
				</c:when> 
				<c:otherwise> 
			  		<c:forEach items="${sessionScope.user.role.roleModulars}" var="rms" varStatus="status">
				  	<c:if test="${rms.functionModular.id==child1.id}">
					<div class="nav_on subNav"> 
	  					<h3 class="left_nav_icon2">
	  						<a href="${child1.moduleUrl }">${child1.moduleName }</a>
	  					</h3>
	 				</div>   
	 				</c:if>
		  			</c:forEach>
				</c:otherwise> 
				</c:choose>
			</c:forEach>
			</c:if>
		</c:forEach>
   	  <!-- <div class="nav_on subNav">
        <h3 class="left_nav_icon2"><a href="cm_user_list">用户管理</a></h3>
      </div>
   	  <div class="nav_on subNav">
        <h3 class="left_nav_icon2"><a href="cm_organization_list">部门管理</a></h3>
      </div>
   	  <div class="nav_on subNav">
        <h3 class="left_nav_icon2"><a href="cm_role_list">角色权限管理</a></h3>
      </div>
   	  <div class="nav_on subNav">
        <h3 class="left_nav_icon2"><a href="#">工作流管理</a></h3>
      </div>
   	  <div class="nav_on subNav">
        <h3 class="left_nav_icon2"><a href="cm_dictionary_list">字典管理</a></h3>
      </div>
      <div class="nav_on subNav">
        <h3 class="left_nav_icon2"><a href="help_list">帮助中心管理</a></h3>
      </div>
      <div class="nav_on subNav">
        <h3 class="left_nav_icon2"><a href="cm_operationLog_list">日志管理</a></h3>
      </div>
      <div class="nav_on subNav">
        <h3 class="left_nav_icon2"><a href="cm_user_editPassWord">修改密码</a></h3>
      </div>
      <div class="nav_on subNav">
        <h3 class="left_nav_icon2"><a href="cm_user_resetPassWord">重置密码</a></h3>
      </div> -->
      
    </div>
</div>