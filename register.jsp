<!DOCTYPE HTML>
<html>
<head>
<title>Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	function createid() {
		var myDate = new Date();
		var idstring = myDate.getFullYear() + '' + (myDate.getMonth() + 1) + ''
				+ myDate.getDate() + '' + myDate.getHours() + ''
				+ myDate.getMinutes() + '' + myDate.getSeconds();
		document.getElementById("userid").value = idstring;
	}

	function CheckInfo(form) {
		var mail = document.getElementById("email").value;
		var name = document.getElementById("name").value;
		var password = document.getElementById("password").value;
		var filter = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if (!filter.test(mail)) {
			alert('Please check your email');
			return false;
		} else {
			if (name == "") {
				alert('Please enter your name');
				return false;
			} else {
				if (password.length < 6) {
					alert('Password should be no less than 6 digits');
					return false;
				} else {
					return true;
				}
			}
		}
	}
</script>

</head>
<body>
<div class="index-banner1">
  <div class="header-top">	
	<div class="wrap">
   		<div class="logo">
			<p id="welcomeuser"></p>
					
					<a id="loginbutton" style="display:none" href="login.jsp"><button class="grey">Login</button></a>
		</div>	
		<div class="menu">																
			<a href="#" class="right_bt" id="activator"><img src="images/nav_icon.png" alt=""></a>
				<div class="box" id="box">
				  	<div class="box_content_center1">
					    <div class="menu_box_list1">
							<ul>
								<li><a href="index.jsp">Home</a></li>
							   <li class="active"><a href="chat.jsp">Chat</a></li> 
							   <li><a href="friends.jsp">Friend</a></li>
							   <li><a href="group.jsp">Group</a></li>
							   <li><a href="">Setting dashboard</a></li>
							</ul>
					     </div>
						 <a class="boxclose" id="boxclose"><img src="images/close.png" alt=""></a>
					 </div>                
			      </div>
			                 <script type="text/javascript">
								var $ = jQuery.noConflict();
									$(function() {
										$('#activator').click(function(){
												$('#box').animate({'top':'0px'},500);
										});
										$('#boxclose').click(function(){
												$('#box').animate({'top':'-700px'},500);
										});
									});
									$(document).ready(function(){
									
									//Hide (Collapse) the toggle containers on load
									$(".toggle_container").hide(); 
									
									//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
									$(".trigger").click(function(){
										$(this).toggleClass("active").next().slideToggle("slow");
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
   	      <div class="register_account">
          	<div class="wrap">
    	      <h4 class="title">Create an Account</h4>
    		   <form action="welcome.jsp" method="post">
    			 <div class="col_1_of_2 span_1_of_2">
    			 	<div><input name="email" type="text" value="E-Mail" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'E-Mail';}"></div>
		   			 <div><input name="name" type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}"></div>
		   			 <input name="password" type="password" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}">
		    			<button class="grey">Submit</button>	    				    			
		    	 </div>
		    	  <div class="col_1_of_2 span_1_of_2">	
		    		<div></div>
		    				        
		          <div></div>
		           
		       </div>
		      
		    <p class="terms"></p>
		    <div class="clear"></div>
		    <input id="userid" name="userid" type="hidden" value="">
		    </form>
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
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>