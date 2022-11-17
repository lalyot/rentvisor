<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<h2>
	<c:out value="${error}" />
</h2>
<h2>
	<c:out value="${logout}" />
</h2>

<form:form method="post" action="/login">
	<div class="login_box">
		<h1><spring:message code="auth.header.login"/></h1><br><br>
		<input type="text" name="username" placeholder="아이디" class="text_box"/><br><br><br>
		<h3></h3>
		<input type="password" name="password" placeholder="비밀번호" class="text_box"/><br><br>
		<input type="checkbox" name="remember-me"><spring:message code="auth.rememberMe"/>
		<button><spring:message code="action.login"/></button>
	</div>
</form:form>
