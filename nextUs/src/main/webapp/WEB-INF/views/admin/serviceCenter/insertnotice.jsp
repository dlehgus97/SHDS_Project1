<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<link rel="stylesheet" href="../resources/css/admin/adminMain.css" />
<link rel="stylesheet" href="../resources/css/admin/serviceCenter.css" />
<style>
    .form-container {
        max-width: 600px;
        margin: auto;
        padding: 20px;
        background: #f4f4f4;
        border-radius: 8px;
    }
    
    .form-group {
        margin-bottom: 15px;
    }
    
    .form-group label {
        display: block;
        font-weight: bold;
    }
    
    .form-group input, .form-group textarea {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    
    .form-group textarea {
        height: 150px;
        resize: none;
    }
    
    .form-group button {
        background-color: purple;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    
    .form-group button:hover {
        background-color: darkpurple;
    }
</style>
</head>
<body>
<div class="form-container">
    <h1>공지사항 작성</h1>
    <form action="insertnotice.do" method="post">
        <div class="form-group">
            <label for="title">제목:</label>
            <input type="text" id="title" name="title" required>
        </div>
        <div class="form-group">
            <label for="content">내용:</label>
            <textarea id="content" name="content" required></textarea>
        </div>
        <div class="form-group">
            <button type="submit">등록</button>
        </div>
    </form>
</div>
</body>
</html>