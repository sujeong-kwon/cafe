<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.menu_img{
  object-fit: cover;
  width: 300px;
  height: 300px;
}

.menu_name{

}

.menu_price{

}
</style>
<body>
<header>
	<%@ include file="/incl/header.jsp" %>
</header>
<section>
	<div class="container">
		<table border="1">
			<tr>
				<td>
					<img class="menu_img" src="<spring:url value='/resources/img/${menuitem.image}'/>">	
				</td>
				<td>
					<table border="1" style="height: 300px; width: 400px;">
						<tr align="center">
							<td>상품명</td>
							<td>${menuitem.mname}</td>
						</tr>
						<tr align="center">
							<td>가격</td>
							<td><fmt:formatNumber value="${menuitem.price}" pattern="###,###,###"/>원</td>
						</tr>
						<tr align="center">
							<td colspan="2">
								<form action="/cafe/cart/insert" method="post">
									<input type="hidden" name="menuitemId" value="${menuitem.mid}">
									<select name="amount">
										<c:forEach begin="1" end="${menuitem.stock}" var="i">
											<option value="${i}">${i}</option>
										</c:forEach>
									</select>&nbsp;개
									<input type="submit" value="담기">
								</form>
								<a href="/cafe">돌아가기</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</section>
</body>
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</html>