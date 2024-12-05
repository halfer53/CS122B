<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String serverPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Fabflix Cartoon</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<%@ include file="base/common2.jsp"%>
</head>

<body>
	<section>
		<jsp:include page="menu/admin_manage_user_admin.jsp" />

		<div class="mainpanel">
			<jsp:include page="base/base_headPanel.jsp" />
			<div class="pageheader">
				<h2>
					<i class="fa fa-home"></i>Welcome ${employee.fullname} to Admin
					Dashboard&nbsp; &nbsp;&nbsp;&nbsp; Email: ${employee.email} <span><a
						href="javascript:history.back(-1);">back</a></span>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label">FABFLIX CARTOON COPYRIGHT</span>
					<ol class="breadcrumb">
						<li>Web Application</li>
						<li><a href="<%=basePath%>view/help">Help</a></li>
					</ol>
				</div>
			</div>

			<div class="contentpanel panel-email"></div>

		</div>

		<div class="modal-footer">
			<button class="btn btn-primary" onclick="modifyUserAccount();">Submit</button>
			&nbsp;
			<button id="modal_close_modify_panel" type="button"
				class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
		</div>

		<!-- modal -->
		<!-- ################################################################################################################################################ -->
		<!-- ################################################################################################################################################ -->
		<!-- ################################################################################################################################################ -->

		<!-- ==================================================================================================== -->
		<jsp:include page="base/base_rightPanel.jsp" />
	</section>
	<%@ include file="base/base_preLoader.jsp"%>
	<%-- <%@ include file="base/base_footPanel.jsp" %> --%>

</body>
</html>