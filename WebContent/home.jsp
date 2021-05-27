<%@page import="com.example.model.SearchNotebook"%>
<%@page import="com.example.model.NotebookModel"%>
<%@page import="com.example.model.UserModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
            cursor: pointer;
        }

        #edit {
            float: right;
            margin-right: 4px;
            cursor: pointer;
            
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
       .addnotebookform{
        padding:20px ;
        min-width: fit-content;
        width:50%; 
        height:fit-content; 
        margin:auto;
      }
      #addNewNotes{
      	display: none;
      }
    </style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%if(session.getAttribute("Name")==null  ||  session.getAttribute("Email")==null){
		response.sendRedirect("index.jsp");
		}%>
	<div class="jumbotron">
        <div class="inp">
        <form action="SearchNotebook" method="get">
            <input type="text" name="search" placeholder="Search(Type 'ALL' for default)">
            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
            </form>
        </div>
        <br>
        <h2>&nbsp;Notebook</h2>
		<%if(!SearchNotebook.name.equals("")  &&  !SearchNotebook.name.equalsIgnoreCase("ALL")) {
			for(NotebookModel i: UserModel.noteBookListCopy){
				if(i.getName().equalsIgnoreCase(SearchNotebook.name)){%>
       	<div id="itemCon">
            <a href="viewnotes.jsp?sub=<%=i.getName() %>"><%=i.getName() %></a>
            <button class="btn btn-primary">Started</button>
            <br>
            <a href="DeleteNoteBook?type=notebook&id=<%=i.getId()%>"  id="delete">
            	<span class="glyphicon glyphicon-erase" >Delete</span>
            </a>
            <button id="edit">
            	<span class="glyphicon glyphicon-edit">Edit</span>
            </button>
            <a onclick="document.getElementById('id03').style.display='block'"><span class="glyphicon glyphicon-plus" id="add"></span></a><br>   
        </div>
		<% }}}else{
        for(NotebookModel i: UserModel.noteBookListCopy){ %>
       	<div id="itemCon">
            <a href="viewnotes.jsp?sub=<%=i.getName() %>"><%=i.getName() %></a>
            <button class="btn btn-primary">Started</button>
            <br>
            <a href="DeleteNoteBook?type=notebook&id=<%=i.getId()%>"  id="delete">
            	<span class="glyphicon glyphicon-erase" >Delete</span>
            </a>
            <a id="edit" onclick="document.getElementById('id06').style.display='block';document.getElementById('id').value='<%=i.getId()%>'">
            	<span class="glyphicon glyphicon-edit" >Edit</span>
            </a>
            <a onclick="document.getElementById('id03').style.display='block'"><span class="glyphicon glyphicon-plus" id="add"></span></a><br>   
        </div>
        <%}} %>
    </div>
   
       	<div id="id03" class="modal"> 
        <form class="modal-content animate addnotebookform form-group" action="AddNotes" method="get">
           	<span class="glyphicon glyphicon-remove" style="float:right; cursor: pointer;" onclick="closeadd()"></span>
            <h2 class="text-center">Add Notes</h2>
            <hr>
            <label for="noteName">Notes Name</label><br>
            <input type="text" name="noteName" id="noteName" placeholder="Add Notes" class="form-control" required>
            <br>
            <label for="startDate">Start Date:</label><br>
            <input type="date" name="startDate" id="startDate" value="2018-07-22" min="2018-01-01" max="2018-12-31" class="form-control" required>
            <br>
            <label for="endDate">End Date:</label><br>
            <input type="date" name="endDate" id="endDate" value="2018-07-22" min="2018-01-01" max="2018-12-31" class="form-control" required>
            <br>
            <label for="sub">Subject:</label><br>
            <select name="sub" id="sub">
            <%for(NotebookModel i: UserModel.noteBookListCopy){ %>
  				<option value="<%=i.getName()%>"> <%=i.getName() %> </option>
  			<% }%>
			</select>
            <br>
            <button type="submit" style="text-align: center; padding:10px" class="btn btn-success" onclick="closeadd()">Submit</button>
        </form>
    </div>
    
    
    <div id="id06" class="modal"> 
        <form class="modal-content animate addnotebookform form-group" action="EditNotebook" method="get">
        	<span class="glyphicon glyphicon-remove" onclick="closeEdit()" style="float:right;"></span>
            <h2 class="text-center">Edit Notebook</h2>
            <hr>
            <label for="noteName">Notebook Name</label><br>
            <input type="text" name="newName" id="noteName" placeholder="Notebook Name" class="form-control" required>
            <input type="text" name="newType" id="type" value="notebook" class="form-control" style="display:none;">
            <input type="text" name="newId" id="id" class="form-control" style="display:none;">
            <br>
            <button type="submit" style="text-align: center; padding:10px" class="btn btn-success" onclick="closeEdit()">Submit</button>
            <button style="text-align: center; padding:10px" class="btn btn-success" onclick="closeEdit()">Close</button>
            
        </form>
    </div>
    
    <script>
        function closeadd() {
            document.getElementById('id03').style.display = 'none';
        }
        function closeEdit() {
            document.getElementById("id06").style.display = 'none';
        }

        function closedel(int id){
			var r=confirm("Are you sure you want to delete?");
			if(r==true){
				window.loation.href="DeleteNoteBook?type=notebook&id="+id;
			}else{

			}
		}
    </script>

</body>
</html>