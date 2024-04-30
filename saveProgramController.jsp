<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javapackage.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorPage.jsp"%>

<%
    try {
        int programId = Integer.parseInt(request.getParameter("programId"));

        // save program in database
        ProgramService programService = new ProgramService();
        programService.updateProgram(programId);
        request.getSession().removeAttribute("programID");

        response.sendRedirect(request.getContextPath() + "/gymathome/history.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>