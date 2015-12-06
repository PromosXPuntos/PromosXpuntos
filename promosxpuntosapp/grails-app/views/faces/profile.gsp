<!DOCTYPE HTML>
<!--
	Retrospect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Promos x Puntos - Perfil de usuario</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <asset:stylesheet src="template.css"/>
</head>
<body>

<!-- Header -->
<header id="header">
    <h1><a href="">Promos x Puntos</a></h1>
    <a>${session.user.nickname}</a>
    <a href="#nav">Menu</a>
</header>

<!-- Nav -->
<nav id="nav">
    <ul class="links">
        <li><a href="${createLink(controller:'StandardUser', action:'logOut')}" class="button special">Cerrar Sesion</a></li>
        <li><a href="${createLink(controller:'profile', action:'editStandardUser')}">Editar Perfil</a></li>
        <li><a href="${createLink(controller:'profile', action:'QRScanner')}">Registrar Visita</a></li>
        <li><a href="${createLink(controller:'shopRecord', action:'showHistory', params: [userId: session.user.id])}">Ver Historial</a></li>
        <li><a href="${createLink(controller:'customerList')}">Redimir Puntos</a></li>
    </ul>
</nav>

<!-- Main -->
<section id="main" class="wrapper">
    <div class="container">

        <header class="major special">
            <h2>Bienvenido</h2>
            <img src="${createLink(controller:'StandardUser', action:'displayPicture', params: [nickname:session.user.nickname])}" width="200px" height="200px" class="rigth">
            <p>${session.user.name} ${session.user.lastname}</p>
            <g:uploadForm controller="standardUser" action="logOut" method="post">
                <ul class="actions">
                    <li><a href="${createLink(controller:'profile', action:'QRScanner')}" class="button special">Registrar Visita</a></li>
                    <li><a href="${createLink(controller:'customerList')}" class="button special">Redimir Puntos</a></li>
                    <li><a href="${createLink(controller:'shopRecord', action:'showHistory', params: [userId: session.user.id])}" class="button special">Ver historial</a></li>
                </ul>
            </g:uploadForm>
        </header>

        <h2>Datos de Usuario</h2>
        <div class="table-wrapper">
            <table>
                <tr><th> Nombres:</th> <th>${session.user.name}</th></tr>
                <tr><th> Apellidos:</th> <th>${session.user.lastname}</th></tr>
                <tr><th> Correo electrónico:</th> <th>${session.user.email}</th></tr>
                <tr><th> Fecha de nacimiento:</th> <th>${session.user.birthday.format('d MMMM, yyyy')}</th></tr>
                <tr><th> Genero:</th> <th>${session.user.gender}</th></tr>
                <tr><th> Teléfono:</th> <th>${session.user.telephone}</th></tr>
            </table>
        </div>
    </div>
</section>

<!-- Footer -->
<footer id="footer">
    <div class="inner">
        <ul class="icons">
            <li><a href="#" class="icon fa-facebook">
                <span class="label">Facebook</span>
            </a></li>
            <li><a href="#" class="icon fa-twitter">
                <span class="label">Twitter</span>
            </a></li>
            <li><a href="#" class="icon fa-instagram">
                <span class="label">Instagram</span>
            </a></li>
            <li><a href="#" class="icon fa-linkedin">
                <span class="label">LinkedIn</span>
            </a></li>
        </ul>
        <ul class="copyright">
            <li>&copy; PromosXPuntos.</li>
            <li>IngeSoft II.</li>
            <li>Unal.edu.co.</li>
        </ul>
    </div>
</footer>

<!-- Scripts -->
<asset:javascript src="jquery.min.js"/>
<asset:javascript src="skel.min.js"/>
<asset:javascript src="util.js"/>
<asset:javascript src="main.js"/>

</body>
</html>