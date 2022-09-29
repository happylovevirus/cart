<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>sessionLogout</title>
</head>
<body>
<%
session.invalidate(); 
%>
<script>
alert("로그아웃 되었습니다.");
location.href='<%= request.getContextPath() %>/';
</script></body><%@ include file = "/WEB-INF/views/include/footer.jsp" %></html>
