<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="javapackage.*" %>
<%@ page errorPage="errorPage.jsp"%>

<%
        String musclegroup = (String) session.getAttribute("musclegroup");
        List<String> selectedExerciseList = (List<String>) session.getAttribute("selectedExerciseList");
        String difficultyLevel = (String) session.getAttribute("selectedDifficulty");
        
        String username = null;
        User authenticatedUser = (User) session.getAttribute("authenticated_user");

        if (musclegroup == null || selectedExerciseList == null || difficultyLevel == null) {
            response.sendRedirect(request.getContextPath() + "/gymathome/homepage.jsp");
        } else if (authenticatedUser == null || authenticatedUser.getUsername() == null || authenticatedUser.getUsername().isEmpty()) {
            session.setAttribute("referringPage", request.getRequestURI());
            session.setAttribute("error_message", "Please log in to start your program.");
            response.sendRedirect(request.getContextPath() + "/gymathome/login.jsp?error=loginRequired");

        } else {
            username = authenticatedUser.getUsername();

        ProgramService programService = new ProgramService();
        try {
            int programId = programService.createNewProgram(username, musclegroup, difficultyLevel);
            programService.linkExercisesToProgram(programId, selectedExerciseList);
            session.setAttribute("programID", programId);
            
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    

%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Get Started</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0.0/dist/fancybox.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="./assets/css/getstarted.css">
</head>

<body data-bs-spy="scroll" data-bs-target=".navbar">
    <!-- NAVBAR -->
    <%@ include file="header5.jsp" %>

    <!-- MAIN BODY -->
    <section class="container-in">
        <div>
            <h1><p style="font-size: 40px; font-weight: bold; color:rgb(255, 255, 255)"><strong>ARE YOU READY TO BEGIN?</strong></p></h1>
            <a href="./timer.jsp">
                <img src="./assets/images/getstarted.png" alt="Button Image" style="width: 200px; height: 200px; align-items: center;">
            </a>
            <h1><p style="font-size: 20px; font-weight: bold; color:rgb(255, 0, 255); bottom: 0px;">START PROGRAM</p></h1>
        </div>
    </section>

    <%@ include file="footer.jsp" %>

    <script src="./assets/js/timer.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0.0/dist/fancybox.umd.js"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script src="./assets/js/main.js"></script>
</body>

<%
        }
        %>



</html>


