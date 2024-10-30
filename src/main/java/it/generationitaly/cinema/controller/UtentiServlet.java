package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.UtenteRepository;
import it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UtentiServlet
 */
public class UtentiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UtenteRepository utenteRepository = new UtenteRepositoryImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Utente> utenti = utenteRepository.findAll();
		
		request.setAttribute("listaUtenti", utenti);
		
		// inserita pagina jsp corretta 
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("community.jsp");
		requestDispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
