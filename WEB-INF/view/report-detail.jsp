<%-- 
    Document   : report-detail
    Created on : 2014-5-16, 15:30:38
    Author     : Administrator
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="content-hd row">
    <div class="sub-nav clearfix">
        <div class="nav-tabs pull-left" id="">
            <ul>
                <li class="tab active"><a href="javascript:void(0);">Report detail</a></li>
            </ul>
        </div>
    </div>
</div>


<!--      report的一些详细信息-->
<div class="clearfix report-detail-row">
    <div class="col-md-4 clearfix workerInfo report-detail-workerInfo"  data-reportId="${Report.id}">
        <div class="pull-left"><img class="staff-img" src="" data-userid="${Report.confirmWorkerId}"></div>
        <div class="pull-left worker-name"></div>
    </div>
    <div class="col-md-7 clearfix report-detail-workerInfo">
        <p>当前状态：${Report.status}</p>
        <p>上次修改：${Report.lastModifyTime}</p>
        <p>创建时间：${Report.createTime}</p>
        <p>关键字：</p>
        <p>  <c:forEach items="${Report.keywordList}" var="Keyword">  
                ${Keyword}
            </c:forEach></p>
        <p>Tags:<button type="button" class="btn btn-sm btn-success" id="editTags_btn">Edit</button>
        </p>
        <p>
            <c:forEach items="${Report.assignedTags}" var="AssignedTags">  
                <button type="button" class="btn btn-sm btn-info">${AssignedTags.content}</button>
            </c:forEach>
        </p>
        <p>
        <div id="editTags_div" class="alert alert-info" style="overflow: hidden; display: none;">
            <div class="row">
                <div class="col-lg-6">
                    <p>添加</p>
                </div><!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="input-group">
                        <input type="text" id="addTips_text" class="form-control">
                        <span class="input-group-btn">
                            <button class="btn btn-success" id="addTips_btn" type="button">添加</button>
                        </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
            </div><!-- /.row -->
            <p>可选标签(双击添加)</p>
            <c:forEach items="${Report.recommendedTags}" var="RecommendedTags">  
                <button type="button" class="btn btn-sm btn-info newTips_btn">${RecommendedTags.content}</button>
            </c:forEach>
        </div>
        </p>
        <div class="clearfix">
            <div class="clearfix">备注:</div>
            <p>
            <div class="clearfix">${Report.note}</div>
            </p>
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
                <pre><c:out value="${history}"/></pre>
            </c:forEach>  
        </div>
    </div>
</div>

<!--    report-history-->
<div class="panel panel-default report-detail-row">
    <div class="panel-heading" id="report_history">
        <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                Report Environment
            </a>
        </h4>
    </div>
    <div id="report_history_detail" class="panel-collapse collapse">
        <div class="panel-body">
            <c:forEach items="${Report.historyList}" var="history">
                <pre><c:out value="${history}"/></pre>
            </c:forEach>  
        </div>
    </div>
</div>


<!--    report-history-->
<div class="panel panel-default report-detail-row">
    <div class="panel-heading" id="report_history">
        <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                Report 
            </a>
        </h4>
    </div>
    <div id="report_history_detail" class="panel-collapse collapse">
        <div class="panel-body">
            <c:forEach items="${Report.historyList}" var="history">
                <pre><c:out value="${history}"/></pre>
            </c:forEach>  
        </div>
    </div>
</div>


<!--    message-->
<div class="row">
    <div class="container" id="msg_container">
        <div class="panel panel-default  report-detail-row">
            <div class="panel-heading" id="report_message">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                        Report Message
                    </a>
                </h4>
            </div>
            <div id="report_message_detail" class="panel-collapse collapse">
                <div class="panel-body">
                    <ul class="report-detail-message-ul clearfix">
                        <c:forEach items="${Report.voiceMsgTxt}" var="VoiceMsgTxt">   
                            <li class="li-item clearfix"><div>  
                                    <div class="col-md-6 clearfix">${VoiceMsgTxt}</div>
                                    <div class="col-md-6 clearfix">
                                        <span class="glyphicon glyphicon-share-alt"></span>
                                    </div>
                                    <div class="reply-wrap"></div>
                            </li>
                        </c:forEach>     

                        <c:forEach items="${Report.txtMsg}" var="TxtMsg">    
                            <li class="li-item clearfix"><div>  
                                    <div class="col-md-6 clearfix">${TxtMsg}</div>
                                    <div class="col-md-6 clearfix">
                                        <span class="glyphicon glyphicon-share-alt"></span>
                                    </div>
                                    <div class="reply-wrap"></div>
                            </li>
                        </c:forEach>     

                        <c:forEach items="${Report.imageUrl}" var="ImageUrl">   
                            <li class="li-item clearfix"><div>  
                                    <div class="col-md-6 clearfix"><img style="width:80px;height:80px;" src="${ImageUrl}" class="media-object" data-userid="o54b2t0Stdu6Bz8WMz48XlbLFbUE"></div>
                                    <div class="col-md-6 clearfix">
                                        <span class="glyphicon glyphicon-share-alt"></span>
                                    </div>
                                    <div class="reply-wrap"></div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>


<div class="clearfix" style="padding:10px 0 30px 20px">
    <div class="col-md-7 clearfix">  
    </div>
    <div class="col-md-3 clearfix">
        <div class="pull-left"><button class="btn" id="fixed-btn" type="button" style="padding:10px 15px 10px 15px">已修复</button></div>
        <div class="pull-left" style="padding-left:20px">
            <button class="btn" data-toggle="modal" data-target="#reAllocateModal" type="button" style="padding:10px 15px 10px 15px">重分配</button>
        </div>
    </div>
    <div class="col-md-2 clearfix">
        <button class="btn" id="cancel-btn" type="button" style="padding:10px 15px 10px 15px">取消</button>
    </div>
</div>

</div>




<div class="modal fade" id="reAllocateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">消息委派</h4>
            </div>
            <div class="modal-body">

                <div class="alert alert-info" id="setStaffForm">
                    <form id="setStaff-form">
                        <h4><div class="row marketing">
                                <div class="col-lg-3">
                                    <h4>发送信息：</h4>
                                </div>
                                <div class="col-lg-9">
                                    <h4>
                                        <textarea rows="5" cols="38" style="resize:none; border-radius: 9px;"></textarea>
                                    </h4>
                                </div>
                            </div></h4>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button"  id="reAllocate-btn" class="btn btn-success">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->