<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Remind Me</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  body {
    font: 400 15px Lato, sans-serif;
    line-height: 1.8;
  }
  .jumbotron{
      width: 50%;
      height: 50%;
      margin: auto;
      padding: 50px 100px;
      margin-top: 30px;
  }
  h1{
    color: black;
  }
  </style>
    <script>
      function validate(){
        if(document.getElementById("password").value == document.getElementById("confirmpassword").value){
          return true;
        }else{
          alert("Incorrect Password");
          return false;
        }
      }
    </script>
</head>
<body>
	<h1 class="text-center">Remind Me</h1>
	<div class="jumbotron">
    <h3 class="text-center">Create Account</h3><br>
    <form class="form-group" id="myForm" method="POST" action="UserRegister" onsubmit="return validate()">
        <label for="username" style="font-size: medium;">User Name</label>
        <input type="text" id="username" name="username" placeholder="Username" class="form-control" required><br>
        <label for="mobile" style="font-size: medium;">Mobile</label>
        <input type="tel" id="mobile" name="mobile" placeholder="Mobile" class="form-control" required><br>
        <label for="email" style="font-size: medium;">Email Address</label>
        <input type="email" id="email" name="Email" placeholder="Email address" class="form-control"><br>
        <label for="password" style="font-size: medium;">Password</label>
        <input type="password" id="password" name="Password" placeholder="Password(Min: 8 characters)" class="form-control"><br>
        <label for="confirmpassword" style="font-size: medium;">Confirm Password</label>
        <input type="password" id="confirmpassword" name="ConfirmPassword" placeholder="Confirm Password(Min: 8 characters)" class="form-control"><br>
        <button type="submit" class="btn btn-success">Submit</button><br>
        <span>Already a member? <a href="login.jsp">Login</a></span>
    </form>
	</div>
	<br><br>

	<script>
		function validate(){
			var p = document.forms["myForm"]["Password"].value;
			var c = document.forms["myForm"]["ConfirmPassword"].value;
			if(p==c){
				return true;
			}else{
				alert("Password does not match!!");
				return false;		
			}
		}
	</script>
	
</body>
</html>