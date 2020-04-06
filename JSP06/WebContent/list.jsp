<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>list.jsp<br>
	<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="testBoard.TestDAO"/>
	<c:set var="listDto" value="${dao.list() }"/>
	<%-- --%>
	<table border="1">
		<tr><th>번호</th><th>제목</th><th>등록날짜</th><th>조회수</th></tr>
			<c:choose>
				<c:when test="${listDto.size() != 0 }">
					<c:forEach var="l" items="${listDto }">
						<tr>
							<td>${l.num }</td><td>${l.title }</td>
							<td>${l.pdate }</td><td>${l.count }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><th colspan="4">등록된 정보가 없습니다</th></tr>
				</c:otherwise>
			</c:choose>
			<tr><td colspan="4" align="right"><button type="button" onclick="location.href='regForm.jsp'">등록</button></td></tr>
		
	</table>
	
</body>
</html>