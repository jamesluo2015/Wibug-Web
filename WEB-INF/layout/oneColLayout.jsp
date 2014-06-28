<%-- 
    Document   : oneColLayout
    Created on : 2014-4-24, 11:07:50
    Author     : 一
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <title><tiles:insertAttribute name="title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <!-- Customized style -->
    <link rel="stylesheet" href="resources/css/styles.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <tiles:insertAttribute name="header"/>
    <tiles:insertAttribute name="body" />
    <tiles:insertAttribute name="footer"/>
  </body>
</html>
