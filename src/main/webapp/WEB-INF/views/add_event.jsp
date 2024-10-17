<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Event</title>
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
    border-color: #777799;
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
 <f:form action="add-event" modelAttribute="eventAddress">
    <h2 style="text-align: center;">Enter event</h2>
        <f:label path="title">Title:</f:label>
        <f:input path="title" />
        <br>
        <br>

        <f:label path="description">Description:</f:label>
        <f:input path="description" />
        <br>
        <br>
        <f:label path="startDateTime">Start Date Time:</f:label>
        <f:input path="startDateTime" />
        <br>
        <br>

        <f:label path="status">Status:</f:label>
        <f:input path="status" />
        <br>
        <br>
        
        <h2 style="text-align: center;"> Enter address </h2>

        <f:label path="addressLine">Address Line:</f:label>
        <f:input path="addressLine" />
        <br>
        <br>

        <f:label path="landMark">Land Mark:</f:label>
        <f:input path="landMark" />
        <br>
        <br>

        <f:label path="city">City:</f:label>
        <f:input path="city" />
        <br>
        <br>

        <f:label path="state">State:</f:label>
        <f:input path="state" />
        <br>
        <br>

        <f:label path="pincode">Pincode:</f:label>
        <f:input path="pincode" />
        <br>
        <br>
         
        <input type="submit" value="Add Event">
    </f:form>
</body>
</html>