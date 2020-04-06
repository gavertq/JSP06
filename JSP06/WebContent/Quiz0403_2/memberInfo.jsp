<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.div_memberInfo{text-align: center; align-items: center;}
.table_memberInfo{margin: 0 auto;}
</style>

</head>
<body>

<%@page import="members.MemberDTO"%>
<jsp:useBean id="dao" class="members.MemberDAO"/>

	<c:import url="header.jsp"/>
	<c:choose>	
		
		<c:when test="${sessionScope.loginSuccess == 'Yes' }">		
			<%ArrayList<MemberDTO> listMember = dao.memberView(); %>
			<c:set var="result" value="${dao.memberView()}"/>
			<c:choose>
			<c:when test="${result.size() != 0 }">	
				<div class="div_memberInfo">
				<h3>회원 목록</h3>
				<table class="table_memberInfo" border="1"><tr><th>이름</th><th>주소</th><th>전화번호</th></tr>
					<c:forEach var="re" items="${result}"> 
					<tr>
					<td><a href="memberDetailInfo.jsp?id=${re.getId() }">${re.getName() }</a></td>
					<td>${re.addr }</td>
					<td>${re.getTel() }</td>
					</tr>
					</c:forEach>
				</table>
				</div>
			</c:when>	
			
			<c:otherwise>
				<div class="div_memberInfo"><h3>데이터 없음</h3></div>			
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