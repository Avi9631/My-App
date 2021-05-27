<%@page import="com.example.model.SearchNotes"%>
<%@page import="com.example.model.UserModel"%>
<%@page import="com.example.model.NotesModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" import="java.util.*" %>
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
            margin: 0;
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

        .newNote {
            color: white;
        }

        .n1 {
            background-color: lightgrey;
            margin: 5px;
            width: 20%;
        }

        .n2 {
            background-color: lightgrey;
            width: 75%;
            min-height: 80vw;
            height: fit-content;
        }
        #addNewNotebook{
        	display:none;
        }
        
        #addNewNotes{
      	display: block;
      	}

    </style>
    <script>
		document.getElementById("notebookName1").innerHTML="Notes Name";
		document.getElementById("addNoteHeader").innerHTML="Add Notes";
    </script>
   
</head>
<body>
	<%@ include file="header.jsp" %>
		<%if(session.getAttribute("Name")==null  ||  session.getAttribute("Email")==null){
		response.sendRedirect("index.jsp");
		}%>
	 <div class="container" style="margin: 0px; width: 100%;">
        <div class="row">
            <div class="col-md-2 n1">
                <h1>Your Daily Tasks!!!!</h1>
                <% for(NotesModel i: UserModel.noteList){%>
                <a href="#"><%=i.getNoteName() %></a>
                <p>Started date:  <%=i.getNoteStartDate()%></p>
                <p>End date:  <%=i.getNoteEndDate()%></p>
                <hr>
                <%} %>
            </div>
            <div class="col-md-8  n2">
                <div class="inp">
                <form action="SearchNotes" method="get">
                    <input type="text" placeholder="Search" name="searchNotes">
                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
                </form>
                </div>
                <br>
                <h2>Notebook</h2>
       
                <% if(!SearchNotes.noteName.equals("") && !SearchNotes.noteName.equalsIgnoreCase("ALL")){
                for(NotesModel i: UserModel.noteList){
                	if(i.getNoteName().equalsIgnoreCase(SearchNotes.noteName)){%>
                <div id="itemCon">
                    <a href="#"><%=i.getNoteName() %></a>
                    <button class="btn btn-primary" disabled>Started: <%=i.getNoteStartDate()%></button>
                    <button class="btn btn-primary" disabled>End: <%=i.getNoteEndDate()%></button>
                    
                    <br>
                    <a href="DeleteNoteBook?type=notes&id=<%=i.getNoteId() %>">
                    	<span class="glyphicon glyphicon-erase" id="delete">Delete</span>
                    </a>
                    <a onclick="document.getElementById('id03').style.display='block'"><span class="glyphicon glyphicon-plus" id="add"></span></a><br>
                    <p>Complete the assignment.</p>
                </div>
                <%}}} else{
                   for(NotesModel i: UserModel.noteList){%>
                <div id="itemCon">
                    <a href="#"><%=i.getNoteName() %></a>
                    <button class="btn btn-primary" disabled>Started: <%=i.getNoteStartDate()%></button>
                    <button class="btn btn-primary" disabled>End: <%=i.getNoteEndDate()%></button>
                    
                    <br>
                    <a href="DeleteNoteBook?type=notes&id=<%=i.getNoteId() %>" >
                    	<span class="glyphicon glyphicon-erase" id="delete">Delete</span>
                    </a>
                    <a><span class="glyphicon glyphicon-edit" id="edit">Edit&nbsp;</span></a>
                    <a onclick="document.getElementById('id03').style.display='block'"><span class="glyphicon glyphicon-plus" id="add"></span></a><br>
                    <p>Complete the assignment.</p>
                </div>
                <%}} %>
            </div>
        </div>
    </div>
    
    <script>
		function closedel(int id){
			var r=confirm("Are you sure you want to delete?");
			if(r==true){
				window.loation.href="DeleteNoteBook?type=notes&sub"+id;
			}else{

			}
		}
    </script>
</body>
</html>