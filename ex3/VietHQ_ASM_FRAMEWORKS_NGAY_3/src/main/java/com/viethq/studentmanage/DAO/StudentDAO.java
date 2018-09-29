package com.viethq.studentmanage.DAO;

import com.viethq.studentmanage.DTO.Student;
import com.viethq.studentmanage.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO extends GenericDAO {

    public List<Student> findAll() {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        String sql = "Select s.id, s.name " +
                "from tblStudent s";

        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            rs = statement.executeQuery();
            List<Student> studentList = new ArrayList<>();
            Student student;
            while (rs.next()) {
                student = new Student();
                int id = rs.getInt("id");
                String name = rs.getString("name");
                student.setId(id);
                student.setName(name);

                studentList.add(student);
            }
            return studentList;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            closeConnection(conn, statement, rs);
        }
    }

    public Student findById(int studentId) {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        String sql = "Select s.id, s.name " +
                "from tblStudent s " +
                "where s.id=?";

        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setInt(1, studentId);
            rs = statement.executeQuery();
            Student student = null;
            if (rs.next()) {
                student = new Student();
                int id = rs.getInt("id");
                String name = rs.getString("name");
                student.setId(id);
                student.setName(name);
            }
            return student;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            closeConnection(conn, statement, rs);
        }
    }

    public int removeById(int studentId) {
        Connection conn = null;
        PreparedStatement statement = null;
        String sql = "Delete from tblStudent where id=?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setInt(1, studentId);
            return statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        } finally {
            closeConnection(conn, statement);
        }
    }

    public int insert(Student student) {
        Connection conn = null;
        PreparedStatement statement = null;
        String sql = "Insert into tblStudent(id, name) values(?,?)";

        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setInt(1, student.getId());
            statement.setString(2, student.getName());
            return statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        } finally {
            closeConnection(conn, statement);
        }
    }

    public int update(Student student) {
        Connection conn = null;
        PreparedStatement statement = null;
        String sql = "Update tblStudent " +
                "Set name=? " +
                "Where id=?";
        try {
            conn = DBConnection.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, student.getName());
            statement.setInt(2, student.getId());
            return statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        } finally {
            closeConnection(conn, statement);
        }
    }

}
