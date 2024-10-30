package it.generationitaly.cinema.controller;

import java.io.IOException;

import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.UtenteRepository;
import it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/utenteServlet")
public class UtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UtenteRepository utenteRepository = new UtenteRepositoryImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		long id = Long.parseLong(request.getParameter("id"));
		
		Utente utente = utenteRepository.findById(id);
		
		request.setAttribute("utente", utente);
		
		// inserita pagina jsp corretta 
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("utente.jsp");
		requestDispatcher.forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
