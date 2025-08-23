<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="afterLoginHeader.jsp"></jsp:include>

<h3>
<p>Welcome, ${sessionScope.name}!</p>
</h3>

<%
if(request.getParameter("t")!=null)
{%>
	
	<div class="alert alert-success">
  <strong>Success!</strong> Note created successfully.
</div>
	
	
<%}

%>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>