<%--
  Created by IntelliJ IDEA.
  User: japrietov
  Date: 24/11/15
  Time: 06:25 PM
--%>

<%@ page import="promosxpuntosapp.StandardUser" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Promos x Puntos - Validar Compra</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <asset:stylesheet src="template.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
</head>
<body>
<!-- Header -->
<header id="header">
    <h1><a href="${createLink(controller:'profileEstablishment')}">Promos x Puntos</a></h1>
    <a>${session.establishment.nicknameEstablishment}</a>
    <a href="${createLink(controller:'profileEstablishment')}" class="button special">Volver</a>
</header>

<section id="main" class="wrapper">
    <div class="container" style="text-align: justify">
        <header class="major special">
            <label> Usuario <b>${promosxpuntosapp.StandardUser.findById(session.shopRecord.standardUserId).name} ${promosxpuntosapp.StandardUser.findById(session.shopRecord.standardUserId).lastname}</b> encontrado. </label>
            <label> Usuario <b> ${promosxpuntosapp.StandardUser.findById(session.shopRecord.standardUserId).nickname}</b> encontrado. </label>
            <label>Redención en establecimiento: ${promosxpuntosapp.Establishment.findById(session.shopRecord.customerId).name} / En: ${session.shopRecord.date}</label>
            <g:uploadForm controller="shopRecord" action="validateShop" accept-charset="UTF-8" role="form" class="form-signup">
                <g:textField id="consecutive" name="consecutive" style="display: none" value="${session.shopRecord.consecutive}"></g:textField>
                <g:textField id="nickname" name="nickname" style="display: none" value="${session.establishment.nicknameEstablishment}"></g:textField>
                <g:submitButton name="submit" type="submit" value="Validar" class="special" tabindex="-1"></g:submitButton>
            </g:uploadForm>
        </header>
    </div>
    <div>
        <a href="promosxpuntosapp/profileCustomer" class="special"></a>
    </div>
</section>


<g:if test="${session.foundU != null}">
    <label>${session.foundU.name} ${session.foundU.lastname}</label>
    <label>${session.foundU.nickname}</label>
    <label>Redención en establecimiento: ${promosxpuntosapp.Establishment.findById(session.foundS.customerId).name} / En: ${session.foundS.date}</label>
    <g:uploadForm controller="ShopRecord" action="" method="" accept-charset="UTF-8" role="form" class="form-signup">
        <g:submitButton name="submit" type="submit" value="Validar" class="special" tabindex="-1"></g:submitButton>
    </g:uploadForm>
</g:if>


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
</body>
</html>