<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title><style>
	body { font-size: 11pt; color: teal;}
 	div { margin: 0 auto;}
</style></head><body><div>
<h2>회원 리스트</h2>
	<c:forEach var="e" items="${userList}">
	${e.uid}
	${e.uname} ${e.uphone} ${e.uaddr} <br>
	</c:forEach>
</div></body><%@ include file = "/WEB-INF/views/include/footer.jsp" %></html>