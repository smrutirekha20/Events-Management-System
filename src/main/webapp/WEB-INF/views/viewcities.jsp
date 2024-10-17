<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Of cities</title>
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
        color: #333;
        margin-bottom: 20px;
    }

    form {
        background-color: #000000;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 20px;
        width: 300px;
    }

    select {
        padding: 10px;
        border: 1px solid #000000;
        border-radius: 5px;
        font-size: 14px;
        margin-bottom: 15px;
        width: 100%;
    }

    input[type="submit"] {
        padding: 10px 15px;
        background-color: #000000;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
    }

    input[type="submit"]:hover {
        background-color: #000000;
    }

    h2 {
        color: #333;
        margin-bottom: 10px;
    }

    table {
        width: 80%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color:#000000;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ddd;
    }

    th {
        background-color: #000000;
        color: white;
    }

    tr:nth-child(even) {
        background-color: white;
    }

    tr:hover {
        background-color: white;
    }

    a {
        color: #000000;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<h1>Select city</h1>
	<form action="view-events" method="post">
		<select name="city">
			<c:forEach var="city" items="${ cities }">
				<option value="${city}">${city }</option>
			</c:forEach>
		</select> <input type="submit">
	</form>

	<c:if test="${ events != null }">
		<h2>Your events</h2>

		<table border="2">
			<tr>
				<th>EventID</th>
				<th>Title</th>
				<th>Description</th>
				<th>Start Date Time</th>
				<th>Status</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>

			<c:forEach items="${events}" var="event">
				<tr>
					<td>${event.eventId}</td>
					<td>${event.title}</td>
					<td>${event.description}</td>
					<td>${event.startDateTime}</td>
					<td>${event.status}</td>
					<td><a href="request-update-event?eventId=${event.eventId}">Edit</a>
					</td>
					<td><a href="delete-event?eventId=${event.eventId}">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>