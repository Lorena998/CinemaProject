package it.generationitaly.cinema.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import it.generationitaly.cinema.entity.Recensione;
import it.generationitaly.cinema.repository.RecensioneRepository;
import it.generationitaly.cinema.repository.impl.RecensioneRepositoryImpl;
public class RecensioniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private RecensioneRepository recensioneRepository = new RecensioneRepositoryImpl();
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List <Recensione> recensioni = recensioneRepository.findAll();
		
		request.setAttribute("listaRecensioni", recensioni);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("community.jsp");
		requestDispatcher.forward(request, response);
	}

	
	
}
