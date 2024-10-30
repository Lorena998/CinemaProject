<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"
		import="java.util.HashMap"
		import="java.util.ArrayList"
		import="it.generationitaly.cinema.entity.Categoria"
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
		<div class="mt-4"></div>
		<div class="album py-5">
	 <div class="container" style="padding-top: 50px">
		 <div class ="row row-cols-3 row-cols-sm-3 row-cols-md-4 g-3">
	 <!-- codice temporaneo per pololare la pagina -->
	 
			 <%
	 			 List<Categoria> categorie = (List<Categoria>) request.getAttribute("elencoCategorie");
			 				 
			 HashMap<Long, String> urlById = new HashMap<>();
			    urlById.put(1L, "https://a.ltrbxd.com/resized/sm/upload/t0/3y/yr/rs/n3rm3gxguxzFDlygpROV7RHbELe-0-1000-0-1500-crop.jpg?v=67909d635e");
			    urlById.put(2L, "https://a.ltrbxd.com/resized/film-poster/2/6/5/4/3/3/265433-indiana-jones-and-the-dial-of-destiny-0-1000-0-1500-crop.jpg?v=34f4a02c6b");
			    urlById.put(3L, "https://a.ltrbxd.com/resized/film-poster/7/8/4/3/2/8/784328-oppenheimer-0-1000-0-1500-crop.jpg?v=e3c6e7a32c");
			    urlById.put(4L, "https://a.ltrbxd.com/resized/film-poster/2/7/7/0/6/4/277064-barbie-0-1000-0-1500-crop.jpg?v=1b83dc7a71");
			    urlById.put(5L, "https://a.ltrbxd.com/resized/film-poster/8/5/3/8/2/2/853822-pearl-0-1000-0-1500-crop.jpg?v=471dfc4a24");
			    urlById.put(6L, "https://a.ltrbxd.com/resized/film-poster/6/1/7/4/4/3/617443-dune-part-two-0-1000-0-1500-crop.jpg?v=cc533700f8");
			    urlById.put(7L, "https://a.ltrbxd.com/resized/sm/upload/3t/vq/0u/m6/1tX9ZlgVvWjAQhMs1vAfsYpi7VK-0-1000-0-1500-crop.jpg?v=30bbb824e1");
			    urlById.put(8L, "https://a.ltrbxd.com/resized/film-poster/5/1/4/4/4/51444-pulp-fiction-0-1000-0-1500-crop.jpg?v=dee19a8077");
			    urlById.put(9L, "https://a.ltrbxd.com/resized/sm/upload/hl/jj/br/9g/Kd5OkBc6GyUa1tIpxYUHLpyE2t-0-1000-0-1500-crop.jpg?v=a2db0a150a");
			    urlById.put(10L, "https://a.ltrbxd.com/resized/film-poster/4/3/8/5/1/1/438511-soul-0-1000-0-1500-crop.jpg?v=8d0b74f9a8");
			    urlById.put(11L, "https://a.ltrbxd.com/resized/film-poster/9/2/1/6/3/9/921639-sophia--0-1000-0-1500-crop.jpg?v=de9e1003be");
			    urlById.put(12L, "https://a.ltrbxd.com/resized/film-poster/2/4/0/3/4/4/240344-la-la-land-0-1000-0-1500-crop.jpg?v=053670ff84");


			    if (categorie != null && !categorie.isEmpty()) {
			        for (Categoria categoria : categorie) {
			            Long id = categoria.getId();
			            String imgUrl = urlById.get(id);

			            if (imgUrl != null) {
			%>
	  			 <div class="col">
                    <a href="ricercaPerCategoria?idCategoria=<%= categoria.getId() %>">
                        <div class="lumus card mt-4 " 
                            style="border-color: transparent; 
                            height: 310px; 
                            width: 210px; 
                            background-color: transparent; 
                            margin-left: 15px; 
                            border-bottom:#1A2D3F;
                            background: linear-gradient(180deg, rgba(68, 119, 165, 0) 10%, #1A2D3F 100%), url(<%= imgUrl %>); 
                            background-size: cover; 
                            background-position: center; 
                            border-radius: 15px;
                            position: relative;
                            padding-bottom: -2px;
                            box-shadow: 0 2px 4px rgba(0, 0, 0, 1);">

                            <h6 class="card-title testo-paragraph text-bottom" 
                                style="position: absolute; 
                                bottom: 0; 
                                width: 100%; 
                                text-align: center; 
                                text-transform: uppercase; 
                                font-weight:bold;
                                padding-bottom: 8px;
                                margin-bottom: 10; 
                                color: white;">
                                <%= categoria.getGenere() %>
                            </h6>
                        </div>
                    </a>
                </div>

	<%
            } else {
                System.out.println("Nessuna immagine trovata per la categoria con ID: " + id);
            }
        }
    } else {
        System.out.println("La lista delle categorie è vuota o null.");
    }
%>
	
	 	</div>
	 </div>
</div>
		
	
		<%@ include file="footer.jsp"%>
	</body>
</html>