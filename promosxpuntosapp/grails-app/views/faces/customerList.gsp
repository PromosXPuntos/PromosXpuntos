<%--
  Created by IntelliJ IDEA.
  User: japrietov
  Date: 23/11/15
  Time: 09:17 PM
--%>

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
    <h1><a href="">Promos x Puntos</a></h1>
    <a>${session.user.nickname}</a>
    <a href="${createLink(controller:'profile')}" class="button special">Volver</a>
</header>

<!-- Main -->
<section id="main" class="wrapper">
    <div class="container">
        <header class="major special">
            <h2>Catalogo de Clientes</h2>
            <p>¡Conoce nuestros clientes! Da Click en alguno de ellos para ver sus establecimientos</p>
        </header>
        <div class="container 50%">
            <div class="row uniform 50%">
                <div class="12u$">
                    <table style="align-items: center">
                        <g:each var="c" in="${Customer.list()}">
                            <tr>
                                <th>
                                    <h3 style="text-align: center">${c.name} </h3>
                                </th>
                                <th>
                                    <span class="image" style="vertical-align: middle">
                                        <a href="${createLink(controller:'customer', action:'establecimientosUser', params:[nickname:c?.nickname])}"><img style="padding-top: 10px;" src="${createLink(controller:'customer', action:'displayPicture', params: [nickname:c?.nickname])}"width="150px" height="150px"></a>

                                    </span>
                                </th>
                                <th>
                                    <g:if test="${session.user.points?.containsKey(c.id)}">
                                        <h3 style="text-align: center">Puntos acumulados:  ${session.user.points[c.id]}</h3>
                                    </g:if>
                                    <g:else>
                                        <h3 style="text-align: center">Puntos acumulados:  0</h3>
                                    </g:else>
                                </th>
                            </tr>
                        </g:each>
                    </table>
                </div>
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