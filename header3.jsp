<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javapackage.*" %>
<%@ page import="java.util.*" %>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<link href="./assets/css/navbar3.css" rel="stylesheet">

<%
    User user = (User) session.getAttribute("authenticated_user");
%>

<nav class="navbar navbar-expand-lg bg-white sticky-top">
    <div class="container">
        <a class="navbar-brand" href="./homepage.jsp">
            <img src="./assets/images/logog.jpg" alt="Logog" width="40" height="40">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <% if (user == null || user.getUsername() == null || user.getUsername().isEmpty()) { %>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp?referringPage=<%= request.getRequestURI() %>"><p style="font-size: 1.5em;"><b>Log in</p></a>
                    </li>
                    <li class="nav-item">
                        <a href="./register.jsp" class="btn btn-brand ms-lg-3">Sign up</a>
                    </li>
                </ul>
            </div>
        <% } else { %>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a href="./history.jsp" type="button" class="btn btn-outline">History</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./logout.jsp">Log out</a>
                    </li>
                </ul>
            </div>
        <% } %>
        
    </div>
</nav>