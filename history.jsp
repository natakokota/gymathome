<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javapackage.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="errorPage.jsp"%>

<%
// Retrieve the username from the session
User authenticateduser = (User) session.getAttribute("authenticated_user");

if (authenticateduser == null || authenticateduser.getUsername() == null || authenticateduser.getUsername().isEmpty()) {

    // If not logged in, store referring page in session and forward to login
    session.setAttribute("referringPage", request.getRequestURI());

    session.setAttribute("error_message", "Please log in to view archive.");
    response.sendRedirect(request.getContextPath() + "/gymathome/login.jsp?error=loginRequired");

} else {
    
    String username = authenticateduser.getUsername();

	ProgramService programservice = new ProgramService();
	List <Program> programs = programservice.getSavedPrograms(username);
%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Archive</title>
		<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="./assets/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="./assets/css/history.css">
		<!-- Bootstrap CSS -->

		<!-- jQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

		<!-- Bootstrap JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	</head>

    <body>
		<!-- NAVBAR missing -->
        
        <main class="table">
	   
			<section class="table__header">
				<h1><p style="color: rgb(255, 255, 255);">Archive</p></h1>
			</section>
   
			<section class="table__body">
				<table>
					<thead>
						<tr>
							<th><centered>Muscle Group</centered></th>
							<th><centered>Difficulty Level</centered></th>
							<th><centered>Exercises</centered></th>
							<th><centered>Choose</centered></th>
						</tr>
					</thead>
					<section class="scroll-container">
						<tbody>
						<%
						if (programs.isEmpty()) {
						%>
						<tr>
							<td colspan="4" style="text-align: center;">No programs saved</td>
						</tr>
						<%
						} else {
							for (Program program : programs) {
								if (program.getSaved()) {
						%>
									<tr>
										<td><%= program.getMusclegroup() %></td>
										<td><%= program.getDifficultylevel() %></td>
										<td>
											<div class="dropdown">
												<button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color: blueviolet; color:white;">
													Exercises
													<span class="caret"></span>
												</button>
												<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
													<%
													List<Exercises> programExercises = program.getExercises();
													for (Exercises exercise : programExercises) {
													%>
														<li><span><%= exercise.getExercisename() %></span></li>
													<%
													}
													%>
												</ul>
											</div>
										</td>
										<td>
											<form action="./historycontroller.jsp" method="post">
												<input type="hidden" name="programId" value="<%= program.getProgramID() %>">
												<button type="submit" class="button">GO</button>
											</form>
										</td>
									</tr>
						<%
								}
							}
						}
						%>
						</tbody>
					</section>
				</table>
			</section>
        	<a href="./homepage.jsp">
				<button class="button1">Back</button>
			</a>

		</main>

		<!-- footer -->
		<%@ include file="footer.jsp" %>

		<!-- Bootstrap 3 JavaScript files -->
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<script src="./assets/js/main.js"></script>

    </body>
<%
	}
%>
</html>