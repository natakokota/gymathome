<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javapackage.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorPage.jsp"%>

<%
    String referer = request.getHeader("referer");
    
    // Check if the page is accessed directly (without proper flow)
    if (referer == null || !referer.contains(request.getContextPath() + "/gymathome/timer.jsp")) {
        response.sendRedirect(request.getContextPath() + "/gymathome/homepage.jsp");
    }
%>

<%
    // Retrieve program ID from session
    Integer programId = (Integer) session.getAttribute("programID");
%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Well Done</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
    
    
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="./assets/css/welldone3.css">
</head>


<body data-bs-spy="scroll" data-bs-target=".navbar">
    

    <!-- NAVBAR -->
    <%@ include file="header5.jsp" %>
        <!-- MAIN BODY -->
        <section id="about" class="section-padding">
            <section class="container-in">
                <div>
                    <h1><p style="font-size: 100px; color:rgb(255, 255, 255)"><strong>WELL DONE!</strong></p></h1>
                    <h1><p style="font-size: 30px; color:rgb(255, 255, 255)"><strong>YOU FINISHED YOUR PROGRAM!</strong></p></h1>
                    <div class="col-12 text-center">
                        <p class="text-white"style="font-size: 18px; " >Click here to save:</p>
                        <form action ="./saveProgramController.jsp" method="post">
                            <input type="hidden" name="programId" value="<%= programId %>">
                            <button type="submit" class="w-20 btn btn-lg btn-outline" style="font-size: 18px; ">Save</button>
                        </form>
                        <br></br>
                        <p class="text-white" style="font-size: 18px; ">Or go to <a href="./homepage.jsp" style="font-size: 18px; ">Homepage</a></p>

                    </div>
                  
                </div>  
            </section>
        </section>


    <!-- FOOTER -->
   
    <%@ include file="footer.jsp" %>
    <br></br>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script src="./assets/js/main.js"></script>
</body>

</html>