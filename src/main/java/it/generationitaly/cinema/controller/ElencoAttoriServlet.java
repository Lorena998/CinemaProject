package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Attore;
import it.generationitaly.cinema.repository.impl.AttoreRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/elencoAttori")
public class ElencoAttoriServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AttoreRepositoryImpl attoreRepository = new AttoreRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Attore> elencoAttori = attoreRepository.findAll();

		request.setAttribute("elencoAttori", elencoAttori);
		// 
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("elencoAttori.jsp");
		requestDispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// metodo post
	}

}
