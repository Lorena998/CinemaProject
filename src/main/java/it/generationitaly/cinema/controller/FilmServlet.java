package it.generationitaly.cinema.controller;

import java.io.IOException;

import it.generationitaly.cinema.entity.Film;
import it.generationitaly.cinema.repository.impl.FilmRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dettagliFilm")
public class FilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private FilmRepositoryImpl filmRepository = new FilmRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long id = Long.parseLong(request.getParameter("id"));
		Film film = filmRepository.findById(id);
		request.setAttribute("film", film);

		// inserita pagina jsp corretta
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("film.jsp");
		requestDispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// metodo post
	}

}
