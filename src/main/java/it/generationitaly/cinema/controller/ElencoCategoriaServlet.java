package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Categoria;
import it.generationitaly.cinema.repository.CategoriaRepository;
import it.generationitaly.cinema.repository.impl.CategoriaRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/elencoCategoria")
public class ElencoCategoriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CategoriaRepository categoriaRepository = new CategoriaRepositoryImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Categoria> elencoCategorie = categoriaRepository.findAll();
		request.setAttribute("elencoCategorie", elencoCategorie);

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("./categorie.jsp");
			requestDispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}
