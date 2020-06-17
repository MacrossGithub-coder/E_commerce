<%--
  Created by IntelliJ IDEA.
  User: MACROSS
  Date: 2020/6/5
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
var error1="${requestScope.error1}";
var error2="${requestScope.error2}";
var error0="${requestScope.error0}";
if(error0.length>0)
{
    alert(error0);
    location.href="../views/login/login_page.jsp";

}
if(error1.length>0)
{
    alert(error1);
    location.href="../views/login/login_page.jsp";

}
if(error2.length>0)
{
    alert(error2);
    location.href="../views/login/login_page.jsp";
}
</script>
<body>

</body>
</html>
