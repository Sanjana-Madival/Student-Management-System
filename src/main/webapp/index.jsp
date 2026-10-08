<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Welcome - Student Management Portal</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #1e3a8a, #2563eb);
            color: white;
        }

        .welcome-box {
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        .icon {
            font-size: 70px;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 42px;
            margin-bottom: 15px;
        }

        p {
            font-size: 20px;
            opacity: 0.9;
        }

        .loader {
            width: 45px;
            height: 45px;
            border: 4px solid rgba(255,255,255,0.3);
            border-top: 4px solid white;
            border-radius: 50%;
            margin: 30px auto 0;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            100% {
                transform: rotate(360deg);
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.9);
            }

            to {
                opacity: 1;
                transform: scale(1);
            }
        }

    </style>

    <script>

        setTimeout(function() {

            window.location.href = "StudentServlet";

        }, 4000);

    </script>

</head>

<body>

    <div class="welcome-box">

        <div class="icon">🎓</div>

        <h1>Welcome to Student Management Portal</h1>

        <p>Manage your students easily and efficiently</p>

        <div class="loader"></div>

    </div>

</body>

</html>