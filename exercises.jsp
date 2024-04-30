<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javapackage.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorPage.jsp"%>

<%
String musclegroup = request.getParameter("musclegroup");

if (musclegroup == null || musclegroup.isEmpty()) {
    response.sendRedirect("./musclegroup.jsp");
} else {
    ExercisesService exercisesservice = new ExercisesService();
    List<Exercises> exercisesofthis = exercisesservice.getExercisesOfMuscle(musclegroup);
    request.setAttribute("exercisesofthis", exercisesofthis);
    session.setAttribute("musclegroup", musclegroup);

%>
    
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Exercises</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
            <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.css">
            <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
            <link rel="stylesheet" href="./assets/css/exercises.css">
        
            <style>
                input.largersize {
                    width: 20px;
                    height: 20px;
                }
            </style>

        </head>    
        <body data-bs-spy="scroll" data-bs-target=".navbar">

            <!-- NAVBAR -->
            <%@ include file="header5.jsp" %>
            <!-- MAIN BODY -->
            <section class="section-padding">
                <form action="exercisesController.jsp" method="post">
                <input type="hidden" name="musclegroup" value="<%= musclegroup %>">
                <main class="table">
            
                    <section class="table__header">
                        <h1><p style="color: rgb(255, 255, 255); font-size: 0.8em;">Choose your desired exercises</p></h1>
                    </section>
        
                    <section class="table__body">
                            <table>
                                <thead>
                                    <tr>
                                        <th><center><p style="color: rgb(255, 255, 255);">Exercises</p></center></th>
                                        <th><center><p style="color: rgb(255, 255, 255);">Checked</p></center></th>
                                        
                                    </tr>
                                </thead>
                                <section class="scroll-container">
                                    <tbody>
                                        
                                            <%
                                                for (Exercises exercise : exercisesofthis) {
                                            %>
                                            <tr>
                                                <td><center><%= exercise.getExercisename() %></center></td>
                                                <td><center><input type="checkbox" class="largersize" name="selectedExercises" value="<%= exercise.getExercisename() %>"</center></td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                            
                                    </tbody>
                                </section>
                            </table>
                        
                    </section>
                </main> 
            </section>
            <div class="button-container">
                    <input type="submit" class="button2" id="nextButton"  value="Next" />
            </div> 
        </form> 
            <script>
                document.getElementById('nextButton').addEventListener('click', function(event) {
                    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
                    var isChecked = false;
        
                    checkboxes.forEach(function(checkbox) {
                        if (checkbox.checked) {
                            isChecked = true;
                        }
                    });
        
                    if (!isChecked) {
                        event.preventDefault();
                        alert('Please select at least one exercise.');
                    }
                });
            </script>

            <%@ include file="footer.jsp" %>
            <script src="./assets/js/timer.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
            <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
            <script src="./assets/js/main.js"></script>
        </body>
<%
    }
%>
</html>
