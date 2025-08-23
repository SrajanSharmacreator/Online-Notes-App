<%@page import="dao.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Notes</title>

<script src="https://cdn.tailwindcss.com"></script>

</head>
<body class="bg-gray-100">
<jsp:include page="afterLoginHeader.jsp"></jsp:include>

<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy"); // Example: 22/Aug/2025
%>

<h3>
View Notes
</h3>

<div class="container mx-auto p-6">
    <h2 class="text-2xl font-bold mb-4 text-blue-700">Notes List</h2>

    <table class="table-auto border-collapse w-full bg-white shadow rounded-lg">
        <thead>
            <tr class="bg-gray-200 text-left">
                <th class="px-4 py-2 border">ID</th>
                <th class="px-4 py-2 border">Title</th>
                <th class="px-4 py-2 border">Description</th>
                <th class="px-4 py-2 border">Photo</th>
                <th class="px-4 py-2 border">Created Date</th>
                <th class="px-4 py-2 border">Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            try (DBConnect d = new DBConnect();
                 ResultSet rs = d.QueryReturner("SELECT * FROM notes where email='"+
            session.getAttribute("email")+"'")) {
                while (rs.next()) {
        %>
            <tr class="hover:bg-gray-100">
                <td class="border px-4 py-2"><%= rs.getInt("noteid") %></td>
                <td class="border px-4 py-2"><%= rs.getString("title") %></td>
                <td class="border px-4 py-2"><%= rs.getString("description") %></td>
                <td class="border px-4 py-2 text-center">
    <img src="uploads/<%= rs.getString("photo") %>" 
         width="100" class="rounded shadow cursor-pointer hover:scale-105 transition"
         onclick="showImage('uploads/<%= rs.getString("photo") %>')">
</td>
                <td class="border px-4 py-2"> <%= sdf.format(rs.getTimestamp("createdate")) %></td>
                <td class="border px-4 py-2">
                    <a href="deleteNote.jsp?id=<%= rs.getInt("noteid") %>" 
                       class="bg-red-600 text-white px-3 py-1 rounded"
                       onclick="return confirm('Are you sure to delete this note?');">
                       Delete
                    </a>
                </td>
            </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
        </tbody>
    </table>
</div>




<jsp:include page="footer.jsp"></jsp:include>
<!-- Modal -->
<div id="imgModal" 
     class="fixed inset-0 bg-black bg-opacity-70 hidden flex items-center justify-center z-50">
    <span class="absolute top-5 right-8 text-white text-3xl cursor-pointer" onclick="closeImage()">&times;</span>
    <img id="modalImage" src="" class="max-h-[90%] max-w-[90%] rounded-lg shadow-lg border-4 border-white">
</div>
<script>
function showImage(src) {
    document.getElementById("modalImage").src = src;
    document.getElementById("imgModal").classList.remove("hidden");
}
function closeImage() {
    document.getElementById("imgModal").classList.add("hidden");
}
</script>

</body>
</html>