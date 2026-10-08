<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.studentmanagement.Student" %>

<%
    List<Student> students =
        (List<Student>) request.getAttribute("students");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Student Management System</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #1f2937;
        }

        .header {
            background: #1e3a8a;
            color: white;
            padding: 25px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 28px;
        }

        .header p {
            margin-top: 5px;
            opacity: 0.8;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
        }

        .top-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .top-section h2 {
            font-size: 25px;
        }

        .add-btn {
            background: #2563eb;
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            border-radius: 8px;
            font-weight: bold;
        }

        .add-btn:hover {
            background: #1d4ed8;
        }

        .card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #eff6ff;
            color: #1e3a8a;
            text-align: left;
            padding: 15px;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover {
            background: #f9fafb;
        }

        .edit-btn {
            background: #f59e0b;
            color: white;
            padding: 7px 12px;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
        }

        .delete-btn {
            background: #dc2626;
            color: white;
            padding: 7px 12px;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
        }

        .edit-btn:hover {
            background: #d97706;
        }

        .delete-btn:hover {
            background: #b91c1c;
        }

        .empty {
            text-align: center;
            padding: 40px;
            color: #6b7280;
        }

        .footer {
            text-align: center;
            margin-top: 35px;
            color: #6b7280;
            font-size: 14px;
        }

        @media (max-width: 700px) {

            .header {
                padding: 20px;
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }

            .container {
                width: 95%;
            }

            .top-section {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
        }

    </style>

</head>

<body>

    <div class="header">

        <div>
            <h1>🎓 Student Management System</h1>
            <p>Manage your students easily</p>
        </div>

    </div>


    <div class="container">

        <div class="top-section">

            <h2>Student Records</h2>

            <a class="add-btn"
               href="StudentServlet?action=new">
                + Add Student
            </a>

        </div>


        <div class="card">

            <% if (students != null && !students.isEmpty()) { %>

            <table>

                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Course</th>
                    <th>Age</th>
                    <th>Actions</th>
                </tr>

                <% for (Student student : students) { %>

                <tr>

                    <td><%= student.getId() %></td>

                    <td>
                        <strong>
                            <%= student.getName() %>
                        </strong>
                    </td>

                    <td>
                        <%= student.getEmail() %>
                    </td>

                    <td>
                        <%= student.getCourse() %>
                    </td>

                    <td>
                        <%= student.getAge() %>
                    </td>

                    <td>

                        <a class="edit-btn"
                           href="StudentServlet?action=edit&id=<%= student.getId() %>">
                            Edit
                        </a>

                        &nbsp;

                        <a class="delete-btn"
                           href="StudentServlet?action=delete&id=<%= student.getId() %>"
                           onclick="return confirm('Are you sure you want to delete this student?');">
                            Delete
                        </a>

                    </td>

                </tr>

                <% } %>

            </table>

            <% } else { %>

                <div class="empty">
                    <h3>No students found</h3>
                    <p>Click "Add Student" to create your first student.</p>
                </div>

            <% } %>

        </div>


        <div class="footer">
            Student Management System © 2026
        </div>

    </div>

</body>

</html>