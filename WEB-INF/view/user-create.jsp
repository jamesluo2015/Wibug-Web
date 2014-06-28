<%-- 
    Document   : user-create
    Created on : 2014-5-23, 16:35:27
    Author     : Charles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <form role="form" class="form-signin" method="POST">
            <c:if test="${errmsg!=null}">
                <div class="error">${errmsg}</div>
            </c:if>
            <c:if test="${errmsg==null}">
                <div class="info">Create New User Administrator!!</div>
            </c:if>
                
            公司名字: <input type="text" name="companyName" ><br>
            Email: <input type="text" name="email" ><br>
            password: <input type="text" name="passwd" ><br>
            password comfirm: <input type="text" name="passwd2" ><br>
            appId: <input type="text" name="appId" ><br>
            tel: <input type="text" name="tel" ><br>
            name: <input type="text" name="name" ><br>
            <input type="submit" value="Submit">
        </form> 

    </body>
</html>

