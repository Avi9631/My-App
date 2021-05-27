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
  .text-center{
    color: black;
    font-weight: bold;
  }
  button{
    margin-left: 25%;
    margin-right: 25% ;
  }
  </style>
</head>
<body>
	

	<h1 class="text-center">Remind Me</h1>
	<div class="jumbotron">
    <h2 class="text-center">Login</h2><br>
    <form class="form-group" action="UserLogin" method="POST">
        <label for="email" style="font-size: medium;">Email Address</label>
        <input type="email" id="email" name="Email" placeholder="Email address" class="form-control" required><br>
        <label for="password" style="font-size: medium;">Password</label>
        <input type="password" id="password" name="Password" placeholder="Password(Min: 8 characters)" class="form-control" required><br>
        <button type="submit" class="btn btn-success">Log In</button><br>
        <span>New member? <a href="register.jsp">Register</a></span>
    </form>
	</div>
	<br><br>
	

</body>
</html>