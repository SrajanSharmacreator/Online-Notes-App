<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<jsp:include page="afterLoginHeader.jsp"></jsp:include>

<h3>

<p>Welcome, ${sessionScope.name}!</p>

</h3>
<h1 class="text-3xl font-bold text-center text-blue-600">Create Notes!</h1>
	
	<form action="./NotesController" method="post" enctype="multipart/form-data"
		class="max-w-md mx-auto p-6 bg-white shadow rounded-lg">
		
		<label class="block mb-2 text-sm font-medium">Title</label> 
		<input type="text" name="t1"
			class="w-full border border-gray-300 rounded p-2 mb-4"> 
			
			<label
			class="block mb-2 text-sm font-medium">Description</label> 
			<textarea rows="5" cols="40" name="t2" class="w-full border border-gray-300 rounded p-2 mb-4"></textarea>
			
			<label
			class="block mb-2 text-sm font-medium">Photo</label> 
			<input
			type="file" name="t3" class="w-full border border-gray-300 rounded p-2 mb-4">
			
		<button class="w-full bg-green-600 text-white p-2 rounded">Submit</button>
		
	</form>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>