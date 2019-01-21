<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网上信访</title>

<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/tcc.css" rel="stylesheet" />

<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery.SuperSlide.2.1.js"></script>
<script type="text/javascript" src="${path}/static/js/ajaxfileupload.js" ></script>
<script src="${path}/static/js/date.js"></script><!--时间控件js-->

<script type="text/javascript">
	//内容部分高度自适应
	$(function() {
		$(".center").css("height", $(window).height() - 170);
	});
	var h = (window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
	$(".center").css({
		"height" : h - 170
	});
	window.onresize = resize;
	function resize() {
		var h = (window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
		$(".center").css({
			"height" : h - 170
		});
	}
</script>
</head>
<body>
	<jsp:include page="../../include/top.jsp"></jsp:include>
	<div class="center">
		<jsp:include page="../../include/public_voice_register_left.jsp"></jsp:include>
		<div class="pubilc_right fl">
			<div class="pubilc_right_cn">
				<form action="cm_visitingRegistration_save" id="addForm" name="addForm" method="post">
					<div class="cfcx">
						<div class="cfcx_2">
							<h1 class="kzt_bt">
								<span>举报人员信息及反应情况</span>
							</h1>
							<div class="table_eg">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
									<tbody>
										<tr>
											<td width="20%" class="table_grey">信访编号：</td>
											<td width="30%" colspan="2"><p>${guestbook.complaintNumber}</p></td>
											<td width="20%" class="table_grey">创建日期：</td>
											<td width="30%" colspan="2"><p><fmt:formatDate value="${guestbook.createTime}" pattern="yyyy-MM-dd hh:mm:ss" type="date"/></p></td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">姓　　名：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantName}</p></td>
											<td class="table_grey">身份证号：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantCardNo}</p></td>
										</tr>
										<tr>
											<td class="table_grey">级　　别：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantLevel}</p></td>
											<td class="table_grey">政治面貌：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantpoliticalFace}</p></td>
										</tr>
										<tr>
											<td class="table_grey">手　　机：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantPhone}</p></td>
											<td class="table_grey">居住地址：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantPlace}</p></td>
										</tr>
										<tr>
											<td class="table_grey">标　　题：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.title}</p></td>
											<td width="20%" class="table_grey">所属问题：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.matterCategory}</p></td>
										</tr>
										<tr>
											<td class="table_grey">问题细类：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.matterDetailed}</p></td>
											<td width="20%" class="table_grey">是否有复核意见书：</td>
											<td width="30%" colspan="2">
												<p>
													<c:choose>
														<c:when test="${guestbook.ext.reviewOpinions}">是</c:when>
														<c:otherwise>否</c:otherwise>												
													</c:choose>
												</p>
											</td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">法院是否已受理：</td>
											<td width="30%" colspan="2">
												<p>
													<c:choose>
														<c:when test="${guestbook.ext.accept}">是</c:when>
														<c:otherwise>否</c:otherwise>												
													</c:choose>
												</p>
											</td>
											<td width="20%" class="table_grey">是否已经行政复议：</td>
											<td width="30%" colspan="2">
												<p>
													<c:choose>
														<c:when test="${guestbook.ext.administrativeReconsideration}">是</c:when>
														<c:otherwise>否</c:otherwise>												
													</c:choose>
												</p>
											</td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">是否允许公开：</td>
											<td width="30%" colspan="2">
												<p>
													<c:choose>
														<c:when test="${guestbook.ext.publicity}">是</c:when>
														<c:otherwise>否</c:otherwise>												
													</c:choose>
												</p>
											</td>
											<td width="20%" class="table_grey"></td>
											<td width="30%" colspan="2"></td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">文档附件：</td>
											<td colspan="4">
												<div id="fileDocName">
													<c:forEach items="${guestbook.attachments}" var="list">
														<c:if test="${list.type==1}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">音频附件：</td>
											<td colspan="4">
												<div id="fileMediaName">
													<c:forEach items="${guestbook.attachments}" var="list">
														<c:if test="${list.type==2}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">视频附件：</td>
											<td colspan="4">
												<div id="fileVideoName">
													<c:forEach items="${guestbook.attachments}" var="list">
														<c:if test="${list.type==3}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">图片附件：</td>
											<td colspan="4">
												<div id="fileImageName">
													<c:forEach items="${guestbook.attachments}" var="list">
														<c:if test="${list.type==4}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">反应问题及诉求：</td>
											<td width="30%" colspan="5"><p>${guestbook.appeals}</p></td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">初步处理意见：</td>
											<td width="30%" colspan="5"><p>${guestbook.preliminaryOpinion}</p></td>
										</tr>
										<tr>
											<td class="table_grey">案件负责单位：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.processingCompany.name}</p></td>
											<td class="table_grey">案件负责人：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.processingHead.description}</p></td>
										</tr>
									</tbody>
								</table>
							</div>
							<h1 class="kzt_bt">
								<span>被举报人信息</span>
							</h1>
							<div class="table_eg">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
									<tbody>
										<tr>
											<td width="20%" class="table_grey">被举报人：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.reportedName}</p></td>
											<td width="20%" class="table_grey">单　　位：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.reportedCompany}</p></td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">职　　务：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.reportedDuties}</p></td>
											<td class="table_grey">级　　别：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.reportedLevel}</p></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="clear"></div>
						<div class="sj_bt_wai">
							<div class="sj_bt">
								<input type="button" class="bt_small bt_yellow" value="返&nbsp;&nbsp;&nbsp;回" onclick="javascript:window.location.href='/cm_online_petition_list'" />
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>