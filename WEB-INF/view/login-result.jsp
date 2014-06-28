<%-- 
    Document   : login-result
    Created on : 2014-4-17, 10:14:24
    Author     : Charles
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    var status = ${status};
    if (status){
        if (window.opener && !window.opener.closed){
            window.opener.document.location.reload();
            window.close();
        }else{
            location.href = "localhost:8084/Wibug-Web/";
        }
    } else {
        alert('Login failed, please try again.');
        window.close();
    }
</script>