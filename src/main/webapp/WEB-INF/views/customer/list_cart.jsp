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
		<h2>주문목록 확인</h2>
		<c:choose>
			<c:when test="${map.count == 0}">
				주문목록이 없습니다.
			</c:when>
			<c:otherwise>
				<form action="">
					<table border="1">
						<tr>
							<th>품명</th>
							<th>단가</th>
							<th>수량</th>
							<th>금액</th>
							<th>취소</th>
						</tr>
						<c:forEach var="row" items="${map.list}" varStatus="i">
						<tr align="center">
							<td>
								${row.mname}
							</td>
							<td style="width: 80px" align="right">
								<fmt:formatNumber value="${row.price}" pattern="###,###,###"/>원
							</td>
							<td>
								<input type="number" style="width: 40px" name="amount" value="${row.amount}" min="1">
								<input type="hidden" name="menuitemId" value="${row.menuItemId}">
							</td>
							<td style="width: 100px" align="right">
								<fmt:formatNumber value="${row.price}" pattern="###,###,###"/>원
							</td>
							<td style="width: 100px" align="right">
								<a>삭제</a>
							</td>
						</tr>
						</c:forEach>
						<tr>
							<td colspan="5" align="right">
								<fmt:formatNumber value="${map.allSum}" pattern="###,###,###"/>원
							</td>
						</tr>
					</table>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
</section>
</body>
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</html>