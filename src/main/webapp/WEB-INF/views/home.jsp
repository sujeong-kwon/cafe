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
    transform: translate(-50%,-60%);
    width: 500px;
    height: 600px;
    text-align: center;
    background: #fff;
}

#popmenu p {
    margin-top: 80px;
}

.popup_img{
	object-fit: cover;
  	width: 300px;
  	height: 300px;
  	margin-top: 30px;
}

.btn-group {
  display: flex;
  width: 100%;
  height: 50px;
  margin-top: 120px;
  justify-content: center;
}
 
.i-btn {
  display: flex;
  justify-content: space-around;
  height: 100%;
  width: 60%;
}

.i-btn .btn {
  display: flex;
  justify-content: center;
  height: 100%;
  background: tomato;
  border-radius: 30px;
  width: 130px;
  height: 50px;
}

button.btn-inner {
  color: white;
  border-style: none;
  height: 100%;
  width: 75px;
  font-size:20px;
  background: none;
  cursor: pointer;
}

.i-btn .in-btn {
  font-size: 20px;
  color: white;
  line-height: 50px;
  text-align: center;
}

.i-btn .in-btn:hover {
  font-weight: normal;
}

</style>
<body>
<header>
	<%@ include file="/incl/header.jsp" %>
</header>
<section>
	<c:if test="${!empty menuitem_modal}">
			<div id="popup" onclick="javascript:doDisplay();">
			      <div id="popmenu">
					  <img class="popup_img" src="<spring:url value='/resources/img/${menuitem_modal.image}'/>">
			          <div class="desc">${menuitem_modal.mname}</div>
			          <div class="desc">${menuitem_modal.price}</div>
			          <form action="cart" method="post">
			          	<input type="text" name="menuItemCount" placeholder="수량">
			          </form>		          
			          <div class="btn-group">
			            <div class="i-btn">
			              <div class="btn" onclick="javascript:donotDisplay();">
			                <button class="btn-inner">취소</button>
			              </div>
			              <div class="btn" onclick="javascript:donotDisplay();">
			                <a type="submit" class="in-btn">선택완료</a>
			              </div>
			            </div>
			          </div>
			      </div>
			</div>
	</c:if>
	<div class="tab">
		<ul class="tabnav">
			<c:forEach var="cate" items="${category}">
				<li><a href="/cafe/order/category?cid=${cate.cid}">${cate.cname}</a></li>
			</c:forEach>
		</ul>
		<div class="tabcontent">
			<div id="tab01" class="center">	
				<c:forEach var="item" items="${menuitem}">	  
					  <div class="gallery" onclick="javascript:sendPost('<c:url value='/order/category/menu'/>');">
					      <img class="contents" src="<spring:url value='/resources/img/${item.image}'/>">
					    <div class="desc">${item.mname}</div>
					    <div class="desc">${item.price}</div>
					  </div>
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
	function sendPost(url, param, param2) {
	    console.log(url)
	    var form = document.createElement('form');
	    form.setAttribute('method', 'get');
	    form.setAttribute('action', url);
	    document.charset = "UTF-8";
	    
	    var hiddenField = document.createElement('input');
	    hiddenField.setAttribute('type', 'hidden');
	    hiddenField.setAttribute('name', "cid");
	    hiddenField.setAttribute('value', param);
	    form.appendChild(hiddenField);
	    
	    var hiddenField2 = document.createElement('input');
	    hiddenField2.setAttribute('type', 'hidden');
	    hiddenField2.setAttribute('name', "mid");
	    hiddenField2.setAttribute('value', param);
	    form.appendChild(hiddenField2);
	    
	    document.body.appendChild(form);   
	    form.submit();
	}
	
	var popup = document.getElementById("popup"); 	
    popup.style.display = 'block'; 	
	
	var bDisplay = true; 
	function donotDisplay(){ 	
        var popup = document.getElementById("popup"); 		
        popup.style.display = 'none'; 	
    }
	
</script>
</html>