<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page" /> 
<!--翻页开始--> 
<div class="pages"> 
 <div id="Pagination"> 
  <div class="pagination">
   <a href="javascript:pageing(1 )" class="ep">首页</a>
   	<c:choose>
   	<c:when test="${pageNum <= 1}">
   <a href="javascript:void(0)"class="current prev"><i></i>上一页</a>
   	</c:when>  
  	<c:otherwise>  
   <a href="javascript:pageing(${pageNum-1 } )"class="current prev"><i></i>上一页</a>
  	</c:otherwise>
 	</c:choose>
	<c:choose> 
	<c:when test="${pageNum < 4 }">
		<c:choose> 
		<c:when test="${totalPages < 4 }">
			<c:forEach var="i" begin="1" end="${totalPages }" varStatus="status">
	       	<c:choose>
	    	<c:when test="${status.index == pageNum}">
	        <a class="current">${status.index}</a>
	    	</c:when>  
	   		<c:otherwise>  
	        <a href="javascript:pageing(${status.index} )">${status.index}</a>
	   		</c:otherwise>
	  		</c:choose>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<c:forEach var="i" begin="1" end="5" varStatus="status">
		       	<c:choose>
		    	<c:when test="${status.index == pageNum}">
		        <a class="current">${status.index}</a>
		    	</c:when>  
		   		<c:otherwise>  
		        <a href="javascript:pageing(${status.index })">${status.index}</a>
		   		</c:otherwise>
		  		</c:choose>
				</c:forEach>   
			</c:otherwise>
		</c:choose>
	</c:when> 
	<c:when test="${pageNum+4 >= totalPages }">
		<c:forEach var="i" begin="${totalPages - 4}" end="${totalPages }" varStatus="status">
		<c:choose>
		<c:when test="${status.index == pageNum}">
  		<a class="current">${status.index}</a>
		</c:when>  
		<c:otherwise>  
  		<a href="javascript:pageing(${status.index })">${status.index}</a>
		</c:otherwise>
		</c:choose>
		</c:forEach>		
	</c:when> 
	<c:otherwise>    
		<c:forEach var="i" begin="${pageNum - 2}" end="${pageNum + 2 }" varStatus="status">
		<c:choose>
		<c:when test="${status.index == pageNum}">
  		<a class="current">${status.index}</a>
		</c:when>  
		<c:otherwise>  
  		<a href="javascript:pageing(${status.index })">${status.index}</a>
		</c:otherwise>
		</c:choose>
		</c:forEach>
	</c:otherwise> 
	</c:choose>
   
   <!-- <a class="current">1</a>
   <a href="#">2</a>
   <a href="#">3</a>
   <a href="#">4</a>
   <span class="pagination-break">...</span>
   <a href="#" class="ep">15</a> -->
   
   	<c:choose>
   	<c:when test="${pageNum+1 > totalPages}">
   <a href="javascript:void(0)"class="next"><i></i>下一页</a>
   	</c:when>  
  	<c:otherwise>  
   <a href="javascript:pageing(${pageNum+1 } )"class="next"><i></i>下一页</a>
  	</c:otherwise>
 	</c:choose>
 	
   <a href="javascript:pageing(${totalPages })" class="ep">末页</a>
  </div> 
 </div> 
 <div class="searchPage"> 
  <span class="page-sum">共<strong class="allPage">${totalPages }</strong>页</span> 
  <span class="page-go">跳转<input type="text" id="inputPageNum" name="inputPageNum"/>页</span> 
  <a href="javascript:inputPageing();" class="page-btn">GO</a> 
 </div> 
</div> 
<!--翻页结束-->
<script type="text/javascript">
function pageing(pageNum){
	var form = $("#searchForm"); 
	var pageNumInput = $('<input>');
	pageNumInput.attr('type', 'hidden');
	pageNumInput.attr('name', 'pageNum');
	pageNumInput.attr('value', pageNum);
	form.append(pageNumInput);
	form.submit();
}

function inputPageing(){
	var page = $("#inputPageNum").val().trim();
	if(page == ""){
		$("#notice").text("请输入跳转页码！");
		$(".ts_block").css("display","block");
		return false;
	}
	if((/^(\+|-)?\d+$/.test( page )) && page > 0){
		var form = $("#searchForm"); 
		var pageNumInput = $('<input>');
		pageNumInput.attr('type', 'hidden');
		pageNumInput.attr('name', 'pageNum');
		pageNumInput.attr('value', page);
		form.append(pageNumInput);
		form.submit();
	}else{
		$("#notice").text("页码请输入正整数！");
		$(".ts_block").css("display","block");
		return false;
	}
}
</script>