<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javapackage.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorPage.jsp"%>

<%
    String referer = request.getHeader("referer");
    
    if (referer == null || !referer.contains(request.getContextPath() + "/gymathome/exercises.jsp")) {
        response.sendRedirect(request.getContextPath() + "/gymathome/homepage.jsp");
    }
%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Difficulty Level</title>
    
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
   
    <link rel="stylesheet" href="./assets/css/diifficultylevel.css">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/pricing/">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>

<body data-bs-spy="scroll" data-bs-target=".navbar">
    <%@ include file="header5.jsp" %>
    
    <!-- SERVICES -->
    <section id="services" class="section-padding border-top">
        <div class="container">
            <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                <symbol id="check" viewBox="0 0 16 16">
                  <title>Check</title>
                  <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
                </symbol>
              </svg>
              
              <div class="container py-3">
                <header>
                  
              
                  <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
                    <h1 class="display-4 fw-normal">Choose your Difficulty Level</h1>
                    <p class="fs-5 text-muted">Choose the Level of Difficulty that you want your personalized program to have, the duration makes the difference.</p>
                  </div>
                </header>
              
                <main>
                  <form action="diificultylevelcontroller.jsp" method="post">
                      <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
                          <div class="col">
                              <div class="card mb-4 rounded-3 shadow-sm">
                                  <div class="card-header py-3">
                                      <h4 class="my-0 fw-normal">Beginner</h4>
                                  </div>
                                  <div class="card-body">
                                      <h1 class="card-title pricing-card-title">10 sec/exercise<small class="text-muted fw-light"></small></h1>
                                      <ul class="list-unstyled mt-3 mb-4">
                                          <li></li>
                                      </ul>
                                      <button type="submit" class="w-100 btn btn-lg btn-outline" name="selectedDifficulty" value="Beginner">Select</button>
                                  </div>
                              </div>
                          </div>
              
                          <div class="col">
                              <div class="card mb-4 rounded-3 shadow-sm">
                                  <div class="card-header py-3">
                                      <h4 class="my-0 fw-normal">Intermediate</h4>
                                  </div>
                                  <div class="card-body">
                                      <h1 class="card-title pricing-card-title">20 sec/exercise<small class="text-muted fw-light"></small></h1>
                                      <ul class="list-unstyled mt-3 mb-4">
                                          <li></li>
                                      </ul>
                                      <button type="submit" class="w-100 btn btn-lg btn-outline" name="selectedDifficulty" value="Intermediate">Select</button>
                                  </div>
                              </div>
                          </div>
              
                          <div class="col">
                              <div class="card mb-4 rounded-3 shadow-sm">
                                  <div class="card-header py-3">
                                      <h4 class="my-0 fw-normal">Advanced</h4>
                                  </div>
                                  <div class="card-body">
                                      <h1 class="card-title pricing-card-title">30 sec/exercise<small class="text-muted fw-light"></small></h1>
                                      <ul class="list-unstyled mt-3 mb-4">
                                          <li></li>
                                      </ul>
                                      <button type="submit" class="w-100 btn btn-lg btn-outline" name="selectedDifficulty" value="Advanced">Select</button>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </form>
              </main>            
                
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
