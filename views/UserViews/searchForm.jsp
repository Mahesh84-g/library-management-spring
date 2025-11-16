<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Search Books</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background: linear-gradient(135deg, #ffefba, #ffc3a0);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .form-box {
        background: rgba(255, 255, 255, 0.75);
        padding: 35px;
        border-radius: 18px;
        width: 360px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        backdrop-filter: blur(5px);
        text-align: center;
    }

    h2 {
        color: #444;
        margin-bottom: 20px;
        font-weight: 600;
    }

    label {
        font-size: 16px;
        font-weight: 600;
        color: #333;
    }

    input {
        width: 100%;
        padding: 12px 12px;
        margin-top: 10px;
        margin-bottom: 22px;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 16px;
        transition: 0.3s;
    }

    input:focus {
        border-color: #ff8c42;
        box-shadow: 0 0 8px rgba(255,140,66,0.5);
        outline: none;
    }

    button {
        width: 100%;
        padding: 12px;
        background: #ff8c42;
        border: none;
        border-radius: 10px;
        color: white;
        font-size: 17px;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #ff7a20;
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(255,120,60,0.35);
    }

</style>

</head>
<body>

<div class="form-box">
    <h2>Search Books</h2>

    <form action="studentSearch" method="post">
        <label>Search (Title / Author / Category):</label>
        <input type="text" name="key" placeholder="Enter keyword..." required>

        <button type="submit">Search</button>
    </form>
</div>

</body>
</html>
