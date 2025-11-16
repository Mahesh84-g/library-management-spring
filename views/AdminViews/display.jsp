<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.mahesh.model.BooksModel"%>
<% List<BooksModel> ls=(List<BooksModel>)request.getAttribute("bookList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Books</title>

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

    .table-box {
        background: rgba(255, 255, 255, 0.75);
        padding: 25px;
        border-radius: 18px;
        width: 80%;
        box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        backdrop-filter: blur(5px);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #444;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        font-size: 16px;
    }

    th {
        background: #ff8c42;
        color: white;
        padding: 12px;
        border-radius: 8px 8px 0 0;
        text-transform: uppercase;
    }

    td {
        padding: 12px;
        text-align: center;
        background: rgba(255, 255, 255, 0.85);
        border-bottom: 1px solid #e6b89c;
    }

    tr:hover td {
        background: rgba(255, 180, 120, 0.3);
        transition: 0.3s;
    }

    /* Buttons */
    a.action-btn {
        padding: 8px 15px;
        border-radius: 8px;
        text-decoration: none;
        color: white;
        font-weight: 600;
        transition: 0.3s;
        display: inline-block;
    }

    .edit-btn {
        background: #4aa96c;
    }

    .edit-btn:hover {
        background: #379a59;
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(80,200,120,0.4);
    }

    .delete-btn {
        background: #e63946;
    }

    .delete-btn:hover {
        background: #c6282e;
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(220,80,80,0.4);
    }
</style>

</head>
<body>

<div class="table-box">
    <h2>All Books</h2>

    <table>
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Author</th>
            <th>Category</th>
            <th>Copies</th>
            <th colspan="2">Action</th>
        </tr>

        <% for(BooksModel b : ls) { %>
        <tr>
            <td><%= b.getBookId() %></td>
            <td><%= b.getBookTitle() %></td>
            <td><%= b.getBookAuthor() %></td>
            <td><%= b.getCategory() %></td>
            <td><%= b.getAvailableCopies() %></td>

            <td>
                <a class="action-btn edit-btn" 
                   href="editForm?id=<%= b.getBookId() %>">Edit</a>
            </td>

            <td>
                <a class="action-btn delete-btn" 
                   href="delete?id=<%= b.getBookId() %>">Delete</a>
            </td>
        </tr>
        <% } %>

    </table>
</div>

</body>
</html>
