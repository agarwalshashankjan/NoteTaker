<%@page import="com.entity.Note"%>
<%@page import="com.utility.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Note</title>
<%@include file="bootstrap.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>Edit your Note here</h1>
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id"));
		Session s = FactoryProvider.getFactory().openSession();

		Note noteToEdit = (Note) s.get(Note.class, noteId);
		%>

		<!-- This is Edit Note form-->

		<form action="UpdateNoteServlet" method="post">
			<div class="mb-3">
			<input name="note_id" value="<%=noteId %>" type="hidden" />
				<label for="title" class="form-label">Note title</label> <input
					name="title" required="required" type="text" class="form-control"
					id="title" aria-describedby="emailHelp"
					value="<%=noteToEdit.getTitle() %>"
					placeholder="Enter Title of Note">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Content</label>
				<textarea name="content" required="required" id="content"
					placeholder="Enter the content here" class="form-control"
					style="height: 200px"><%=noteToEdit.getContent() %></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Note</button>
			</div>
		</form>
	</div>
</body>
</html>