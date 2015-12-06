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
    <a href="${createLink(controller:'customerList')}" class="button special">Volver</a>
    <a href="#nav">Menu</a>
</header>

<!-- Nav -->
<nav id="nav">
    <ul class="links">
        <li><a href="${createLink(controller:'customer', action:'logOut')}" class="button special">Cerrar Sesion</a></li>
        <li><a href="${createLink(controller:'customer', action:'QRScanner')}">Registrar visita</a></li>
        <li><a href="${createLink(controller:'shopRecord', action:'showHistory', params: [userId: session.user.id])}">Ver historial</a></li>
    </ul>
</nav>


<!-- Main -->
<section id="main" class="wrapper">
    <div class="container">
        <header class="major special">
            <h2> ${session.customer.name}</h2>
            <figure>
                <g:if test="${session.customer.logo != null}">
                    <img class="img-responsive img-thumbnail" width=250px" height="250px" src="${createLink(controller:'customer', action:'displayPicture', params: [nickname:session.customer.nickname])}" />
                </g:if>
                <g:else>
                    <g:img dir="images" file="logotipo.png" class="img-responsive img-thumbnail"/>
                </g:else>
            </figure>
        </header>

        <div class="container 75%">
            <h2>Recompenzas vigentes</h2>
            <div class="row uniform 50%">
                <g:uploadForm controller="shopRecord" action="redimir" method="post" accept-charset="UTF-8" role="form" >
                    <g:each var="c" in="${promosxpuntosapp.Reward.findAllByCustomer(session.customer)}">
                        <div class="12u$">
                            <div class="table-wrapper">
                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>
                                <table style="vertical-align: middle">
                                    <tr><th> Nombre:</th> <th>${c?.rewardName}</th></tr>
                                    <tr><th> Puntos requeridos:</th> <th>${c?.point}</th></tr>
                                    <tr><th> Disponibilidad:</th> <th>${c?.available}</th></tr>
                                    <tr><th> Vigente hasta:</th><th> ${c?.dueDateReward.format('d MMMM, yyyy')}</th></tr>
                                </table>
                            </div>
                        </div>
                    </g:each>
                    <select id="reward" name="reward.id">
                        <g:each var="x" in="${promosxpuntosapp.Reward.findAllByCustomer(session.customer)}">
                            <option value="${x.id}">${x.rewardName}</option>
                        </g:each>
                    </select>
                    <div class="12u$">
                        <g:textField id="customer" value="${session.customer.id}" class="form-control" name="customer.id" style="display: none"></g:textField>
                    </div>
                    <div class="12u$">
                        <g:textField id="standardUser" value="${session.user.id}" class="form-control" name="standardUser.id" style="display: none"></g:textField>
                    </div>
                    <g:submitButton name="summit" type="submit" value="Redimir" class="special" tabindex="-1"></g:submitButton>
                </g:uploadForm>
            </div>
        </div>

        <div class="container 75%">
            <h2>Disponible en los siguientes establecimientos</h2>
            <div class="row uniform 50%">
                <g:each var="c" in="${promosxpuntosapp.Establishment.findAllByCustomer(session.customer)}">
                    <div class="6u 12u$(xsmall)">
                        <div class="table-wrapper">
                            <table>
                                <tr><th> Nombre:</th> <th>${c?.name}</th></tr>
                                <tr><th> Direccion:</th> <th>${c?.address}</th></tr>
                                <tr><th> Numero telefonico:</th> <th>${c?.telephoneNumber}</th></tr>
                                <iframe style="height:100%;width:100%;border:0;" frameborder="0"
                                        src="https://www.google.com/maps/embed/v1/place?q=${c?.address},+${c?.name},+Colombia&amp;key=AIzaSyAN0om9mFmy1QN6Wf54tXAowK4eT0ZUPrU">
                                </iframe>
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