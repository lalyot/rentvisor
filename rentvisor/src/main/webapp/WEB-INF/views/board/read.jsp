<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="board.header.read" /></h2>

<form:form modelAttribute="board">
	<form:hidden path="boardNo" />

	<input type="hidden" name="page" value="${pgrq.page}">
	<input type="hidden" name="searchType" value="${pgrq.searchType}">
	<input type="hidden" name="keyword" value="${pgrq.keyword}">
	<hr class="stroke_review"/>

        <h1 class="review_read_title">${board.title}</h1>
        
        <div class="review_information">
            <p>${board.writer} | ${board.regDate} | 조회수 : 32</p>
        </div>
		
		<div class="review_content_image">
        	<img src="/images/image_slide_camera.jpg" width="100%">
        </div>
        
        <div class="review_content">
        <p>${board.content}</p>
        </div>
        
        
	
</form:form>

<div>
	<sec:authentication property="principal" var="pinfo"/>

	<sec:authorize access="hasRole('ADMIN')">
		<button type="submit" id="btnRemove"><spring:message code="action.remove" /></button>
	</sec:authorize>

	<sec:authorize access="hasRole('MEMBER')">
       <c:if test="${pinfo.username eq board.writer}">
       	<button type="submit" id="btnEdit"><spring:message code="action.edit" /></button>
       	<button type="submit" id="btnRemove"><spring:message code="action.remove" /></button>
       </c:if>
	</sec:authorize>

	<button type="submit" id="btnList"><spring:message code="action.list" /></button>
</div>
        <hr class="stroke_comment_title"/>
        <div class="list_comment" align="left" id="comment_box">
        	<c:forEach items="${list}" var="comment">
	            <p>${comment.userId}</p>
	            <p class="comment_content">${comment.content}</p>
	            <p>${comment.writeDate}</p>
	            <button class="btn_down_level_comment" onClick="plusPlus(${comment.commentId})">답글</button>
	            <hr class="stroke_comment_content"/>
	            <div id=comment_content_box${comment.commentId}>
	            </div>
            </c:forEach>
		</div>
		
		<div class="commentForm" align="left">
            <p>아이디</p>
            <input type="text" class="commentForm_content" id="con">
            <button class="btn_comment" id="addComment" >등록</button>
		</div>
<script>

	function plusPlus(commentId){
		var boardNo = $("#boardNo").val();
		$.ajax({
		type:"GET",
		async:"true",
		url:"/comment/plusBox/"+boardNo+","+commentId,
		success:function(data){
		var plusBox = "<div class=commentFormPlusBox id=comment_content_box"+commentId+">";
		for(var i in data){
			plusBox += "<div class=commentFormPlus>";
			plusBox += "<p>"+data[i].userId+"</p>";
			plusBox += "<p class=comment_content>"+data[i].content+"</p>";
			plusBox += "<p>"+data[i].writeDate+"</p>";
			plusBox += "<hr class=stroke_comment_content/>";
			plusBox += "</div>";
		}
			plusBox += "<div class=commentFormPlus>";
			plusBox += "<p>아이디</p>";
			plusBox += "<input type=text class=commentForm_content id=plusContentsVal"+commentId+">";
			plusBox += "<button class=btn_comment onClick=btn_plusContent("+commentId+")>등록</button>";
			plusBox += "</div></div>";
			$("#comment_content_box"+commentId).append(plusBox);
			alert("success");
		}
		});
	}
	
	function btn_plusContent(commentId){
		var boardNo = $("#boardNo").val();
		var plusContentVal = $("#plusContentsVal"+commentId).val();
		
		$.ajax({
		type:"GET",
		async:"true",
		url:"/comment/plus/"+boardNo+","+commentId,
		data:{content:plusContentVal},
		success:function(data){
		var output = "<div class=commentFormPlusBox id=plusContent"+commentId+">";
		for(var i in data){
		output += "<div class=commentFormPlus>";
		output += "<p>"+data[i].userId+"</p>";
		output += "<p class=comment_content>"+data[i].content+"</p>";
		output += "<p>"+data[i].writeDate+"</p>";
		output += "<hr class=stroke_comment_content/>";
		output += "</div>";
		}
		output += "<div class=commentFormPlus>";
		output += "<p>아이디</p>";
		output += "<input type=text class=commentForm_content id=plusContentsVal"+commentId+">";
		output += "<button class=btn_comment onClick=btn_plusContent("+commentId+")>등록</button>";
		output += "</div></div>";
		$("#comment_content_box"+commentId).html(output);
		}
		});
	}
	
	$(document).ready(function() {

		var formObj = $("#board");
		
		
		$("#addComment").on("click",function(){
				var boardNO = $("#boardNo").val();
				var contents = $("#con").val();
				$.ajax({
				type:"GET",
				async:"true",
				url:"/comment/add/"+boardNO,
				data:{content:contents},
				success:function(data){
				var output="";
				for(var i in data){
				output +="<p>"+data[i].userId+"</p>";
				output +="<p class=comment_content>"+data[i].content+"</p>";
				output +="<p>"+data[i].writeDate+"</p>";
				output +="<button class=btn_down_level_comment onClick=plusPlus("+data[i].commentId+")>답글</button>";
				output +="<hr class=stroke_comment_content/>";
				output +="<div id=comment_content_box"+data[i].commentId+">";
				output +="</div>";
				}
				$("#comment_box").html(output);
				}
				});
			});
		
		$("#btnEdit").on("click", function() {
			var boardNo = $("#boardNo");
			var boardNoVal = boardNo.val();
			
			self.location = "/board/modify${pgrq.toUriString()}" + "&boardNo=" + boardNoVal;
		});

		$("#btnRemove").on("click", function() {
			formObj.attr("action", "/board/remove");
			formObj.submit();
		});

		$("#btnList").on("click", function() {
			self.location = "/board/list${pgrq.toUriString()}";
		});

	});
</script>

