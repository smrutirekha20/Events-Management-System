<%@page import="com.mvc.entity.Event"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Event</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: white;
    margin: 0;
    padding: 20px;
    display: flex;
    justify-content: center;
}

form {
    background-color: #000000;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    width: 80%; /* Change to 80% */
    max-width: 600px; /* Set a maximum width */
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 8px;
    font-weight: bold;
    color: white;
}

input[type="text"], input[type="datetime-local"], input[type="submit"] {
    margin-bottom: 20px;
    padding: 12px;
    border: 1px solid #ced4da;
    border-radius: 5px;
    font-size: 14px;
    transition: border-color 0.2s, box-shadow 0.2s;
}

input[type="text"]:focus, input[type="datetime-local"]:focus {
    border-color: #000000;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    outline: none;
}

input[type="submit"] {
    background-color: #000000;
    color: white;
    border: none;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s, transform 0.2s;
}

input[type="submit"]:hover {
    background-color: #000000;
    transform: translateY(-2px);
}

input[type="submit"]:active {
    transform: translateY(0);
}

@media (max-width: 600px) {
    form {
        width: 90%; /* Adjust for smaller screens */
    }
}
</style>
</head>
<body>
 <%
    Event event =(Event) request.getAttribute("event"); 
 %>
       <f:form action="update-event" modelAttribute="event" method="post">
        <h2 >Edit Event</h2>
        <f:hidden path="eventId"/>
        <f:label path="title">Title:</f:label>
        <f:input path="title" />
        <br>

        <f:label path="description">Description:</f:label>
        <f:input path="description" />
        <br>

        <f:label path="startDateTime">Start Date Time:</f:label>
        <f:input path="startDateTime" />
        <br>

        <f:label path="status">Status:</f:label>
        <f:input path="status" />
        <br>
         <input type="submit" value="Update Event">
      </f:form>
</body>
</html>