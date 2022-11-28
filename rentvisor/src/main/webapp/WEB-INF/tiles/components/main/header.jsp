<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 메인 레이아웃 헤더 -->
<div class="header">

	<!-- 메인 레이아웃 헤더 박스 왼쪽 -->
	<div class="header_box_left">
		<a href="/"><img class="header_icon_home" src="/images/icon_rentvisor.png"></a>
	</div>

	<!-- 메인 레이아웃 헤더 박스 가운데 -->
	<div class="header_box_middle">
		<img class="header_link_icon" src="/images/icon_tangerine.png"/>
		<span class="header_link_text"><a href="/item/list?category=camera" class="header_link_a">물품대여</a></span>
		<img class="header_link_icon" src="/images/icon_tangerine.png" />
		<span class="header_link_text"><a href="/board/list" class="header_link_a">이용후기</a></span>
		<img class="header_link_icon" src="/images/icon_tangerine.png" />
		<span class="header_link_text"><a href="/notice/directions" class="header_link_a">이용안내</a></span>
		<img class="header_link_icon" src="/images/icon_tangerine.png" />
		<span class="header_link_text">전화상담</span>
		<img class="header_link_icon" src="/images/icon_tangerine.png" />
	</div>
	<!-- 메인 레이아웃 헤더 박스 가운데 -->

	<!-- 메인 레이아웃 헤더 박스 오른쪽 -->
	<div class="header_box_right">

		<sec:authorize access="!isAuthenticated()">
			<form>
				<button class="header_button" formaction="/user/register">
					<spring:message code="header.joinMember" />
				</button>
				<button class="header_button" formaction="/auth/login">
					<spring:message code="header.login" />
				</button>
			</form>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<form action="/auth/logout" method="post">
				<sec:csrfInput />
				<button class="header_user_name" formaction="/user/register">
					<sec:authentication property="principal.username" />님
				</button>
				<button class="header_button">
					<spring:message code="action.logout" />
				</button>
			</form>
		</sec:authorize>

	</div>
	<!-- 메인 레이아웃 헤더 박스 오른쪽 -->

</div>
<!-- 메인 레이아웃 헤더 -->
<hr>
