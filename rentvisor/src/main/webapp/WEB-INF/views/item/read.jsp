<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h2><spring:message code="item.header.read" /></h2>

<form:form modelAttribute="item" action="buy">
	<form:hidden path="itemId" />
	<form:hidden path="pictureUrl" />
	<form:hidden path="previewUrl" />
	
        <div class= "body"> 
        <div class= "read_product_top">
        <div class= "read_product_top_image">
            <img class = "image_read_top" src="picture?itemId=${item.itemId}" width="200px">
        </div>
    <div class="read_product_top_information">
            <p>카메라</p>
            <h2>${item.itemName}<br>
                대여료 : ${item.price}원 / 24시간
            </h2>
            <p class="read_product_notice"> ※기본 24시간 대여료입니다.<br>
                ※8시간 이하 추가 사용히 24시간 대여료의 50%가 추가됩니다.</p>
            
            <hr class="stroke_read_product"/>

            <button class="btn_select_date">대여/반납일자 선택하기</button>

            <label for="additional_order">추가주문</label>
                <select name="additionalList" form="additionalform" class="additional_list">
                <option value="">---</option>
                <option value="gopro_sport_kit">고프로용 스포츠 키트(+8000원)</option>
                <option value="gopro_light_kit">고프로용 조명 키트(+8000원)</option>
                <option value="magnetic_rotary_clip">자석식 회전 클립(+5000원)</option>
                <option value="quick_clip">퀵 클립(+3000원)</option>
                <option value="extra_bettery">고프로 추가 배터리(+5000원)</option>
                <option value="head_mount">헤드 마운트(+5000원)</option>
                <option value="dive_mount">다이브 하우징(60ml)(+5000원)</option>
                <option value="chest_mount">체스트 마운트</option>(+5000원)</option>
                <option value="handlebar_mount">핸들바 마운트(+5000원)</option>
            </select>

            <div class="selected_additional_order">
                <div class="selected_additional_order_name">고프로 히어로 10 블랙 액션캠</div>
                <div class="selected_additional_order_quantity">- 1 +</div>
                <div class="selected_additional_order_price">28,000</div>
            </div>
            <div class="selected_additional_order">
                <div class="selected_additional_order_name">고프로용 조명 키트</div>
                <div class="selected_additional_order_quantity">- 1 +</div>
                <div class="selected_additional_order_price">8,000</div>
            </div>
            <div class="selected_additional_order">
                <div class="selected_additional_order_name">퀵 클립</div>
                <div class="selected_additional_order_quantity">- 1 +</div>
                <div class="selected_additional_order_price">3,000</div>
            </div>
            <div class="read_price">
            <h2>39,000</h2>
            </div>
            
            <div class="rent_cart_button">
            <button class="button_rent">바로 빌리기</button>
            <button class="button_cart">장바구니에 추가</button>
            </div>

            <hr class="stroke_read_product"/>

            <p>꼭 읽어주세요! <br><br>
                1. 반납일을 반드시 지켜주세요.<br><br>
                2. 생활 기스 정도의 훼손은 책임을 묻지 않습니다.<br><br>
                3. 상품 파손시 제품 수리비를 배상하셔야합니다.</p>
        </div>
        </div>
        <hr class="stroke"/>
</form:form>

 <div class="product_read_middle">
            <input type="radio" id="radio_read_image" name="show" checked />
            <input type="radio" id="radio_review" name="show" />

                <div class="product_read_tab">
                    <label for="radio_read_image">상세보기</label>
                    <label for="radio_review">이용후기</label>
                </div>

                <div class="radio_content">

                    <div class="radio_content_image">
                        <img src="/images/camera/image_action_camera_1_read.jpg" alt="고프로 상세 설명 이미지" >
                    </div>

                    <div class="radio_content_review">
                        <div class="radio_content_review_box">
                        <div class="radio_content_review_img">
                        <img src="/images/camera/image_action_camera_1.png" alt="이용후기 썸네일 이미지" class="image_radio_content">
                        </div>
                        <div class="radio_content_review_text">
                            <p>책상위새우깡</p>
                            <h3>굉장히 만족합니다.</h3>
                            <p class="comment_content">All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, 
                                combined with a handful of model sentence structures</p>
                            <p>2022.09.20</p>
                        </div>
                    </div>
                    <hr class="stroke_comment_content"/>
                </div>
                </div>
        </div>
        </div>

<script>
	$(document).ready(function() {

		var formObj = $("#item");

		$("#btnBuy").on("click", function() {
			formObj.submit();
		});

		$("#btnList").on("click", function() {
			self.location = "list";
		});

	});
</script>
