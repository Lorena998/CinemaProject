package it.generationitaly.cinema.controller;

import java.io.IOException;
import java.sql.Date; // Usa java.sql.Date

import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.UtenteRepository;
import it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registrazione")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; // Questa riga è corretta

	private UtenteRepository utenteRepository = new UtenteRepositoryImpl();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String dataNascitaStr = request.getParameter("dataNascita");

		// Converto la stringa in java.sql.Date
		Date dataNascita = Date.valueOf(dataNascitaStr);

		Utente utente = new Utente();
		utente.setEmail(email);
		utente.setUsername(username);
		utente.setPassword(password);
		utente.setNome(nome);
		utente.setCognome(cognome);
		utente.setDataNascita(dataNascita);

		if (utenteRepository.existsByUsername(username)) {
			request.setAttribute("errorMessage", "Username già in uso. Scegli un altro username.");
			// inserita pagina jsp corretta 
			request.getRequestDispatcher("registrazione.jsp").forward(request, response);
			return;
		}

		// Salva l'utente nel repository
		utenteRepository.save(utente);
		
		// Reindirizza alla pagina di login dopo la registrazione
		// inserita pagina jsp corretta 
		response.sendRedirect("login.jsp");
	}
}