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

</head>
<body>

<!-- Header -->
<header id="header">
    <h1><a href="${createLink(controller:'profileCustomer')}">Promos x Puntos</a></h1>
    <a>${session.customer.nickname}</a>
    <a href="${createLink(controller:'profileCustomer')}" class="button special">Volver</a>
</header>


<!-- Main -->
<section id="main" class="wrapper">
    <div class="container" style="text-align: justify">
        <header class="major special">
            <figure>
                <g:if test="${session.reward.picture != null}">
                    <img class="img-responsive img-thumbnail" src="${createLink(controller:'reward', action:'displayPicture', params: [rewardName:session.reward.rewardName])}" width="300px"/>
                </g:if>
                <g:else>
                    <g:img dir="images" file="logotipo.png" class="img-responsive img-thumbnail"/>
                </g:else>
            </figure>
            <h2>¡Registro exitoso!</h2>
            <p style="text-align: center"> ${session.reward.rewardName} </p>
            <p> ${session.reward.description} </p>
            <p> Numero de puntos: ${session.reward.point} </p>
            <p> Disponibilidad: ${session.reward.available} </p>
            <p> Fecha de creacion:  ${session.reward.creationDateReward.format('d MMMM, yyyy')} </p>
            <p> Fecha de duracion: ${session.reward.dueDateReward.format('d MMMM, yyyy')} </p>
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