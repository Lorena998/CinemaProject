package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Film;
import it.generationitaly.cinema.entity.Preferiti;
import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.PreferitiRepository;
import it.generationitaly.cinema.repository.impl.FilmRepositoryImpl;
import it.generationitaly.cinema.repository.impl.PreferitiRepositoryImpl;
import it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/preferiti")
public class PreferitiUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PreferitiRepository preferitiRepository = new PreferitiRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long utenteId = Long.parseLong(request.getParameter("filmId"));

		List<Preferiti> preferiti = preferitiRepository.findPreferitiByUtenteId(utenteId);

		request.setAttribute("preferiti", preferiti);
		// Inoltra la richiesta alla pagina utente.jsp
		request.getRequestDispatcher("utente.jsp").forward(request, response); // Modificata da mostraPreferiti.jsp
	}

	UtenteRepositoryImpl utenteRepository = new UtenteRepositoryImpl();

	FilmRepositoryImpl filmRepository = new FilmRepositoryImpl();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		long utenteId = Long.parseLong(request.getParameter("utenteId"));
		Utente utente = utenteRepository.findById(utenteId);
		long filmId = Long.parseLong(request.getParameter("filmId"));
		Film film = filmRepository.findById(filmId);

		Preferiti preferiti = new Preferiti();
		preferiti.setFilm(film);
		preferiti.setUtente(utente);

		preferitiRepository.save(preferiti);
		// aggiornamento della sessione con i nuovi dati dell'utente
		// cosi da poter mostrare l'ultimo film aggiunto
		
		Utente utenteAggiornato = utenteRepository.findById(utente.getId());
		request.setAttribute("utente", utenteAggiornato);

		doGet(request, response);
	}
}