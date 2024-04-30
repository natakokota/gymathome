<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta name="description" content="Error page">
		<title>Error page</title>
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="./assets/css/homepage.css">
    <link rel="canonical" href="https://getbootstrap.com/docs/3.4/examples/carousel/">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../js/ie-emulation-modes-warning.js"></script>
	</head>
	
	<body data-bs-spy="scroll" data-bs-target=".navbar">
		<%@ include file="header5.jsp" %>
	
		<div class="container theme-showcase d-flex align-items-center" style="min-height: 100vh;" role="main">

			<div class="page-header">
				
			</div>
	
			<div class="row">
				<div class="col-xs-12 text-center">
					<div style="margin-top: 20px;">
						<h2>Ooops something went wrong</h2>
						<% if(request.getParameter("error_message") != null) { %>                   
							<p><code><%= (String)request.getParameter("error_message") %></code></p>                        
						<% } %>        
					</div>
				</div>
			</div>	
		</div>
	
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
	
	</body>
	</html>