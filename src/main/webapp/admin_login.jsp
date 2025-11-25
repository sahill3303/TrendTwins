<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - TrendTwins</title>
    <style>
        /* Import Poppins font from Google Fonts */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            background: #f4f6f8;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: white;
            width: 400px;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 30px;
            font-weight: 600;
            color: #333;
        }

        label {
            display: block;
            text-align: left;
            font-weight: 600;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border: 1.8px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #ff9900;
            outline: none;
            box-shadow: 0 0 5px #ff9900;
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            background-color: #ff9900;
            border: none;
            border-radius: 6px;
            color: white;
            font-weight: 600;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #e08600;
        }

        .error-message {
            margin-top: 20px;
            color: #d93025;
            font-weight: 600;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form method="post" action="admin_authenticate.jsp">
            <label for="username">Username:</label>
            <input id="username" type="text" name="username" required>

            <label for="password">Password:</label>
            <input id="password" type="password" name="password" required>

            <input type="submit" value="Login">
        </form>
        <% if (request.getParameter("error") != null) { %>
            <p class="error-message">Invalid username or password</p>
        <% } %>
    </div>
</body>
</html>
