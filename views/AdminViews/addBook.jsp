<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", Arial, sans-serif;
        background: linear-gradient(135deg, #ffefba, #ffc3a0); /* warm gradient */
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .form-box {
        background: rgba(255, 255, 255, 0.7);
        padding: 40px;
        border-radius: 18px;
        width: 350px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        backdrop-filter: blur(5px);
        transition: 0.3s;
    }

    .form-box:hover {
        box-shadow: 0 12px 30px rgba(0,0,0,0.25);
    }

    h2 {
        text-align: center;
        color: #444;
        margin-bottom: 25px;
    }

    label {
        font-weight: 600;
        color: #333;
    }

    input {
        width: 100%;
        padding: 10px 12px;
        margin: 8px 0 18px 0;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 15px;
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
    <h2>Add Book</h2>

    <form action="addBookDetails" method="post">
        
        <input type="number" name="bookId" value="0" style="display:none;">

        <label>Book Name:</label>
        <input type="text" name="bookTitle" required>

        <label>Author Name:</label>
        <input type="text" name="bookAuthor" required>

        <label>Category:</label>
        <input type="text" name="category" required>

        <label>Available Copies:</label>
        <input type="number" name="availableCopies" required>

        <button type="submit">Submit</button>
    </form>
</div>

</body>
</html>
