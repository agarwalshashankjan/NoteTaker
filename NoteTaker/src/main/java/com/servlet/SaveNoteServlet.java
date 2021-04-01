package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.utility.FactoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			// title / content fetch

			String title = request.getParameter("title");
			String content = request.getParameter("content");

			Note note = new Note(title, content, new Date());

			// Hibernate Save
			Session openSession = FactoryProvider.getFactory().openSession();
			Transaction beginTransaction = openSession.beginTransaction();
			openSession.save(note);

			beginTransaction.commit();
			openSession.close();

			response.setContentType("text/html");
			PrintWriter writer = response.getWriter();
			writer.println(
					"<h1 style = 'text-align: center'>"
						+ "Note Added successfully"
						+ "<br>"
						+ "<a href = 'all_notes.jsp'>"
							+ "View All Notes"
						+ "</a>"
					+ "</h1>");
		} catch (Exception e) {

		}
	}

}
