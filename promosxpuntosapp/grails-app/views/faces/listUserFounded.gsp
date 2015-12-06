<%--
  Created by IntelliJ IDEA.
  User: japrietov
  Date: 4/12/15
  Time: 09:47 PM
--%>

<%@ page import="promosxpuntosapp.StandardUser; promosxpuntosapp.ShopRecord; promosxpuntosapp.CustomerController" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Promos x Puntos - Usuarios encontrados</title>
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
    <div class="container">
        <header class="major special">
            <h2> ${session.customer.name}</h2>
            <figure>
                <g:if test="${session.customer.logo != null}">
                    <img class="img-responsive img-thumbnail" width=150px" height="150px" src="${createLink(controller:'customer', action:'displayPicture', params: [nickname:session.customer.nickname])}" />
                </g:if>
                <g:else>
                    <g:img dir="images" file="logotipo.png" class="img-responsive img-thumbnail"/>
                </g:else>
            </figure>
        </header>
        <div class="container 75%">
            <div class="row uniform 50%">
                <div class="12u$">
                    <div class="table-wrapper">
                        <g:each in="${listUser}" var="i">
                            <h2>${promosxpuntosapp.StandardUser.findById(i).name}</h2>
                            <table style="vertical-align: middle;">
                                <tr><th>NOMBRE DE LA RECOMPENSA</th><th>LUGAR DE LA REDENCION</th><th>FECHA DE LA REDENCIO</th></tr>
                                <g:each in="${ShopRecord?.findAllByStandardUser(StandardUser?.findById(i))}" var="reward">
                                    <tr><th>${reward.reward.rewardName}</th><th>${reward.placeValidate}</th><th>${reward.date.format("d MMMM yyyy")}</th></tr>
                                </g:each>
                            </table>
                        </g:each>

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