<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="it.generationitaly.cinema.entity.*" %>
    <%@ page import="java.util.List"
		import="java.util.HashMap"
		import="java.util.ArrayList"
		import="java.util.Date"
		import="java.text.SimpleDateFormat"
		import="java.util.Random"
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<link rel="icon" type="image/x-icon" href="popcorn.png">
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
        <h1 class="testo-titoli">NOVITÀ</h1>
        <p class="testo-pargraph">Resta sempre aggiornato sulle ultime uscite e scopri sempre nuovi titoli grazie alla nostra community</p>
      </div>
    </div>
  </section>
  <!-- carosello coming soon -->
  <div class="row justify-content-evenly" style="padding-top: 50px">
  <div class="col-10" >
  <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" style="box-shadow: 0 0 20px rgba(0, 0, 0, 0.8); border-radius: 10px;">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" style="position: relative;" >
      <a href="dettagliFilm?id=61"><img src="carosello1.jpg" class="d-block w-100"  alt="..."></a>
      <div class="gradient-overlay"></div>
      <div class="carousel-caption d-none d-md-block">
        <h2 class="testo-titoli" style="text-transform: uppercase; font-weight: bold;">Coming soon</h2>
        <h1 style="text-transform: uppercase;">Terrifier 3:<span style="text-transform: lowercase;"> il nuovo violentissimo slasher con Art il Clown</span></h1>
      </div>
    </div>
    <div class="carousel-item" style="position: relative;">
      <a href="dettagliFilm?id=62"><img src="carosello2.png" class="d-block w-100" alt="..."></a>
      <div class="gradient-overlay"></div>
      <div class="carousel-caption d-none d-md-block">
        <h2 class="testo-titoli" style="text-transform: uppercase; font-weight: bold;">Coming soon</h2>
        <h1 style="text-transform: uppercase;">Wicked:<span style="text-transform: lowercase;"> scopri la vera storia mai raccontata delle streghe di Oz nel più grande successo di Broadway</span></h1>
      </div>
    </div>
    <div class="carousel-item" style="position: relative;">
      <a href="dettagliFilm?id=63"><img src="carosello3.png" class="d-block w-100" alt="..."></a>
      <div class="gradient-overlay"></div>
      <div class="carousel-caption d-none d-md-block">
       <h2 class="testo-titoli" style="text-transform: uppercase; font-weight: bold;">Coming soon</h2>
        <h1 style="text-transform: uppercase;">Nosferatu: <span style="text-transform: lowercase;">Un racconto gotico sull'ossessione tra una giovane donna tormentata e il terrificante vampiro che si è infatuato di lei, provocando un indicibile orrore.</span></h1>
      </div>
    </div>
      <div class="carousel-item" style="position: relative;">
      <a href="dettagliFilm?id=65"><img src="carosello4.png" class="d-block w-100" alt="..."></a>
      <div class="gradient-overlay"></div>
      <div class="carousel-caption d-none d-md-block">
       <h2 class="testo-titoli" style="text-transform: uppercase; font-weight: bold;">Coming soon</h2>
        <h1 style="text-transform: uppercase;">Il Gladiatore II: <span style="text-transform: lowercase;">Diretto dal leggendario regista Ridley Scott, il Gladiatore II continua raccontare la straordinaria saga di potere, intrighi e vendetta ...</span></h1>
      </div>
    </div>
     <div class="carousel-item" style="position: relative;">
      <a href="dettagliFilm?id=66"><img src="carosello5.png" class="d-block w-100" alt="..."></a>
      <div class="gradient-overlay"></div>
      <div class="carousel-caption d-none d-md-block">
       <h2 class="testo-titoli" style="text-transform: uppercase; font-weight: bold;">Coming soon</h2>
        <h1 style="text-transform: uppercase;">The Substance: <span style="text-transform: lowercase;">Quanto è amara la Bellezza?</span></h1>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<h1 class="testo-titoli" style="text-transform: uppercase; font-weight: bold; padding-top: 50px">Ultime uscite</h1>
</div>
</div>

	<!-- Novità card film --> 
<div class="album py-5">
    <div class="container" style="padding-top: 20px;">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">

            <%
                List<Film> annoFilm = (List<Film>) request.getAttribute("filmAnno");

            	SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
            	String annoRiferimento = "2024";
				
                if (annoFilm != null && !annoFilm.isEmpty()) {
                    for (Film film : annoFilm) {
                 String annoFilmUscita = sdf.format(film.getDataUscita());
				if (annoFilmUscita.equals(annoRiferimento)) {
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
                } else {
                    System.out.println("Nessun film disponibile.");
                }
            %>

        </div>
    </div>
</div>
<%@ include file="footer.jsp"%>
<script src="https://getbootstrap.com/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>