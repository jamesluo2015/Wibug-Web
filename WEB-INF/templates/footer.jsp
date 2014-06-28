<%-- 
    Document   : footer.jsp
    Created on : 2014-4-20, 0:02:49
    Author     : Charles
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- FOOTER -->
<footer>
    <div class="container">
        <p>&copy; 2013 Company, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
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
<script src="resources/js/wb-pagination.js"></script>
<script src="resources/js/fans.js"></script>
<script src="resources/js/message.js"></script>
<script src="resources/js/staff.js"></script>
<script src="resources/js/tag.js"></script>
<script src="resources/js/report.js"></script>
<script src="resources/js/report_detail.js"></script>
<c:forEach var="script" items="${javascripts}">
    <script src="<c:url value='${script}'/>"></script>
</c:forEach>
