<%-- 
    Document   : index
    Created on : Oct 6, 2022, 5:11:23 PM
    Author     : PhucPhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> </body>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            function checkUsername() {
                var username = $("#login-username").val();
                if (username_regex.test(username) === false) {
                    if (username !== "")
                        $('#username-alert').show();
                    return false;
                } else {
                    $('#username-alert').hide();
                    return true;
                }
            }

            function checkPassword() {
                var password = $("#login-password").val();
                if (password_regex.test(password) === false) {
                    if (password !== "")
                        $('#password-alert').show();
                    return false;

                } else {
                    $('#password-alert').hide();
                    return true;
                }
            }
            var username_regex = /^[A-Za-z]+[A-Za-z0-9]+$/;
            var password_regex = /^.{6,}$/;
            $("#login-username").blur(function () {
                checkUsername();
            });

            $("#login-password").blur(function () {
                checkPassword();
            });


            $('#btn-login').click(function () {
                if ($("#login-username").val() === "") {
                    $('#username-alert').show();
                    return false;
                }

                if ($("#login-password").val() === "") {
                    $('#password-alert').show();
                    return false;
                }

                if (checkUsername() === false || checkPassword() === false)
                    return false;

            });


        });
    </script>
</head>
<body>
    <div class="container">    
        <%
            String errorDisplay = "none";
            String errorContent = "";
            if (request.getParameter("error") != null) {
                errorDisplay = "block";
                String errorType = request.getParameter("error");
                if (errorType.equals("user_not_found")) {
                    errorContent = "User not found.";
                } else if (errorType.equals("incorrect_password")) {
                    errorContent = "Incorrect password.";
                }
            }
            String name = "";

            Cookie[] cookies = request.getCookies();
            for (Cookie c : cookies) {
                if (c.getName().equals("username")) {
                    name = c.getValue();
                    break;
                }
            }
            if (!name.equals("")) {
                response.sendRedirect("/Lab01_PhucPH/list.jsp");
            }
        %>
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">     
            <div style="display:<%= errorDisplay %>" id="usernotfound-alert" class="alert alert-danger col-sm-12"><%= errorContent %></div>

            <div class="panel panel-info" >
                <div class="panel-heading">
                    <div class="panel-title">Sign In</div>
                </div>     

                <div style="padding-top:30px" class="panel-body" >


                    <form id="loginform" class="form-horizontal" role="form" action="AccountServlet" method="post">

                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="login-username" type="text" class="form-control" name="username" value="" placeholder="username">   

                        </div>
                        <div style="display:none" id="username-alert" class="alert alert-danger col-sm-12">Username must start with a letter, have more than 1 character and do not contain special characters or spaces.</div>

                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="login-password" type="password" class="form-control" name="password" placeholder="password">
                        </div>
                        <div  style="display:none" id="password-alert" class="alert alert-danger col-sm-12">Password must have more than 5 characters.</div>

                        <div style="margin-top:10px" class="form-group">
                            <!-- Button -->
                            <div class="col-sm-12 controls" >
                                <input id="btn-login"  class="btn btn-success"type="submit" class="fadeIn fourth" value="Log In">

                            </div>

                        </div>
                    </form>     
                </div>                     
            </div>  
        </div>

    </div>

</body>
</html>
