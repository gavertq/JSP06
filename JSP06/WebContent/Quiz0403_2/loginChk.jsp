<%@page import="java.util.ArrayList"%>
<%@page import="members.MemberDTO"%>
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
</head>
<body>

<c:set var="uid" value="${param.idLogin }"/>
<c:set var="uPwd" value="${param.pwdLogin }"/>

<jsp:useBean id="dao" class="members.MemberDAO"/>
<c:set var="result" value="${dao.memberLogin(uid, uPwd) }"/>

<c:choose>
	<c:when test="${ result == 0}">
		<script>location.href='login_Success.jsp'</script>
		<c:set var="loginSuccess" value="Yes" scope="session"/>
	</c:when>
	<c:when test="${ result == 1}">
		<script>
		alert("비밀번호가 일치하지 않습니다.");
		location.href='login.jsp'
		</script>
	</c:when>
	<c:otherwise>
		<script>
		alert("등록되지 않은 아이디 입니다.");
		location.href='login.jsp'
		</script>
	</c:otherwise>
</c:choose>

</body>
</html>