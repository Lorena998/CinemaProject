<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.cinema.entity.*"%>
<%@ page import="java.util.List" import="java.util.HashMap"
	import="java.util.ArrayList" import="java.util.Set"
	import="java.util.stream.Collectors"
	import="java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>I risultati della tua ricerca</title>
	<link rel="stylesheet" href="style.css">
</head>
<body class="custom-bg">
	<%@ include file="nav.jsp"%>
	<!-- inizializzazione di un numero random, ricordare le import della classe random-->
	<% Random random = new Random(); 
		int x = random.nextInt(7);%>
	<!-- head chiamare la classe css headline-casuale ed inserire lo style della pagine-->
<section class="py-5 text-center container-fluid headline-casual"
		style="background: linear-gradient(180deg, rgba(101, 131, 161, 0.4094) 0%, rgba(0, 0, 0, 0) 100%), url(./img-ref/<%= x%>.png);"><!-- url con numero random -->
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="testo-titoli">COMMUNITY</h1>
        <p class="testo-pargraph">Resta sempre aggiornato sulle ultime uscite e scopri sempre nuovi titoli grazie alla nostra community</p>
      </div>
    </div>
  </section>
	<div class="container mt-5" style="padding-top: 40px;">
		<div class="row g-3">
			<div class="col text-start" style="border-bottom: 4px solid rgb(101, 131, 161); color: rgb(101, 131, 161);">
				<h3>La nostra community</h3>
				<p>Film lovers and friends</p>
			</div>

			<div class="row" style="padding-left: 100px;">
				<%
				// Controllo se l'attributo recensioni è nullo per evitare un NullPointerException
				List<Recensione> recensioni = (List <Recensione>) request.getAttribute("elencoRecensioni"); 
				List<Utente> elencoUtenti = (List <Utente>) request.getAttribute("elencoUtenti"); 
				if (elencoUtenti != null) {
					for (Utente utente : elencoUtenti) {
				%> 
				<div class="col-lg-2">
					<img src="user-286.png" class="bd-placeholder-img rounded-circle" width="150" height="150" alt="">
					<h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white"><%= utente.getUsername() %></h2>
					<p><a class="btn btn-giallo" href="utenteServlet?id=<%= utente.getId()%>">Vedi utente</a></p>
				</div>
				<%
					} 
				} else { 
				%>
				<div class="col-lg-12">
					<p class="text-white">Nessuna recensione disponibile.</p>
				</div>
				<%
				} 
				%>
			</div>
		</div>
	</div>

	<div class="container text-end" style="padding-top: 40px;">
		<div class="row row-cols-md-2 g-3">
			<div class="col"></div>
			<div class="col" style="border-bottom: 4px solid rgb(101, 131, 161); color: rgb(101, 131, 161);">
				<h3>Scopri i film tramite le recensioni della nostra community</h3>
			</div>
		</div>
	</div>

	<div class="container ml-5 mt-3" style="padding-top: 40px;">
		<div class="row">
			<%
			if (recensioni != null) {
				int i = 0;
				for (Recensione recensione : recensioni) {
					if (i >= 20)
						break;
			%>

			<!-- Colonna recensione -->
			<div class="col-md-8 ml-3 mt-3">
				<h4 style="color:white;font-style: italic"><%= recensione.getUtente().getUsername() %></h4>
				<div style="border-top: 4px solid rgb(101, 131, 161); color: rgb(101, 131, 161);">
					<h5 style="color: white"><%= recensione.getFilm().getTitolo() %></h5>
					<p style="color: rgb(101, 131, 161);">
						<%= recensione.getRecensione() %>
					</p>
				</div>
			</div>

			<!-- Colonna locandina del film -->
			<div class="col-md-4 text-center mt-3">
				<a href="dettagliFilm?id=<%= recensione.getFilm().getId() %>">
					<div class="card"
						style="border-color: transparent; 
						height: 310px; 
						width: 210px; 
						margin-left: 15px;
						margin-top: 70px; 
						border-bottom:#1A2D3F;
						background: linear-gradient(180deg, rgba(68, 119, 165, 0) 10%, #1A2D3F 100%), url(<%= recensione.getFilm().getLocandina() %>); 
						background-size: cover; 
						background-position: center; 
						border-radius: 15px;
						position: relative;
						box-shadow: 0 2px 4px rgba(0, 0, 0, 1);">
						
						<h6 class="card-title testo-paragraph text-bottom"
							style="position: absolute; bottom: 0; width: 100%; text-align: center; text-transform: uppercase; font-weight: bold; padding-bottom: 8px; color: white;">
							<%= recensione.getFilm().getTitolo() %>
						</h6>
					</div>
				</a>
			</div>

			<%
				i++;
				}
			} 
			%>
		</div>
	</div>

	<!-- parte dei preferiti utenti -->
	<div class="container ml-5">
		<% 
		Set <Film> filmPreferiti = null;
		int i = 0 ;
		for(Utente utente: elencoUtenti){
			if(i > 5) break;
		%>
		<div class="row" style="border-top: 4px solid rgb(101, 131, 161); ">
			<div class="col" style="color: rgb(101, 131, 161);">
				<h3>I preferiti di</h3>
				<h4 style="color:white;font-style: italic"><%= utente.getUsername()%></h4>
			</div>
			<div class="container">
				<div class="row">

			<% 
			List<Preferiti> utentiFilm = utente.getPreferiti();
			filmPreferiti = utentiFilm.stream()
									.map(Preferiti::getFilm)
									.collect(Collectors.toSet());
			
			for(Film preferiti : filmPreferiti){
			%>
				<div class="col-lg-3 col-md-4 col-sm-6 mb-3" 
				
					style="border-color:transparent;
					height: 90%; width:100px;
					background-color: transparent;
					margin-left: 15px;">
					<a href="dettagliFilm?id=<%= preferiti.getId()%>">
						<img class="rounded-circle" 
     src="<%=preferiti.getLocandina()%>" 
     style="width: 150px; height: 150px; object-fit: cover; border-radius: 50%; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.5);">
					</a> 
				</div>
			<%}
			i++;}%>
		</div>	
	</div>	
</div>	
	</div>
	
</body>
</html>
