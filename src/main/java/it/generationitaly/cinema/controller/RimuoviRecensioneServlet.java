package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Recensione;
import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.impl.RecensioneRepositoryImpl;
import it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/rimuoviRecensione")
public class RimuoviRecensioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long utenteId = Long.parseLong(request.getParameter("utenteId"));

		List<Recensione> recensioni = recensioneRepository.findRecensioneByUtenteId(utenteId);

		request.setAttribute("recensioni", recensioni);
		// Inoltra la richiesta alla pagina utente.jsp
		request.getRequestDispatcher("utente.jsp").forward(request, response); // Modificata da mostraPreferiti.jsp
	}

	RecensioneRepositoryImpl recensioneRepository = new RecensioneRepositoryImpl();
	UtenteRepositoryImpl utenteRepository = new UtenteRepositoryImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long utenteId = Long.parseLong(request.getParameter("utenteId"));

		long recensioneId = Long.parseLong(request.getParameter("recensioneId"));
		Recensione recensioneDaEliminare = recensioneRepository.findById(recensioneId);
		recensioneRepository.delete(recensioneDaEliminare);

		Utente utenteAggiornato = utenteRepository.findById(utenteId);
		request.setAttribute("utente", utenteAggiornato);

		doGet(request, response);
	}
}
