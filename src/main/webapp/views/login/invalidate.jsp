<%--
  Created by IntelliJ IDEA.
  User: MACROSS
  Date: 2020/3/21
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        session.invalidate();
        response.sendRedirect("login_page.jsp");
    %>
</body>
</html>
