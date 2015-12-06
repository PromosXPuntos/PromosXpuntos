<%@ page import="promosxpuntosapp.Customer" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE HTML>
<!--
	Retrospect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Promos x Puntos - Modulo de Cliente</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <asset:stylesheet src="template.css"/>
</head>
<body>



<!-- Header -->
<header id="header">
    <h1><a href="${createLink(controller:'profile')}">Promos x Puntos</a></h1>
    <a>${session.user.nickname}</a>
    <a href="${createLink(controller:'profile')}" class="button special">Volver</a>
</header>


<!-- Main -->
<section id="main" class="wrapper">
    <div class="container">
        <header class="major special">
            <h2> ${session.user.name}</h2>
            <figure>
                <g:if test="${session.user.picture != null}">
                    <img class="img-responsive img-thumbnail" width="250px" height="250px"
                         src="${createLink(controller:'StandardUser', action:'displayPicture', params: [nickname:session.user.nickname])}" />
                </g:if>
                <g:else>
                    <g:img dir="images" file="logotipo.png" class="img-responsive img-thumbnail"/>
                </g:else>
            </figure>
        </header>

        <div class="container 75%">
            <h2>Historial de Recompensas</h2>
            <div class="row uniform 50%">
                <g:each var="c" in="${promosxpuntosapp.Reward.findAllByCustomer(session.customer)}">
                    <div class="6u 12u$(xsmall)">
                        <div class="table-wrapper">
                            <table>
                                <tr><th> Nombre:</th> <th>${c?.rewardName}</th></tr>
                                <tr><th> Descripcion:</th> <th>${c?.description}</th></tr>
                                <tr><th> Fecha de creación:</th> <th>${c?.creationDateReward.format('d, MMMM yyyy')}</th></tr>
                                <tr><th> Fecha de vencimiento:</th> <th>${c?.dueDateReward.format('d, MMMM yyyy')}</th></tr>
                                <tr><th> Puntos:</th> <th>${c?.point}</th></tr>
                                <tr><th> Disponible:</th> <th>${c?.available}</th></tr>

                            </table>
                        </div>
                    </div>
                </g:each>
            </div>
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