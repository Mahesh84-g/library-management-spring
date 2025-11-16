<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.mahesh.model.BooksModel"%>
<% List<BooksModel> ls = (List<BooksModel>) request.getAttribute("borrowedList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrowed Books</title>

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
        font-weight: 600;
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

    /* Return Button */
    .return-btn {
        background: #4a90e2;
        color: white;
        padding: 8px 15px;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 600;
        transition: 0.3s;
        display: inline-block;
    }

    .return-btn:hover {
        background: #357ac9;
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(80,120,200,0.4);
    }

</style>

</head>
<body>

<div class="table-box">
    <h2>Borrowed Books</h2>

    <table>
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Author</th>
            <th>Category</th>
            <th>Borrowed Copies</th>
            <th>Action</th>
        </tr>

        <% for(BooksModel b : ls) { %>
        <tr>
            <td><%= b.getBookId() %></td>
            <td><%= b.getBookTitle() %></td>
            <td><%= b.getBookAuthor() %></td>
            <td><%= b.getCategory() %></td>
            <td><%= b.getBorrowed_copies() %></td>

            <td>
                <a class="return-btn"
                   href="returnBook?id=<%= b.getBookId() %>&copies=<%= b.getBorrowed_copies() %>">
                    Return Book
                </a>
            </td>
        </tr>
        <% } %>
    </table>

</div>

</body>
</html>
