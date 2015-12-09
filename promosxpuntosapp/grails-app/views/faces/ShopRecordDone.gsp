<%@ page import="promosxpuntosapp.Reward" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML>
<!--
	Retrospect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Promos x Puntos - recompensa exitosa</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <asset:stylesheet src="template.css"/>
    <style>
    .nonStyletext { font-weight:normal; text-transform: none }
    </style>

</head>
<body>

<!-- Header -->
<header id="header">
    <h1><a href="">Promos x Puntos</a></h1>
    <a>${session.user.nickname}</a>
    <a href="${createLink(controller:'profile')}" class="button special">Volver</a>
</header>


<!-- Main -->
<section id="main" class="wrapper">
    <div class="container" style="text-align: justify">
        <header class="major special">
            <h2> ¡Felicidades ${session.user.name}! </h2>
            <p> Has redimido un: <b>${session.shopRecord.reward.rewardName}</b> </p>
            <p> Este es tu codigo de verificación: </p>
            <h2 class="nonStyletext"> ${session.shopRecord.consecutive} </h2>
            <p> Presentalo en un establecimiento autorizado para que te entreguen tu promocion</p>
        </header>
    </div>
    <div>
        <a href="${createLink(controller:'profileCustomer')}" class="special"></a>
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