<%-- 
    Document   : menu
    Created on : 2014-4-20, 14:00:42
    Author     : Charles
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@page contentType="text/html" pageEncoding="UTF-8"%>

<div role="complementary" class="wb-sidebar affix">
    <ul class="nav nav-title wb-sidenav">
        <c:if test="${currentUserRoles['Administrator']||currentUserRoles['Manager']}">
            <li>
                <a  href="message/list?pageCount=20&pageNum=1&keyword=">
                    <span class="glyphicon glyphicon-th-large"></span>
                    消息管理
                </a>
            </li>
        </c:if>


        <li>
            <a  href="report/list?pageCount=20&pageNum=1&keyword=">
                <span class="glyphicon glyphicon-inbox"></span>
                报告管理
            </a>
        </li>


        <c:if test="${currentUserRoles['Administrator']||currentUserRoles['Manager']}">
            <li>
                <a  href="fans/list?pageCount=20&pageNum=1&groupId=">
                    <span class="glyphicon glyphicon-inbox"></span>
                    粉丝管理
                </a>
            </li>
        </c:if>

        <c:if test="${currentUserRoles['Administrator']}">
            <li>
                <a  href="staff/list?pageCount=20&pageNum=1&groupId=">
                    <span class="glyphicon glyphicon-inbox"></span>
                    员工管理
                </a>
            </li>
        </c:if>

        <c:if test="${currentUserRoles['Administrator']||currentUserRoles['Manager']}">
            <li>
                <a  href="statistics">
                    <span class="glyphicon glyphicon-stats"></span>
                    统计
                </a>
            </li>
        </c:if>

        <li>
            <a  href="account/info">
                <span class="glyphicon glyphicon-print"></span>
                账号信息
            </a>
        </li>

        <li>
            <a  href="account/setting">
                <span class="glyphicon glyphicon-cog"></span>
                账号设置
            </a>
        </li>
    </ul>
</div>
