<%--
  Created by IntelliJ IDEA.
  User: japrietov
  Date: 25/11/15
  Time: 03:12 PM
--%>

<%@ page import="promosxpuntosapp.ShopRecord" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE HTML>
<!--
	Retrospect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Promos x Puntos - historial de compras</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <asset:stylesheet src="template.css"/>
</head>
<body>

<!-- Header -->
<header id="header">
    <h1><a href="">Promos x Puntos</a></h1>
    <a href="${createLink(controller:'profile')}" class="button special">Volver</a>
</header>


<!-- Main -->
<section id="main" class="wrapper">
    <div class="container">
        <header class="major special">
            <h2> ${session.user.name} ${session.user.lastname}</h2>
        </header>

        <div class="container 75%">
            <h2>Productos por redimir</h2>
            <div class="row uniform 50%">
                <div class="12u$">
                    <div class="table-wrapper">
                        <table style="vertical-align: middle;">
                            <tr><th> RECOMPENSA </th> <th>FECHA</th> <th>CLIENTE</th></tr>
                            <g:each var="c" in="${promosxpuntosapp.ShopRecord.findAllByStandardUser(session.user)}">
                                <g:if test="${c.validate}">
                                    <tr><th> ${c.reward.rewardName}</th> <th>${c.date.format("d MMMM yyyy")}</th><th>${c.customer.name}</th></tr>
                                </g:if>
                            </g:each>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="container 75%">
            <h2>Productos ya redimidos</h2>
            <div class="row uniform 50%">
                <div class="12u$">
                    <div class="table-wrapper">
                        <table style="vertical-align: middle; ">
                            <tr><th> RECOMPENSA </th> <th>FECHA</th> <th>CLIENTE</th></tr>
                            <g:each var="c" in="${promosxpuntosapp.ShopRecord.findAllByStandardUser(session.user)}">
                                <g:if test="${!c.validate}">
                                    <tr><th> ${c.reward.rewardName}</th> <th>${c.date.format("d MMMM yyyy")}</th><th>${c.customer.name}</th></tr>
                                </g:if>
                            </g:each>
                        </table>
                    </div>
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