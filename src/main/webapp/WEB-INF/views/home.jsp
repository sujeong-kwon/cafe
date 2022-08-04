<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/default.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/header.css'/>"/>
</head>
<style>
body { 
  overflow: auto;
  width:100%;
  height:100%;
}


section{
  margin-top: 80px;
  width: 100%
}

.tab{
  float: left;
  width: 75%
}

.tabcontent{
  margin-top: 46px;
}

.tabnav{
  font-size: 10px;
  width: 600px;
  border: 1px solide #ddd;
}

.tabnav li{
  display: inline-block;
  height: 46px;
  text-align: center;
  border-right: 1px solid #ddd;
}

.tabnav li a:before{
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 3px;
}

.tabnav li a.active:before {background:tomato;}

.tabnav li a.active {border-bottom:1px solid #fff;}

.tabnav li a {
  position:relative;
  display:block;
  background: #tomato;
  color: #000;
  padding:0 30px;
  line-height:46px; 
  text-decoration:none; 
  font-size:16px;
}

.tabnav li a:hover, .tabnav li a.active{
  background:#fff;
  color:tomato;
}

.gallery {
  width: 25%;
  box-sizing: border-box;
}

.center{
  display: flex;
  flex-wrap: wrap;
}

div.gallery img {
  /* position: center; not valid */
  object-fit: cover;
  width: 300px;
  height: 300px;
}

div.desc {
  padding: 0px;
  text-align: center;
}

.order{
  float: right;
  background: red;
  width: 25%;
  height: 100vh;
}

/*팝업창*/
#popup {
    display: none; /*숨기기*/
    position: fixed;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.5);
    z-index: 10;
}

#popmenu {
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%,-50%);
    width: 500px;
    height: 500px;
    text-align: center;
    background: #fff;
}

#popmenu p {
    margin-top: 80px;
}

</style>
<body>
<header>
	<%@ include file="/incl/header.jsp" %>
</header>
<section>
	<div id="popup">
       <div id="popmenu">
           <div class="gallery">
		      <img class="contents" src="<spring:url value='/resources/img/${item.image}'/>">
		    <div class="desc">${item.mname}/${item.price}/${item.stock}</div>
		  </div>
           <div class="exit">취소</div>
           <div class="exit">선택완료</div>
       </div>
	</div>
	<div class="tab">
		<ul class="tabnav">
			<li><a href="#tab01">커피</a></li>
			<li><a href="#tab02">음료</a></li>
			<li><a href="#tab03">빽스치노</a></li>
		</ul>
		<div class="tabcontent">
			<div id="tab01" class="center">	
				<c:forEach var="item" items="${menuitem}">	
					<c:if test="${item.categoryId eq 1}">	  
					  <div class="gallery" onclick="javascript:sendPost('<c:url value='${baseURL}${path}'/>', ${item.mid} );">
					      <img class="contents" src="<spring:url value='/resources/img/${item.image}'/>">
					    <div class="desc">${item.mname}/${item.price}/${item.stock}</div>
					  </div>
				 	</c:if>	
				 </c:forEach>							 
			</div>
			<div id="tab02" class="center">
				 <c:forEach var="item" items="${menuitem}">	
						<c:if test="${item.categoryId eq 2}">  
						  <div class="gallery" onclick="javascript:sendPost('<c:url value="/"/>', ${item.mid} );">
						      <img class="contents" src="<spring:url value='/resources/img/${item.image}'/>">
						    <div class="desc">${item.mname}/${item.price}/${item.stock}</div>
						  </div>
					 	</c:if>	
				 </c:forEach>	
			</div>
			<div id="tab03" class="center">
				 <c:forEach var="item" items="${menuitem}">	
						<c:if test="${item.categoryId eq 3}">	  
						  <div class="gallery">
						      <img class="contents" src="<spring:url value='/resources/img/${item.image}'/>">
						    <div class="desc">${item.mname}/${item.price}/${item.stock}</div>
						  </div>
					 	</c:if>
				 </c:forEach>	
			</div>	   	
		</div>
	</div>		
	<div class="order">
		<h2>주문내역</h2>
		<table style="width:100%">
		    <tr style="background-color:lightgrey">
		        <th>품명</th>
		        <th>수량</th>
		        <th>금액</th>      
		    </tr>
		    <tr>
		        <td>아이스아메리카노</td>
		        <td>2개</td>
		        <td>1500원</td>
		    </tr>
		    <tr>
		        <td>카페라떼</td>
		        <td>3개</td>
		        <td>2500원</td>
		    </tr>
</table>
	</div>
</section>
</body>
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function sendPost(url, param) {
	    console.log(url)
	    var form = document.createElement('form');
	    form.setAttribute('method', 'post');
	    form.setAttribute('action', url);
	    document.charset = "UTF-8";
	    
	    var hiddenField = document.createElement('input');
	    hiddenField.setAttribute('type', 'hidden');
	    hiddenField.setAttribute('name', "mid");
	    hiddenField.setAttribute('value', param);
	    form.appendChild(hiddenField);

	    document.body.appendChild(form);
	    form.submit();
	}
	
	$(function(){
	  $('.tabcontent > div').hide();
	  $('.tabnav a').click(function () {
	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	    $('.tabnav a').removeClass('active');
	    $(this).addClass('active');
	    return false;
	  }).filter(':eq(0)').click();
	});
	
	$(function(){
        $(".contents").click(function(){
            $("#popup").css("display", "block");
        });
        $("#popup").click(function(){
            $("#popup").css("display", "none");
        });
	});
</script>
</html>