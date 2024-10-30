<%@ page import="it.generationitaly.cinema.repository.impl.UtenteRepositoryImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="it.generationitaly.cinema.entity.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Utente</title>
</head>
<body class="custom-bg">
    <%@ include file="nav.jsp" %>
    <% Utente utente = (Utente) request.getAttribute("utente"); %>
    <section class="py-5 text-center container headline-background">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
            </div>
        </div>
        <div class="col-lg-4">
            <img src="user-286.png" class="bd-placeholder-img rounded-circle" width="140" height="140" alt="">
            <h2 class="fw-normal" style="font-size: 20px; color: rgb(238, 226, 58);">
                <%= utente != null ? utente.getUsername() : "Utente non loggato" %>
            </h2>
        </div>
    </section>

    <div class="album py-5">
        <h2 class="text-center mb-4 testo-titoli">Film Preferiti</h2>
        <div class="container" style="padding-top: 20px;">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
                <!-- Mostrare i film preferiti -->
                <% 
                List<Preferiti> preferiti = utente != null ? utente.getPreferiti() : null;
                if (preferiti != null) {
                    for (Preferiti p : preferiti) {
                        Film film = p.getFilm();
                %>
                  <div class="col">
					 <div class="card " 
						 style="border-color:transparent;
							height: 90%; width:200px;
							background-color: transparent;
							margin-left: 15px;
							padding: 20">
					 <a href="dettagliFilm?id=<%= film.getId()%>"><img class="card-img-top" src="<%= film.getLocandina()%>"style="border-radius:15px; height: 100%; width:200px; object-fit: cover"></a>
	 			<h6 class="card-title testo-pargraph"><%= film.getTitolo()%></h6>
			 </div>
	 	 </div>
                <% 
                    }
                }
                %>
            </div>
        </div>
    </div>

    <div class="container" style="padding-top: 40px;">
        <div class="row g-3">
            <div class="col text-start" style="border-bottom: 4px solid rgb(101, 131, 161); color: rgb(101, 131, 161);">
                <h3>Recensioni</h3>
            </div>
            <div class="col"></div>
        </div>
    </div>

    <div class="container mb-5" style="padding-top: 20px;">
        <div class="row row-cols-1 g-3">
            <!-- Mostrare le recensioni -->
            <% 
            List<Recensione> recensioniUtente = utente != null ? utente.getRecensioni() : null;
            if (recensioniUtente != null) {
                for (Recensione r : recensioniUtente) {
            %>
                <div class="col">
                    <div class="card" style="border-color: transparent; background-color: rgba(255, 255, 255, 0.8);">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="dettagliFilm?id=<%= r.getFilm().getId() %>" class="text-decoration-none">
                                    <h5 class="card-title m-0"><%= r.getFilm().getTitolo() %></h5>
                                </a>
                                <%
                                Utente utenteSessione = (Utente) session.getAttribute("utente");
                                if (utenteSessione != null && utenteSessione.getId() == utente.getId()) {
                                %>
                                <form action="rimuoviRecensione" method="post" class="mb-0">
                                    <input type="hidden" name="recensioneId" value="<%= r.getId() %>">
                                    <input type="hidden" name="utenteId" value="<%= utente.getId() %>">
                                    <button type="submit" class="btn btn-danger btn-sm">Elimina</button>
                                </form>
                                <% } %>
                            </div>
                            <p class="card-text mt-3"><%= r.getRecensione() %></p>
                        </div>
                    </div>
                </div>
            <% 
                }
            } else if (utente != null) {
            %>
                <div class="col">
                    <p>Non hai lasciato recensioni.</p>
                </div>
            <% 
            }
            %>
        </div>
    </div>
<%-- 
    <div class="container" style="padding-top: 40px;">
        <div class="row g-3">
            <div class="row g-3">
                <div class="col text-start" style="border-bottom: 4px solid rgb(101, 131, 161); color: rgb(101, 131, 161);">
                    <h3>La nostra community</h3>
                    <p>Film lovers and friends</p>
                </div>
                <div class="row" style="padding-left: 100px;">
                    <%
                    UtenteRepositoryImpl utenteRepository = new UtenteRepositoryImpl();
                    List<Utente> elencoUtenti = utenteRepository.findAll();
                    if (elencoUtenti != null) {
                        int i = 0;
                        for (Utente u : elencoUtenti) {
                            if (i < 5) break;
                    %>
                    <div class="col-lg-2">
                        <img src="user-286.png" class="bd-placeholder-img rounded-circle" width="150" height="150" alt="">
                        <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white;"><%= u.getUsername() %></h2>
                        <p><a class="btn btn-giallo" href="utenteServlet?id=<%= u.getId() %>">Vedi utente</a></p>
                    </div>
                    <%
                        i++;
                        }
                    }
                    %>
                </div>
            </div>
        </div>
    </div> --%>
    <%@ include file="footer.jsp"%>
</body>
</html>
