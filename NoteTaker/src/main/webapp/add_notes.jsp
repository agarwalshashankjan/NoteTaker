<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="bootstrap.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>Fill your Note details</h1>

		<!-- This is Add Note form-->

		<form action="SaveNoteServlet" method="post">
			<div class="mb-3">
				<label for="title" class="form-label">Note title</label> <input required="required"
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter Title of Note">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Content</label>
				<textarea required="required" id="content" placeholder="Enter the content here"
					class="form-control" style="height: 200px"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add Note</button>
			</div>
		</form>
	</div>
</body>
</html>