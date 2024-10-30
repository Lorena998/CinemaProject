package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Recensione;
import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.impl.RecensioneRepositoryImpl;
import it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/elencoRecensioni")
public class ElencoRecensioniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private RecensioneRepositoryImpl recensioneRepository = new RecensioneRepositoryImpl();
	private UtenteRepositoryImpl utenteRepository = new UtenteRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Start ELENCO RECENSIONI");
		List<Recensione> elencoRecensioni = recensioneRepository.findAll();
		List<Utente> utenti = utenteRepository.findAll();

		request.setAttribute("elencoRecensioni", elencoRecensioni);

		request.setAttribute("elencoUtenti", utenti);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("community.jsp");
		requestDispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}
