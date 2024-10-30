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

@WebServlet("/ricercaPerCategoria")
public class RicercaFilmPerCategoriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private FilmRepositoryImpl filmRepository = new FilmRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		long idCategoria = Long.parseLong(request.getParameter("idCategoria"));
		List<Film> filmCategoria = filmRepository.findFilmByCategoriaId(idCategoria);
		request.setAttribute("filmCategoria", filmCategoria);
		
		// inserita pagina jsp corretta 
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("film-cercati.jsp");
		requestDispatcher.forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// metodo post
	}

}
