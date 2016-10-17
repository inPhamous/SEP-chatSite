<!DOCTYPE HTML>
<html>
<head>
<title>Gallery</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
		<link href="css/magnific-popup.css" rel="stylesheet" type="text/css">
		<script>
			$(document).ready(function() {
				$('.popup-with-zoom-anim').magnificPopup({
					type: 'inline',
					fixedContentPos: false,
					fixedBgPos: true,
					overflowY: 'auto',
					closeBtnInside: true,
					preloader: false,
					midClick: true,
					removalDelay: 300,
					mainClass: 'my-mfp-zoom-in'
			});
		});
		</script>
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
	 	  
	var myArray = new Array();
	var num=0;
	var result = [];
	    function checklogin() {
	    	var user = firebase.auth().currentUser;
	    	firebase.auth().onAuthStateChanged(function(user) {
	    	  if (user) {
	    	    //alert(user.displayName);

	    	  } else {
	    		//document.getElementById("hellouser").innerHTML="Welcome";
	    	  }
	    	});    
	    }
	    
	    window.onload = function(){	    	
	    	user(num);
	    	readuser2(num);	
	    	setTimeout('display()',2500);
	    	
	    }
	    
	    function display(){
	    	var arr = myArray;
	    	var hash = {};
	        for (var i = 0, elem; (elem = arr[i]) != null; i++) {
	            if (!hash[elem]) {
	                result.push(elem);
	                hash[elem] = true;
	            }
	        }
	    	    	
	    	for (var i=0;i<result.length;i++){
	    		//alert(myArray[i]);
	    		document.getElementById("user"+(i+1)).style.display="";
				document.getElementById("username"+(i+1)).innerHTML=result[i];
	    	}	    	
	    }
	    		    	
	    function user() {
	    	
	    	var userId = firebase.auth().currentUser.uid;

	    	
	    	return firebase.database().ref('/users/').once('value').then(function(snapshot) {
	    	  var username = snapshot.val();
				for(var i in username){
					if (userId!=i){

						readuser(i);					
					}					
				}			
	    	});	 	    	
	    }
	    
	    function readuser(i){
	    	return firebase.database().ref('/users/' + i).once('value').then(function(snapshotot) {
		    	  var invites = snapshotot.val().invites;
		    	  var name = snapshotot.val().name;
					for(var j in invites){							
						loaduser(i,j,name);
					}			
		    	});	
    	}

	    function loaduser(i,j,name){
	    	var userId = firebase.auth().currentUser.uid;
	    	return firebase.database().ref('/users/' + i+'/invites/'+j).once('value').then(function(snapshototot) {
		    	  var fromUserId = snapshototot.val().fromUserId;					
		    	  
		    	  var status = snapshototot.val().status;
		    	  
					if (userId==fromUserId&&status=="accepted")	{
						myArray[num]=name;
						num++;						
					}	
					
		    	});	
	    }
	    
	    function readuser2() {	    	
	    	var userId = firebase.auth().currentUser.uid;
	    	var result="";
	    	
	    	return firebase.database().ref('/users/' + userId).once('value').then(function(snapshot) {
	    	  var invites = snapshot.val().invites;
				for(var i in invites){						
						loaduser2(userId,i);			
				}			
	    	});	 	    	
	    }
	    
	    function loaduser2(userId,i){
	    	var userId = firebase.auth().currentUser.uid;
	    	return firebase.database().ref('/users/' + userId+'/invites/'+i).once('value').then(function(snapshototot) {
	    		try{
	    			var fromUserName = snapshototot.val().fromUserName;
	    			var status = snapshototot.val().status;
					if (status=="accepted")	{
						myArray[num]=fromUserName;
						num++;
						//alert(myArray.length);
						//document.getElementById("user"+num).style.display="";
						//document.getElementById("username"+num).innerHTML=fromUserName;					
					}
					
	    		}catch(e){
	    			
	    		}
		    	  
		    	});	
	    }
	    
	    function deletefriend(temp){
	    	var userId = firebase.auth().currentUser.uid;
	    	var friendName= result[temp-1];
	    	
	    	
	    	return firebase.database().ref('/users/').once('value').then(function(snapshot) {
		    	  var username = snapshot.val();
					for(var i in username){
						if (userId!=i){
							//alert(1);
							findThisFriend(i,friendName);					
						}
						else if (userId==i){
							
							findOtherFriend(friendName);
						}
					}
					serTimeout(window.location.reload(),2000);
		    	});	
	    }
	    
	    function findOtherFriend(friendName){
	    	var userId = firebase.auth().currentUser.uid;
	    	
	    	return firebase.database().ref('/users/' + userId).once('value').then(function(snapshot) {
	    	  var invites = snapshot.val().invites;
				for(var i in invites){	
					
					deleteOtherFriend(i,friendName);			
				}			
	    	});
	    }
	    
	    function deleteOtherFriend(i,friendName){
			var userId = firebase.auth().currentUser.uid;
			
	    	return firebase.database().ref('/users/' + userId+'/invites/'+i).once('value').then(function(snapshot) {
	    	  var friend = snapshot.val().fromUserName;
	    	  var status = snapshot.val().status;
	    	  //alert(friendName);
	    	  //alert(friend);
				if (friendName==friend&&status=="accepted")	{
					
					deletedetail(userId,i);
				}	
	    	});
	    }
	    
	    
	    function findThisFriend(i,friendName){
	    	var userId = firebase.auth().currentUser.uid;
	    	return firebase.database().ref('/users/' + i).once('value').then(function(snapshotot) {
		    	  var name = snapshotot.val().name;
		    	  //alert(name);
		    	  //alert(friendName);
		    	  if(name==friendName){
		    		  var invites = snapshotot.val().invites;
		    		  for(var j in invites){
		    			  //alert(2);
							deleteuser(i,j,name);
						}
		    	  }
								
		    	});	
	    }
	    
	    function deleteuser(i,j,name) {
	    	var userId = firebase.auth().currentUser.uid;
	    	return firebase.database().ref('/users/' + i+'/invites/'+j).once('value').then(function(snapshototot) {
	    		var fromUserId = snapshototot.val().fromUserId;
	    		if (fromUserId==userId){

	    			deletedetail(i,j);
	    		}	    		
	    	});
	    }
	    
	    function deletedetail(i,j){
	    	return firebase.database().ref('/users/' + i+'/invites/'+j).remove();
	    }
	    
	    
	    
	    		
