<%-- 
    Document   : message-manage
    Created on : 2014-5-5, 10:46:04
    Author     : Administrator
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="content-hd row">
    <div class="sub-nav clearfix">
        <div class="nav-tabs pull-left" id="">
            <ul>
                <li class="tab active"><a href="javascript:void(0);">全部消息</a></li>
                <li class="tab"><a href="javascript:void(0);">今天</a></li>
                <li class="tab"><a href="javascript:void(0);">昨天</a></li>
                <li class="tab"><a href="javascript:void(0);">前天</a></li>
                <li class="tab"><a href="javascript:void(0);" data-toggle="modal" data-target="#timeModal">自定义</a></li>
                <li class="tab"><a href="javascript:void(0);">重要消息</a></li>
            </ul>
        </div>

        <div class="nav-search pull-right">
            <form action="" method="get">
                <input type="text" class="search-query" placeholder="消息内容">
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

    <div id="newMessageTip">
        <!-- 有多少条新消息 -->
    </div>

    <div class="content-list-wrap">
        <ul class="content-list message-list">
            <c:forEach items="${page.datas}" var="Message">
            <li class="message-item" data-msgid="<c:out value="${Message.id}"/>">
                <div class="message-wrap clearfix">
                    <div class="pull-left">
                        <img class="user-head" src="" data-userid="<c:out value="${Message.fromUserId}"/>">
                    </div>
                    <div class="pull-left">
                        <div class="message-info">
                            <div class="user-info">
                                <a href="javascript:void(0);"></a>
                            </div>
                            <div class="message-time">
                                <fmt:formatDate value="${Message.createTime}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                            </div>
                            <div class="message-status">
                                
                            </div>
                        </div>
                        <div class="message-content">
                            <c:if test="${Message.msgtype=='text'}">
                                <p class="message-text"><c:out value="${Message.content}"/></p>
                            </c:if>
                            <c:if test="${Message.msgtype=='image'}">
                                <a class="fancybox-buttons" data-fancybox-group="button" href="<c:out value="${Message.picUrl}"/>" target="_blank">
                                    <img class="message-image" src="<c:out value="${Message.picUrl}"/>">
                                </a>
                            </c:if>
                            <c:if test="${Message.msgtype=='voice'}">
                                <div class="message-voice">
                                    [语音]
                                    <!-- <c:out value="${Message.mediaId}"/> -->
                                </div>
                            </c:if>
                        </div>
                        <div class="reply-wrap"></div>
                    </div>
                    <div class="pull-right">
                        <div class="message-operation">
                            <a href="javascript:void(0);" class="reply-link" title="快速回复"><span class="glyphicon glyphicon-comment"></span></a>
                            <a href="javascript:void(0);" class="" title=""><span class="glyphicon glyphicon-star"></span></a>
                            <a href="javascript:void(0);" class="" title=""><span class="glyphicon glyphicon-edit"></span></a>
                        </div>
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





<div class="modal fade" id="timeModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">选择时间</h4>
            </div>
            <form action="" method="get">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">开始时间</div>
                        <div class="col-md-6">截止时间</div>
                    </div>
                    <div class="row">
                        <div class="datetime-group input-group col-md-6">
                            <input type="text" class="form-control form-datetime" data-date="" data-date-format="yyyy-mm-dd" data-link-field="fromDateInput" data-link-format="yyyy-mm-dd" readonly>
                            <span class="input-group-addon remove"><i class="glyphicon glyphicon-remove"></i></span>
                            <input type="hidden" id="fromDateInput" name="fromDate" value="" />
                        </div>
                        <div class="datetime-group input-group col-md-6">
                            <input type="text" class="form-control form-datetime" data-date="" data-date-format="yyyy-mm-dd" data-link-field="toDateInput" data-link-format="yyyy-mm-dd" readonly>
                            <span class="input-group-addon remove"><i class="glyphicon glyphicon-remove"></i></span>
                            <input type="hidden" id="toDateInput" name="toDate" value="" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info">确定</button>
                </div>
            </form>
        </div>
    </div>
</div>




<div id="quickReplyWrap" class="hide">
    <div id="quickReplyDiv">
        <div>快速回复:</div>
        <div><textarea id="replyInput" rows="3"></textarea></div>
        <div class="clearfix">
            <div class="pull-right" id="wordsCount">
                还可以输入<em>140</em>&nbsp;字
            </div>
            <div class="pull-left">
                <a href="javascript:void(0);" class="btn btn-primary" id="replyOk">发送</a>
                <a href="javascript:void(0);" id="replyCancel">取消</a>
            </div>
        </div>
        <input type="hidden" id="replyUserId" value="">
        <input type="hidden" id="replyMessageId" value="">
    </div>
</div>