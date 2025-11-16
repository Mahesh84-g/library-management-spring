<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.mahesh.model.BooksModel"%>
<% BooksModel b = (BooksModel) request.getAttribute("book"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Book</title>

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
        padding: 40px;
        border-radius: 18px;
        width: 350px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        backdrop-filter: blur(5px);
    }

    h2 {
        text-align: center;
        color: #444;
        margin-bottom: 25px;
        font-weight: 600;
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
    <h2>Edit Book</h2>

    <form action="update" method="post">
        
        <label>Book ID:</label>
        <input type="number" name="bookId" value="<%= b.getBookId() %>" readonly>

        <label>Book Name:</label>
        <input type="text" name="bookTitle" value="<%= b.getBookTitle() %>" required>

        <label>Author Name:</label>
        <input type="text" name="bookAuthor" value="<%= b.getBookAuthor() %>" required>

        <label>Category:</label>
        <input type="text" name="category" value="<%= b.getCategory() %>" required>

        <label>Available Copies:</label>
        <input type="number" name="availableCopies" value="<%= b.getAvailableCopies() %>" required>

        <button type="submit">Update</button>
    </form>
</div>

</body>
</html>
