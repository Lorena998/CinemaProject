package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Categoria;
import it.generationitaly.cinema.entity.Film;
import it.generationitaly.cinema.entity.Recensione;
import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.impl.CategoriaRepositoryImpl;
import it.generationitaly.cinema.repository.impl.FilmRepositoryImpl;
import it.generationitaly.cinema.repository.impl.RecensioneRepositoryImpl;
import it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/homeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private FilmRepositoryImpl filmrepository = new FilmRepositoryImpl();
	private CategoriaRepositoryImpl categoriaRepository = new CategoriaRepositoryImpl();
	private RecensioneRepositoryImpl recensioneRepository = new RecensioneRepositoryImpl();
	private UtenteRepositoryImpl utenteRepository = new UtenteRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Film> elencoFilm = filmrepository.findAll();
		request.setAttribute("elencoFilm", elencoFilm);
		System.err.println(elencoFilm.size());

		List<Categoria> elencoCategorie = categoriaRepository.findAll();
		request.setAttribute("elencoCategorie", elencoCategorie);

		List<Recensione> elencoRecensioni = recensioneRepository.findAll();
		request.setAttribute("elencoRecensioni", elencoRecensioni);

		List<Utente> utenti = utenteRepository.findAll();
		request.setAttribute("elencoUtenti", utenti);

		RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
