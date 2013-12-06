<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionComponent.logado != null}">
	<!DOCTYPE html>
	<html>
<head>
<title>Usu&aacute;rio | Administra&ccedil;&atilde;o |
	${sessionComponent.hospital.nomeFantasia}</title>
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/assets/styles.css"
	rel="stylesheet" media="screen">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<body>
	<jsp:include page="../menu/menu.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="block">
			<div class="navbar navbar-inner block-header">
				<div class="muted pull-left">Usu&aacute;rio</div>
			</div>
			<div class="block-content collapse in">
				<div class="span12">
					<form class="form-horizontal">
						<fieldset>
							<legend>Usu&aacute;rio</legend>
							<legend>Detalhes do Registro</legend>
							<div class="control-group">
								<label class="control-label" for="id">Id </label>
								<div class="controls">
									<input type="text" class="span6" id="id" name="id"
										value="${usuario.id}" disabled="disabled">
								</div>
							</div>
							<legend>Detalhes do Usu&aacute;rio</legend>
							<div class="control-group">
								<label class="control-label" for="usuario">Usu&aacute;rio
								</label>
								<div class="controls">
									<input type="text" class="span6" id="usuario"
										value="${usuario.usuario}" disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="senha">Senha </label>
								<div class="controls">
									<input type="password" class="span6" id="senha"
										value="${usuario.senha}" disabled="disabled">
								</div>
							</div>
							<legend>Detalhes da Pessoa</legend>
							<div class="control-group">
								<label class="control-label" for="nome">Nome </label>
								<div class="controls">
									<input type="text" class="span6" id="nome"
										value="${funcionario.pessoaFisica.nome}" disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="cpf">CPF </label>
								<div class="controls">
									<input type="text" class="span6" id="cpf"
										value="${funcionario.pessoaFisica.cpf}" disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="cargo">Cargo </label>
								<div class="controls">
									<input type="text" class="span6" id="cargo"
										value="${usuario.tipoUsuario}" disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="sexo">Sexo </label>
								<div class="controls">
									<input type="text" class="span6" id="sexo"
										value="${funcionario.pessoaFisica.sexo}" disabled="disabled">
								</div>
							</div>
							<legend>Detalhes para Contato</legend>
							<div class="control-group">
								<label class="control-label" for="telefone">Telefone </label>
								<div class="controls">
									<input type="text" class="span6" id="telefone"
										value="${funcionario.pessoaFisica.telefone}"
										disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="celular">Celular </label>
								<div class="controls">
									<input type="text" class="span6" id="celular"
										value="${funcionario.pessoaFisica.celular}"
										disabled="disabled">
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--/.fluid-container-->
	<script
		src="${pageContext.request.contextPath}/vendors/jquery-1.9.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/scripts.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</body>
	</html>
</c:if>
<c:if test="${sessionComponent.logado == null}">
	<c:redirect url="/usuario/login"></c:redirect>
</c:if>