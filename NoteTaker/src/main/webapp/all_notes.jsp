<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.utility.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>
<%@include file="bootstrap.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1 style='text-align: center' class='text-uppercase'>All Notes</h1>

		<div class="row">
			<div class="col-12">

				<%
					Session s = FactoryProvider.getFactory().openSession();

				Query q = s.createQuery("from Note");
				List<Note> notes = q.list();

				for (Note note : notes) {
				%>

				<div class="card mt-3">
					<img src="img/noteIcon.jpg" style="max-width: 50px"
						class="card-img-top m-2" alt="This is NoteIcon">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<kbd><%=new SimpleDateFormat("E, dd MMM yyyy HH:mm:ss z").format(note.getAddedDate())%></kbd>
						<div class="container text-center">
							<a href="DeleteServlet?note_id=<%=note.getId()%>"
								class="btn btn-danger">Delete Note</a> <a
								href="edit.jsp?note_id=<%=note.getId()%>"
								class="btn btn-primary">Edit Note</a>
						</div>
					</div>
				</div>

				<%
					}
				%>
			</div>
		</div>
		<%
			s.close();
		%>

	</div>
</body>
</html>