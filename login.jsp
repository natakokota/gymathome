<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="errorPage.jsp"%>

<%
    String referringPage = (String) session.getAttribute("referringPage");
    session.removeAttribute("referringPage");

    if (referringPage == null || referringPage.isEmpty()) {
        referringPage = request.getParameter("referringPage");
        session.setAttribute("referringPage", referringPage);
    }

    String errorMessage = (String) session.getAttribute("error_message");
    session.removeAttribute("error_message");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login Page</title>
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/loginstyle.css">
</head>
<body>
    <div class="login-container">
        <div class="image">
            <div class="login-content">
                <div class="login-title">Login</div>
                <div class="login-subtitle">Sign in to your account</div>

                <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= errorMessage %>
                    </div>
                <% } %>

                <form action="logincontroller.jsp" method="post" id="login" class="form-group">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" required class="form-control" id="username" name="username" placeholder="Enter your username">
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" required class="form-control" id="password" name="password" placeholder="Enter your password">
                    </div>

                    <input type="hidden" name="referringPage" value="<%= referringPage %>">
                    <button type="submit" class="btn btn-primary login-button">Login</button>
                </form>

                <div class="forgot-password">
                    <p>Don't have an account? <a href="register.jsp">Register now</a></p>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <%@ include file="footer.jsp" %>

    <!-- Bootstrap 3 JavaScript files -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="./assets/js/main.js"></script>

</body>
</html>
