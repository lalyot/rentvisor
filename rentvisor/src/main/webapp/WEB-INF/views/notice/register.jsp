<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="notice.header.register" /></h2>

<form:form modelAttribute="notice" action="register">
	<div class="review_body">
		<hr class="stroke_comment_content"/>
        <div align="left">
        <p>글 제목</p> <form:input path="title" class="review_register_titleForm"/>
        <form:errors path="title" class="error_message" />
        <p>글 내용</p> <form:textarea path="content" class="review_register_contentForm"/>
		<form:errors path="content" class="error_message" />
        </div>
        <hr class="stroke_comment_content"/>
		
		<div align="left">
        <p>이미지파일 첨부</p>
        <button class="btn_upload_file">파일 선택</button>
        <img src="/images/icon_tangerine.png" alt="" class="image_regiser_thumbnail"><br>
        </div>
</form:form>

<div>
	<sec:authorize access="hasRole('ADMIN')">
		<button type="submit" id="btnRegister" class="btn_register"><spring:message code="action.register" /></button>
	</sec:authorize>
	
	<button type="submit" id="btnList"class="btn_list"><spring:message code="action.list"/></button>
</div>

<script>
	$(document).ready(function() {

		var formObj = $("#notice");

		$("#btnRegister").on("click", function() {
			formObj.submit();
		});

		$("#btnList").on("click", function() {
			self.location = "list";
		});

	});
</script>
