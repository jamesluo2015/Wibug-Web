<%-- 
    Document   : header
    Created on : 2014-4-25, 18:39:28
    Author     : 一
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <body>
    <div class="navbar navbar-fixed-top top-nav" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">WiBug</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="#">首页</a></li>
            <li><a href="#about">功能特性</a></li>
            <li><a href="#contact">联系我们</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
              <li><a href="#">${currentUser.name},欢迎光临</a></li>  
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
