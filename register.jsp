<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="errorPage.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register Page</title>
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/registerstyle.css">
</head>
<body>
    <div class="register-container">
        <div class="funky-background">
            <h2 id="joinTheFun">Join the<br><span class="fun-text">fun</span></h2>
        </div>

        <div class="register-form">
            <div class="register-box">
                <h2>Create an account</h2>

                <!-- Display error message if registration failed -->
                <% String errorMessage = (String)request.getAttribute("error_message"); %>
                <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= errorMessage %>
                    </div>
                <% } %>

                <form action="registercontroller.jsp" method="post" id="register" class="form-group"> 

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="firstName">First Name</label>
                            <input type="text" class="form-control" name="firstname" id="firstname" placeholder="Enter your first name">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="lastName">Last Name</label>
                            <input type="text" class="form-control" name= "lastname" id="lastname" placeholder="Enter your last name">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="age">Age</label>
                            <input type="text" class="form-control" name="age" id="age" placeholder="Enter your age">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="sex">Sex</label>
                            <select class="form-control" name="sex" id="sex">
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group indent">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email">
                    </div>

                    <div class="form-group indent">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" name="username" id="username" placeholder="Choose a username">
                    </div>

                    <div class="form-group indent">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Choose a password">
                    </div>

                    <button type="submit" class="btn btn-success create-account-button">Create Account</button>
                </form>

                <p class="login-link">Already have an account? Click <a href="login.jsp">here</a> to login.</p>
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
