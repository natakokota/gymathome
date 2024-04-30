<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// Check if the referring page attribute is present in the session
String referringPage = (String) session.getAttribute("referringPage");

if (referringPage == null || referringPage.isEmpty()) {
    // Store referring page in session attribute
    session.setAttribute("referringPage", request.getRequestURI());
}
%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gym@Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="./assets/css/homepage.css">
</head>

<body data-bs-spy="scroll" data-bs-target=".navbar">
    <%@ include file="header5.jsp" %>

    <!-- HERO -->
    <section id="hero" class="min-vh-100 d-flex align-items-center text-center">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 data-aos="fade-left" class="text-white fw-bold display-1">Gym@Home</h1>
                    <p class="p" data-aos="fade-right"></lightning-input>Create your own workout programs for free. No equipment needed.</p>
                    <div data-aos="fade-up" data-aos-delay="50">
                        <a href="./musclegroup.jsp" class="btn1 btn1-brand">Get Started</a>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- SERVICES -->
    <section id="services" class="section-padding border-top">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center" data-aos="fade-down" data-aos-delay="150">
                    <div class="section-title">
                        <h1 class="display-4 fw-semibold">Wide variety of exercises</h1>
                        <div class="line"></div>
                        <p>Don't waste your time on preparing your program before your workout session. We do it for you faster, better and for free</p>
                    </div>
                </div>
            </div>
            <div class="row g-4 text-center">
                <div class="col-lg-4 col-sm-6" data-aos="fade-down" data-aos-delay="150">
                    <div class="service theme-shadow p-lg-5 p-4">
                        <div class="circle">
                            <i class="ri-heart-pulse-line"></i>
                        </div>
                        <h5 class="mt-4 mb-3">Personalised program</h5>
                        <p>Set a muscle group and choose your exercises</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6" data-aos="fade-down" data-aos-delay="250">
                    <div class="service theme-shadow p-lg-5 p-4">
                        <div class="circle">
                            <i class="ri-history-line"></i>
                        </div>
                        <h5 class="mt-4 mb-3">Timestopper</h5>
                        <p>Workout with a timestopper for every exercise</p>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6" data-aos="fade-down" data-aos-delay="350">
                    <div class="service theme-shadow p-lg-5 p-4">
                        <div class="circle">
                            <i class="ri-check-double-line"></i>
                        </div>
                        <h5 class="mt-4 mb-3">Program history</h5>
                        <p>Save your program and use it in future workout sessions</p>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- FOOTER -->
    <footer class="bg-dark">
        <div class="footer-bottom">
            <div class="container">
                <div class="row g-4 justify-content-between">
                    <div class="col-auto">
                        <p class="mb-0">© Copyright Gym@Home. All Rights Reserved</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>





    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script src="./assets/js/main.js"></script>
</body>

</html>