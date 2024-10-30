<%@page import="it.generationitaly.cinema.repository.impl.PreferitiRepositoryImpl"%>
<%@page import="it.generationitaly.cinema.repository.impl.RecensioneRepositoryImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.cinema.entity.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film</title>
<link rel="stylesheet" href="style.css">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="custom-bg">
<%@ include file="nav.jsp"%>

<div class="container text-center">
<div class="row">

  <!-- Dettagli del film -->
  <div class="col-md-4">
    <div class="card card-attore" style="border-color:transparent; background-color: transparent; padding-top: 100px;">
      <% 
        Film film = (Film) request.getAttribute("film"); 
        // Aggiunto controllo nullità per evitare errori
        if (film != null) { 
      %>
         <img src="<%= film.getLocandina() %>" height="100%" width="358" style="border-radius:15px" class="card-img-top" alt="locandina del film">
         <div class="card-body"></div>
      <% 
        } else { 
      %>
         <p style="color: white;">Film non trovato.</p>
      <% } %>
    </div>
  </div>

  <!-- Dettagli del film -->
  <% if (film != null) { %> <!-- Aggiunto controllo nullità qui -->
  <div style="margin-left: 20px; max-width: 500px; padding-top: 100px;">
      
      <h1 style="color: white;">"<%= film.getTitolo() %>"</h1>
      <div>
        <p style="color: white;"><%= film.getTrama() %></p>
      </div>
      <br>
      <div>
      	<span style="font-size: 25px; opacity: 0.5; color: white;">DETTAGLI</span>
      	<br>
        <span style="font-size: 20px; opacity: 0.5; color: white;">Durata:</span>
        <p style="font-size: 15px; opacity: 0.5; color: white;"><%= film.getDurata() %> minuti</p>
        <span style="font-size: 20px; opacity: 0.5; color: white;">Data di uscita:</span>
        <p style="font-size: 15px; opacity: 0.5; color: white;"><%= film.getDataUscita() %></p>
        <span style="font-size: 20px; opacity: 0.5; color: white;">Genere:</span>
        <p style="font-size: 15px; opacity: 0.5; color: white;"><%= film.getCategoria().getGenere() %></p>
      </div>
    </div>
  <% } %> <!-- Fine controllo nullità -->

</div>

<!-- Sezione CAST -->
<br>
<span style="font-size: 40px; opacity: 0.5; color: white;">CAST</span>
<br><br><br>
<div class="row">
  <% 
    if (film != null) { // Aggiunto controllo nullità anche per il cast
      List<Attore> elencoAttori = film.getAttori();
      for (Attore attore : elencoAttori) { 
  %>
      <div class="col-lg-4">
        <a href="dettagliAttore?id=<%= attore.getId()%>" ><img class="rounded-circle" 
     src="<%=attore.getFoto()%>" 
     style="width: 150px; height: 150px; object-fit: cover; border-radius: 50%; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.5);"></a>
        <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white"><%= attore.getNome() %> <%= attore.getCognome() %></h2>
      </div>
  <% 
      } 
    } 
  %>
</div>
</div>
<!-- Sezione recensioni -->
<br><br>
<div class="row" style="padding-left: 60px;">
  <div class="col col-md-8 mb-5">
    <% if (session.getAttribute("username") == null) { %>
      <p style="font-size: 15px; color: white">
            <a href="./login.jsp" class="btn btn-giallo">
                <i class="bi bi-box-arrow-in-right"></i> Accedi per aggiungere una recensione
            </a>
        </p>
        <% } else {
    	Utente utente = (Utente) session.getAttribute("utente");
    	Long utenteId = utente.getId(); // Recuperiamo l'utente
    	RecensioneRepositoryImpl recensioniRepository = new RecensioneRepositoryImpl();
    	List<Recensione> recensioni = recensioniRepository .findRecensioneByUtenteId(utenteId);
    	boolean recensito = false;
    	for(Recensione r : recensioni) {
    	    if(r.getFilm().getId().equals(film.getId())) {
    	        recensito = true;
    	        break;
    	    }
    	}
    	%>
    	<% if(recensito == false) { %>
      <div class="border rounded" style="background-color: rgb(101, 131, 161); border: none;">
        <div class="p-4" style="background-color: transparent;">
          <h5 class="mb-3" style="color: white;">Lascia una recensione</h5>          
          <form action="recensione" method="post">
            <input type="hidden" name="filmId" value="<%= film.getId() %>">
            <textarea class="form-control mb-3" name="testoRecensione" rows="3" placeholder="La tua recensione" required style="background-color: transparent; color: white; border: 1px solid yellow;"></textarea>
            <div class="form-floating mb-3">
              <button type="submit" class="btn btn-giallo" style="color: black;">INVIA RECENSIONE</button>
            </div>
          </form>
          <% }else{%>
          	<h4 style="color:white">Hai già recensito questo film</h4>
          <%}%>
        </div>
      </div>
    <% } %>
  </div>

