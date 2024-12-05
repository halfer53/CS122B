<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String serverPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Fabflix Cartoon</title>
<script src="https://www.google.com/recaptcha/api.js"></script>
<%@ include file="base/common2.jsp"%>
</head>

<body class="signin" onkeydown="keyDown(event);">
	<section>

		<div class="signinpanel">
			<div class="row">
				<div class="col-md-7">
					<div class="signin-info">
						<div class="logopanel">
							<h1>
								<span>[</span> Fabflix Cartoon Admin System <span>]</span>
							</h1>
						</div>
						<!-- logopanel -->

						<div class="mb20"></div>
						<h5>
							<strong>Welcome!</strong>
						</h5>
						<ul>
							<li><i class="fa fa-arrow-circle-o-right mr5"></i> Search
								Movies</li>
							<li><i class="fa fa-arrow-circle-o-right mr5"></i> View
								Movie Description</li>
							<li><i class="fa fa-arrow-circle-o-right mr5"></i> See Your
								Favorite Stars</li>
							<li><i class="fa fa-arrow-circle-o-right mr5"></i> Browse
								Movie with Genres</li>
							<li><i class="fa fa-arrow-circle-o-right mr5"></i> More than
								Expected at Fabflix...</li>
							<li><i class="fa fa-arrow-circle-o-right mr5"></i>
								Vegetables</li>
							<li><i class="fa fa-arrow-circle-o-right mr5"></i> more...</li>
						</ul>
						<div class="mb20"></div>
						<%-- <strong>Have no account? <a href="<%=basePath%>view/sign_up">SignUp</a></strong> --%>
					</div>
					<!-- signin0-info -->
				</div>

				<div class="col-md-5">
					<form method="POST" action="<%=basePath%>AdminServlet?method=login"
						style="border-radius: 5px; padding-top: 30px; padding-bottom: 30px; padding-left: 20px; padding-right: 20px; border: 1px solid #cccccc; background-color: #e9ecee;">

						<h4 class="nomargin" style="font-weight: bold;">Administator
							Login</h4>
						<!-- <p class="mt5 mb20">username/password</p> -->
						<input name="fullname" id="fullname" type="text" value=""
							class="form-control uname" placeholder="username" /> <input
							name="password" id="password" type="password" value=""
							class="form-control pword" placeholder="password" /> <select
							name="userrole" id="userrole" class="form-control mb15"
							name="query_locationRegion" class="select"
							data-placeholder="user role">
							<option value="admin">administrator</option>
							<option value="customer" onclick="customer_login()">customer</option>
						</select>
						<button id="but_submit_login" class="btn btn-success btn-block"
							type="submit" onclick="loginCheck()">submit</button>
						<div class="g-recaptcha"
							data-sitekey="6LdsIB4UAAAAAGWhLwfTUKmEh1s_9M0WZVinDDx_"></div>
					</form>



				</div>

				<!-- col-sm-5 -->

			</div>
			<!-- row -->
			<div class="signup-footer">
				<div class="pull-left">&copy; 2017. Fabflix Cartoon All Rights
					Reserved.</div>
			</div>
		</div>
	</section>


</body>


<script type="text/javascript">
	function customer_login(){
		window.location.replace("<%=basePath%>JSP/signin.jsp");
	}
	function loginCheck() {
		var login_username = $("#fullname").val();
		var login_password = $("#password").val();

		if (login_username == null || login_username == "") {
			mAlertWarning("Server Prompt", "Username can not be empty");
			return;
		}
		if (login_password == null || login_password == "") {
			mAlertWarning("Server Prompt", "Password can not be empty");
			return;
		}
	}

	function keyDown(e) {
		var keycode = 0;
		//IE
		if (CheckBrowserIsIE()) {
			keycode = event.keyCode;
		} else {
			//FireFox
			keycode = e.which;
		}
		if (keycode == 13) //Enter
		{
			document.getElementById("but_submit_login").click();
		}
	}
	//is or not ie
	function CheckBrowserIsIE() {
		var result = false;
		var browser = navigator.appName;
		if (browser == "Microsoft Internet Explorer") {
			result = true;
		}
		return result;
	}
</script>
</html>
