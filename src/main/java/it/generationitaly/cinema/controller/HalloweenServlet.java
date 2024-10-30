package it.generationitaly.cinema.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Film;
import it.generationitaly.cinema.repository.impl.FilmRepositoryImpl;

/**
 * Servlet implementation class HalloweenServlet
 */
@WebServlet("/HalloweenServlet")
public class HalloweenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private FilmRepositoryImpl filmRepository = new FilmRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long idCategoria = Long.parseLong(request.getParameter("idCategoria"));
		List<Film> filmCategoria = filmRepository.findFilmByCategoriaId(idCategoria);
		request.setAttribute("filmCategoria", filmCategoria);
		
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("halloween.jsp");
		requestDispatcher.forward(request, response);
		
	}

   
}
