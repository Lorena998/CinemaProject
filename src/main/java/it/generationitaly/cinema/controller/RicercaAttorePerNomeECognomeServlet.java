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

@WebServlet("/ricercaAttore")
public class RicercaAttorePerNomeECognomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AttoreRepositoryImpl attoreRepository = new AttoreRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nomeECognome = request.getParameter("nome");
		// divisione della string per ogni spazio contenuto
		String[] stringaDivisa = nomeECognome.split(" ");
		String nome = null;
		String cognome = null;
		if (!stringaDivisa[0].equals("") && !stringaDivisa[1].equals("")) {
			nome = stringaDivisa[0];
			cognome = stringaDivisa[1];
		}
		List<Attore> attori = attoreRepository.findAttoreByNomeECognome(nome, cognome);
		request.setAttribute("attori", attori);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("film-cercati.jps");
		requestDispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
