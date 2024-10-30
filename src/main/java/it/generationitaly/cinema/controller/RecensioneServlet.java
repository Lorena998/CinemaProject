package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Recensione;
import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.impl.FilmRepositoryImpl;
import it.generationitaly.cinema.repository.impl.RecensioneRepositoryImpl;
import it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/recensione")
public class RecensioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	RecensioneRepositoryImpl recensioniRepository = new RecensioneRepositoryImpl();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		Utente utente = (Utente) session.getAttribute("utente");

		if (utente != null) {
			Long utenteId = utente.getId();

			List<Recensione> recensioni= recensioniRepository.findRecensioneByUtenteId(utenteId);

			request.setAttribute("recensioniUtente", recensioni);
			// Inoltra la richiesta alla pagina utente.jsp
			request.getRequestDispatcher("utente.jsp").forward(request, response); // Modificata da mostraPreferiti.jsp
																					// a utente.jsp
		} else {
			// Se l'utente non è autenticato, reindirizz alla pagina di login
			response.sendRedirect("login.jsp");
			return;
		}

	}

	private UtenteRepositoryImpl utenteRepository = new UtenteRepositoryImpl();
	private FilmRepositoryImpl filmRepository = new FilmRepositoryImpl();
	private RecensioneRepositoryImpl recensioneRepository = new RecensioneRepositoryImpl();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Utente utente = (Utente) session.getAttribute("utente");

		if (utente != null) {
			String testoRecensione = request.getParameter("testoRecensione");
			long idFilm = Long.parseLong(request.getParameter("filmId"));

			Recensione recensione = new Recensione();
			recensione.setFilm(filmRepository.findById(idFilm));
			recensione.setUtente(utente);
			recensione.setRecensione(testoRecensione);

			recensioneRepository.save(recensione);
			Utente utenteAggiornato = utenteRepository.findById(utente.getId());
			request.setAttribute("utente", utenteAggiornato);
			
			doGet(request, response);
		} else {
			// inserita pagina jsp corretta
			response.sendRedirect("login.jsp");
			return;
		}
	}

}
