<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Portal</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Syne:wght@400;700;800&family=Inter:wght@300;400;500&display=swap');

        * { margin:0; padding:0; box-sizing:border-box; }

        body {
            font-family: 'Inter', sans-serif;
            background: #0d0d0d;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        /* Animated background orbs */
        body::before, body::after {
            content: '';
            position: fixed;
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.15;
            animation: float 8s ease-in-out infinite;
            pointer-events: none;
        }
        body::before {
            width: 500px; height: 500px;
            background: #4f46e5;
            top: -100px; left: -100px;
        }
        body::after {
            width: 400px; height: 400px;
            background: #7c3aed;
            bottom: -80px; right: -80px;
            animation-delay: -4s;
        }
        @keyframes float {
            0%, 100% { transform: translate(0,0); }
            50%       { transform: translate(30px, 30px); }
        }

        .hero {
            position: relative;
            z-index: 1;
            text-align: center;
            padding: 70px 60px;
            background: rgba(255,255,255,0.03);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 28px;
            backdrop-filter: blur(20px);
            max-width: 520px;
            width: 90%;
        }

        .logo {
            width: 72px; height: 72px;
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            border-radius: 20px;
            display: flex; align-items: center; justify-content: center;
            font-size: 2em;
            margin: 0 auto 28px;
            box-shadow: 0 8px 32px rgba(79,70,229,0.4);
        }

        h1 {
            font-family: 'Syne', sans-serif;
            font-size: 2.6em;
            font-weight: 800;
            color: #fff;
            letter-spacing: -1px;
            line-height: 1.1;
            margin-bottom: 12px;
        }
        h1 span { color: #818cf8; }

        p {
            color: #6b7280;
            font-size: 1em;
            font-weight: 300;
            margin-bottom: 44px;
            line-height: 1.6;
        }

        .actions { display: flex; flex-direction: column; gap: 12px; }

        .btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 16px 28px;
            border-radius: 14px;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.95em;
            letter-spacing: 0.3px;
            transition: all 0.2s ease;
        }
        .btn-primary {
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            color: #fff;
            box-shadow: 0 4px 20px rgba(79,70,229,0.35);
        }
        .btn-primary:hover {
            box-shadow: 0 8px 28px rgba(79,70,229,0.55);
            transform: translateY(-2px);
        }
        .btn-ghost {
            background: rgba(255,255,255,0.04);
            color: #9ca3af;
            border: 1px solid rgba(255,255,255,0.08);
        }
        .btn-ghost:hover {
            background: rgba(255,255,255,0.08);
            color: #fff;
            transform: translateY(-2px);
        }

        .divider {
            margin: 30px 0 0;
            padding-top: 20px;
            border-top: 1px solid rgba(255,255,255,0.06);
            color: #374151;
            font-size: 0.78em;
            letter-spacing: 1px;
            text-transform: uppercase;
        }
    </style>
</head>
<body>
    <div class="hero">
        <div class="logo">👥</div>
        <h1>Employee<br><span>Portal</span></h1>
        <p>Register, manage and track your workforce — all from one place.</p>

        <div class="actions">
            <a href="register.jsp" class="btn btn-primary">
                <span>➕</span> Register New Employee
            </a>
            <a href="EmployeeServlet?action=list" class="btn btn-ghost">
                <span>📋</span> View All Employees
            </a>
        </div>

        <div class="divider">Assignment No. 05 · JSP + Servlet + JDBC</div>
    </div>
</body>
</html>
