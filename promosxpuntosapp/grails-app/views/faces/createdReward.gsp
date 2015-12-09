<%--
  Created by IntelliJ IDEA.
  User: japrietov
  Date: 6/11/15
  Time: 10:27 AM
--%>

<%@ page import="promosxpuntosapp.Reward" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE HTML>
<!--
	Retrospect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>PROMOXPUNTOS register-reward</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <asset:stylesheet src="template.css"/>
</head>
<body class="landing">

<!-- Header -->
<header id="header">
    <h1><a href="${createLink(controller:'profileCustomer')}">Promos x Puntos</a></h1>
    <a>${session.customer.name}</a>
    <a href="${createLink(controller:'profileCustomer')}" class="button special">Volver</a>
</header>



<!-- Four -->
<section id="subscribe" class="wrapper style4 special">
    <div class="inner">
        <header class="major narrow">
            <h2>Nueva Recompensa</h2>
        </header>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:uploadForm controller="reward" action="save" method="post" accept-charset="UTF-8" role="form" class="form-signup">
            <div class="container 75%">
                <div class="row uniform 50%">
                    <select id="customer" name="customer.id" required="" class="many-to-one" style="display: none" >
                        <option value="${session.customer?.id}">${session.customer?.name}</option>
                    </select>
                    <g:if test="${!hasErrors(field: 'rewardName','error')}">
                        <div class="12u$">
                            <g:textField id="rewardName" class="form-control" name="rewardName"  placeholder="Nombre"></g:textField>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="12u$">
                            <g:textField id="rewardName" class="form-control "  name="rewardName"  placeholder="Nombre"></g:textField>
                            <label class="control-label list-group-item-danger img-rounded">Nombre entre 3-20 caracteres</label>
                        </div>
                    </g:else>
                    <g:if test="${!hasErrors(field: 'description','error')}">
                        <div class="12u$">
                            <g:textArea id="description" class="form-control" name="description"  placeholder="Descripcion de tu PROMO"></g:textArea>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="12u$">
                            <g:textArea id="description" class="form-control "  name="description"  placeholder="Descripcion"></g:textArea>
                            <label class="control-label list-group-item-danger img-rounded">Descripcion minimo de 30 caracteres</label>
                        </div>
                    </g:else>
                    <g:if test="${!hasErrors(field: 'point','error')}">
                        <div class="6u 12u$(xsmall)">
                            <g:field type="number"  id="point" class="form-control" name="point"  placeholder="Puntos de la PROMO"></g:field>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="6u 12u$(xsmall)">
                            <g:field type="number" id="point" class="form-control "  name="point"  placeholder="Puntos de la PROMO"></g:field>
                            <label class="control-label list-group-item-danger img-rounded">Puntos mayor que 1</label>
                        </div>
                    </g:else>
                    <g:if test="${!hasErrors(field: 'available','error')}">
                        <div class="6u 12u$(xsmall)">
                            <g:field type="number"  id="available" class="form-control" name="available"  placeholder="Disponibilidad! de la PROMO"></g:field>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="6u 12u$(xsmall)">
                            <g:field type="number" id="available" class="form-control "  name="available"  placeholder="Puntos de la PROMO"></g:field>
                            <label class="control-label list-group-item-danger img-rounded">Disponibilidad mayor que 1</label>
                        </div>
                    </g:else>
                    <div class="12u$">
                        <label>Fecha de Inicio de la Promoción</label>
                    </div>
                    <g:if test="${!hasErrors(field: 'creationDateReward','error')}">
                        <div class="12u$">
                            <g:datePicker name="creationDateReward" id="creationDateReward" class="form-control" years="${1900..2030}" precision="day"/>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="12u$">
                            <g:datePicker name="creationDateReward" id="creationDateReward" class="form-control" years="${1900..2030}" precision="day"/>
                            <label class="control-label list-group-item-danger img-rounded">asddasfasdf</label>
                        </div>
                    </g:else>
                    <div class="12u$">
                        <label>Fecha de Vencimiento de la Promoción</label>
                    </div>
                    <g:if test="${!hasErrors(field: 'dueDateReward','error')}">
                        <div class="12u$">
                            <g:datePicker name="dueDateReward" id="dueDateReward" class="form-control"  years="${1900..2030}" precision="day"/>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="12u$">
                            <g:datePicker name="dueDateReward" id="dueDateReward" class="form-control"  years="${1900..2030}" precision="day"/>
                            <label class="control-label list-group-item-danger img-rounded">Fecha invalida</label>
                        </div>
                    </g:else>
                    <div class="12u$">
                        <label>Imagen de la Promoción</label>
                    </div>
                    <g:if test="${flash.message == "picture"}">
                        <div class="12u$">
                            <input type="file" name="picture"/>
                            <p>Tu imagen de la promocio es opcional, pero como sus clientes se enteraran de tus promociones sin una buena imagen!.</p>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="12u$">
                            <input type="file" name="picture" id="picture" />
                            <p>Tu imagen de la promocion es opcional, pero como tus clientes se enteraran de tus promociones sin una buena imagen!</p>
                        </div>
                    </g:else>
                </div>
            </div>
            <ul class="actions">
                <g:submitButton name="summit" type="submit" value="Crear recompensa" class="special" tabindex="-1"></g:submitButton>
            </ul>
        </g:uploadForm>
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

