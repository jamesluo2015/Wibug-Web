<%-- 
    Document   : staff-manage
    Created on : 2014-5-5, 17:12:26
    Author     : apple
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>

    <div class="content-hd row">
        <div class="sub-nav clearfix">
            <div class="nav-tabs pull-left" id="">
                <ul>
                    <li class="tab active"><a data-toggle="modal" data-target="#myModal" id="showAllFans">添加新员工</a></li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-9">
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
                                <c:forEach items="${staffGroupList}" var="groupList">  
                                    <li class="group-list-li li-item changeStaffGroup-li" data-groupid="<c:out value="${groupList.groupId}"/>"><a><c:out value="${groupList.name}"/></a></li>
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

                        <c:forEach items="${page.datas}" var="Staff">  

                            <li class="report-list-li li-item staff-edit">
                                <div class="row">
                                    <div class="col-md-7 clearfix workerInfo">
                                        <div class="pull-left"><input type="checkbox" class="input-style fan-choose-input" style="margin:13px 17px 0 0px"></div>

                                        <div class="pull-left"><span><img style="width:80px;height:80px;" align="left" src="<c:out value="${Staff.imageUrl}"/>"></span></div>
                                        <div class="pull-left worker-name" data-staffId="<c:out value="${Staff.id}"/>" data-groupId="<c:out value="${Staff.groupId}"/>"><a><c:out value="${Staff.name}"/></a><br>
                                            Email：<c:out value="${Staff.email}"/><br>
                                            Tel： <c:out value="${Staff.tel}"/><br>
                                            备注： <c:out value="${Staff.note}"/><br></div>
                                    </div>
                                    <div class="col-md-3 clearfix">
                                        <select class="form-control changeGroup-select">    
                                            <c:forEach items="${staffGroupList}" var="groupList">  
                                                <option data-groupid="<c:out value="${groupList.groupId}"/>"><c:out value="${groupList.name}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-2 clearfix">
                                          <div class="staff-operation" style="display:none;">
                                           <a  class="editStaffName changeStaffNote" data-toggle="modal" data-target="#setNoteModal"><span class="glyphicon glyphicon-pencil"></span></a>
                                            <a  class="deleteStaff"><span class="glyphicon glyphicon-trash"></span></a>
                                          </div>
                                    </div>
                                </div>
                            </li>

                        </c:forEach>

                    </ul>  
                </div>


            </div>



        </div>
        <div class="col-md-3">


            <div class="group-list">
                <div>
                    <ul class="ul-style staff-group-ul">
                        <li class="all-group-list-li group-list-li li-have-a" ><a class="a-style" href="staff/list?pageCount=20&pageNum=1&groupId=">全部分组(20)</a></li>
                            <c:forEach items="${staffGroupList}" var="groupList">  
                            <li class="normal-group-list-li group-list-li li-item li-have-a" data-groupid="<c:out value="${groupList.groupId}"/>"><a class="a-style" href="staff/list?pageCount=20&pageNum=1&groupId=<c:out value="${groupList.groupId}"/>"><c:out value="${groupList.name}"/>
                                <div class="pull-right group-operation" style="display:none;">
                                         <a  class="editGroupName"><span class="glyphicon glyphicon-pencil"></span></a>
                                         <a  class="deleteGroup deleteGroupName "><span class="glyphicon glyphicon-trash"></span></a>
                                 </div>
                                </a></li>
                            </c:forEach>
                        <li id="addGroup_div" style="overflow: hidden; display: none;"><div class="input-group"><input type="text" id="addGroup_text" class="form-control">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" id="addGroup_btn" type="button"><span class="glyphicon glyphicon-ok-circle"></span></button>
                                </span>
                            </div>
                        </li>
                    </ul>
                </div>

                <div>
                    <ul class="ul-style">
                        <li class="add-group-list-li group-list-li li-item" id="addGroup"><a class="a-style"><span class="glyphicon glyphicon-plus"></span>新建分组</a></li>
                    </ul>
                </div>
                
            </div>


        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">所有Fans</h4>
            </div>
            <div class="modal-body">           
                <hr>           
                <table>
                    <colgroup span="3">
                        <col width="60%">
                        <col width="30%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr></tr>
                    </thead>
                    <tbody id="showAllFansTbody">
                    </tbody>
                </table>
                <hr>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" id="next" class="btn btn-success">下一步</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<div class="modal fade" id="setFansDetail">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">设置Staff信息</h4>
            </div>

            <div class="modal-body">
                <div class="alert alert-info">
                    <form action="staff/add" method="post">
                        <!--        <input size="16" type="date" class="form_datetime">to
                                <input size="16" type="date" class="form_datetime">-->
                        <div class="row marketing">
                            <div class="col-lg-5" id="fansDetail">
                            </div>

                            <div class="col-lg-7">


                                <p>分组情况：<select class="form-control" id="modalGroupSelect">
                                        <c:forEach items="${staffGroupList}" var="groupList">  
                                            <option data-groupid="<c:out value="${groupList.groupId}"/>"><c:out value="${groupList.name}"/></option>
                                        </c:forEach>
                                    </select>
                                    </p>
                                <p>管理权限：<select class="form-control" id="roleGroupSelect">
                                        <c:forEach items="${roleList}" var="roleList">  
                                            <option><c:out value="${roleList}"/></option>
                                        </c:forEach>
                                    </select>
                                </p>
          

                            </div>
                        </div>  

                        <hr>       
                        <div class="row marketing">
                            <div class="col-lg-5">
                                <h4>Name：</h4>
                            </div>
                            <div class="col-lg-7">
                                <h4><input type="text" name="name" /></h4>
                            </div>
                        </div>  


                        <div class="row marketing">
                            <div class="col-lg-5">
                                <h4>note：</h4>
                            </div>
                            <div class="col-lg-7">
                                <h4><input type="text" name="note" /></h4>
                            </div>
                        </div>  

                        <div class="row marketing">
                            <div class="col-lg-5">
                                <h4>password：</h4>
                            </div>
                            <div class="col-lg-7">
                                <h4><input type="password" name="password1"/></h4>
                            </div>
                        </div>  

                        <div class="row marketing">
                            <div class="col-lg-5">
                                <h4>Confirm password：</h4>
                            </div>
                            <div class="col-lg-7">
                                <h4><input type="password" name="password2"/></h4>
                            </div>
                        </div>  

                        <div class="row marketing">
                            <div class="col-lg-5">
                                <h4>Email：</h4>
                            </div>
                            <div class="col-lg-7">
                                <h4><input type="text" name="email"/></h4>
                            </div>
                        </div>  

                        <div class="row marketing">
                            <div class="col-lg-5">
                                <h4>Tel：</h4>
                            </div>
                            <div class="col-lg-7">
                                <h4><input type="text" name="tel"/></h4>
                            </div>
                        </div>  

                        <div class="row marketing">
                            <div class="col-lg-5">
                                <h4>WorkNumber</h4>
                            </div>
                            <div class="col-lg-7">
                                <h4><input type="text" name="workNumber"/></h4>
                            </div>
                        </div>  


                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="forward">上一步</button>
                <button type="button" class="btn btn-info" id="confirmAddFans">添加</button>

            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


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
                <button type="button"  id="setStaffNote-btn" class="btn btn-success">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->