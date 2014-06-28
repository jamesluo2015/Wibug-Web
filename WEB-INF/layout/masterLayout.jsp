<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <base href="<%=basePath%>">
    <title><tiles:insertAttribute name="title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <!-- Bootstrap -->
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <!-- Customized style -->
    <link rel="stylesheet" href="resources/css/styles.css">
    <link rel="stylesheet" href="resources/css/tag.css">
    <link rel="stylesheet" href="resources/css/fans.css">
    <link rel="stylesheet" href="resources/css/staff.css">
    <link rel="stylesheet" href="resources/css/message.css">
    <link rel="stylesheet" href="resources/css/report-manage.css">
    <link rel="stylesheet" href="resources/css/report-detail.css">
    <c:forEach items="${stylesheets}" var="css">
    <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
    </c:forEach>
    <link rel="stylesheet" href="resources/css/bootstrap-datetimepicker.min.css">
    <!--<link rel="stylesheet" href="resources/css/jquery.fancybox.css">-->
    <!--<link rel="stylesheet" href="resources/css/jquery.fancybox-buttons.css">-->
    <link rel="stylesheet" href="resources/css/wb-pagination.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
<body>
<tiles:insertAttribute name="header"/>
<div class="container main-container">
  <div class="row">
    <div class="col-md-2 wb-side">
        <tiles:insertAttribute name="menu" />
    </div>
    <div class="col-md-10 wb-main">
      <div class="wb-content">
        <div class="container">
          <tiles:insertAttribute name="body" />
        </div>
      </div>
    </div>
  </div>
</div>
<tiles:insertAttribute name="footer"/>
</body>
</html>
