
<!DOCTYPE HTML>
<!--
	Retrospect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Promos x Puntos</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <asset:stylesheet src="template.css"/>
</head>
<body class="landing">

<!-- Header -->
<header id="header" class="alt">
    <h1><a href="">Promos x Puntos</a></h1>
    <a href="#nav">Menu</a>
</header>

<!-- Nav -->
<nav id="nav">
    <ul class="links">
        <li><a href="">Principal</a></li>
        <li><a href="users-module">usuarios</a></li>
        <li><a href="#subscribe">Registrar usuario</a></li>
        <li><a href="customersIndex">Para empresas</a></li>
        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
            <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.naturalName}</g:link></li>
        </g:each>
    </ul>
</nav>

<!-- Banner -->
<section id="banner">
    <asset:image src="logotipo.png"/>
    <p>PromosXPuntos - Para que te diviertas ganando</p>
    <ul class="actions">
        <li><a href="#two" class="button big special">Ingresa</a></li>
    </ul>
</section>

<section class="wrapper style1" align="center">
    <header class="major narrow">
        <h2>Encuentranos</h2>
    </header>
    <iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d16491.39356475207!2d-74.08865031089259!3d4.654165704834756!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2sco!4v1446650936869" width="75%" height="600" frameborder="0" style="border:0" allowfullscreen></iframe>
</section>

<!-- Two -->
<section id="two" class="wrapper style4 special">
    <div class="inner">
        <header class="major narrow">
            <h2>Ingresa</h2>
            <p>Ingresa tus datos de usuario</p>
        </header>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:uploadForm controller="standardUser" action="logIn" method="post">
            <div class="container 75%">
                <div class="row uniform 50%">
                    <div class="6u 12u$(xsmall)">
                        <g:if test="${!hasErrors(field: 'nickname','error')}">
                            <div class="12u$">
                                <g:textField id="nickname" name="nickname"  placeholder="Nombre de usuario"></g:textField>
                            </div>
                        </g:if>
                        <g:else>
                            <div class="12u$">
                            <g:textField id="nickname" name="nickname"  placeholder="Nombre de usuario"></g:textField>
                            </div>
                        </g:else>
                    </div>
                    <div class="6u$ 12u$(xsmall)">
                        <g:if test="${!hasErrors(field: 'password','error')}">
                            <div class="6u 12u$">
                                <g:passwordField id="password" name="password" placeholder="Contraseña"></g:passwordField>
                            </div>
                        </g:if>
                        <g:else>
                            <div class="6u 12u$">
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

<!-- Three -->
<section id="three" class="wrapper style3 special">
    <div class="inner">
        <header class="major narrow	">
            <h2>Manten a tus clientes cerca y tus ingresos en aumento.</h2>
            <p>Con Promos X Puntos tendrás a la mano una herramienta de fidelización y marketing para tu compañia.</p>
        </header>
        <ul class="actions">
            <li><a href="customersIndex" class="button big alt">PromosXPuntos para Empresas</a></li>
        </ul>
    </div>
</section>

<!-- Four -->
<section id="subscribe" class="wrapper style4 special">
    <div class="inner">
        <header class="major narrow">
            <h2>Suscribete</h2>
        </header>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:uploadForm controller="standardUser" action="save" method="post" accept-charset="UTF-8" role="form" class="form-signup">
            <div class="container 75%">
                <div class="row uniform 50%">
                    <g:if test="${!hasErrors(field: 'name','error')}">
                        <div class="6u 12u$(xsmall)">
                            <g:textField id="name" name="name" required="" placeholder="Nombres"></g:textField>
                        </div>
                    </g:if>
                    <g:else>
                        <g:textField id="name" name="name" required="" placeholder="Nombres"></g:textField>
                        <label class="control-label list-group-item-danger img-rounded">Nombre malo</label>
                    </g:else>
                    <g:if test="${!hasErrors(field: 'lastname','error')}">
                        <div class="6u 12u$(xsmall)">
                            <g:textField id="lastname" name="lastname" required="" placeholder="Apellidos"></g:textField>
                        </div>
                    </g:if>
                    <g:else>
                        <g:textField id="lastname" name="lastname" required="" placeholder="Apellidos"></g:textField>
                        <label class="control-label list-group-item-danger img-rounded">Apellido malo</label>
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
                            <g:textField id="nickname" name="nickname" required="" placeholder="Nombre de usuario"></g:textField>
                        </div>
                    </g:if>
                    <g:else>
                        <g:textField id="nickname" name="nickname" required="" placeholder="Nombre de usuario"></g:textField>
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
                    <g:if test="${!hasErrors(field: 'gender','error')}">
                        <div class="12u$">
                            <div class="select-wrapper">
                                <g:select name="gender" from="['male', 'female']"  noSelection="['':'-Género-']"/>
                            </div>
                        </div>
                    </g:if>
                    <g:if test="${!hasErrors(field: 'telephone','error')}">
                        <div class="12u$">
                            <g:textField id="telephone" name="telephone" required="" placeholder="Teléfono"></g:textField>
                        </div>
                    </g:if>
                    <g:else>
                        <g:textField id="telephone" name="telephone" required="" placeholder="Teléfono"></g:textField>
                        <label class="control-label list-group-item-danger img-rounded">Telefono malo</label>
                    </g:else>
                    <div class="12u$">
                        <label>Fecha de Nacimiento</label>
                    </div>
                    <g:if test="${!hasErrors(field: 'birthday','error')}">
                        <div class="12u">
                            <g:datePicker years="${1915..2015}" name="birthday" id="birthday" precision="day" class="form-control" value="${new Date()}"  noSelection="['':'Selecciona']"/>
                        </div>
                    </g:if>
                </div>
            </div>
            <g:submitButton name="summit" type="submit" value="Registrarse" class="special" tabindex="-1"></g:submitButton>
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