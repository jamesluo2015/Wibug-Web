<%-- 
    Document   : tag-manager
    Created on : 2014-5-6, 20:11:14
    Author     : Administrator
--%>

<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
            <div class="container">
              <div class="row">
                <div role="toolbar" class="navbar navbar-default">
                  <div class="container">
                    <div class="collapse navbar-collapse">
                      <ul class="nav navbar-nav">
<!--                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>-->
                        <li>
                        <form class="nav navbar-form navbar-right" id="findTagForm" role="form">
                        <div class="form-group">
                                <li class="dropdown">
                                              <input type="text" placeholder="MessageInfo" class="form-control" data-toggle="dropdown">
                                              <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="http://twitter.com/fat">Action</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="http://twitter.com/fat">Another action</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="http://twitter.com/fat">Something else here</a></li>
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="http://twitter.com/fat">Separated link</a></li>
                                              </ul>
                                            </li>
                        </div>
                        <button type="button" class="btn btn-success">查找</button>
                        </form>
                        </li>
                      </ul>
                      <ul class="nav navbar-nav navbar-right">
                        <li>
                        <form class="nav navbar-form navbar-right" id="addTagForm" role="form">
                        <div class="form-group">
                          <input type="text" placeholder="TagContent" class="form-control">
                        </div>
                        <button type="button" class="btn btn-success">添加</button>
                        </form>
                        </li>
                      </ul>
                      </div><!--/.nav-collapse -->
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="container">
                                                         <div class="bs-example">
                                                          <ul class="nav nav-pills">
                                                            <c:forEach items="${datas}" var="Tag">  
                                                                <li class="active" data-tagId="<c:out value="${Tag.id}"/>"><a href=""><c:out value="${Tag.content}"/><span class="badge"><c:out value="${Message.createTime}"/></span></a></li>
                                                                <c:out value="${Message.createTime}"/>
                                                            </c:forEach>
                                                          
        
                                                          </ul>
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
            <h4 class="modal-title" id="myModalLabel">消息</h4>
          </div>
          <div class="modal-body">
            <h4>重复Tag，添加失败</h4>
            

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success"  data-dismiss="modal">Close</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
