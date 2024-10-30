package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Film;
import it.generationitaly.cinema.repository.impl.FilmRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ricercaFilmPerAnno")
public class RicercaFilmPerAnnoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private FilmRepositoryImpl filmRepository = new FilmRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String anno = request.getParameter("anno");
		List<Film> filmAnno = filmRepository.findFilmByAnno(anno);
		request.setAttribute("filmAnno", filmAnno);
		// inserire la pagina jsp corretta per la visualizzazione dei dettagli di un
		// attore
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("novita.jsp");
		requestDispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// metodo post
	}

}