</script>
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
   	     <div class="wrap">
   	       <div class="abstract">
		   	 <ul class="breadcrumb breadcrumb__t"><a class="home" href="#">Friends</a></ul>
			  <div class="section group">
				 <div class="cont1 span_2_of_g1">
				      <div class="section group">
						<div id="user1" style="display:none;" class="col_1_of_about-box span_1_of_about-box">
						 <a  href="chat.jsp"><span class="rollover"></span><img src="images/g1.jpg" width="320" height="196" title="continue" alt=""/></a>
		                     <div id="small-dialog" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g1.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 id="username1" class="no"><a href="#">#125846</a></h4>
			                   	<p id="useremail1" class="g_2"><a href="javascript:deletefriend('1')">Delete</a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div id="user2" style="display:none;" class="col_1_of_about-box span_1_of_about-box">
						    <a  href="chat.jsp"><span class="rollover"></span><img src="images/g2.jpg" width="320" height="196" title="continue" alt=""/></a>
		                     <div id="small-dialog1" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g2.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 id="username2" class="no"><a href="#">#125846</a></h4>
			                   	<p id="useremail2" class="g_2"><a href="#"></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div id="user3" style="display:none;" class="col_1_of_about-box span_1_of_about-box">
						   <a  href="chat.jsp"><span class="rollover"></span><img src="images/g3.jpg" width="320" height="196" title="continue" alt=""/></a>
		                     <div id="small-dialog2" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g3.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div> 
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 id="username3" class="no"><a href="#">#125846</a></h4>
			                   	<p id="useremail3" class="g_2"><a href="#"></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
				        <div class="clear"></div> 
					</div>
					<div class="section group">
						<div id="user4" style="display:none;" class="col_1_of_about-box span_1_of_about-box">
						   <a  href="chat.jsp"><span class="rollover"></span><img src="images/g4.jpg" width="320" height="196" title="continue" alt=""/></a>
		                     <div id="small-dialog4" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g4.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 id="username4" class="no"><a href="#">#125846</a></h4>
			                   	<p id="useremail4" class="g_2"><a href="#"></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div id="user5" style="display:none;" class="col_1_of_about-box span_1_of_about-box">
						    <a  href="chat.jsp"><span class="rollover"></span><img src="images/g5.jpg" width="320" height="196" title="continue" alt=""/></a>
		                     <div id="small-dialog5" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g5.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 id="username5" class="no"><a href="#">#125846</a></h4>
			                   	<p id="useremail5" class="g_2"><a href="#"></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div id="user6" style="display:none;" class="col_1_of_about-box span_1_of_about-box">
						   <a  href="chat.jsp"><span class="rollover"></span><img src="images/g6.jpg" width="320" height="196" title="continue" alt=""/></a>
		                     <div id="small-dialog6" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g6.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 id="username6" class="no"><a href="#">#125846</a></h4>
			                   	<p id="useremail6" class="g_2"><a href="#"></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
				        <div class="clear"></div> 
					</div>
					<div class="section group">
						<div id="user7" style="display:none;" class="col_1_of_about-box span_1_of_about-box">
						   <a  href="chat.jsp"><span class="rollover"></span><img src="images/g7.jpg" width="320" height="196" title="continue" alt=""/></a>
		                     <div id="small-dialog7" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g7.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 id="username7" class="no"><a href="#">#125846</a></h4>
			                   	<p id="useremail7" class="g_2"><a href="#"></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div id="user8" style="display:none;" class="col_1_of_about-box span_1_of_about-box">
						   <a  href="chat.jsp"><span class="rollover"></span><img src="images/g8.jpg" width="320" height="196" title="continue" alt=""/></a>
		                     <div id="small-dialog8" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g8.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 id="username8" class="no"><a href="#">#125846</a></h4>
			                   	<p id="useremail8" class="g_2"><a href="#"></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div id="user9" style="display:none;" class="col_1_of_about-box span_1_of_about-box">
						   <a  href="chat.jsp"><span class="rollover"></span><img src="images/g9.jpg" width="320" height="196" title="continue" alt=""/></a>
		                     <div id="small-dialog9" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g9.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 id="username9" class="no"><a href="#">#125846</a></h4>
			                   	<p id="useremail9" class="g_2"><a href="#"></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
				        <div class="clear"></div> 
					</div>
					<div class="section group">
						<div id="user10" style="display:none;" class="col_1_of_about-box span_1_of_about-box">
						   <a  href="chat.jsp"><span class="rollover"></span><img src="images/g10.jpg" width="320" height="196" title="continue" alt=""/></a>
		                     <div id="small-dialog10" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g10.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 id="username10" class="no"><a href="#">#125846</a></h4>
			                   	<p id="useremail10" class="g_2"><a href="#"></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div id="user11" style="display:none;" class="col_1_of_about-box span_1_of_about-box">
						    <a  href="chat.jsp"><span class="rollover"></span><img src="images/g11.jpg" width="320" height="196" title="continue" alt=""/></a>
		                     <div id="small-dialog11" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g11.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 id="username11" class="no"><a href="#">#125846</a></h4>
			                   	<p id="useremail11" class="g_2"><a href="#"></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
						 <div id="user12" style="display:none;" class="col_1_of_about-box span_1_of_about-box">
						   <a  href="chat.jsp"><span class="rollover"></span><img src="images/g12.jpg" width="320" height="196" title="continue" alt=""/></a>
		                     <div id="small-dialog12" class="mfp-hide">
							   <div class="pop_up">
							   	  <img src="images/g12.jpg" alt=""/>
							   	  <div class="mfp-title">Lorem ipsum est</div>
								</div>
							 </div>  
						   <div class="g_desc">
			                   <div class="g_1">
			                   	<h4 id="username12" class="no"><a href="#">#125846</a></h4>
			                   	<p id="useremail12" class="g_2"><a href="#"></a></p>
			                   </div>
			                   
			                   <div class="clear"></div>
			               </div>		
					     </div>
				        <div class="clear"></div> 
					</div>
				    
		</div>
        <div class="labout span_1_of_g1">
			 
		  </div>
		   <div class="clear"></div>	
		  </div>
		</div>
   	 </div>
   	</div>
	<div class="footer">
	   	<div class="wrap">
	   		<div class="copy">
			   <p>Copyright &copy; 2014.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
		    </div>
	   	</div>
    </div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>