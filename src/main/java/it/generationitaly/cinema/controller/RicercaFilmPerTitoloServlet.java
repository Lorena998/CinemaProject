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

@WebServlet("/ricercaFilm")
public class RicercaFilmPerTitoloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	FilmRepositoryImpl filmRepository = new FilmRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String titolo = request.getParameter("titolo");
		List<Film> filmTitolo = filmRepository.findFilmByTitolo(titolo);
		request.setAttribute("filmTitolo", filmTitolo);
		// inserire la pagina jsp corretta per la visualizzazione dei dettagli di un
		// attore
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("film-cercati.jps");
		requestDispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
