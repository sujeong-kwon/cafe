<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<title>Home</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/default.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/header.css'/>"/>	
</head>
<body>
<style>
body { overflow: auto; }

.container{
  width: 100%;
  height: calc(100vh - 30px);
}

.center{
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0 auto;
  flex-direction: column;
  padding-top: 150px;
  
}
</style>
<header>
    <%@ include file="/incl/header.jsp" %>
</header>
<div class="container">
      <div class="center">
		    
		</div>
    </div>
</body>
</html>
