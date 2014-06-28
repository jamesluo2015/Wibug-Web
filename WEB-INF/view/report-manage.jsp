<%-- 
    Document   : report
    Created on : 2014-5-15, 20:41:48
    Author     : Administrator
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="content-hd row">
    <div class="sub-nav clearfix">
        <div class="nav-tabs pull-left" id="">
            <ul>
                <li class="tab active"><a href="javascript:void(0);">全部报告</a></li>
                <li class="tab"><a href="javascript:void(0);">未处理</a></li>
                <li class="tab"><a href="javascript:void(0);">待解决</a></li>
                <li class="tab"><a href="javascript:void(0);">重新打开</a></li>
                <li class="tab"><a href="javascript:void(0);">已关闭</a></li>
            </ul>
        </div>

        <div class="nav-search pull-right">
            <form action="" method="get" id="report-search">
                <input type="text" class="search-query" placeholder="报告内容">
                <span class="glyphicon glyphicon-search"></span>
            </form>
        </div>
    </div>
</div>

<div class="content-bd row">
    <div class="sub-title-bar clearfix">
        <div class="info pull-left">
            
        </div>
        <div class="pagination-wrap pull-right">
            <div class="pagination wb-pagination" data-page-now="<c:out value="${page.pageNo}"/>" data-page-total="<c:out value="${page.totalPage}"/>"></div>
        </div>
    </div>

    <div class="content-list-wrap">
        <ul class="content-list report-list">
          <c:forEach items="${page.datas}" var="Report">  
          <li class="report-list-li li-item">
          <div class="row">
          <div class="col-md-3 clearfix workerInfo">
          <div class="pull-left"><img class="staff-img" src="" data-userid="<c:out value="${Report.confirmWorkerId}"/>"></div>
          <div class="pull-left worker-name"></div>
          </div>
              <div class="col-md-5 clearfix">
                              
                  
                            <p>当前状态：<c:out value="${Report.status}"/></p>
                            <p>上次修改：2014-04-06 02:02:30</p>
                            <p>创建时间：<c:out value="${Report.createTime}"/></p>
                            <p>关键字：</p>
                            <p><c:forEach items="${Report.keywordList}" var="keyword">  
                               ${keyword}</c:forEach></p>
                            <p>tags：
                            <p>
                            <c:forEach items="${Report.assignedTags}" var="AssignedTags">  
                             <button type="button" class="btn btn-sm btn-info">${AssignedTags.content}</button>
                            </c:forEach>
                            </p>
                             <p>
                                 
                        <div class="note">
                        <div class="clearfix">
                        <div class="pull-left">
                        备注:
                        </div>
                        <div class="pull-left">
                            <div class="report-list-note-operation">
                                <a href="javascript:void(0);"><span class="glyphicon glyphicon-edit"></span></a>
                        </div>
                        </div>
                        <div class="pull-right">
                        </div>
                        
                      </div>
                      <p>
                      <div class="clearfix">
                            <textarea readonly="true" class="note-value"><c:out value="${Report.note}"/></textarea>
                      </div>
                      </p>
                      </div>
                      </p>

             </div>
             <div class="col-md-4 clearfix">
              <button type="button" class="btn show_ReportDetail" data-reportid="<c:out value="${Report.id}"/>">查看详细</button>
              <button class="btn setStaffBtn" type="button" data-toggle="modal" data-target="#setStaffModal">分派</button>
             </div>
          </div>
          </li>
          </c:forEach>
        </ul>  
    </div>

    <div class="bottom-tool-bar clearfix">
        <div class="pagination-wrap pull-right">
            <div class="pagination wb-pagination" data-page-now="<c:out value="${page.pageNo}"/>" data-page-total="<c:out value="${page.totalPage}"/>"></div>
        </div>
    </div>
</div>



<!-- Modal -->
<div class="modal fade" id="setStaffModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">消息委派</h4>
      </div>
      <div class="modal-body">
          
        <div class="alert alert-info" id="setStaffForm">
            <form id="setStaff-form">
        <h4>请选择工作员： <div class="btn-group">
                                    <select class="form-control">    
                                          <c:forEach items="${staffList}" var="Staff">  
                                            <option data-staffid="<c:out value="${Staff.id}"/>"><c:out value="${Staff.name}"/></option>
                                          </c:forEach>
                                    </select>
                                </div>

        </h4>
        <hr>
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
        <button type="button"  id="setStaffRealBtn" class="btn btn-success">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
