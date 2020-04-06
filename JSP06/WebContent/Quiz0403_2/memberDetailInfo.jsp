<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="members.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.div_memberDetail{text-align: center; align-items: center;}
table{margin: 0 auto;}
</style>

</head>
<body>

<c:import url="header.jsp"/>
	<c:choose>
		<c:when test="${ sessionScope.loginSuccess == 'Yes' }">		
			<jsp:useBean id="dao" class="members.MemberDAO"/>
			<jsp:useBean id="dto" class="members.MemberDTO"/>
			
			<c:set var="id" value="${param.id}"/>
			<c:set var="list" value="${dao.memberDetailView(id) }"/>
	
		<c:choose>
			
			<c:when test="${list.size() != 0 }">
					<div class="div_memberDetail">
					<h2>개인 정보</h2>
					<table>
						<c:forEach var="m" items="${list }">
							<tr><th>아이디</th><td>${m.id }</td></tr>
							<tr><th>비밀번호</th><td>${m.pwd }</td></tr>
							<tr><th>이 름</th><td>${m.name }</td></tr>
							<tr><th>주 소</th><td>${m.addr }</td></tr>
							<tr><th>전화번호</th><td>${m.tel }</td></tr>
						</c:forEach>
					</table>
					<input type="button" value="수정" onclick="location.href='modify.jsp?id=${id}'">
					<input type="button" value="삭제"  onclick="location.href='delete.jsp?id=${id}'">
				
				</div>

			</c:when>
				
			<c:otherwise>
				<div class="div_memberDetail">
					<h3>데이터 없음</h3>
				</div>
			</c:otherwise>
		</c:choose>
		</c:when>
			
		<c:otherwise>
			<script type="text/javascript">location.href="login.jsp"</script>
		</c:otherwise>
	</c:choose>
<c:import url="footer.jsp"/>

</body>
</html>