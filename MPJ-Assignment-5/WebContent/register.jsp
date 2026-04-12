<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Employee</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Syne:wght@600;700;800&family=Inter:wght@300;400;500;600&display=swap');

        * { margin:0; padding:0; box-sizing:border-box; }

        body {
            font-family: 'Inter', sans-serif;
            background: #0d0d0d;
            min-height: 100vh;
            display: flex;
            align-items: flex-start;
            justify-content: center;
            padding: 40px 16px;
        }
        body::before {
            content: '';
            position: fixed;
            width: 600px; height: 600px;
            background: radial-gradient(circle, rgba(79,70,229,0.12) 0%, transparent 70%);
            top: -200px; right: -200px;
            pointer-events: none;
        }

        .card {
            position: relative;
            z-index: 1;
            background: rgba(255,255,255,0.03);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 24px;
            padding: 44px 40px;
            width: 100%;
            max-width: 640px;
            backdrop-filter: blur(20px);
        }

        .card-header {
            display: flex;
            align-items: center;
            gap: 14px;
            margin-bottom: 32px;
        }
        .card-icon {
            width: 48px; height: 48px;
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            border-radius: 14px;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.4em;
            flex-shrink: 0;
        }
        .card-header h2 {
            font-family: 'Syne', sans-serif;
            font-size: 1.5em;
            font-weight: 700;
            color: #fff;
        }
        .card-header p { color: #6b7280; font-size: 0.85em; margin-top: 2px; }

        .error-box {
            background: rgba(239,68,68,0.08);
            border: 1px solid rgba(239,68,68,0.25);
            color: #f87171;
            padding: 12px 16px;
            border-radius: 10px;
            margin-bottom: 24px;
            font-size: 0.88em;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .section-label {
            font-size: 0.7em;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            color: #4f46e5;
            margin: 24px 0 14px;
            padding-bottom: 8px;
            border-bottom: 1px solid rgba(79,70,229,0.2);
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }
        .form-group { display: flex; flex-direction: column; }
        .form-group.full { grid-column: 1 / -1; }

        label {
            font-size: 0.78em;
            font-weight: 500;
            color: #9ca3af;
            margin-bottom: 6px;
            letter-spacing: 0.3px;
        }
        label .req { color: #f87171; margin-left: 2px; }

        input, select {
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 10px;
            padding: 11px 14px;
            color: #e5e7eb;
            font-size: 0.92em;
            font-family: 'Inter', sans-serif;
            outline: none;
            transition: border-color 0.2s, background 0.2s, box-shadow 0.2s;
            width: 100%;
        }
        input::placeholder { color: #4b5563; }
        input:focus, select:focus {
            border-color: #4f46e5;
            background: rgba(79,70,229,0.06);
            box-shadow: 0 0 0 3px rgba(79,70,229,0.12);
        }
        select option { background: #1a1a2e; color: #e5e7eb; }

        /* Date input color fix */
        input[type="date"]::-webkit-calendar-picker-indicator { filter: invert(0.5); cursor: pointer; }

        .btn-row {
            display: flex;
            gap: 12px;
            margin-top: 30px;
        }
        .btn-submit {
            flex: 1;
            padding: 14px;
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            color: #fff;
            border: none;
            border-radius: 12px;
            font-size: 0.95em;
            font-weight: 600;
            font-family: 'Inter', sans-serif;
            cursor: pointer;
            letter-spacing: 0.5px;
            transition: all 0.2s;
            box-shadow: 0 4px 16px rgba(79,70,229,0.3);
        }
        .btn-submit:hover {
            opacity: 0.9;
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(79,70,229,0.45);
        }
        .btn-back {
            padding: 14px 20px;
            background: rgba(255,255,255,0.04);
            color: #9ca3af;
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 12px;
            text-decoration: none;
            font-size: 0.92em;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 6px;
            transition: all 0.2s;
        }
        .btn-back:hover { background: rgba(255,255,255,0.08); color: #fff; }

        @media (max-width: 520px) {
            .card { padding: 30px 20px; }
            .form-grid { grid-template-columns: 1fr; }
            .form-group.full { grid-column: 1; }
        }
    </style>
</head>
<body>
<div class="card">
    <div class="card-header">
        <div class="card-icon">📝</div>
        <div>
            <h2>Register Employee</h2>
            <p>All fields marked <span style="color:#f87171">*</span> are required</p>
        </div>
    </div>

    <%-- Error message --%>
    <% String err = (String) request.getAttribute("errorMsg");
       if (err != null && !err.isEmpty()) { %>
        <div class="error-box">⚠ &nbsp;<%= err %></div>
    <% } %>

    <form action="EmployeeServlet" method="post" autocomplete="off">

        <div class="section-label">Personal Information</div>
        <div class="form-grid">
            <div class="form-group">
                <label>Full Name <span class="req">*</span></label>
                <input type="text" name="name" placeholder="e.g. Rahul Sharma" required>
            </div>
            <div class="form-group">
                <label>Email Address <span class="req">*</span></label>
                <input type="email" name="email" placeholder="rahul@company.com" required>
            </div>
            <div class="form-group">
                <label>Phone Number <span class="req">*</span></label>
                <input type="tel" name="phone" placeholder="9876543210"
                       pattern="[6-9][0-9]{9}" title="Enter valid 10-digit Indian mobile number" required>
            </div>
        </div>

        <div class="section-label">Job Information</div>
        <div class="form-grid">
            <div class="form-group">
                <label>Department <span class="req">*</span></label>
                <select name="department" required>
                    <option value="">-- Select Department --</option>
                    <option>Engineering</option>
                    <option>Human Resources</option>
                    <option>Finance</option>
                    <option>Marketing</option>
                    <option>Operations</option>
                    <option>Sales</option>
                    <option>Information Technology</option>
                    <option>Research &amp; Development</option>
                </select>
            </div>
            <div class="form-group">
                <label>Designation <span class="req">*</span></label>
                <input type="text" name="designation" placeholder="e.g. Software Engineer" required>
            </div>
            <div class="form-group">
                <label>Salary (₹) <span class="req">*</span></label>
                <input type="number" name="salary" placeholder="e.g. 50000" min="0" step="100" required>
            </div>
            <div class="form-group">
                <label>Date of Joining <span class="req">*</span></label>
                <input type="date" name="joinDate" required>
            </div>
        </div>

        <div class="btn-row">
            <a href="index.jsp" class="btn-back">← Back</a>
            <button type="submit" class="btn-submit">✔ Register Employee</button>
        </div>
    </form>
</div>
</body>
</html>
