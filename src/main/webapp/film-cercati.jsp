<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List"
		import="java.util.HashMap"
		import="java.util.ArrayList"
		import="it.generationitaly.cinema.entity.*"
		import="java.util.Random"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>


<body class="custom-bg">
<%@ include file="nav.jsp"%>
<section class="py-5 text-center container-fluid headline-casual" 
  style="background: linear-gradient(180deg, rgba(101, 131, 161, 0.4094) 0%, rgba(0, 0, 0, 0) 100%), 
  url(<% 
    List<Film> filmCategoria = (List<Film>) request.getAttribute("filmCategoria");
    String imagePath = "./img-ref/5.png"; // Base
    if (filmCategoria != null && !filmCategoria.isEmpty()) {
        Film film = filmCategoria.get(0);
        Categoria categoria = film.getCategoria();

        if (categoria.getId() == 1L) {
            imagePath = "./img-ref/6.png"; // Azione
        } else if (categoria.getId() == 2L) {
            imagePath = "./img-ref/7.png"; // Avventura
        } else if (categoria.getId() == 3L) {
            imagePath = "./img-ref/0.png"; // Drammatico
        } else if (categoria.getId() == 4L) {
            imagePath = "./img-ref/8.png"; // Commedia
        } else if (categoria.getId() == 5L) {
            imagePath = "./img-ref/9.png"; // Horror
        } else if (categoria.getId() == 6L) {
            imagePath = "./img-ref/4.png"; // Fantascienza
        } else if (categoria.getId() == 7L) {
            imagePath = "./img-ref/1.png"; // Fantasy
        } else if (categoria.getId() == 8L) {
            imagePath = "./img-ref/10.png"; // Thriller
        } else if (categoria.getId() == 9L) {
            imagePath = "./img-ref/3.png"; // Romantico
        } else if (categoria.getId() == 10L) {
            imagePath = "./img-ref/11.png"; // Animazione
        } else if (categoria.getId() == 11L) {
            imagePath = "./img-ref/5.png"; // Documentario
        } else if (categoria.getId() == 12L) {
            imagePath = "./img-ref/12.png"; // Musical
        }
    } 
    out.print(imagePath);
  %>);">
  <div class="row py-lg-5">
    <div class="col-lg-6 col-md-8 mx-auto">
      <% 
        filmCategoria = (List<Film>) request.getAttribute("filmCategoria");
        if (filmCategoria != null && !filmCategoria.isEmpty()) {
          Film film = filmCategoria.get(0);  
          Categoria categoria = film.getCategoria(); 
          
          if (categoria.getId() == 1L) { %>
            <h1 class="testo-titoli">Azione</h1>
            <p class="testo-pargraph">Resta sempre aggiornato sulle ultime uscite e scopri nuovi titoli grazie alla nostra community</p>
          <% } else if (categoria.getId() == 2L) { %>
            <h1 class="testo-titoli">Avventura</h1>
            <p class="testo-pargraph">Scopri le migliori avventure cinematografiche e resta aggiornato con noi.</p>
          <% } else if (categoria.getId() == 3L) { %>
            <h1 class="testo-titoli">Drammatico</h1>
            <p class="testo-pargraph">Esplora storie toccanti e intense nel mondo del dramma cinematografico.</p>
          <% } else if (categoria.getId() == 4L) { %>
            <h1 class="testo-titoli">Commedia</h1>
            <p class="testo-pargraph">Scopri le migliori commedie che ti faranno ridere e divertire.</p>
          <% } else if (categoria.getId() == 5L) { %>
            <h1 class="testo-titoli">Horror</h1>
            <p class="testo-pargraph">Resta sveglio con i film horror che ti faranno saltare dalla sedia!</p>
          <% } else if (categoria.getId() == 6L) { %>
            <h1 class="testo-titoli">Fantascienza</h1>
            <p class="testo-pargraph">Esplora mondi futuristici e avventure straordinarie nella fantascienza.</p>
          <% } else if (categoria.getId() == 7L) { %>
            <h1 class="testo-titoli">Fantasy</h1>
            <p class="testo-pargraph">Immergiti in storie di magia e mondi incantati con i film fantasy.</p>
          <% } else if (categoria.getId() == 8L) { %>
            <h1 class="testo-titoli">Thriller</h1>
            <p class="testo-pargraph">Preparati a tensione e colpi di scena nei migliori thriller cinematografici.</p>
          <% } else if (categoria.getId() == 9L) { %>
            <h1 class="testo-titoli">Romantico</h1>
            <p class="testo-pargraph">Scopri le storie d'amore più belle e commoventi del cinema.</p>
          <% } else if (categoria.getId() == 10L) { %>
            <h1 class="testo-titoli">Animazione</h1>
            <p class="testo-pargraph">Goditi film d'animazione che piacciono a tutte le età e che raccontano storie indimenticabili.</p>
          <% } else if (categoria.getId() == 11L) { %>
            <h1 class="testo-titoli">Documentario</h1>
            <p class="testo-pargraph">Esplora il mondo attraverso documentari che informano e ispirano.</p>
          <% } else if (categoria.getId() == 12L) { %>
            <h1 class="testo-titoli">Musical</h1>
            <p class="testo-pargraph">Lasciati trasportare dalla musica e dalle emozioni dei musical.</p>
          <% } else { %>
            <h1 class="testo-titoli">CINEMA</h1>
            <p class="testo-pargraph">Resta sempre aggiornato sulle ultime uscite e scopri nuovi titoli grazie alla nostra community</p>
          <% } 
        } else { %>
          <h1 class="testo-titoli">CINEMA</h1>
          <p class="testo-pargraph">Resta sempre aggiornato sulle ultime uscite e scopri nuovi titoli grazie alla nostra community</p>
        <% } %>
    </div>
  </div>
