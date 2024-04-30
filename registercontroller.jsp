<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javapackage.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorPage.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registration Controller</title>
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
</head>
<body>

<div class="container">
<%
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");

    String ageParameter = request.getParameter("age");
    int age = Integer.parseInt(ageParameter);

    String sex = request.getParameter("sex");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    boolean isFirstnameValid = firstname.length() >= 2;
    boolean isLastnameValid = lastname.length() >= 2;
    boolean isAgeValid = age >= 1 && age <= 100; 
    boolean isUsernameValid = username.length() >= 3;
    boolean isPasswordValid = password.length() >= 3;

    boolean hasErrors = !isFirstnameValid || !isLastnameValid || !isAgeValid || !isUsernameValid || !isPasswordValid;

    if (!hasErrors) {
        try {
            UserService userService = new UserService();
            User user = new User(firstname, lastname, age, sex, email, username, password);
            
            userService.registerUser(user);
            user = userService.authenticate(username, password);
            session.setAttribute("authenticated_user", user);

            response.sendRedirect("homepage.jsp");
            return; 
            
        } catch (Exception e) {
            request.setAttribute("error_message", e.getMessage());
        }
    } else {
        // general error message for validation issues
        request.setAttribute("error_message", "Registration failed due to validation issues. Please check your inputs.");
    }

    request.getRequestDispatcher("register.jsp").forward(request, response);
%>

</div>

<!-- Bootstrap 3 JavaScript files -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</body>
</html>
