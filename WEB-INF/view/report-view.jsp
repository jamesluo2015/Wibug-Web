<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- saved from url=(0079)http://localhost:8080/Wibug-Web/report/detail?reportId=5392847b1b5dc3737bd3837a -->
<html lang="zh-cn"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <base href="<%=basePath%>">
    <!--<base href="http://localhost:8080/Wibug-Web/">--><base href=".">
    <title>Report Detail</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
    <!-- Bootstrap -->
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <!-- Customized style -->
    <link rel="stylesheet" href="resources/css/styles.css">
    <link rel="stylesheet" href="resources/css/tag.css">
    <link rel="stylesheet" href="resources/css/message.css">
    <link rel="stylesheet" href="resources/css/report-manage.css">
    <link rel="stylesheet" href="resources/css/report-detail.css">
    
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
  <style id="holderjs-style" type="text/css"></style></head>
<body>


<div class="container main-container">
  <div class="row">
    <div class=" wb-main">
      <div class="wb-content">
        <div class="container">
          





<!--        report-detail?sub-nav-->
 <div class="content-hd row">
    <div class="sub-nav clearfix">
        <div class="nav-tabs pull-left" id="">
            <ul>
                <li class="tab active"><a href="javascript:void(0);">Report detail</a></li>
            </ul>
         </div>
        </div>
    </div>


<!--      report-->
            <div class="clearfix report-detail-row">
             <div class="col-md-4 clearfix workerInfo report-detail-workerInfo" data-reportId="${Report.id}">
             <div class="pull-left"><img class="staff-img" src="" data-userid="${Report.confirmWorkerId}"></div>
             <div class="pull-left worker-name"></div>
             </div>
             <div class="col-md-7 clearfix report-detail-workerInfo">
                        <p>状态:${Report.status}</p>
                        <p>上次修改时间:${Report.lastModifyTime}</p>
                        <p>创建时间:${Report.createTime}</p>
                        <p>关键字:</p>
                        <p>
                        <c:forEach items="${Report.keywordList}" var="Keyword">  
                        ${Keyword}
                        </c:forEach></p>
                        <p>Tags:
                        </p>
                        <p>
                         <c:forEach items="${Report.assignedTags}" var="AssignedTags">  
                         <button type="button" class="btn btn-sm btn-info">${AssignedTags.content}</button>
                         </c:forEach>
                        </p>
                         <div class="clearfix">
                             <div class="pull-left">
                            备注:
                            </div>
                            
                            <div class="clearfix">${Report.note}</div>
                         </div>
                    </div>
                 </div>





             



<!--    report-history-->
            <div class="panel panel-default report-detail-row">
              <div class="panel-heading" id="report_history">
                <h4 class="panel-title">
                  <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                    Report History
                  </a>
                </h4>
              </div>
              <div id="report_history_detail" class="panel-collapse collapse">
                <div class="panel-body">
                <c:forEach items="${Report.historyList}" var="history">
                <p><pre><c:out value="${history}"/></pre></p>
                </c:forEach>  
                </div>
              </div>
            </div>



            <!--    report-message-->
            <div class="panel panel-default report-detail-row">
              <div class="panel-heading" id="report_message">
                <h4 class="panel-title">
                  <a data-toggle="collapse" data-parent="#accordion">
                    Report Message
                  </a>
                </h4>
              </div>
              <div id="report_message_detail" class="panel-collapse in" style="height: 0px;">
                <div class="panel-body">
                
                    
                            <c:forEach items="${Report.voiceMsgTxt}" var="VoiceMsgTxt">
                            <pre>${VoiceMsgTxt}</pre>
                             </c:forEach>     

                              <c:forEach items="${Report.txtMsg}" var="TxtMsg">    
                              <pre>${TxtMsg}</pre>
                             </c:forEach>     

                              <c:forEach items="${Report.imageUrl}" var="ImageUrl">   
                              <div class="col-md-6 clearfix"><img style="width:80px;height:80px;" src="${ImageUrl}" class="media-object" data-userid="o54b2t0Stdu6Bz8WMz48XlbLFbUE"></div>
                              </c:forEach>
                </div>
              </div>
            </div>




<div class="clearfix" style="padding:10px 0 30px 20px">
             <div class="col-md-3 clearfix">
             <div class="pull-left"><button class="btn" id="fixed-btn" type="button" style="padding:10px 15px 10px 15px">已修复</button></div>
             <div class="pull-left" style="padding-left:20px">
              <button class="btn" id="reAllocate-btn" type="button" style="padding:10px 15px 10px 15px">重分配</button>
             </div>
             </div>
             <div class="col-md-4 clearfix">
             <button class="btn" id="cancel-btn" type="button" style="padding:10px 15px 10px 15px">取消</button>
             </div>
             </div>


  </div>


                    


        </div>
      </div>
    </div>
  </div>
</div>



<!-- FOOTER -->
<footer>
    <div class="container">
        <p>© 2013 Company, Inc. · <a href="http://localhost:8080/Wibug-Web/#">Privacy</a> · <a href="http://localhost:8080/Wibug-Web/#">Terms</a></p>
    </div>
</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/bootstrap-datetimepicker.min.js"></script>
<script src="resources/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="resources/js/holder.min.js"></script>
<!--<script src="resources/js/jquery.fancybox.min.js"></script>-->
<!--<script src="resources/js/jquery.fancybox-buttons.js"></script>-->
<script src="resources/js/pagination.js"></script>

<script src="resources/js/message.js"></script>
<script src="resources/js/staff.js"></script>
<script src="resources/js/tag.js"></script>
<script src="resources/js/report.js"></script>
<script src="resources/js/report_detail.js"></script>




</body></html>