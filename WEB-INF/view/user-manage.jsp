<%-- 
    Document   : user-manage
    Created on : 2014-4-25, 23:07:53
    Author     : 一
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row">
  <div role="toolbar" class="navbar navbar-default">
    <div class="container">
      <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li><a href="#">操作1</a></li>
          <li><a href="#">操作2</a></li>
          <li><a href="#">操作3</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#">操作4</a></li>
          <li><a href="#">操作5</a></li>
        </ul>
        </div><!--/.nav-collapse -->
    </div>
  </div>
</div>
<div class="row">
  <div class="container">
    <div class="col-md-9">
      <table class="user-table table table-hover">
        <thead>
          <tr>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><input type="checkbox"></td>
            <td><img data-src="holder.js/50x50/auto/#777:#7a7a7a/text:U"> 孙一</td>
            <td>
              <select class="form-control">
                <option>未分组</option>
                <option>黑名单</option>
                <option>。。。</option>
              </select>
            </td>
            <td>
              <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal">修改备注</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="col-md-3">
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a>全部分组(1)</a></li>
        <li><a href="">+添加分组</a></li>
        <li><a href="">黑名单</a></li>
      </ul>
    </div>
  </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
