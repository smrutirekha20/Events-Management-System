<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: white;
        margin: 0;
        padding: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    h1 {
        color: #000000;
        text-align: center;
        text-shadow:2px 2px 5px #ff0000;
        margin-bottom: 20px;
    }
    h2{
     color: #000000;
        text-align: center;
        margin-bottom: 20px;
      }
      h3{
       color: #000000;
        text-align: center;
        text-shadow:2px 2px 5px #ff0000;
        margin-bottom: 20px;
      }
    a {
        display: inline-block;
        margin: 10px;
        padding: 10px 15px;
        color: #fff;
        background-color: #000000;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    a:hover {
        background-color: #ff0000;
    }
</style>
 
</head>
<body>
     <%
	String msg = (String) request.getAttribute("msg");
	%>
	<h1>Event Management System</h1>
	<marquee behaviour="scroll" direction="right" scrollamount="20"><h2 textcolor=#000000>Welcome To Home Page</h2></marquee>
	<h3><%=msg%></h3>

	<a href="add-event">Add events</a>
	<a href="view-events">Show events</a>
	
</body>
</html>