<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="uts.wsd.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway'
	rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
</head>
<%
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String gender = request.getParameter("password");
	String filePath = application.getRealPath("WEB-INF/users.xml");
%>
<jsp:useBean id="diaryApp" class="uts.wsd.DiaryApplication"
	scope="application">
	<jsp:setProperty name="diaryApp" property="filePath"
		value="<%=filePath%>" />
</jsp:useBean>
<%
	User user = new User(email, name, password, gender);
%>
<script src="https://www.gstatic.com/firebasejs/3.4.1/firebase.js"></script>
<script>
	var config = {
	    apiKey: "AIzaSyAUkPHUOD--sz9-nmc6RTVt74nYfuXTzIQ",
	    authDomain: "sepassignment.firebaseapp.com",
	    databaseURL: "https://sepassignment.firebaseio.com",
	    storageBucket: "sepassignment.appspot.com",
	    messagingSenderId: "649203914654"
	  };
	  firebase.initializeApp(config);
	    	    
	    window.onload= function(){	    
	    	var email = <%="'"+email+"'"%>;
		    var password = <%="'"+password+"'"%>;
	    	firebase.auth().createUserWithEmailAndPassword(email, password).catch(function(error) {

		    var errorCode = error.code;
		    var errorMessage = error.message;
		    	  
		    	});	  
	    	
	    	
	    	setTimeout(upDateUser,1000);
	    }	    
	    
	    function upDateUser() {
	    	var user = firebase.auth().currentUser;

	    	user.updateProfile({
	    	  displayName: <%="'"+user.getName()+"'"%>,
	    	}).then(function() {
	    		checklogin();
	    	}, function(error) {
	    	  // An error happened.
	    	});
	    }
	    
	    function checklogin() {
	    	var user = firebase.auth().currentUser;
	    	firebase.auth().onAuthStateChanged(function(user) {
	    	  if (user) {
	    	    //alert(user.displayName+user.email);
	    	    document.getElementById("hellouser").innerHTML="Welcome, "+user.displayName;
	    	  } else {
	    		
	    	  }
	    	});    
	    }
</script>
<body>
	<div class="index-banner1">
		<div class="header-top">
			<div class="wrap">
				<div class="logo">
					<a href="index.html">
						<!--<img src="images/logo.png" alt=""/>-->
					</a>
				</div>
				<div class="menu">
					<a href="#" class="right_bt" id="activator"><img
						src="images/nav_icon.png" alt=""></a>
					<div class="box" id="box">
						<div class="box_content_center1">
							<div class="menu_box_list1">
								<ul>
									<li><a href="index.jsp">Home</a></li>
									<li class="active"><a href="chat.jsp">Chat</a></li>
									<li><a href="friends.jsp">Friend</a></li>
								
									<li><a href="dashboard.jsp">Setting dashboard</a></li>
								</ul>
							</div>
							<a class="boxclose" id="boxclose"><img src="images/close.png"
								alt=""></a>
						</div>
					</div>
					<script type="text/javascript">
						var $ = jQuery.noConflict();
						$(function() {
							$('#activator').click(function() {
								$('#box').animate({
									'top' : '0px'
								}, 500);
							});
							$('#boxclose').click(function() {
								$('#box').animate({
									'top' : '-700px'
								}, 500);
							});
						});
						$(document).ready(
								function() {

									//Hide (Collapse) the toggle containers on load
									$(".toggle_container").hide();

									//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
									$(".trigger").click(
											function() {
												$(this).toggleClass("active")
														.next().slideToggle(
																"slow");
												return false; //Prevent the browser jump to the link anchor
											});

								});
					</script>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="main">
		<div class="wrap">
			<div class="abstract">
				<ul class="breadcrumb breadcrumb__t">
					<a class="home" href="#">Home</a> / Welcome
				</ul>
				<div class="g_desc">
					<div id="hellouser"></div>
					
				</div>

			</div>
		</div>
	</div>
	<div class="footer">
		<div class="wrap">
			<div class="copy">
				<!--<p>Copyright &copy; 2014.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>-->
			</div>
		</div>
	</div>
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>