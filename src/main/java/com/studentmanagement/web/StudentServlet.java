package com.studentmanagement.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.studentmanagement.Student;
import com.studentmanagement.dao.StudentDAO;

import java.io.IOException;
import java.util.List;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private StudentDAO studentDAO;

    public void init() {
        studentDAO = new StudentDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {

        case "new":
            showNewForm(request, response);
            break;

        case "edit":
            showEditForm(request, response);
            break;

        case "delete":
            deleteStudent(request, response);
            break;

        default:
            listStudents(request, response);
            break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("insert".equals(action)) {
            insertStudent(request, response);

        } else if ("update".equals(action)) {
            updateStudent(request, response);

        } else {
            response.sendRedirect("StudentServlet");
        }
    }

    private void listStudents(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Student> students = studentDAO.selectAllStudents();

        request.setAttribute("students", students);

        request.getRequestDispatcher("student-list.jsp")
               .forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("student-form.jsp")
               .forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Student existingStudent = studentDAO.selectStudent(id);

        request.setAttribute("student", existingStudent);

        request.getRequestDispatcher("student-form.jsp")
               .forward(request, response);
    }

    private void insertStudent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        int age = Integer.parseInt(request.getParameter("age"));

        Student student = new Student();

        student.setName(name);
        student.setEmail(email);
        student.setCourse(course);
        student.setAge(age);

        studentDAO.insertStudent(student);

        response.sendRedirect("StudentServlet");
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        int age = Integer.parseInt(request.getParameter("age"));

        Student student = new Student();

        student.setId(id);
        student.setName(name);
        student.setEmail(email);
        student.setCourse(course);
        student.setAge(age);

        studentDAO.updateStudent(student);

        response.sendRedirect("StudentServlet");
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        studentDAO.deleteStudent(id);

        response.sendRedirect("StudentServlet");
    }
}