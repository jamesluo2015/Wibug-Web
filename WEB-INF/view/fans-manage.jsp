<%-- 
    Document   : fans-manage
    Created on : 2014-5-5, 16:41:50
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>

    <div class="content-hd row">
        <div class="sub-nav clearfix">
            <div class="nav-tabs pull-left" id="">
                <ul>
                    <li class="tab active"><a href="javascript:void(0);">Fans 管理</a></li>
                </ul>
            </div>
        </div>
    </div>


<div class="row">
     <div class="col-md-9 clearfix"> 
     <div>
     <!--  左边第一行 -->
     <div class="sub-title-bar clearfix sub-title-first-bar">
        <div class="pull-left">
           <div class="dropdown all-camera-dropdown">
            <div class="pull-right" style="height:30px ;padding: 3px 12px 0 0;">
            <b class="caret"></b></div>
           <div class="dropdown-toggle fan-list-addTo">
            添加到
           </div>
           <ul class="dropdown-menu">
               
            <c:forEach items="${fanGroupList}" var="fanGroupList">  
            <li class="group-list-li li-item changeFanGroup-li" data-groupid="<c:out value="${fanGroupList.wechatGroupId}"/>"><a class="a-style"><c:out value="${fanGroupList.name}"/></a></li>
            </c:forEach>
          </ul>
          </div>


                    </div>
                    <div class="pagination-wrap pull-right">
                        <div class="pagination wb-pagination" data-page-now="<c:out value="${page.pageNo}"/>" data-page-total="<c:out value="${page.totalPage}"/>"></div>
                    </div>
                </div>

                <!-- 左边第二行 -->

                <div class="clearfix sub-title-second-bar">
                    <div class="pull-left">
                        <div> <input type="checkbox" class="input-style" id="selectAll" style="margin: 2px 8px 0px 0px;">全选</div>
                    </div>
                </div>

                <!-- 左边第三行 -->
                <div>
                    <ul class="ul-style">

                        <c:forEach items="${page.datas}" var="Fans">  

                            <li class="report-list-li li-item">
                                <div class="row">
                                    <div class="col-md-6 clearfix workerInfo">
                                        <div class="pull-left"><input type="checkbox" class="input-style fan-choose-input" style="margin:13px 17px 0 0px"></div>

                                        <div class="pull-left"><img class="staff-img" src="<c:out value="${Fans.headImgUrl}"/>" data-userid="<c:out value="${Fans.openId}"/>"></div>
                                        <div class="pull-left worker-name" data-fanId="<c:out value="${Fans.openId}"/>"><c:out value="${Fans.nickName}"/></div>
                                    </div>
                                    <div class="col-md-3 clearfix">
                                        <select class="form-control changeFanGroup-select">    
                                            <c:forEach items="${fanGroupList}" var="fanGroupList">  
                                            <option data-groupid="<c:out value="${fanGroupList.wechatGroupId}"/>"><c:out value="${fanGroupList.name}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-3 clearfix">
                                        <button type="button" class="btn changefansNoteBtn" data-toggle="modal" data-target="#setNoteModal">修改备注</button>
                                    </div>
                                </div>
                            </li>

                        </c:forEach>

                    </ul>  
                </div>










            </div>


        </div>
        <div class="col-md-3 clearfix">
            <div class="group-list">
                <div>
                    <ul class="ul-style fan-group-ul">
                        <li class="all-group-list-li group-list-li li-have-a" ><a class="a-style" href="fans/list?pageCount=20&pageNum=1&groupId=">全部分组(1)</a></li>
                            <c:forEach items="${fanGroupList}" var="fanGroupList">  
                            <c:if test="${fanGroupList.wechatGroupId!='1'}"> 
                            <li class="normal-group-list-li group-list-li li-item li-have-a" data-groupid="<c:out value="${fanGroupList.wechatGroupId}"/>"><a class="a-style" href="fans/list?pageCount=20&pageNum=1&groupId=<c:out value="${fanGroupList.wechatGroupId}"/>"><c:out value="${fanGroupList.name}"/>
                                <div class="pull-right group-operation" style="display:none;">
                                         <a  class="editGroupName"><span class="glyphicon glyphicon-pencil"></span></a>
                                         <a  class="deleteFanGroup deleteGroupName"><span class="glyphicon glyphicon-trash"></span></a>
                                 </div>
                             </a></li>
                            </c:if>  
                            </c:forEach>
                        <li id="addFanGroup_div" style="overflow: hidden; display: none;"><div class="input-group"><input type="text" id="addFanGroup_text" class="form-control">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" id="addFanGroup_btn" type="button"><span class="glyphicon glyphicon-ok-circle"></span></button>
                                </span>
                            </div>
                        </li>
                    </ul>
                </div>

                <div>
                    <ul class="ul-style">
                        <li class="add-group-list-li group-list-li li-item" id="addFanGroup"><a class="a-style"><span class="glyphicon glyphicon-plus"></span>新建分组</a></li>
                    </ul>
                </div>

                <div>
                    <ul class="ul-style">
                        <li class="black-group-list-li group-list-li li-have-a"><a class="a-style" href="fans/list?pageCount=20&pageNum=1&groupId=1">黑名单</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

                    
                    
                    
  <div class="modal fade" id="setNoteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">设置备注</h4>
            </div>
            <div class="modal-body">

                <div class="alert alert-info" id="setStaffForm">
                    <form id="setStaff-form">
                        <h4><div class="row marketing">
                                <div class="col-lg-3">
                                    <h4>备注信息：</h4>
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
                <button type="button"  id="setFansNote-btn" class="btn btn-success">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->