<!DOCTYPE HTML>
<!--
	Retrospect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Promos x Puntos - Modulo de Usuario</title>
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

<!-- Nav -->
<nav id="nav">
    <ul class="links">
        <li><a href="${createLink(controller:'StandardUser', action:'logOut')}" class="button special">Cerrar Sesion</a></li>
        <li><a href="${createLink(controller:'profile', action:'editStandardUser')}">Editar Perfil</a></li>
        <li><a href="${createLink(controller:'profile', action:'QRScanner')}">Registrar Visita</a></li>
        <li><a href="${createLink(controller:'shopRecord', action:'showHistory', params: [userId: session.user.id])}">Ver Historial</a></li>
        <li><a href="${createLink(controller:'customerList')}">Catalogo de Clientes</a></li>
    </ul>
</nav>

<!-- Main -->
<section id="subscribe" class="wrapper style4 special">
    <div class="inner">
        <header class="major narrow">
            <h2>Edición de datos</h2>
        </header>
        <g:uploadForm controller="standardUser" action="actualizar" method="post" accept-charset="UTF-8" role="form" class="form-signup">
            <div class="container 75%">
                <div class="row uniform 50%">
                    <g:if test="${!hasErrors(field: 'name','error')}">
                        <div class="6u 12u$(xsmall)">
                            <g:textField id="name" name="name" required="" placeholder="Nombres" value="${session.user.name}"></g:textField>
                        </div>
                    </g:if>
                    <g:else>
                        <g:textField id="name" name="name" required="" placeholder="Nombres" value="${session.user.name}"></g:textField>
                        <label class="control-label list-group-item-danger img-rounded">Nombre malo</label>
                    </g:else>
                    <g:if test="${!hasErrors(field: 'lastname','error')}">
                        <div class="6u 12u$(xsmall)">
                            <g:textField id="lastname" name="lastname" required="" placeholder="Apellidos" value="${session.user.lastname}"></g:textField>
                        </div>
                    </g:if>
                    <g:else>
                        <g:textField id="lastname" name="lastname" required="" placeholder="Apellidos" value="${session.user.lastname}"></g:textField>
                        <label class="control-label list-group-item-danger img-rounded">Apellido malo</label>
                    </g:else>
                    <g:if test="${!hasErrors(field: 'email','error')}">
                        <div class="12u$">
                            <g:textField id="email" name="email" required="" placeholder="Correo electrónico" value="${session.user.email}"></g:textField>
                        </div>
                    </g:if>
                    <g:else>
                        <g:textField id="email" name="email" required="" placeholder="Correo electrónico" value="${session.user.email}"></g:textField>
                        <label class="control-label list-group-item-danger img-rounded">Correo malo</label>
                    </g:else>
                    <div class="12u$">
                        <g:textField id="nickname" name="nickname" required="" placeholder="Nombre de usuario" value="${session.user.nickname}" disabled=""></g:textField>
                        <label class="control-label list-group-item-danger img-rounded">Tu nombre de ususario no se puede cambiar</label>
                    </div>
                    <g:if test="${!hasErrors(field: 'password','error')}">
                        <div class="6u 12u$(xsmall)">
                            <g:passwordField id="password" name="password" required="" placeholder="Contraseña" value="${session.user.password}"></g:passwordField>
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
                                <g:select name="gender" from="['Hombre', 'Mujer']" value="${session.user.gender}" noSelection="['':'-Género-']"/>
                            </div>
                        </div>
                    </g:if>
                    <g:if test="${!hasErrors(field: 'telephone','error')}">
                        <div class="12u$">
                            <g:textField id="telephone" name="telephone" required="" placeholder="Teléfono" value="${session.user.telephone}"></g:textField>
                        </div>
                    </g:if>
                    <g:else>
                        <g:textField id="telephone" name="telephone" required="" placeholder="Teléfono" value="${session.user.telephone}"></g:textField>
                        <label class="control-label list-group-item-danger img-rounded">Telefono malo</label>
                    </g:else>
                    <div class="12u$">
                        <label>Fecha de Nacimiento</label>
                    </div>
                    <g:if test="${!hasErrors(field: 'birthday','error')}">
                        <div class="12u">
                            <g:datePicker years="${1915..2015}" name="birthday" id="birthday" precision="day" class="form-control" value="${session.user.birthday}"  noSelection="['':'Selecciona']"/>
                        </div>
                    </g:if>
                    <div class="12u$">
                        <label>Imagen de Usuario</label>
                    </div>
                    <div class="12u$">
                        <input type="file" name="picture"/>
                        <p>Tu imagen es opcional, pero es más fácil identificarte con ella!.</p>
                    </div>
                </div>
            </div>
            <ul class="actions">
                <g:submitButton name="summit" type="submit" value="Actualizar" class="special" tabindex="-1"></g:submitButton>
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