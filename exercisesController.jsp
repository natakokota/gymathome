<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="java.io.IOException" %>
<%@ page errorPage="errorPage.jsp"%>

<%
    String[] selectedExercises = request.getParameterValues("selectedExercises");

    List<String> selectedExerciseList = (selectedExercises != null) ? Arrays.asList(selectedExercises) : null;

    session.setAttribute("selectedExerciseList", selectedExerciseList);
    
    // Declare musclegroup as a local variable
    String musclegroup = request.getParameter("musclegroup");
    session.setAttribute("musclegroup", musclegroup);

    response.sendRedirect("difficultylevel.jsp?musclegroup=" + musclegroup);
%>

