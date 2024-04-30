<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="java.io.IOException" %>
<%@ page errorPage="errorPage.jsp"%>

<%
    String programID = request.getParameter("programId");
    session.setAttribute("programID", Integer.valueOf(programID));

    response.sendRedirect("timer.jsp");
%>