<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="dao.DBConnect" %>
<%
    String id = request.getParameter("id");
    if (id != null) {
        String photoName = null;
        try (DBConnect obj = new DBConnect()) {
            // 1. Get photo name before deleting
            PreparedStatement ps1 = obj.cn.prepareStatement("SELECT photo FROM notes WHERE noteid=?");
            ps1.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                photoName = rs.getString("photo");
            }

            // 2. Delete record from DB
            PreparedStatement ps2 = obj.cn.prepareStatement("DELETE FROM notes WHERE noteid=?");
            ps2.setInt(1, Integer.parseInt(id));
            ps2.executeUpdate();

            // 3. Delete physical file (if not default)
            if (photoName != null && !photoName.equals("Nophoto.jpg")) {
                String savePath = application.getRealPath("") + "uploads" + File.separator + photoName;
                File file = new File(savePath);
                if (file.exists()) {
                    file.delete();
                }
            }

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
    response.sendRedirect("ViewNotes.jsp");
%>
