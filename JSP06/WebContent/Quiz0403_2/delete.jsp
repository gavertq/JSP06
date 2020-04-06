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

<jsp:useBean id="dao" class="members.MemberDAO"/>
<jsp:useBean id="dto" class="members.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<c:set var="id" value="${sessionScope.modiId }"/>
<c:set var="result" value="${dao.memberDel(id) }"/>

<c:choose>
	<c:when test="${result ==true }">
		<script>
		alert("삭제 완료");
		location.href='delete_Success.jsp';
		</script>
	</c:when>
	<c:otherwise>
		<script>
		alert("삭제 실패");
		location.href='memberDetailInfo.jsp';
		</script>
	</c:otherwise>
</c:choose>

</body>
</html>