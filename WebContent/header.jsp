<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
            color: black;
        }

        nav {
            background-color: black;
            margin: 0px;
            padding: 4px;
        }

        .logo {
            color: white;
            font-weight: bold;
        }

        .logout {
            color: white;
            float: right;
            margin-top: auto;
            margin-bottom: auto;
        }

        .noti {
            float: right;
            margin-top: auto;
            margin-bottom: auto;
        }

        .inp {
            float: right;
            margin-top: 10px;
        }

        #delete {
            float: right;
        }

        #edit {
            float: right;
            margin-right: 4px;
        }

        #itemCon {
            background-color: white;
            margin: 10px;
            padding: 10px;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .addnotebookform {
            padding: 20px;
            width: 50%;
            height: fit-content;
            margin: auto;
        }
        .sidenav {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

        .sidenav a {
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 25px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }

        .sidenav a:hover {
            color: #f1f1f1;
        }

        .sidenav .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }
        
        #saveBtn{
        	text-align: center; 
        	padding:10px;
        	margin-left: auto;
			margin-right: auto;
        }
        
        .addnotebookform{
        padding:20px ;
        min-width: fit-content;
        width:50%; 
        height:fit-content; 
        margin:auto;
      }

        @media screen and (max-height: 450px) {
            .sidenav {
                padding-top: 15px;
            }

            .sidenav a {
                font-size: 18px;
            }
        }
    </style>
</head>
<body>

	 <nav class="navbar navbar-light bg-dark">
        <span style="font-size:30px;cursor:pointer; color: white; float: left;" onclick="openNav()">&#9776;</span>
        <a class="navbar-brand logo" href="#">Navbar</a>
        <a class="navbar-brand logout" href="Logout">
        	<span class="glyphicon glyphicon-log-out"></span> Log out
        </a>
        <a class="navbar-brand noti" href="#"><span class="glyphicon glyphicon-bell"></span></a>
        <a class="navbar-brand noti" id="addNewNotebook" href="#" onclick="document.getElementById('id02').style.display='block'">
        	<span class="glyphicon glyphicon-plus"></span>ADD NEW NOTEBOOK
        </a>
        <a class="navbar-brand noti" id="addNewNotes" href="#" onclick="document.getElementById('id02').style.display='block'">
        	<span class="glyphicon glyphicon-plus"></span>ADD NEW NOTES
        </a>
    </nav>
    
    <!--Common-->
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="#">Hi,&nbsp;<%=session.getAttribute("Name") %></a>
        <ul>
            <li class="active"><a href="home.jsp">Notebook</a></li>
            <li><a href="notes.jsp">NOTES</a></li>
            <li><a href="#" onclick="document.getElementById('id01').style.display='block'">Edit User</a></li>
        </ul>
    </div>

    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }
    </script>
    <!--Common-->

    <div id="id01" class="modal">
        <form class="modal-content animate addnotebookform form-group" action="EditUser" method="post">
        <span class="glyphicon glyphicon-remove" style="float:right; cursor: pointer;" onclick="closefun()"></span>
            <h2 class="text-center">Edit User</h2>
            <hr>
            <label for="userName">UserName</label><br>
            <input type="text" name="userName" id="userName" placeholder="User Name" class="form-control" required>
            <br>
            <label for="mobileNo">Mobile No.</label><br>
            <input type="tel" name="mobileNo" id="mobileNo" placeholder="Mobile No." class="form-control" required>
            <br>
            Password:<input type="password" name="password" id="password" placeholder="Password" class="form-control" required>
            <br>
            <button type="submit" id="saveBtn" class="btn btn-success"
                onclick="closefun()">Save</button>
            <hr>    
        </form>
    </div>

	<div id="id02" class="modal"> 
        <form class="modal-content animate addnotebookform form-group" action="AddNotebook" method="get" >
        	<span class="glyphicon glyphicon-remove" style="float:right; cursor: pointer;" onclick="closeNotes()"></span>
            <h2 class="text-center" id="addNoteHeader">Add Notebook</h2>
            <hr>
            <label for="notebookName" id="notebookName1">NoteBook Name</label><br>
            <input type="text" name="notebookName" id="notebookName" placeholder="Add Notebook" class="form-control" required>
            <br>
            <input type="text" name="userid" id="userid" value="<%=session.getAttribute("Id") %>" class="form-control" style="display:none">
            <button type="submit" style="text-align: center; padding:10px" class="btn btn-success" onclick="closeNotes()">Submit</button>
        </form>
    </div>
    <script>
        function closefun() {
            document.getElementById('id01').style.display = 'none';
        }
        function closeNotes() {
            document.getElementById('id02').style.display = 'none';
        }
    </script>
</body>
</html>