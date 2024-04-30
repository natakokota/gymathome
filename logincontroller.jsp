<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javapackage.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorPage.jsp"%>

<%
    String referringPage = request.getParameter("referringPage");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    UserService userService = new UserService();

    try {
        User user = userService.authenticate(username, password);
        session.setAttribute("authenticated_user", user);

        if (referringPage != null && !referringPage.isEmpty()) {
            response.sendRedirect(referringPage);
        } else {
            response.sendRedirect(request.getContextPath() + "/gymathome/homepage.jsp");
        }
    } catch (Exception e) {
        String errorMessage = "Invalid username or password. Please try again.";
        session.setAttribute("error_message", errorMessage);
        session.setAttribute("redirect_reason", "loginRequired");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/gymathome/login.jsp");
        dispatcher.forward(request, response);
    }
%>
