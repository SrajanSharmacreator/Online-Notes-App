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

 <h1 class="text-3xl font-bold text-center text-blue-600">New User!</h1>
 <form action="./RegController" method="post" class="max-w-md mx-auto p-6 bg-white shadow rounded-lg">
  <label class="block mb-2 text-sm font-medium">Full Name</label> 
  <input type="text" name="t1"
   class="w-full border border-gray-300 rounded p-2 mb-4"> 
   <label
   class="block mb-2 text-sm font-medium">Email</label> 
   <input
   type="email" name="t2" class="w-full border border-gray-300 rounded p-2 mb-4">
   
   <label
   class="block mb-2 text-sm font-medium">Password</label> 
   <input
   type="password" name="t3" class="w-full border border-gray-300 rounded p-2 mb-4">
   
   <label
   class="block mb-2 text-sm font-medium">Mobile</label> 
   <input
   type="number" name="t4" class="w-full border border-gray-300 rounded p-2 mb-4">
   
   
  <button class="w-full bg-green-600 text-white p-2 rounded">Submit</button>
  
  </form>
</body>
</html>