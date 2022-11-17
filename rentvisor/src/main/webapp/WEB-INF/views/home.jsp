<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 스프링 MVC : 홈 뷰 -->

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<div class="slider">
	<div><img class ="slider_image" src="/images/image_slide_tent.jpg" /></div>
	<div><img class ="slider_image" src="/images/image_slide_hiking.jpg" /></div>
	<div><img class ="slider_image" src="/images/image_slide_camera.jpg" /></div>
	<div><img class ="slider_image" src="/images/image_slide_boardgame.jpg" /></div>
	<div><img class ="slider_image" src="/images/image_slide_waterslide.jpg" /></div>
</div>

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

<br>

<div class="introduction">
    <img class="introduction_image" src="/images/image_site_introduction.jpg">
    <img class="introduction_image" src="/images/image_site_introduction.jpg">
    <img class="introduction_image" src="/images/image_site_introduction.jpg">
</div>

<script>
  $(document).ready(function(){
    $('.slider').bxSlider();
  });
</script>