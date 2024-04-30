<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javapackage.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorPage.jsp"%>

<%
    String referer = request.getHeader("referer");
    
    // Check if the page is accessed directly (without proper flow)
    if (referer == null || !referer.contains(request.getContextPath() + "/gymathome/homepage.jsp")) {
        response.sendRedirect(request.getContextPath() + "/gymathome/homepage.jsp");
    }
%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Muscle Group</title>
    <link rel="stylesheet" href="./assets/css/musclegroup.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
    
</head>

<body data-bs-spy="scroll" data-bs-target=".navbar">
    

    <!-- NAVBAR -->
    <%@ include file="header5.jsp" %>
        <!-- MAIN BODY -->

        <section class="container-in">
                <div class="row justify-content-between align-items-center">
                    
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="text-white mb-4 text-center">Choose your muscle group</h2>
                            </div>
                        </div>

                        <div class="row">
                            <!-- First Row -->
                            <div class="col-md-6">
                                <div class="card exercise-card">
                                    <img src="./assets/images/abs.png"class= "card-img-top">
                                    <div class="card-body">
                                            <form action="exercises.jsp" method="post">
                                            <button type="submit" class="button" name="musclegroup" value="ABS">Abs</button>
                                            </form>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card exercise-card">
                                    <img src="./assets/images/back.png" class="card-img-top">
                                    <div class="card-body">
                                            <form action="exercises.jsp" method="POST">
                                            <button type="submit" class="button" name="musclegroup" value="BACK">Back</button>
                                            </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                
                        <div class="row mt-4">
                            <!-- Second Row -->
                            
                            <div class="col-md-6">
                                <div class="card exercise-card">
                                    <img src="./assets/images/legs.png"class="card-img-top">
                                    <div class="card-body">
                                            <form action="exercises.jsp" method="POST">
                                            <button type="submit" class="button" name="musclegroup" value="LEGS-GLUTES">Legs</button>
                                            </form>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="card exercise-card">
                                    <img src="./assets/images/arms.png" class="card-img-top">
                                    <div class="card-body">
                                            <form action="exercises.jsp" method="post">
                                            <button type="submit" class="button" name="musclegroup" value="ARMS">Arms</button>
                                            </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <h1 style="color: rgba(0, 0, 0, 0)">...</h1>
                          
                </div>

        </section>
    
    <%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
 
</body>

</html>