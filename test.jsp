<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	  
	  
	  function insert() {
		  
		  var userId = firebase.auth().currentUser.uid;
		  var userName = firebase.auth().currentUser.displayName;
		  var postData={
				  id:userId,
				  name:userName 
		  };
		  var newPostKey = firebase.database().ref().child('user-names-online').child(userName).push().key;
		  
		  var updates = {};
		  updates['/user-names-online/'+userName+'/'+newPostKey]=postData;
		  
		  return firebase.database().ref().update(updates);
	  }
	  
	  function delete1() {
		  var userId = firebase.auth().currentUser.uid;
		  var userName = firebase.auth().currentUser.displayName;
		  
		  
		  return firebase.database().ref().child('user-names-online').child(userName).remove();
	  }
	  
	  function reset() {
		  var useremail = firebase.auth().currentUser.email;
		  alert(useremail);
		  return firebase.auth().sendPasswordResetEmail(useremail);
	  }
</script>
<script>

</script>
<body>
	<a href="javascript:insert()">123</a><br>
	<a href="javascript:delete1()">123</a><br>
	<a href="javascript:reset()">123</a>
</body>
</html>