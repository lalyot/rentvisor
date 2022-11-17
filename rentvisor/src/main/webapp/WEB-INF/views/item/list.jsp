<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="item.header.list" /></h2>

<sec:authorize access="hasRole('ADMIN')">
	<a href="register"><spring:message code="action.new" /></a>
</sec:authorize>
<div class="category">
    <a href="/item/list?category=camera"><img src="/images/icon_camera.png"></a>
    <a href="/item/list?category=bmx"><img src="/images/icon_bmx.png"></a>
    <a href="/item/list?category=hiking"><img src="/images/icon_hiking.png"></a>
    <a href="/item/list?category=diving_goggles"><img src="/images/icon_diving_goggles.png"></a>
    <a href="/item/list?category=tent"><img src="/images/icon_tent.png"></a>
    <a href="/item/list?category=fishing_rod"><img src="/images/icon_fishing_rod.png"></a>
    <a href="/item/list?category=board_game"><img src="/images/icon_board_game.png"></a>
    <a href="/item/list?category=luggage"><img src="/images/icon_luggage.png"></a>
</div>

	<br><br>
	<c:choose>
		<c:when test="${empty itemList}">
			<sec:authorize access="!hasRole('ADMIN')">
				<spring:message code="common.listEmpty" />
			</sec:authorize>
			
			<sec:authorize access="hasRole('ADMIN')">
				<spring:message code="common.listEmpty" />
			</sec:authorize>
		</c:when>
		<c:otherwise>
		<div class="image_box">
			<c:forEach items="${itemList}" var="item">
				<div>
				<a href="/item/read?itemId=${item.itemId}">
				<img class="image_item" src="picture?itmeId=${item.itemId}"/></a><br>
				<p>${item.itemName}</p>
				<p>${item.price}/24</p>
				</div>
			</c:forEach>
		</div>
		</c:otherwise>
	</c:choose>
	
<script>
	var result = "${msg}";

	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>
