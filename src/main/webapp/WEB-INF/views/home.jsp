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
body { overflow: auto; }


.center{
  display: flex;
  flex-wrap: wrap;
}

.img{
  display: block;
  margin: auto;
  width: 50%;
  height: auto;
}

.container .gallery {
  width: 25%;
  box-sizing: border-box;
}

div.gallery img {
  /* position: center; not valid */
  object-fit: cover;
}

div.desc {
  padding: 0px;
  text-align: center;
}

</style>
<body>
<header>
	<%@ include file="/incl/header.jsp" %>
</header>
<section>
	<div class="container">
		<h3>주문하기</h3>
		<div class="center">
		    <c:forEach var="item" items="${menuitem}">
		    <!-- 
		     <div class="card">
			  	<div class="text-wrap">
			  	  <h2 class="type">${item.mname}</h2>
			  	  <h4 class="num">${item.price}</h4>
			      <h1 class="balance">${item.stock}</h1>
			      <img src="<spring:url value='/resources/img/${item.image_url}'/>" class="img">
			  	</div>
			  </div>
		     -->			  
			  <div class="gallery">
			      <img src="<spring:url value='/resources/img/${item.image_url}'/>">
			    <div class="desc">${item.mname}/${item.price}/${item.stock}</div>
			  </div>
			 </c:forEach>
		</div>
	</div>		
</section>
</body>
</html>