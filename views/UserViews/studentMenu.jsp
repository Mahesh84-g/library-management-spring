<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Menu</title>

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

    .menu-box {
        background: rgba(255, 255, 255, 0.75);
        padding: 40px;
        border-radius: 18px;
        width: 350px;
        text-align: center;
        box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        backdrop-filter: blur(5px);
    }

    h2 {
        color: #444;
        margin-bottom: 25px;
        font-weight: 600;
    }

    a {
        display: block;
        background: #ff8c42;
        color: white;
        margin: 12px 0;
        padding: 12px;
        border-radius: 10px;
        font-size: 17px;
        text-decoration: none;
        transition: 0.3s ease-in-out;
    }

    a:hover {
        background: #ff7a20;
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(255,120,60,0.35);
    }
</style>

</head>
<body>

<div class="menu-box">
    <h2>Student Menu</h2>

    <a href="studentSearchForm">Search a Book</a>
    <a href="sAllBooks">Get All Books</a>
    <a href="BorrowedDetails">My Borrowed Books</a>
</div>

</body>
</html>
