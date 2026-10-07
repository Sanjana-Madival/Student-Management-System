package com.studentmanagement.dao;

import com.studentmanagement.Student;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class StudentDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/student_management";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Saanak@1012";

    protected Connection getConnection() {
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                    jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return connection;
    }
    
    public void insertStudent(Student student) {

        String sql = "INSERT INTO students (name, email, course, age) VALUES (?, ?, ?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, student.getName());
            preparedStatement.setString(2, student.getEmail());
            preparedStatement.setString(3, student.getCourse());
            preparedStatement.setInt(4, student.getAge());

            preparedStatement.executeUpdate();

            System.out.println("Student inserted successfully!");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Student selectStudent(int id) {

        Student student = null;

        String sql = "SELECT id, name, email, course, age FROM students WHERE id = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                student = new Student();

                student.setId(resultSet.getInt("id"));
                student.setName(resultSet.getString("name"));
                student.setEmail(resultSet.getString("email"));
                student.setCourse(resultSet.getString("course"));
                student.setAge(resultSet.getInt("age"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return student;
    }
    
    public List<Student> selectAllStudents() {

        List<Student> students = new ArrayList<>();

        String sql = "SELECT id, name, email, course, age FROM students";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                Student student = new Student();

                student.setId(resultSet.getInt("id"));
                student.setName(resultSet.getString("name"));
                student.setEmail(resultSet.getString("email"));
                student.setCourse(resultSet.getString("course"));
                student.setAge(resultSet.getInt("age"));

                students.add(student);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return students;
    }
    
    public boolean updateStudent(Student student) {

        boolean rowUpdated = false;

        String sql = "UPDATE students SET name = ?, email = ?, course = ?, age = ? WHERE id = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, student.getName());
            preparedStatement.setString(2, student.getEmail());
            preparedStatement.setString(3, student.getCourse());
            preparedStatement.setInt(4, student.getAge());
            preparedStatement.setInt(5, student.getId());

            rowUpdated = preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowUpdated;
    }
    
    public boolean deleteStudent(int id) {

        boolean rowDeleted = false;

        String sql = "DELETE FROM students WHERE id = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id);

            rowDeleted = preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowDeleted;
    }
    
    public static void main(String[] args) {
        StudentDAO dao = new StudentDAO();

        if (dao.getConnection() != null) {
            System.out.println("Database connected successfully!");
        } else {
            System.out.println("Database connection failed!");
        }
    }
}