<!-- Sezione Preferiti -->
  <div class="col col-md-4 mb-5 ml-5">
    <% if (session.getAttribute("username") == null) { %>
        <p style="font-size: 15px; color: white">
            <a href="./login.jsp" class="btn btn-giallo">
                <i class="bi bi-box-arrow-in-right"></i> Accedi per aggiungere il film ai preferiti
            </a>
        </p>
    <% } else { 
        // Verifica se il film è già nei preferiti dell'utente
        Utente utente = (Utente) session.getAttribute("utente");
        Long utenteId = utente.getId(); // Recuperiamo l'utente
        PreferitiRepositoryImpl preferitiRepository = new PreferitiRepositoryImpl();
        List<Preferiti> preferiti = preferitiRepository.findPreferitiByUtenteId(utenteId);
        boolean preferito = false;
        
        for (Preferiti p : preferiti) {
            if (p.getFilm().getId().equals(film.getId())) {
                preferito = true;
                break;
            }
        }
    %>
        <div class="container text-centered">
                <% if (preferito == false) { %>
            		<form action="preferiti" method="post">
                	<input type="hidden" name="utenteId" value="<%= utente.getId() %>">
                	<input type="hidden" name="filmId" value="<%= film.getId() %>">
                    <h5 style="color:white">Aggiungi ai preferiti</h5>
                    <br>
                    <button type="submit" style="box-shadow:rgb(101, 131, 161)" class="btn btn-giallo mt-2">
                        <img alt="film da aggiungere ai preferiti" src="aggiungi preferiti.png" style="width:100px">
                    </button>
                    </form>
                <% } else { %>
                    <h5 style="color:white">Rimuovi film dai preferiti</h5>
                    <form action="rimuoviPreferito" method="post">
                        <input type="hidden" name="utenteId" value="<%= utente.getId() %>">
                        <input type="hidden" name="filmId" value="<%= film.getId() %>">
                        <button type="submit" style="box-shadow:rgb(101, 131, 161)" class="btn btn-giallo mt-2">
                            <img alt="film già nei preferiti" src="rimuovipreferiti.png" style="width:100px">
                        </button>
                    </form>
                <% } %>
        </div>
    <% } %>
</div>

  <%  
  		if(film.getRecensioni()!= null && !film.getRecensioni().isEmpty()){
  			%>
		  <div class= "container mb-5">
		  	<div class = "row">
		  	
		  		<div class="container text-centered" style="border-Top: 4px solid rgb(101, 131, 161); color: rgb(101, 131, 161);">
		  		<h3 style="color: rgb(101, 131, 161);">Recensioni della nostra Community</h3>
		  		</div>
		  		
		  		<% List <Recensione> recensioni = film.getRecensioni();
		  			int i=0;
		  				for(Recensione recensione:recensioni){
		  					if(i<6){ %>
		  		<div class="col col-md-6" style="border-Top: 3px solid rgb(101, 131, 161); color: rgb(101, 131, 161);">
		  		<h6><%= recensione.getUtente().getUsername()%></h6>
		  		<p><%= recensione.getRecensione()%></p>
		  		</div>
  		<%}
  		i++;} %>
  			</div>
  			<div class="container text-centered">
  			<a href="elencoRecensioni"><button class="btn-chiaro">Scopri la nostra community</button></a>
  			</div>
  			</div>
  		<% }%>
  
  
  
</div>  


  <%@ include file="footer.jsp"%>
  

</body>
</html>