<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <title>Registrati</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">

    

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="https://getbootstrap/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="https://getbootstrap/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="https://getbootstrap/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="https://getbootstrap/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="https://getbootstrap/docs/5.3/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="https://getbootstrap/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="https://getbootstrap/docs/5.3/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }

      .bd-mode-toggle {
        z-index: 1500;
      }

      .bd-mode-toggle .dropdown-menu .active .bi {
        display: block !important;
      }
      .login-background{
			background-color: transparent; 
			background: url(./img-ref/background-kubrick.png); 
			background-size: cover; 
			background-position: center; 
		}
	.form-aspect{
		border-color: transparent;
		background-color: rgba(26, 45, 63, 0.7);
		border-radius:15px;
		padding: 50px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 1);
		
	}
    </style>

    
    <!-- Custom styles for this template -->
   <link href="sign-in.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body class="login-background">
<%@ include file="nav.jsp"%>
<main class="form-signin w-100 w-sm-75 w-md-50 m-auto mt-5 pt-4 mb-4"> 
  <form action="registrazione" method="post" class="col-12 col-md-4 m-auto">
   <div class="form-aspect mt-4 mb-2">
    <img class="mb-4" src="./img-ref/logo-login-registrazione.png" alt="" width="72" height="57" >
    <h1 class="h4 mb-3 fw-normal" style="color: white">Registrati</h1> 

    <div class="form-floating">
   
      <input type="text" class="form-control" id="input-nome" placeholder="Mario Rossi" name="nome">
      <label for="input-nome">Nome</label>
    </div>
    <br>
     <div class="form-floating">
      <input type="text" class="form-control" id="input-cognome" placeholder="Mario Rossi" name="cognome" >
      <label for="input-cognome">Cognome</label>
    </div>
    <br>
    <div class="form-floating">
      <input type="date" class="form-control" id="input-date" placeholder="DataNascita" name="dataNascita">
      <label for="input-date">Data Nascita</label>
    </div>
    <br>
     <div class="form-floating">
      <input type="text" class="form-control" id="input-username" placeholder="MarioUser" name="username">
      <label for="input-username">Username</label>
    </div>
    <br>
    <div class="form-floating">
      <input type="email" class="form-control" id="input-email" placeholder="name@example.com" name="email">
      <label for="input-email">Email</label>
    </div>
    <br>
    <div class="form-floating">
      <input type="password" class="form-control" id="input-password" placeholder="Password" name="password">
      <label for="input-password">Password</label>
    </div>
    <br>
   <button class="btn" style="background-color: rgb(238, 226, 58); border-radius: 20px;" type="submit">Registrati</button>
  </div>
  </form>
</main>

<script src="https://getbootstrap/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script type="text/javascript" src="webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
<%@ include file="footer.jsp"%>
</html>
