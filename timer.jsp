<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="javapackage.*" %>
<%@ page errorPage="errorPage.jsp"%>

<%

ProgramExerciseSevice programExerciseSevice = new ProgramExerciseSevice();
ProgramService programService = new ProgramService();

Integer programID = (Integer) session.getAttribute("programID");
if (programID == null) {
    response.sendRedirect("./homepage.jsp");
    return;
} else {

    String difflevel = programService.getDifficultyLevelByProgamID(programID);


    int seconds = 0;
    if (difflevel.equals("Beginner")) {
    seconds = 10;
    } else if (difflevel.equals("Intermediate")) {
    seconds = 20;
    } else if (difflevel.equals("Advanced")) {
    seconds = 30;   
    }

    List <ProgramExercise> programExs = programExerciseSevice.getExercisesByProgramID(programID);
    Integer currentExerciseIndex = (Integer) session.getAttribute("currentExerciseIndex");
    Integer lastExerciseIndex = (Integer) session.getAttribute("lastExerciseIndex");

    if (currentExerciseIndex == null) {
        
        lastExerciseIndex = Integer.valueOf(programExs.size() - 1);
        currentExerciseIndex = 0; // Start from the first exercise
        session.setAttribute("currentExerciseIndex", currentExerciseIndex);
        session.setAttribute("lastExerciseIndex", lastExerciseIndex);
        
    } else if (currentExerciseIndex == lastExerciseIndex) {
        request.getSession().removeAttribute("currentExerciseIndex");
        request.getSession().removeAttribute("seconds");


        response.sendRedirect("welldone.jsp");
    } else {
        currentExerciseIndex = currentExerciseIndex + 1;
        session.setAttribute("currentExerciseIndex", currentExerciseIndex);
    }

    ProgramExercise currentExercise = (currentExerciseIndex <= lastExerciseIndex)
            ? programExs.get(currentExerciseIndex)
            : null;

    request.setAttribute("seconds", "<h1>seconds</h1>");
    
%>


<div id="fromJsp"><%=seconds%></div>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Timestop</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="./assets/css/timer.css">
</head>

<body data-bs-spy="scroll" data-bs-target=".navbar">

    <!-- NAVBAR -->
    <%@ include file="header5.jsp" %>
    
    <!-- MAIN BODY -->
    <section id="about" class="section-padding">
        <div class="container">
            <div class="row justify-content-between align-items-center">
                <div class="col-lg-6" data-aos="fade-down" data-aos-delay="50">
                    <%-- Check for null before accessing properties --%>
                    <% if (currentExercise != null) { %>
                        <h1><%= currentExercise.getExercisename() %></h1>
                        <img src="<%= currentExercise.getImagepath() %>" alt="">
                    <% } %>
                </div>
                <div data-aos="fade-down" data-aos-delay="150" class="col-lg-5 align-items-center">
                    <div class="main-container">
                        <!-- Top Container -->
                        <div id="timer-container" class="col-12">
                            <svg id="timer" viewBox="0 0 100 100">
                                <circle cx="50" cy="50" r="45" fill="#FFFF" />
                                <circle id="timer-progress" cx="50" cy="50" r="45" />
                            </svg>
                            <div id="timer-text"><%=seconds%></div>
                        </div>

                        <!-- Bottom Container with Buttons -->
                        <div class="bottom-container">
                            <button id="controlButton" class="btn btn-brand ms-lg-3" onclick="startPauseTimer();">Start</button>
                            <button id="nextButton" class="btn btn-brand ms-lg-3" onclick="window.location='./timer.jsp'">Next</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <%@ include file="footer.jsp" %>

    <script src="./assets/js/timer.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script src="./assets/js/main.js"></script>
</body>
</html>
<%
}
%>