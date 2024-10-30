<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.List"
		import="java.util.HashMap"
		import="java.util.ArrayList"
		import="java.util.Set"
		import="java.util.stream.Collectors"
		import="it.generationitaly.cinema.entity.*"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Halloween</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
	    const ghostContainer = document.querySelector('.ghost-container');
	    const batContainer = document.querySelector('.bat-container');
	
	    function createGhost() {
	        const ghost = document.createElement('img');
	        ghost.src = 'img-ref/ghost.png'; // Immagine del fantasma
	        ghost.classList.add('ghost');
	        ghost.style.left = Math.random() * 100 + 'vw'; // Posizione casuale orizzontale
	        ghost.style.animationDelay = Math.random() * 2 + 's'; // Ritardo casuale nell'animazione
	        ghostContainer.appendChild(ghost);
	
	        setTimeout(() => {
	            ghost.remove(); // Rimuovi il fantasma dopo che è uscito dallo schermo
	        }, 6000); // Durata dell'animazione più un po' di margine
	    }
	
	    function createBat() {
	        const bat = document.createElement('img');
	        bat.src = 'img-ref/bat.png'; // Immagine del pipistrello
	        bat.classList.add('bat');
	        bat.style.left = Math.random() * 100 + 'vw';
	        bat.style.animationDelay = Math.random() * 3 + 's'; 
	        batContainer.appendChild(bat);
	
	        setTimeout(() => {
	            bat.remove();
	        }, 6000); // Durata dell'animazione per il pipistrello
	    }
	
	    // Genera fantasmi e pipistrelli ogni tot secondi
	    setInterval(createGhost, 1500); // Ogni 2 secondi appare un fantasma
	    setInterval(createBat, 1500);   // Ogni 1.5 secondi appare un pipistrello
	});
	
	

</script>
<style type="text/css">
section:before{
	content:'';
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 100px;

	z-index:10000;
}
section:after{
	content:'';
	position: absolute;
	top:0;
	left:0;
	bottom: 0;
	width: 100%;
	height: 100px;

	z-index:10000;
}

</style>
<link rel="icon" type="image/x-icon" href="popcorn.png">
</head>
<body style="background: rgb(10, 3, 40);">
<%@ include file="nav.jsp"%>

<section style="position: relative;
	width: 100%;
	height: 100vh;
	overflow: hidden;
	display: flex;
	justify-content: center;
	align-items: center;">
	
	<img alt="" src="./img-ref/cielo-halloween.png" id="cielo" style="position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	object-fit: cover;
	pointer-events: none;">
	
	<img alt="" src="./img-ref/sfondo-halloween.png" id="sfondo" style="position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	object-fit: cover;
	pointer-events: none;">
	
	<img alt="" src="./img-ref/scritta-Halloween.png" id="scritta" style="position: absolute;
	top: 0;
	pointer-events: none;">
	
	<img alt="" src="./img-ref/casa3.png" id="casa" style="position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	object-fit: cover;
	pointer-events: none;">
	
</section>

<div class="container mt-5" style="padding-top: 40px;">
  <div class="row g-3">
    </div>
    <div class="row justify-content-evenly" style="padding-top: 50px">
  <div class="col-11" >
  <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
     <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
  </div>
  <div class="carousel-inner">
  <div class="carousel-item active">
      <a href="dettagliFilm?id=62"><img src="carosellohalloweenbanner.png" class="d-block w-100" alt="..."></a>
      </div>
    <div class="carousel-item">
      <a href="dettagliFilm?id=61"><img src="carosellohalloween1.png" class="d-block w-100"  alt="..."></a>
      <div class="carousel-caption d-none d-md-block">
        <h1 style="text-transform: uppercase;">Terrifier 3:<span style="text-transform: lowercase;"> il nuovo violentissimo slasher con Art il Clown</span></h1>
      </div>
    </div>
    <div class="carousel-item">
      <a href="dettagliFilm?id=67"><img src="carosellohalloween2.png" class="d-block w-100" alt="..."></a>
      <div class="carousel-caption d-none d-md-block">
        <h1 style="text-transform: uppercase;">It:<span style="text-transform: lowercase;"> L'adattamento dell'omonimo romanzo di Stephen King</span></h1>
      </div>
    </div>
    <div class="carousel-item">
      <a href="dettagliFilm?id=68"><img src="carosellohalloween3.png" class="d-block w-100" alt="..."></a>
      <div class="carousel-caption d-none d-md-block">
        <h1 style="text-transform: uppercase;">The nun: <span style="text-transform: lowercase;">Una giovane suora e un prete partono alla volta della Romania per scoprire i segreti di un luogo sacro infestato da uno spirito maligno.</span></h1>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span> <!--  -->
  </button>
</div>
</div>
</div>
</div>
    <div class="album py-5">
    <div class="container mt-5" style="padding-top: 20px">
        <div class ="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
           
            <% if(request.getAttribute("filmCategoria") != null) {
                List<Film> filmCategoria = (List<Film>) request.getAttribute("filmCategoria");
                for(Film film : filmCategoria) {
                    String categoria = film.getCategoria().getGenere(); 
                    if(categoria.equalsIgnoreCase("Horror")) {  
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
                } 
            } 
            %>
        </div>
    </div>
</div>
<div class="text-center"> <!-- Centra il testo -->
    <span style="font-size: 40px; opacity: 0.5; color: white;">ATTORI DA BRIVIDI...</span>
</div>
<br><br><br>
<div class="container  mr-5 ml-5">

<div class="row">
    <% 
    if(request.getAttribute("filmCategoria") != null) {
        List<Film> filmCategoria = (List<Film>) request.getAttribute("filmCategoria");
        Set <Attore> attori = filmCategoria.stream()
        		.flatMap(film -> film.getAttori().stream())  
				.collect(Collectors.toSet());
        								
        								
        for(Attore attore: attori){
    %>
      <div class="col-lg-3" style="margin-bottom: 30px;"> 
        <a href="dettagliAttore?id=<%= attore.getId()%>"><img class="rounded-circle" 
     src="<%=attore.getFoto()%>" 
     style="width: 150px; height: 150px; object-fit: cover; border-radius: 50%; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.5);"></a>
        <h2 class="fw-normal" style="font-size: 20px; opacity: 0.5; color: white; margin-top: 10px;"> 
            <%= attore.getNome() %> <%= attore.getCognome() %>
        </h2>
      </div>
    <% 
                    }  
    }
    %>
</div>
</div>
      <div class="ghost-container" ></div>
    <div class="bat-container" ></div>  
    
             
<footer>
  <div class="container-fluid fixed-bottom px-0">
    <div class="row d-flex justify-content-between">
      <div class="col-5 d-flex justify-content-start">
        <img alt="" src="./img-ref/zucca-calderone.png" class="img-fluid" style="width: 70%;">
      </div>
      <div class="col-6 d-flex justify-content-end">
        <img alt="" src="./img-ref/zucca-gatto.png" class="img-fluid" style="width: 50%;">
      </div>
    </div>
  </div>
</footer>

    <script src="https://getbootstrap.com/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
   <%@ include file="footer.jsp"%>
    <script>
    let cielo = document.getElementById("cielo");
    let sfondo = document.getElementById("sfondo");
    let scritta = document.getElementById("scritta");
    let casa = document.getElementById("casa");

    window.addEventListener('scroll', function() {
        var value = window.scrollY;
        cielo.style.top = value * 0.4 + 'px';
        sfondo.style.top = value * 0.5+ 'px';
        scritta.style.top = value * 0.3+ 'px';
        casa.style.top = value * 0.05 + 'px';
    });
</script>
    
</body>
</html>