<!DOCTYPE HTML>
<!--
	Retrospect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
	<title>Promos x Puntos - crear Establecimiento</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<asset:stylesheet src="template.css"/>
</head>
<body class="landing">

<!-- Header -->
<!-- Header -->
<header id="header">
	<h1><a href="${createLink(controller:'profileCustomer')}">Promos x Puntos</a></h1>
	<a>${session.customer.nickname}</a>
	<a href="${createLink(controller:'profileCustomer')}" class="button special">Volver</a>
</header>

<!-- Four -->
<section id="subscribe" class="wrapper style4 special">
<div class="inner">
	<header class="major narrow">
		<h2>Nuevo Establecimiento</h2>
	</header>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<g:uploadForm controller="establishment" action="save" method="post" accept-charset="UTF-8" role="form" class="form-signup">
		<div class="container 75%">
			<div class="row uniform 50%">
				<select id="customer" name="customer.id" required="" class="many-to-one" style="display: none">
					<option value="${session.customer?.id}">${session.customer?.name}</option>
				</select>
				<g:if test="${!hasErrors(field: 'name','error')}">
					<div class="6u 12u$(xsmall)">
						<g:textField id="name" name="name" required="" placeholder="Nombre establecimiento"></g:textField>
					</div>
				</g:if>
				<g:else>
					<g:textField id="name" name="name" required="" placeholder="Nombre establecimiento"></g:textField>
					<label class="control-label list-group-item-danger img-rounded">Error nombre</label>
				</g:else>
				<g:if test="${!hasErrors(field: 'address','error')}">
					<div class="6u 12u$(xsmall)">
						<g:textField id="address" name="address" required="" placeholder="Direccion"></g:textField>
					</div>
				</g:if>
				<g:else>
					<g:textField id="address" name="address" required="" placeholder="Direccion"></g:textField>
					<label class="control-label list-group-item-danger img-rounded">Error Direccion</label>
				</g:else>
				<g:if test="${!hasErrors(field: 'telephoneNumber','error')}">
					<div class="12u$">
						<g:textField id="telephoneNumber" name="telephoneNumber" required="" placeholder="Numero Telefonico"></g:textField>
					</div>
				</g:if>
				<g:else>
					<g:textField id="telephoneNumber" name="telephoneNumber" required="" placeholder="Numero Telefonico"></g:textField>
					<label class="control-label list-group-item-danger img-rounded">Error Telefono</label>
				</g:else>
				<div class="container 75%">
					<div class="row uniform 50%">
						<div class="6u 12u$(xsmall)">
							<g:if test="${!hasErrors(field: 'nicknameEstablishment','error')}">
								<div class="12u$">
									<g:textField id="nicknameEstablishment" name="nicknameEstablishment"  placeholder="Nombre de usuario del gerente"></g:textField>
								</div>
							</g:if>
							<g:else>
								<div class="12u$">
									<g:textField id="nicknameEstablishment" name="nicknameEstablishment"  placeholder="Nombre de usuario del gerente"></g:textField>
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
			</div>
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