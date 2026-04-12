<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.emp.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Employees</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Syne:wght@600;700;800&family=Inter:wght@300;400;500;600&display=swap');

        * { margin:0; padding:0; box-sizing:border-box; }

        body {
            font-family: 'Inter', sans-serif;
            background: #0d0d0d;
            min-height: 100vh;
            padding: 40px 24px;
            color: #e5e7eb;
        }
        body::before {
            content: '';
            position: fixed;
            width: 700px; height: 400px;
            background: radial-gradient(ellipse, rgba(79,70,229,0.07) 0%, transparent 70%);
            top: 0; left: 50%;
            transform: translateX(-50%);
            pointer-events: none;
        }

        .page-wrap {
            position: relative;
            z-index: 1;
            max-width: 1100px;
            margin: 0 auto;
        }

        /* Top Bar */
        .top-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 28px;
            flex-wrap: wrap;
            gap: 16px;
        }
        .top-bar-left { display: flex; align-items: center; gap: 14px; }
        .page-icon {
            width: 46px; height: 46px;
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            border-radius: 13px;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.3em;
        }
        .page-title {
            font-family: 'Syne', sans-serif;
            font-size: 1.5em;
            font-weight: 700;
            color: #fff;
        }
        .record-count {
            display: inline-block;
            background: rgba(79,70,229,0.15);
            border: 1px solid rgba(79,70,229,0.3);
            color: #818cf8;
            font-size: 0.75em;
            font-weight: 600;
            padding: 3px 10px;
            border-radius: 20px;
            margin-left: 8px;
        }

        .btn-add {
            display: flex; align-items: center; gap: 7px;
            padding: 11px 20px;
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            color: #fff;
            text-decoration: none;
            border-radius: 11px;
            font-size: 0.88em;
            font-weight: 600;
            box-shadow: 0 4px 16px rgba(79,70,229,0.3);
            transition: all 0.2s;
        }
        .btn-add:hover { transform: translateY(-2px); box-shadow: 0 8px 24px rgba(79,70,229,0.45); }

        /* Table Card */
        .table-card {
            background: rgba(255,255,255,0.02);
            border: 1px solid rgba(255,255,255,0.07);
            border-radius: 18px;
            overflow: hidden;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 820px;
        }

        thead tr {
            background: rgba(79,70,229,0.1);
            border-bottom: 1px solid rgba(79,70,229,0.2);
        }
        th {
            padding: 14px 16px;
            text-align: left;
            font-size: 0.72em;
            font-weight: 600;
            letter-spacing: 1.2px;
            text-transform: uppercase;
            color: #818cf8;
        }

        tbody tr {
            border-bottom: 1px solid rgba(255,255,255,0.04);
            transition: background 0.15s;
        }
        tbody tr:last-child { border-bottom: none; }
        tbody tr:hover { background: rgba(255,255,255,0.03); }

        td {
            padding: 14px 16px;
            font-size: 0.9em;
            color: #d1d5db;
            vertical-align: middle;
        }

        .emp-name { font-weight: 600; color: #f9fafb; }
        .emp-email { color: #6b7280; font-size: 0.85em; }

        .badge {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 0.75em;
            font-weight: 600;
            background: rgba(79,70,229,0.15);
            color: #818cf8;
            border: 1px solid rgba(79,70,229,0.25);
            white-space: nowrap;
        }

        .salary { font-weight: 500; color: #10b981; }

        .btn-delete {
            padding: 6px 12px;
            background: rgba(239,68,68,0.08);
            border: 1px solid rgba(239,68,68,0.2);
            color: #f87171;
            border-radius: 8px;
            text-decoration: none;
            font-size: 0.8em;
            font-weight: 500;
            transition: all 0.2s;
            white-space: nowrap;
        }
        .btn-delete:hover {
            background: rgba(239,68,68,0.18);
            border-color: rgba(239,68,68,0.4);
        }

        /* Empty state */
        .empty-state {
            padding: 80px 20px;
            text-align: center;
        }
        .empty-state .empty-icon { font-size: 3em; margin-bottom: 16px; opacity: 0.3; }
        .empty-state h3 { color: #374151; font-size: 1.1em; margin-bottom: 8px; }
        .empty-state p  { color: #374151; font-size: 0.88em; }

        /* Footer nav */
        .footer-nav {
            text-align: center;
            margin-top: 24px;
        }
        .footer-nav a {
            color: #374151;
            text-decoration: none;
            font-size: 0.85em;
            transition: color 0.2s;
        }
        .footer-nav a:hover { color: #9ca3af; }
    </style>
</head>
<body>
<%
    List<Employee> employees = (List<Employee>) request.getAttribute("employees");
    int count = (employees != null) ? employees.size() : 0;
%>
<div class="page-wrap">

    <!-- Top Bar -->
    <div class="top-bar">
        <div class="top-bar-left">
            <div class="page-icon">👥</div>
            <div>
                <div class="page-title">
                    Employees
                    <span class="record-count"><%= count %> records</span>
                </div>
            </div>
        </div>
        <a href="register.jsp" class="btn-add">➕ Register New</a>
    </div>

    <!-- Table -->
    <div class="table-card">
        <% if (count == 0) { %>
        <div class="empty-state">
            <div class="empty-icon">📭</div>
            <h3>No Employees Yet</h3>
            <p>Register your first employee to get started.</p>
        </div>
        <% } else { %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Employee</th>
                    <th>Department</th>
                    <th>Designation</th>
                    <th>Salary</th>
                    <th>Phone</th>
                    <th>Joined</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <% for (Employee emp : employees) { %>
                <tr>
                    <td style="color:#4b5563;">#<%= emp.getId() %></td>
                    <td>
                        <div class="emp-name"><%= emp.getName() %></div>
                        <div class="emp-email"><%= emp.getEmail() %></div>
                    </td>
                    <td><span class="badge"><%= emp.getDepartment() %></span></td>
                    <td><%= emp.getDesignation() %></td>
                    <td class="salary">₹<%= String.format("%,.0f", emp.getSalary()) %></td>
                    <td><%= emp.getPhone() %></td>
                    <td><%= emp.getJoinDate() %></td>
                    <td>
                        <a href="EmployeeServlet?action=delete&id=<%= emp.getId() %>"
                           class="btn-delete"
                           onclick="return confirm('Delete <%= emp.getName() %>?')">🗑 Delete</a>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
        <% } %>
    </div>

    <div class="footer-nav">
        <a href="index.jsp">← Back to Home</a>
    </div>
</div>
</body>
</html>
