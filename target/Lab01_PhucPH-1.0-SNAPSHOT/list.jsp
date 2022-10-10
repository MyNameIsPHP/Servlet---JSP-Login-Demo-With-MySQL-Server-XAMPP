<%-- 
    Document   : list
    Created on : Oct 10, 2022, 6:23:32 PM
    Author     : PhucPhan
--%>

<%@page import="com.models.Account"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.DAOs.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#tbKhachHang').DataTable();
            });
            function signOut() {
                
                return confirm('Do you want to sign out?');
            }
        </script>
    </head>
    <body>
        <%

            String username = "";

            Cookie[] cookies = request.getCookies();
            for (Cookie c : cookies) {
                if (c.getName().equals("username")) {
                    username = c.getValue();
                    break;
                }
            }
            if (username.equals("")) {
                response.sendRedirect("/Lab01_PhucPH/index.jsp");
            } else {
                AccountDAO acc_dao = new AccountDAO();
                Account account = acc_dao.getAccount(username);
        %>
        Hello, <%= account.fullname%> (<a onclick=signOut() href="AccountServlet">Sign out</a>)
        <br>
        <table border="1" cellpadding="0" cellspacing="0" id="tbKhachHang">

            <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Full name</th>
                <th>Gender</th>
                <th>Birthday</th>
                <th>Department</th>
            </tr>
            <%
                AccountDAO dao = new AccountDAO();
                ResultSet rs = dao.getAll();
                while (rs.next()) {

            %>
            <tr>
                <td><%= rs.getString("username")%></td>
                <td><%= rs.getString("password")%></td>
                <td><%= rs.getString("fullname")%></td>
                <td><%= rs.getString("gender")%></td>
                <td><%= rs.getString("birthday")%></td>
                <td><%= rs.getString("gender")%></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }
        %>

    </body>
</html>
