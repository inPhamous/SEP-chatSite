<!DOCTYPE HTML>
<html>
<head>
<title>About</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<!-- Bootstrap -->
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/css/bootstrap.min.css" />
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" />

  <!-- Firechat -->
  <link rel="stylesheet" href="https://cdn.firebase.com/libs/firechat/3.0.1/firechat.min.css" />

  <link rel="stylesheet" href="./css/pygments-borland.css" />

<script src="http://www.microsoftTranslator.com/ajax/v3/WidgetV3.ashx?siteData=ueOIGRSKkd965FeEGM5JtQ**" type="text/javascript"></script>
    <script type="text/javascript">
		//setInterval("translate()",1000);
        //setInterval("translate()",1000);		
         function translate() {
			 			 
            if (document.readyState == 'complete') {
                Microsoft.Translator.Widget.Translate('en', 'zh-cn', onProgress, onError, onComplete, onRestoreOriginal, 0);
				document.getElementById('WidgetFloaterPanels').style.display='none';
            }
        }
        //You can use Microsoft.Translator.Widget.GetLanguagesForTranslate to map the language code with the language name
        function onProgress(value) {
            document.getElementById('counter').innerHTML = Math.round(value);
        }

        function onError(error) {
            alert("Translation Error: " + error);
        }

        function onComplete() {
            document.getElementById('counter').style.color = 'green';
        }
        //fires when the user clicks on the exit box of the floating widget
        function onRestoreOriginal() { 
            alert("The page was reverted to the original language. This message is not part of the widget.");
        }
		
        window.onload= function() {

  		  var user = firebase.auth().currentUser;

  		  if (user) {
  		    document.getElementById("welcomeuser").innerHTML="Welcome, "+user.displayName;
  		    document.getElementById("logout").style.display="";
  		  } else {
  			  document.getElementById("loginbutton").style.display="";
  		  }
  	    }

    </script>
	
</head>
<body>
<div class="index-banner1">
  <div class="header-top">	
	<div class="wrap">
   		<div class="logo">
			
		</div>
  <div class="menu">																
			<a href="#" class="right_bt" id="activator"><img src="images/nav_icon.png" alt=""></a>
				<div class="box" id="box">
				  	<div class="box_content_center1">
					    <div class="menu_box_list1" translate="no">
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
		   	 <ul class="breadcrumb breadcrumb__t">
		   	   <div translate="no"><a class="home" href="#">Home</a>  / Translate</div>
	   	    </ul>
			  <div class="section group">
				 <div class="cont1 span_2_of_a1" translate="no">
				       <h3>input</h3>
					   	<div id="firechat-container" class="clearfix"></div><a id="twitter-signin" href="javascript:login();">login</a><a href="javascript:logout();">Logout</a><a href="javascript:changename();">changeuser</a><a href="javascript:getid()">123213</a>
        </div>
        <div class="labout span_1_of_a1">
			 <div translate="no"><h3>Translated <select name"language"><option value="1">English -> Chinese</option></select></h3></div>
				 <div id="outputtranslate" class="testi-item" style="overflow:scroll;  width:600px; height:400px;">
					

                          
				 </div>
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
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
<!-- jQuery -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

  <!-- Firebase -->
  <script src="https://www.gstatic.com/firebasejs/3.3.0/firebase.js"></script>

  <!-- Firechat -->
  <script src="css/firechat.min.js"></script>

  <!-- Bootstrap -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/js/bootstrap-modal.min.js"></script>

  <script src="https://www.gstatic.com/firebasejs/3.4.1/firebase.js"></script>
  <script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyAUkPHUOD--sz9-nmc6RTVt74nYfuXTzIQ",
    authDomain: "sepassignment.firebaseapp.com",
    databaseURL: "https://sepassignment.firebaseio.com",
    storageBucket: "sepassignment.appspot.com",
    messagingSenderId: "649203914654"
  };
  firebase.initializeApp(config);


    // Get a reference to the Firebase Realtime Database
    var chatRef = firebase.database().ref(),
        target = document.getElementById("firechat-container"),
        authModal = $('#auth-modal').modal({ show: false }),
        chat = new FirechatUI(chatRef, target);

    chat.on('auth-required', function() {
      authModal.modal('show');
      return false;
    });

    firebase.auth().onAuthStateChanged(function(user) {
      if (user) {
        var userId = user.uid,
            username = user.displayName;

        chat.setUser(userId, username);
        $('#user-name').text(username);
        $('#user-info').show();
        setTimeout(function() {
          chat._chat.enterRoom('-Iy1N3xs4kN8iALHV0QA')
        }, 500);
      } else {
        $('#user-info').hide();
        chat._chat.enterRoom('-Iy1N3xs4kN8iALHV0QA')
      }
    });
	
	function changename() {
		var user = firebase.auth().currentUser;

		user.updateProfile({
  		displayName: "Nero",
  		//photoURL: "https://example.com/jane-q-user/profile.jpg"
		}).then(function() {
  		// Update successful.
		}, function(error) {
  // An error happened.
		});
	}
	
	function getid() {
		var temp = document.getElementsByClassName("tab-pane active")
		
		var obj = document.getElementById(temp.item(0).id).getElementsByTagName("nobr");
		document.getElementById("outputtranslate").innerHTML="";
    	for(i=0;i<obj.length;i=i+2){
			document.getElementById("outputtranslate").innerHTML+="<div style='font-weight:Bold' translate='no'>"+obj[i].innerHTML+"</div><div style='font-size:10px'>"+obj[i+1].innerHTML+"</div>";
        
    }	
	translate();
	}

    function login() {
      //authModal.modal('hide');

      // Log the user in via Twitter
      //var provider = new firebase.auth.TwitterAuthProvider();
      //firebase.auth().signInWithPopup(provider).catch(function(error) {
        //console.log("Error authenticating user:", error);
      //});
	  var email = "139008098@qq.com";
      var password = "722478211q";
	   firebase.auth().signInWithEmailAndPassword(email, password).catch(function(error) {
          // Handle Errors here.
          var errorCode = error.code;
          var errorMessage = error.message;
          // [START_EXCLUDE]
          if (errorCode === 'auth/wrong-password') {
            alert('Wrong password.');
          } else {
            alert(errorMessage);
          }
          console.log(error);
          document.getElementById('quickstart-sign-in').disabled = false;
          // [END_EXCLUDE]
        })
		
		
    };

    function logout() {
      firebase.auth().signOut().then(function() {
        location.reload();
      }).catch(function(error) {
        console.log("Error signing user out:", error);
      });
    }
  </script>

  <!-- Twitter / Facebook / Google -->
  <script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
  <div id="fb-root"></div>
  <script>
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-37102688-1']);
    _gaq.push(['_trackPageview']);


    (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
  </script>
  
</body>
</html>