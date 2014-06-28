<%-- 
    Document   : login
    Created on : 2014-4-17, 9:55:05
    Author     : Charles
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="page-login" class="container sign-in-up">
    <div class="login-display-section">
        <div class="wrap">
            <c:if test="${errmsg!=null}">
                <div class="error">${errmsg}</div>
            </c:if>
            <c:if test="${errmsg==null}">
                <div class="info">Enter your username and password to login into management system.</div>
            </c:if>
            <form id="login-form" action="login" method="POST">
                email: <input type="text" name="email"><br>
                password: <input type="text" name="password"><br>
                <input type="submit" value="Login">
            </form>

            <div class="clear"></div>
        </div>

        <div class="wrap2">
            <c:if test="${errmsg!=null}">
                <div class="error">${errmsg}</div>
            </c:if>
            <c:if test="${errmsg==null}">
                <div class="info">Enter your username and password to register an account.</div>
            </c:if>
            <form id="register-form" action="register" method="POST">
                email: <input type="text" name="email"><br>
                password: <input type="text" name="password"><br>
                reenterpassword: <input type="text" name="reenterPassword"><br>
                <input type="submit" value="Register">
            </form>

            <div class="clear"></div>
        </div>

        <div class="wrap3">
            <c:if test="${errmsg!=null}">
                <div class="error">${errmsg}</div>
            </c:if>
            <c:if test="${errmsg==null}">
                <div class="info">Enter your username and password to register an account.</div>
            </c:if>
            <p>
            <a href="loginTest">required login testing!</a>
            </p>
        </div>
    </div>
    <div class="login-shadow"><div class="left-shadow"></div><div class="center-shadow"></div><div class="right-shadow"></div></div>
</div>
