<%--
  Created by IntelliJ IDEA.
  User: MACROSS
  Date: 2020/4/18
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src="jquery-3.4.1.js"></script>
<script>
    function reloadCheckImg()
    {
        $("img").attr("src", "img.jsp?t="+(new Date().getTime()));  //<img src="...">
    }

    $(document).ready(function () {
        $("#checkcodeID").blur(function () {

            var $checkcode = $("#checkcodeID").val();
            $.post(
                "../CheckCodeServlet",
                "checkcode="+$checkcode,
                function (result) {
                    alert(result);
                }
            )

        })
    })
</script>
<body>
    验证码：
    <input type="text" name="checkcode" id="checkcodeID" size="4" />
    <a href="javascript:reloadCheckImg();"><img src="img.jsp" ></a>
</body>
</html>
