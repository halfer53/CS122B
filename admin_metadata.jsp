<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String serverPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="movie.work.entity.Metadata"%>
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
		<!-- 【menu】 -->
		<jsp:include page="menu/admin_manage_user_admin.jsp" />

		<div class="mainpanel">
			<!-- 【head】 -->
			<jsp:include page="base/base_headPanel.jsp" />
			<!-- ==================================================================================================== -->
			<!-- ==================================================================================================== -->
			<!-- ==================================================================================================== -->
			<div class="pageheader">
				<h2>
					<i class="fa fa-home"></i> Fabflix Cartoon Database Metadata <span><a
						href="javascript:history.back(-1)">back</a></span>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label">Fabflix Cartoon Copyright</span>
					<ol class="breadcrumb">
						<li>Web Application</li>
						<li><a href="<%=basePath%>view/help">Help</a></li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">
				<ul class="nav nav-tabs nav-dark">
					<li class="active"><a data-toggle="tab" href="#all"><strong>Metadata</strong></a></li>
				</ul>
				<div class="tab-content">
					<!-- ==================================================================================================== -->
					<!-- ==================================================================================================== -->
					<!-- ==================================================================================================== -->
					<div id="all" class="tab-pane active">
						<div class="alert alert-info fade in">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">&times;</button>
							<div>【Explain】 This page contains metadata of database,
								including table name, attribute, type, size.</div>
							<div>
								【Attention】
								<div
									style="display: inline-block; width: 13px; height: 13px; background-color: green;"></div>
								&nbsp;Table Name&nbsp;&nbsp;
								<div
									style="display: inline-block; width: 13px; height: 13px; background-color: #EAC100;"></div>
								&nbsp;Attribute Name&nbsp;&nbsp;
								<div
									style="display: inline-block; width: 13px; height: 13px; background-color: #9F4D95;"></div>
								&nbsp;Attribute Type&nbsp;&nbsp;
								<div
									style="display: inline-block; width: 13px; height: 13px; background-color: #FF0000;"></div>
								&nbsp;Data Size&nbsp;&nbsp;
							</div>
						</div>

						<!-- panel -->

						<div class="table-responsive">
							<table class="table table-primary table-buglist">
								<thead>
									<tr>
										<th>#</th>
										<th><div
												style="display: inline-block; width: 13px; height: 13px; background-color: green;"></div>
											&nbsp;Table Name&nbsp;&nbsp;</th>
										<th><div
												style="display: inline-block; width: 13px; height: 13px; background-color: #EAC100;"></div>
											&nbsp;Attribute Name&nbsp;&nbsp;</th>
										<th><div
												style="display: inline-block; width: 13px; height: 13px; background-color: #9F4D95;"></div>
											&nbsp;Attribute Type&nbsp;&nbsp;</th>
										<th><div
												style="display: inline-block; width: 13px; height: 13px; background-color: #FF0000;"></div>
											&nbsp;Data Size&nbsp;&nbsp;</th>
									</tr>
								</thead>

								<%
								List<Metadata> list = (ArrayList<Metadata>) request.getAttribute("list");
								int size = list.size();
								for (int i = 0; i < size; i++) { 
								%>
								<tr style="color: black;"> 
								<td></td>
								<td> <%=list.get(i).getTableName() %></td>
								<td> <%=list.get(i).getAttribute() %></td>
								<td> <%=list.get(i).getType() %></td>
								<td> <%=list.get(i).getColumnSize() %></td>	
								</tr>
								<%
								}
								%>
								<tbody id="returnContentLocation"></tbody>
								<tfoot>
									<tr>
										<td colspan="9" align="center">
											<ul id="pagelistnumber" class="pagination nomargin"></ul>
											<ul id="pagelistnumberall" class="pagination nomargin"></ul>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
						<!-- table-responsive -->
					</div>
				</div>

			</div>


		</div>
		<jsp:include page="base/base_rightPanel.jsp" />
	</section>
	<%@ include file="base/base_preLoader.jsp"%>

</body>
</html>