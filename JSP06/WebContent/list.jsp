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
	
	<%-- 페이징 --%>
	<c:set var="totalPage" value="${dao.getTotalPage() }"/>	
	
	<table border="1">
		<tr><th>번호</th><th>제목</th><th>등록날짜</th><th>조회수</th></tr>
			<c:choose>
				<c:when test="${listDto.size() != 0 }">
					<c:forEach var="l" items="${listDto }">
						<tr>
							<td>${l.num }</td><td><a href="count.jsp?num=${l.num }">${l.title }</a></td>
							<td>${l.pdate }</td><td>${l.count }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><th colspan="4">등록된 정보가 없습니다</th></tr>
				</c:otherwise>
			</c:choose>
			
			<%-- 페이징 --%>
			<tr><td colspan="4" align="right">
				<c:choose>
					<c:when test="${param.start == null }">	<%--페이지를 처음 들어온거면 1페이지로 --%>
						<c:set var="start" value="1"/>
					</c:when>
					<c:otherwise>
						<c:set var="start" value="${param.start }"/>	<%--특정 페이지로 들어온거면 그 페이지로 --%>
					</c:otherwise>
				</c:choose>
				
				<%--이전 버튼. 현 페이지에서 -1. 1이면 버튼 비활성화 --%>
				<c:choose>
					<c:when test="${start > 1 }">
						<button type="button" onclick="location.href='list.jsp?start=${start-1}'">이전</button>
					</c:when>
					<c:otherwise>
						<button type="button" disabled="disabled">이전</button>
					</c:otherwise>
				</c:choose>
				
				<%--페이지 목록 --%>
				<c:forEach begin="1" end="${totalPage }" step="1" var="cnt">
					<a href="list.jsp?start=${cnt }">[${cnt }]</a>
				</c:forEach>
				
				<%--다음 버튼. 현 페이지에서 +1. 마지막이면 버튼 비활성화 --%>
				<c:choose>
					<c:when test="${start < totalPage }">
						<button type="button" onclick="location.href='list.jsp?start=${start+1}'">다음</button>
					</c:when>
					<c:otherwise>
						<button type="button" disabled="disabled">다음</button>
					</c:otherwise>
				</c:choose>
				
				<%--등록 버튼 --%>
				<button type="button" onclick="location.href='regForm.jsp'">등록</button>
			</td></tr>
		
	</table>
	
</body>
</html>