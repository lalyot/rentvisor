<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

 <h1>공지사항</h1>
 <h2>렌트바이저 서비스의 변경사항, 이벤트 등이 공지됩니다.</h2>

<table>
	<tr>
		<th align="center" width="80"><spring:message code="notice.no" /></th>
		<th align="center" width="320"><spring:message code="notice.title" /></th>
		<th align="center" width="180"><spring:message code="notice.regdate" /></th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="3" align="center">
					<spring:message code="common.listEmpty" />
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<div>
			<c:forEach items="${list}" var="notice">
				<tr>
					<td align="center">${notice.noticeNo}</td>
					<td align="center"><a href="/notice/read?noticeNo=${notice.noticeNo}"><c:out value="${notice.title}" /></a></td>
					<td align="center"><javatime:format pattern="yyyy-MM-dd" value="${notice.regDate}" /></td>
				</tr>
			</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
</table><br>
	
	<sec:authorize access="hasRole('ADMIN')">
	<a href="register"><spring:message code="action.new" /></a>
	</sec:authorize>

<script>
	var result = "${msg}";

	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>
