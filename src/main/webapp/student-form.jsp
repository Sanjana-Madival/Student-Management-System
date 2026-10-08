<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.studentmanagement.Student" %>

<%
    Student student = (Student) request.getAttribute("student");

    boolean isEdit = (student != null);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        <%= isEdit ? "Edit Student" : "Add Student" %>
    </title>
</head>

<body>

    <h1>
        <%= isEdit ? "Edit Student" : "Add New Student" %>
    </h1>

    <form action="StudentServlet" method="post">

        <% if (isEdit) { %>

            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id"
                   value="<%= student.getId() %>">

        <% } else { %>

            <input type="hidden" name="action" value="insert">

        <% } %>

        <label>Name:</label>
        <input type="text" name="name"
               value="<%= isEdit ? student.getName() : "" %>"
               required>

        <br><br>

        <label>Email:</label>
        <input type="email" name="email"
               value="<%= isEdit ? student.getEmail() : "" %>"
               required>

        <br><br>

        <label>Course:</label>
        <input type="text" name="course"
               value="<%= isEdit ? student.getCourse() : "" %>"
               required>

        <br><br>

        <label>Age:</label>
        <input type="number" name="age"
               value="<%= isEdit ? student.getAge() : "" %>"
               required>

        <br><br>

        <input type="submit"
               value="<%= isEdit ? "Update Student" : "Add Student" %>">

    </form>

    <br>

    <a href="StudentServlet">Back to Student List</a>

</body>
</html>