</section>
	 <!-- Poster dei film --> 
<div class="album py-5">
	 <div class="container mt-5" style="padding-top: 20px">
		 <div class ="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
		 <!-- se i film vengono dalla richiesta per categorie -->
		 <%if(request.getAttribute("filmCategoria")!=null){
		 
		 filmCategoria = (List<Film>) request.getAttribute("filmCategoria");
			 	for(Film film : filmCategoria){
			 	
			 %>
	  			  <div class="col">
					 <div class="card mb-3" 
						 style="border-color:transparent;
							height: 90%; width:200px;
							background-color: transparent;
							margin-left: 15px;
							padding-bottom: 20px;
							border-radius:20px;">
					<a href="dettagliFilm?id=<%= film.getId()%>"><img class="card-img-top" src="<%=film.getLocandina()%>"style="border-radius:15px; height: 280px; width:200px; object-fit: cover"></a> 
	 			<h6 class="card-title testo-pargraph"><%=film.getTitolo()%></h6>
			 </div>
	 	 </div>
			<!-- se i film vengono dalla ricerca-->
			<% }
		 }
			if(request.getAttribute("filmTitolo")!=null){
			
			
			List<Film> filmRicerca = (List<Film>)request.getAttribute("filmTitolo");
			 	for(Film film : filmRicerca){
			 	
			 	
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
	
			 <%}
			}
			if(request.getAttribute("attori")!=null){	%>
			</div>
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 ml-5 g-3">
	
	<% List<Attore> attoreRicerca = (List<Attore>)request.getAttribute("attori");
			 	for(Attore attore : attoreRicerca){%>
      <div class="col ml-5">
        <a href="dettagliAttore?id=<%= attore.getId()%>"><img src="<%= attore.getFoto() %>" class="rounded-circle mb-1 hover-shadow" style="width: 150px; height: 150px; object-fit: cover; border-radius: 50%; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.5);"></a>
        <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white"><%= attore.getNome() %> <%= attore.getCognome() %></h2>
      </div>
  <% 
		}
      }else{
    	  %> </div><% 
      }
		 if((request.getAttribute("attori")==null)&&(request.getAttribute("filmTitolo")==null)&&(request.getAttribute("filmCategoria")==null)){%>
			<div class="container text-center">
				<h2 style="color:white">La tua ricerca non ha risultati</h2>
				<!-- aggiungere una nuova barra di ricerca  -->
			</div>
			<% 
		}
  %>

			
	 	</div>
	 </div>
</div>


		<!-- Categoria bottone-->

	<div class="container text-end mb-5" style="padding-top: 20px;">
	<div class ="row row-cols-md-2 g-3">
	    <a href="elencoCategoria"><button class="btn-chiaro">Scopri i film tramite le categorie</button>
	    </a>
	</div>
	</div>

	
	<%@ include file="footer.jsp"%>

</body>
</html>