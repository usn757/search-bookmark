<%@ page import="org.example.searchbookmark.model.vo.KeywordSearch" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search GOGO</title>
    <style>
        /* 기본적인 리셋 및 폰트 설정 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            color: #333;
            line-height: 1.6;
        }

        h1 {
            text-align: center;
            color: #4caf50;
            margin-top: 50px;
        }

        /* 검색 폼 스타일 */
        form {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        label {
            font-size: 16px;
            margin-right: 8px;
            font-weight: bold;
        }

        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-right: 10px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button {
            padding: 5px 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* 검색 결과 카드 스타일 */
        section {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            margin-top: 40px;
        }

        .result-card {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            transition: transform 0.3s ease;
        }

        .result-card:hover {
            transform: translateY(-5px);
        }

        .result-card h3 {
            font-size: 18px;
            color: #333;
            margin-bottom: 10px;
        }

        .result-card a {
            text-decoration: none;
            color: #4caf50;
            font-weight: bold;
        }

        .result-card a:hover {
            text-decoration: underline;
        }

        .result-card ul {
            list-style-type: none;
            font-size: 14px;
            color: #666;
        }

        .result-card li {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
<h1>네이버 블로그 글 검색</h1>
<form>
    <input id="keyword" name="keyword" type="text" placeholder="검색할 키워드를 입력하세요">
    <input type="submit" value="검색">
</form>

<% if (request.getAttribute("result") != null) { %>
<section>
    <%
        for (KeywordSearch v : (List<KeywordSearch>) request.getAttribute("result")) {
    %>
    <div class="result-card">
        <h3><a href="<%= v.link()%>" target='_blank'><%= v.title() %></a></h3>
        <ul>
            <li><%= v.description() %></li>
            <li><%= v.date() %></li>
            <%--<li><%= v.createdAt() %></li>--%>
            <form action="bookmark" method="post">
                <input type="hidden" name="uuid" value="<%= v.uuid() %>">
                <button>북마크</button>
            </form>
        </ul>
    </div>
    <%
        }
    %>
</section>
<% } %>
</body>
</html>
