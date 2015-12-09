<!DOCTYPE HTML>
<!--
	Retrospect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Promos x Puntos - Empresas</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <asset:stylesheet src="template.css"/>
</head>
<body class="landing">

<!-- Header -->
<header id="header" class="alt">
    <h1><a href="${createLink(controller:'customersIndex')}">Promos x Puntos</a></h1>
    <a href="#nav">Menu</a>
</header>

<!-- Nav -->
<nav name="nav" id="nav">
    <ul class="links">
        <li><a href="${createLink(controller:'customersIndex')}">Principal</a></li>
        <li><a href="${createLink(controller:'customersIndex', fragment:'login')}">Iniciar sesion</a></li>
        <li><a href="${createLink(controller:'customersIndex', fragment:'subscribe')}">Registrar Empresa</a></li>
        <li><a href="${createLink(controller:'index')}">Para Usuarios</a></li>
    </ul>
</nav>


<section id="banner2">
    <asset:image src="logotipo.png"/>
    <p>PromosXPuntos - Para que te diviertas ganando</p>
    <ul class="actions">
        <li><a href="#subscribe" class="button big special">Registra tu empresa</a></li>
        <li><a href="#login" class="button big special">Ingresa como empresa</a></li>
    </ul>
</section>

<section id="login" class="wrapper style4 special">
    <div class="inner">
        <header class="major narrow">
            <h2>Ingresa</h2>
            <p>Ingresa tus datos de usuario</p>
        </header>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:uploadForm controller="customer" action="logIn" method="post">
            <div class="container 75%">
                <div class="row uniform 50%">
                    <div class="6u 12u$(xsmall)">
                        <g:if test="${!hasErrors(field: 'nickname','error')}">
                            <div class="12u$">
                                <g:textField id="nickname" name="nickname"  placeholder="Nombre de usuario de cliente"></g:textField>
                            </div>
                        </g:if>
                        <g:else>
                            <div class="12u$">
                                <g:textField id="nickname" name="nickname"  placeholder="Nombre de usuario de cliente"></g:textField>
                            </div>
                        </g:else>
                    </div>
                    <div class="6u$ 12u$(xsmall)">
                        <g:if test="${!hasErrors(field: 'password','error')}">
                            <div class="12u$">
                                <g:passwordField id="password" name="password" placeholder="Contraseña"></g:passwordField>
                            </div>
                        </g:if>
                        <g:else>
                            <div class="12u$">
                                <g:passwordField id="password" name="password" placeholder="Contraseña"></g:passwordField>
                            </div>
                        </g:else>
                    </div>
                </div>
            </div>
            <ul class="actions">
                <g:submitButton name="summit" type="submit" value="Ingresar" class="special" tabindex="-1"></g:submitButton>
            </ul>
        </g:uploadForm>
    </div>
</section>


<section id="descriptions" class="wrapper style1">
    <div class="inner">
        <article class="feature left">
            <span class="image"><asset:image src="fid01.jpg" width="500px"/></span>
            <div class="content">
                <h2>¡Puedes calificar nuestra app!</h2>
                <p>Si te gusto nuestra aplicación, pasa por nuestra pagina de facebook y comentanos tu experiencia con PromosXPuntos</p>
                <ul class="actions">
                    <li>
                        <a href="https://www.facebook.com/Promosxpuntos-865416263565823/" class="button alt">Visitanos</a>
                    </li>
                </ul>
            </div>
        </article>
        <article class="feature right">
            <span class="image"><asset:image src="fid02.jpg" width="500px"/></span>
            <div class="content">
                <h2>Comparte lo mejor de PromoXPuntos en tus redes</h2>
                <p>Cuentale a todos tus amigos las maravillosas promociones que encuentras en PromosXPuntos</p>
                <ul class="actions">
                    <li>
                        <a href="https://www.facebook.com/Promosxpuntos-865416263565823/" class="button alt">Comparte</a>
                    </li>
                </ul>
            </div>
        </article>
    </div>
</section>

<!-- subscribe -->
<section id="subscribe" class="wrapper style4 special">
    <div class="inner">
        <header class="major narrow">
            <h2>Registrate</h2>
        </header>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:uploadForm controller="customer" action="save" method="post" accept-charset="UTF-8" role="form" class="form-signup">
            <div class="container 75%">
                <div class="row uniform 50%">
                    <div class="12u$">
                        <h1>Datos de la empresa</h1>
                    </div>
                    <g:if test="${!hasErrors(field: 'name','error')}">
                        <div class="6u 12u$(xsmall)">
                            <g:textField id="name" name="name" required="" placeholder="Nombre del cliente"></g:textField>
                        </div>
                    </g:if>
                    <g:else>
                        <g:textField id="name" name="name" required="" placeholder="Nombre del cliente"></g:textField>
                        <label class="control-label list-group-item-danger img-rounded">Nombre malo</label>
                    </g:else>
                    <g:if test="${!hasErrors(field: 'identification','error')}">
                        <div class="6u 12u$(xsmall)">
                            <g:textField id="identification" name="identification" required="" placeholder="NIT"></g:textField>
                        </div>
                    </g:if>
                    <g:else>
                        <g:textField id="identification" name="identification" required="" placeholder="NIT"></g:textField>
                        <label class="control-label list-group-item-danger img-rounded">Identificación Incorrecta</label>
                    </g:else>
                    <g:if test="${!hasErrors(field: 'email','error')}">
                        <div class="12u$">
                            <g:textField id="email" name="email" required="" placeholder="Correo electrónico"></g:textField>
                        </div>
                    </g:if>
                    <g:else>
                        <g:textField id="email" name="email" required="" placeholder="Correo electrónico"></g:textField>
                        <label class="control-label list-group-item-danger img-rounded">Correo malo</label>
                    </g:else>
                    <g:if test="${!hasErrors(field: 'nickname','error')}">
                        <div class="12u$">
                            <g:textField id="nickname" name="nickname" required="" placeholder="Nombre de usuario de cliente"></g:textField>
                        </div>
                    </g:if>
                    <g:else>
                        <g:textField id="nickname" name="nickname" required="" placeholder="Nombre de usuario de cliente"></g:textField>
                        <label class="control-label list-group-item-danger img-rounded">Nombre de usuario malo</label>
                    </g:else>
                    <g:if test="${!hasErrors(field: 'password','error')}">
                        <div class="6u 12u$(xsmall)">
                            <g:passwordField id="password" name="password" required="" placeholder="Contraseña"></g:passwordField>
                        </div>
                    </g:if>
                    <g:else>
                        <g:passwordField id="password" name="password" required="" placeholder="Contraseña"></g:passwordField>
                        <label class="control-label list-group-item-danger img-rounded">Contraseña mala</label>
                    </g:else>
                    <div class="6u$ 12u$(xsmall)">
                        <input name="repeatpass" placeholder="Repita la contraseña" type="password" />
                    </div>
                    <div class="12u$">
                        <label>Logo del Cliente</label>
                    </div>
                    <div class="12u$">
                        <input type="file" name="logo"/>
                        <p>Tu logo es opcional, pero es más fácil identificarte con este!.</p>
                    </div>
                </div>
            </div>
            <ul class="actions">
                <g:submitButton name="summit" type="submit" value="Registrarse" class="special" tabindex="-1"></g:submitButton>
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