<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp"%>

<%
session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">
	<head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.css">
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="stylesheet" href="./assets/css/logout.css">
        <meta http-equiv="refresh" content="2;url=homepage.jsp"/>
        <title>Logout</title>

	</head>
    <body>	
        <section id="about" class="section-padding">
            <div class="container">
                <h1 class="fw-bold display-1">Logout Successful</h1>
                <p>You will be redirected to another page shortly...</p>		

            </div>
        </section>

    </body>
</html>
