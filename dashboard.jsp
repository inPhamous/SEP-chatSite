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
		    document.getElementById("name").value=user.displayName;
		    searchstatus();
		  } else {
			  document.getElementById("loginbutton").style.display="";
		  }
	    }
	  
	  function searchstatus() {
		  
	    	var userId = firebase.auth().currentUser.uid;
	    	var userName = firebase.auth().currentUser.displayName;
	    	return firebase.database().ref('/user-names-online/').once('value').then(function(snapshot) {
	    	  var user = snapshot.val();	    	  
				for(var i in user){				
					if (i==userName){
						obj = document.getElementById("status");
						obj[0].selected=true;
					}					
				}			
	    	});	 	    	
	    }
	  
	  function reset() {
		  var useremail = firebase.auth().currentUser.email;
		  alert("Already sended the email. Please check you email");
		  //alert(useremail);
		  return firebase.auth().sendPasswordResetEmail(useremail);
		  
	  }
	  
</script>

</head>
<body>
<div class="index-banner1">
  <div class="header-top">	
	<div class="wrap">
   		<div class="logo">
			<a id="welcomeuser" ></a><a id="logout" style="display:none" href=javascript:logout();>   Logout</a>
					
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
							   <li><a href="dashboard.jsp">Setting dashboard</a></li>
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
    	      <h4 class="title">Change Dashboard</h4>
    		   <form action="dashboardaction.jsp" method="post">
    			 <div class="col_1_of_2 span_1_of_2">   			 	
		   			 <div><input id="name" name="name" type="text" ></div>
		   			 <div><select id="status" name="status" onchange="change_country(this.value)" class="frm-field required">
		            <option id="on" value="on" >Status-On</option>
		            <option id="off" value="off" selected="selected">Status-Off</option>
		         </select></div>
		    		<div><button class="grey">Submit</button><a href="javascript:reset();" style="padding-left: 40px">Reset Password</a></div>
		    				    				    			
		    	 </div>
		    	  <div class="col_1_of_2 span_1_of_2">	
		    		<div></div>
		    				        
		          <div>
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