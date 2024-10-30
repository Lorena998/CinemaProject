package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Preferiti;
import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.impl.PreferitiRepositoryImpl;
import it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/rimuoviPreferito")
public class RimuoviPreferitoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long utenteId = Long.parseLong(request.getParameter("utenteId"));

		List<Preferiti> preferiti = preferitiRepository.findPreferitiByUtenteId(utenteId);

		request.setAttribute("preferiti", preferiti);
		// Inoltra la richiesta alla pagina utente.jsp
		request.getRequestDispatcher("utente.jsp").forward(request, response); // Modificata da mostraPreferiti.jsp
	}

	PreferitiRepositoryImpl preferitiRepository = new PreferitiRepositoryImpl();
	UtenteRepositoryImpl utenteRepository = new UtenteRepositoryImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long utenteId = Long.parseLong(request.getParameter("utenteId"));
		long filmId = Long.parseLong(request.getParameter("filmId"));

		Preferiti preferitoDaEliminare = preferitiRepository.findPreferitoByUtendeIdAndFilmId(utenteId, filmId);
		preferitiRepository.delete(preferitoDaEliminare);

		Utente utenteAggiornato = utenteRepository.findById(utenteId);
		request.setAttribute("utente", utenteAggiornato);

		doGet(request, response);
	}
}
