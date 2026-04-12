<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Syne:wght@700;800&family=Inter:wght@300;400;500&display=swap');

        * { margin:0; padding:0; box-sizing:border-box; }
        body {
            font-family: 'Inter', sans-serif;
            background: #0d0d0d;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        body::before {
            content: '';
            position: fixed;
            width: 500px; height: 500px;
            background: radial-gradient(circle, rgba(16,185,129,0.1) 0%, transparent 70%);
            top: 50%; left: 50%;
            transform: translate(-50%,-50%);
            pointer-events: none;
        }

        .card {
            position: relative;
            z-index: 1;
            background: rgba(255,255,255,0.03);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 24px;
            padding: 64px 56px;
            text-align: center;
            max-width: 460px;
            width: 90%;
            backdrop-filter: blur(20px);
        }

        .icon-wrap {
            width: 88px; height: 88px;
            background: rgba(16,185,129,0.12);
            border: 2px solid rgba(16,185,129,0.3);
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            font-size: 2.8em;
            margin: 0 auto 28px;
            animation: popIn 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }
        @keyframes popIn {
            0%   { transform: scale(0); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }

        h2 {
            font-family: 'Syne', sans-serif;
            font-size: 1.8em;
            font-weight: 700;
            color: #10b981;
            margin-bottom: 10px;
        }

        .msg {
            color: #6b7280;
            font-size: 0.95em;
            line-height: 1.6;
            margin-bottom: 36px;
        }
        .emp-name {
            color: #e5e7eb;
            font-weight: 600;
        }

        .actions { display: flex; flex-direction: column; gap: 10px; }

        .btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 14px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.92em;
            transition: all 0.2s;
        }
        .btn-primary {
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            color: #fff;
            box-shadow: 0 4px 16px rgba(79,70,229,0.3);
        }
        .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 8px 24px rgba(79,70,229,0.45); }

        .btn-ghost {
            background: rgba(255,255,255,0.04);
            color: #9ca3af;
            border: 1px solid rgba(255,255,255,0.08);
        }
        .btn-ghost:hover { background: rgba(255,255,255,0.08); color: #fff; }

        .home-link {
            display: block;
            margin-top: 20px;
            color: #374151;
            font-size: 0.82em;
            text-decoration: none;
            transition: color 0.2s;
        }
        .home-link:hover { color: #9ca3af; }
    </style>
</head>
<body>
<div class="card">
    <div class="icon-wrap">✅</div>
    <h2>Registered!</h2>
    <p class="msg">
        <span class="emp-name"><%= request.getAttribute("empName") %></span>
        has been successfully added to the system.
    </p>

    <div class="actions">
        <a href="register.jsp" class="btn btn-primary">➕ Add Another Employee</a>
        <a href="EmployeeServlet?action=list" class="btn btn-ghost">📋 View All Employees</a>
    </div>
    <a href="index.jsp" class="home-link">← Back to Home</a>
</div>
</body>
</html>
