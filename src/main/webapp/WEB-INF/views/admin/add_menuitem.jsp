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
		<h3>상품등록</h3>
		<form:form method="post" modelAttribute="menuitem">
			<label>상품이름</label>
			<form:input path="name" /><br>
			<label>카테고리</label>
			<form:select path="category">
				<option value="unknown">--선택--</option>
				<form:options itemValue="categoryHost"
				 			  itemLabel="categoryCode"
				              items="${categoryProviderList}" />
			</form:select><br>
			<label>상품가격</label>
			<form:input path="price" /><br>
			<label>재고</label>
			<form:input path="stock" /><br>
			<input type="submit" value="등록하기" />
		</form:form>
	</div>		
</section>
</body>
</html>