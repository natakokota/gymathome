<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="java.io.IOException" %>
<%@ page errorPage="errorPage.jsp"%>


<%
    String selectedDifficulty = request.getParameter("selectedDifficulty");
    session.setAttribute("selectedDifficulty", selectedDifficulty);

    response.sendRedirect("getstarted.jsp");
%>
