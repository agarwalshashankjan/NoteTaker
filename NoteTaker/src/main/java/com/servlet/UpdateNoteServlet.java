package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.utility.FactoryProvider;

public class UpdateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateNoteServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			// title / content fetch

			String title = request.getParameter("title");
			String content = request.getParameter("content");

			// Hibernate edit
			Session openSession = FactoryProvider.getFactory().openSession();
			Transaction beginTransaction = openSession.beginTransaction();
			
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			
			Note noteToEdit = openSession.get(Note.class, noteId);
			
			noteToEdit.setTitle(title);
			noteToEdit.setContent(content);
			noteToEdit.setAddedDate(new Date());
			
			openSession.save(noteToEdit);
			beginTransaction.commit();
			openSession.close();

			response.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
