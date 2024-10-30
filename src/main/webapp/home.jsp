<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="it.generationitaly.cinema.entity.*" %>
<%@ page import="java.util.List"
		import="java.util.HashMap"
		import="java.util.ArrayList"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="style.css">
<link rel="icon" type="image/x-icon" href="popcorn.png">
</head>
<body class="custom-bg">
<%@ include file="nav.jsp"%>

<section class="py-5 text-center container-fluid headline-background">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="testo-titoli">CINEMA</h1>
        <p class="testo-pargraph">Resta sempre aggiornato sulle ultime uscite e scopri sempre nuovi titoly grazie alla nostra community</p>
      </div>
    </div>
  </section>
	 
	<!-- Poster dei film --> 
<div class="album py-5">
	 <div class="container" style="padding-top: 20px">
		 <div class ="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">

	<% List<Film> posterFilm= (List<Film>) request.getAttribute("elencoFilm");
			for(Film film : posterFilm){
			
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
	
			 <%
	 		}
		 %>
	
	 	</div>
	 </div>
</div>


		<!-- Categoria, bottoni-->

	<div class="container text-end" style="padding-top: 20px;">
    <div class="row row-cols-md-2 g-3">
        <div class="col"></div>
        <div class="col" style="border-bottom: 4px solid rgb(101, 131, 161); color: rgb(101, 131, 161);">
            <h3>Scopri i film tramite le categorie</h3>
        </div>
    </div>
</div>


<div class="container" style="padding-top: 50px">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-6 g-3">
        <%
        List<Categoria> categorie = (List<Categoria>) request.getAttribute("elencoCategorie");
        for (int i = 0; i < categorie.size(); i++) { 
            Categoria categoria = categorie.get(i);
        %>
            <div class="col d-flex justify-content-center align-items-center"> 
                <a href="ricercaPerCategoria?idCategoria=<%= categoria.getId() %>">
                    <button class="btn-chiaro" style="background-color: rgb(101, 131, 161);
                            border-radius: 20px;
                            color: white;
                            padding: 5px 20px;
                            font-size: 16px;
                            border: none; 
                            height: 50px; 
                            min-width: 120px; 
                            ">
                        <%= categoria.getGenere() %>
                    </button>
                </a>
            </div>
        <% 
            if ((i + 1) % 6 == 0 && (i + 1) < categorie.size()) { 
                %>
                </div><div class="row row-cols-1 row-cols-sm-2 row-cols-md-6 g-3 mt-4"> 
                <%
            }
        } 
        %>
    </div>
</div>


	
	<!--  recensioni utente -->
	<!-- inserire un href per l'utente, che vada tramite la servlet delle recensioni ad aprire uns pagina con le recensioni dell'utente-->
	<div class="container text-end" style="padding-top: 40px;">
	<div class ="row row-cols-md-2 g-3">
	<div class="col" ></div>
	  <div class="col" style="border-bottom: 4px solid rgb(101, 131, 161); color:rgb(101, 131, 161);">
	     
	    <h3>Scopri i film tramite le recensioni della nostra community</h3>
	  </div>  
	</div>
	</div>
	<!-- inizio div recensioni -->
	<div class="container text-cetered" style="padding-top: 40px;">
	
	<% 
			List<Recensione> recensioni= (List<Recensione>)request.getAttribute("elencoRecensioni");
				 
				 if(recensioni==null){
					 %> <p> al momento non ci sono recensioni<% 
				 }else{
					 int i= 1;
					 for(Recensione recensione:recensioni){
				 		if(i>3) break;
				 		%>
				<div class ="row row-cols-md-3 g-3">
				
					<div class="col" style="color:rgb(101, 131, 161); width: 200px; padding-left:20px">
		   				 <h5><%=recensione.getUtente().getUsername() %></h5>
		   			</div >
		   			<div class="col" style="border-top: 4px solid rgb(101, 131, 161); color:rgb(101, 131, 161); ">
					<!--sarebbe troppo mettere una locandina o unpulsante per sapere andare alla pagina film?-->
		   			<h5 style="color:white"><%=recensione.getFilm().getTitolo()%></h5>
		   			<p><%=recensione.getRecensione()%></p>
		   			</div>
		   			<div class="col">
		   			<a href="dettagliFilm?id=<%= recensione.getFilm().getId()%>">
		   				<img class="card card-img-top mb-5" src="<%=recensione.getFilm().getLocandina()%>" style="height:450px ;width : 300px; border-radius:15px; margin-left: 40px; object-fit: cover; margin-top: 40px"></a>
		   			</div>
				</div >
			<%	i++;}
			}
		%>
		<div class="row text-center mb-5">
			<a href="elencoRecensioni"><button class="btn-chiaro"> Scopri altre recensioni</button></a>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>
</body>
</html>
