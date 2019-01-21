<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>事件处理</title>

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
	<jsp:include page="../include/top.jsp"></jsp:include>
	<div class="center">
		<jsp:include page="../include/handle_left.jsp"></jsp:include>
		<div class="pubilc_right fl">
			<div class="pubilc_right_cn">
				<form action="cm_visitingRegistration_save" id="addForm" name="addForm" method="post">
					<div class="cfcx">
						<div class="cfcx_2">
							<h1 class="kzt_bt">
								<span>交办信息</span>
							</h1>
							<div class="table_eg">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
									<tbody>
										<tr>
											<td width="20%" class="table_grey">交办号：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.assignNumber}</p></td>
											<td width="20%" class="table_grey">交办人：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.assignPerson}</p></td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">交办人职务：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.assignPersonPost}</p></td>
											<td width="20%" class="table_grey">交办人单位：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.assignCompany}</p></td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">交办形式：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.assignModality}</p></td>
											<td width="20%" class="table_grey">保管人：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.preserver}</p></td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">地点：</td>
											<td width="30%" colspan="5"><p>${guestbook.ext.place}</p></td>
										</tr>
									</tbody>
								</table>
							</div>
							<h1 class="kzt_bt">
								<span>来访人员信息及反应情况</span>
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
											<td width="20%" class="table_grey">性　　别：</td>
											<td width="30%" colspan="2">
												<p>
													<c:if test="${guestbook.ext.informantSex == 0}">女</c:if>
													<c:if test="${guestbook.ext.informantSex == 1}">男</c:if>
												</p>
											</td>
										</tr>
										<tr>
											<td class="table_grey">年　　龄：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantAge}</p></td>
											<td class="table_grey">民　　族：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantNation}</p></td>
										</tr>
										<tr>
											<td class="table_grey">身份证号：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantCardNo}</p></td>
											<td class="table_grey">文化程度：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantEducation}</p></td>
										</tr>
										<tr>
											<td class="table_grey">居住地址：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantPlace}</p></td>
											<td class="table_grey">政治面貌：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantpoliticalFace}</p></td>
										</tr>
										<tr>
											<td class="table_grey">手　　机：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantPhone}</p></td>
											<td width="20%" class="table_grey">所属问题：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.matterCategory}</p></td>
										</tr>
										<tr>
											<td class="table_grey">上访类型：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.matterProperty}</p></td>
											<td class="table_grey">上访层次：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantGrade}</p></td>
										</tr>
										<tr>
											<td class="table_grey">来访人数：</td>
											<td width="30%" colspan="2"><p>${guestbook.peopleCount}</p></td>
											<td class="table_grey">来访代表：</td>
											<td width="30%" colspan="2"><p>${guestbook.leader}</p></td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">文档附件：</td>
											<td colspan="4">
												<div id="fileDocName">
													<c:forEach items="${guestbook.attachments}" var="list">
														<c:if test="${list.type==1 || list.type==5}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">音频附件：</td>
											<td colspan="4">
												<div id="fileMediaName">
													<c:forEach items="${guestbook.attachments}" var="list">
														<c:if test="${list.type==2 || list.type==6}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">视频附件：</td>
											<td colspan="4">
												<div id="fileVideoName">
													<c:forEach items="${guestbook.attachments}" var="list">
														<c:if test="${list.type==3 || list.type==7}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">图片附件：</td>
											<td colspan="4">
												<div id="fileImageName">
													<c:forEach items="${guestbook.attachments}" var="list">
														<c:if test="${list.type==4 || list.type==8}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">领导批复文件照片：</td>
											<td colspan="4">
												<div id="fileImageName">
													<c:forEach items="${guestbook.attachments}" var="list">
														<c:if test="${list.type==12}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
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
								<input type="button" class="bt_small bt_yellow" value="返&nbsp;&nbsp;&nbsp;回" onclick="javascript:window.location.href='/cm_event_handling_list'" />
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>