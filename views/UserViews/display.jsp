<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.mahesh.model.BooksModel"%>
<%
    List<BooksModel> ls = (List<BooksModel>) request.getAttribute("bookList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Search Results</title>

<style>
    body{
        font-family: Arial, sans-serif;
        background: #f2f2f2;
        padding: 30px;
    }

    .card {
        background: white;
        width: 80%;
        margin: auto;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
    }

    h2{
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    table{
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
    }

    th, td{
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
    }

    th{
        background: #4a90e2;
        color: white;
    }

    tr:nth-child(even){
        background: #f7f7f7;
    }

    a.take-btn{
        display: inline-block;
        background: #28a745;
        color: white;
        padding: 6px 12px;
        text-decoration: none;
        border-radius: 6px;
    }

    a.take-btn:hover{
        background: #218838;
    }

    .no-data {
        text-align: center;
        font-size: 18px;
        padding: 20px;
        color: red;
    }
</style>

</head>
<body>

<div class="card">
    <h2>Books</h2>

    <% if(ls == null || ls.isEmpty()) { %>

        <p class="no-data">No books found!</p>

    <% } else { %>

    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Category</th>
            <th>Copies</th>
            <th>Action</th>
        </tr>

        <% for(BooksModel b : ls) { %>
        <tr>
            <td><%= b.getBookId() %></td>
            <td><%= b.getBookTitle() %></td>
            <td><%= b.getBookAuthor() %></td>
            <td><%= b.getCategory() %></td>
            <td><%= b.getAvailableCopies() %></td>
            <td>
                <a class="take-btn" 
                   href="takeBook?id=<%=b.getBookId() %>&copies=<%= b.getAvailableCopies() %>">
                   Take Book
                </a>
            </td>
        </tr>
        <% } %>
    </table>

    <% } %>

</div>

</body>
</html>
