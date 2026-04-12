package com.emp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    // ── INSERT ─────────────────────────────────────────────────────────────────
    public boolean addEmployee(Employee emp) {
        String sql = "INSERT INTO employees (name, email, department, designation, salary, phone, join_date) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, emp.getName());
            ps.setString(2, emp.getEmail());
            ps.setString(3, emp.getDepartment());
            ps.setString(4, emp.getDesignation());
            ps.setDouble(5, emp.getSalary());
            ps.setString(6, emp.getPhone());
            ps.setDate  (7, emp.getJoinDate());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // ── SELECT ALL ────────────────────────────────────────────────────────────
    public List<Employee> getAllEmployees() {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM employees ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             Statement  st  = con.createStatement();
             ResultSet  rs  = st.executeQuery(sql)) {

            while (rs.next()) {
                Employee emp = new Employee();
                emp.setId         (rs.getInt   ("id"));
                emp.setName       (rs.getString("name"));
                emp.setEmail      (rs.getString("email"));
                emp.setDepartment (rs.getString("department"));
                emp.setDesignation(rs.getString("designation"));
                emp.setSalary     (rs.getDouble ("salary"));
                emp.setPhone      (rs.getString("phone"));
                emp.setJoinDate   (rs.getDate  ("join_date"));
                list.add(emp);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // ── DELETE ────────────────────────────────────────────────────────────────
    public boolean deleteEmployee(int id) {
        String sql = "DELETE FROM employees WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
