<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="uts.wsd.*"%>

<%
	User user = (User) session.getAttribute("user");
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway'
	rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
</head>
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
	  
	  window.onload= function() {

		  var user = firebase.auth().currentUser;

		  if (user) {
		    document.getElementById("welcomeuser").innerHTML="Welcome, "+user.displayName;
		    document.getElementById("logout").style.display="";
		  } else {
			  document.getElementById("loginbutton").style.display="";
		  }
	    }
	  
	  function logout() {
	      firebase.auth().signOut().then(function() {
	        location.reload();
	      }).catch(function(error) {
	        console.log("Error signing user out:", error);
	      });
	    }
	  
</script>

<body>
	<div class="index-banner">
		<div class="header-top">
			<div class="wrap">
				<div class="logo">
	
					<a id="welcomeuser" ></a><a id="logout" style="display:none" href=javascript:logout();>   Logout</a>
					
					<a id="loginbutton" style="display:none" href="login.jsp"><button class="grey">Login</button></a>
	
				</div>
				<div class="menu">
					<a href="#" class="right_bt" id="activator"><img
						src="images/nav_icon.png" alt=""></a>
					<div class="box" id="box">
						<div class="box_content_center">
							<div class="menu_box_list">
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
		<div class="wmuSlider example1">
			<article style="position: absolute; width: 100%; opacity: 0;">
				<div class="banner-wrap">
					<div class="cont span_2_of_3" style="padding-bottom: 200px;">
						<div class="col_1_of_d span_1_of_d">
							<img src="images/pic11.jpg" alt="" />
							<p class="m_5">
								<a href="chat.jsp">Nero</a>
							</p>
						</div>
						<div class="col_1_of_d span_1_of_d">
							<img src="images/pic10.jpg" alt="" />
							<p class="m_5">
								<a href="chat.jsp">Mary</a>
							</p>
						</div>
						<div class="col_1_of_d span_1_of_d">
							<img src="images/pic9.jpg" alt="" />
							<p class="m_5">
								<a href="chat.jsp">Peter</a>
							</p>
						</div>
						<div class="col_1_of_d span_1_of_d">
							<img src="images/pic8.jpg" alt="" />
							<p class="m_5">
								<a href="chat.jsp">Mike</a>
							</p>
						</div>
					</div>
				</div>
		</div>
		</article>
		<!--<article style="position: absolute; width: 100%; opacity: 0;"> 
				   	<div class="banner-wrap">
						<div class="cont span_2_of_3">
						   <h1>Chinese to English<br> </h1>
                           <div class="search_box">
								<form>
								   <input type="text" value="Insert here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'People Walking';}"><input type="submit" value="">
							    </form>
			 				</div>
						</div>
					</div>
				 </article>-->
	</div>
	<script src="js/jquery.wmuSlider.js"></script>
	<script>
		$('.example1').wmuSlider();
	</script>
	</div>
	<div class="main">
		<div class="content-top">
			<div class="section1">
				<div class="cont1 span_2_of_about">
					<h3 class="m_1">
						<a href="register.html">Create a free account now</a>
					</h3>
				</div>
				<div class="rsidebar span_1_of_about">
					<a href="register.jsp"><div class="btn">Register now</div></a>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="content-bottom">
			<h2 class="m_2">Software Engineering Practice</h2>
			<div class="wrap">
				<div class="section group">
					<div class="col_1_of_5 span_1_of_5">
						<ul class="list1">

						</ul>
					</div>
					<div class="col_1_of_5 span_1_of_5">
						<ul class="list1">

						</ul>
					</div>
					<div class="col_1_of_5 span_1_of_5">
						<ul class="list1">

						</ul>
					</div>
					<div class="col_1_of_5 span_1_of_5">
						<ul class="list1">

						</ul>
					</div>
					<div class="col_1_of_5 span_1_of_5">
						<ul class="list1">

						</ul>
					</div>
					<div class="clear"></div>
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