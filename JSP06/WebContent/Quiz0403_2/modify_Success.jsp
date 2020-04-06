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

</head>
<body>

<jsp:useBean id="dao" class="members.MemberDAO"/>
<jsp:useBean id="dto" class="members.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<c:set var="id" value="${sessionScope.modiId }"/>

<c:set var="result" value="${dao.memberModi(dto, id) }"/>

<c:choose>
	<c:when test="${result ==true }">
		<script>
		alert("변경 되었습니다");
		location.href="memberDetailInfo.jsp?id=${id}";
		</script>
	</c:when>
	<c:otherwise>
		<script>
		alert("수정 실패");
		location.href='memberDetailInfo.jsp';
		</script>
	</c:otherwise>
</c:choose>

</body>
</html>