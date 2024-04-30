<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javapackage.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorPage.jsp"%>

<%
    String referer = request.getHeader("referer");
    
    // Check if the page is accessed directly (without proper flow)
    if (referer == null || !referer.contains(request.getContextPath() + "/gymathome/musclegroup.jsp")) {
        response.sendRedirect(request.getContextPath() + "/gymathome/homepage.jsp");
    }
%>