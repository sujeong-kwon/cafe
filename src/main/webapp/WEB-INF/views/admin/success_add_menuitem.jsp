<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

section {
  width: 100%;
  height: calc(100vh - 30px);
}
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0 auto;
  flex-direction: column;
  padding-top: 150px;
}

.type{
  padding-top: 20px;
}

.box{
	display: block;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 30px 10px 30px;
    box-sizing: border-box;
    background: #fff;
    position: relative;
}
</style>
<body>
<header>
	<%@ include file="/incl/header.jsp" %>
</header>
<section>
	<div class="container">
		<h3>상품이 등록되었습니다.</h3>
		<label>상품이름</label> : ${menuitem.name}<br>
		<label>카테고리</label> : ${menuitem.category.cateCode}<br>
		<label>상품가격</label> : ${menuitem.price}<br>
		<label>재고</label> : ${menuitem.stock}
	</div>		
</section>
</body>
</html>