<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.cinema.entity.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://getbootstrap.com/docs/5.3/assets/js/color-modes.js"></script>
    <link rel="stylesheet" href="style.css">
    <title>Attore</title>
</head>

<body class="custom-bg">
    <%@ include file="nav.jsp"%>

    <div class="container text-center">
        <div class="row">
            <!-- Colonna foto attore e biografia -->
            <div class="col-md-4">
                <div class="card card-attore" style="border-color:transparent; background-color: transparent; padding-top: 100px;">
                    <% Attore attore = (Attore) request.getAttribute("attore"); %>
                    <img src="<%= attore.getFoto() %>"height="100%"  width="358"style="border-radius:15px" class="card-img-top" alt="Foto attore">
                </div>
            </div>

            <!-- Colonna biografia -->
            <div class="col-md-8" style="padding-top: 100px;">
             <span style="font-size: 40px; opacity: 0.5; color: white;"><%= attore.getNome() %> <%= attore.getCognome()%></span>
                <div class="card-body">
                    <p class="card-text" style="color:rgb(101, 131, 161); text-align: left;"><%= attore.getBiografia() %></p>
                </div>
            </div>
        </div>

        <!-- Sezione dei film --><br>
        <span style="font-size: 40px; opacity: 0.5; color: white;">FILM</span>
        <div class="row" style="padding-top: 50px;">
            <div class="col-md-12">
                <div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 g-3">
                    <% 
                    List<Film> listFilmByAttore = attore.getFilm();
                    for (Film film : listFilmByAttore) { 
                    %>
                        <div class="col">
                            <div class="card-locandina card" style="border-color:transparent; height: 100%; width:200px; background-color: transparent;">
                                <!-- Aggiunto il link per le locandine -->
                                <a href="dettagliFilm?id=<%= film.getId() %>">
                                    <img class="card-img-top" src="<%= film.getLocandina() %>" style="border-radius:15px; height: 100%; width:200px; object-fit: cover" alt="Poster film">
                                    <h6 class="card-title" style="color: white;"><%= film.getTitolo() %></h6>
                                </a>
                            </div>
                        </div>
                    <% 
                    } 
                    %>
                </div>
            </div>
        </div> <!-- chiusura sezione film -->
    </div>

    <script src="https://getbootstrap.com/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>