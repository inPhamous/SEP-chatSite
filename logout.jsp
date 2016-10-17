<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="uts.wsd.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logout</title>
<link href="./JSCSS/templatemo_style.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<%
		session.invalidate();
	%>
	<div id="templatemo_top_section">
		<div class="templatemo_container">
			<div id="templatemo_header">
				<div id="templatemo_logo_area">
					<h2>LoginState</h2>
					<p></p>
				</div>
				<div id="templatemo_header_right">

					<h2>You have been logged out.</h2>
					<p>
						<a>Click </a><a href="index.jsp">here</a> <a> to return to the
							main page.</a>

					</p>

				</div>
				<div class="cleaner"></div>
				<div id="templatemo_menu">
					<ul>
						<li class="current"><a href="index.jsp">mainpage</a>
							<p>start here</p></li>
						<li><a href="login.jsp">login</a>
							<p>more function</p></li>
						<li><a href="register.jsp">register</a>
							<p>create account</p></li>
						<li class="last"><a href="javascript :;"
							onClick="javascript :history.back(-1);">go back</a>
							<p>previous page</p></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- End Of Container  -->
	</div>
</body>
</html>