<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionComponent.logado != null}">
	<!DOCTYPE html>
	<html>
<head>
<title>Hospital | Administra&ccedil;&atilde;o |
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
				<div class="muted pull-left">Hospital</div>
			</div>
			<div class="block-content collapse in">
				<div class="span12">
					<form class="form-horizontal">
						<fieldset>
							<legend>Hospital</legend>
							<legend>Detalhes do Registro</legend>
							<div class="control-group">
								<label class="control-label" for="id">Id </label>
								<div class="controls">
									<input type="text" class="span6" id="id" name="id"
										value="${hospital.id}" disabled="disabled">
								</div>
							</div>
							<legend>Detalhes do Hospital</legend>
							<div class="control-group">
								<label class="control-label" for="razao">Raz&atilde;o
									Social </label>
								<div class="controls">
									<input type="text" class="span6" id="razao"
										value="${hospital.razaoSocial}" disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="fantasia">Nome
									Fantasia </label>
								<div class="controls">
									<input type="text" class="span6" id="fantasia"
										value="${hospital.nomeFantasia}" disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="cnpj">CNPJ </label>
								<div class="controls">
									<input type="text" class="span6" id="cnpj"
										value="${hospital.cnpj}" disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="telefone">Telefone </label>
								<div class="controls">
									<input type="text" class="span6" id="telefone"
										value="${hospital.telefone}" disabled="disabled">
								</div>
							</div>
							<legend>Detalhes do Endere&ccedil;o</legend>
							<div class="control-group">
								<label class="control-label" for="rua">Logradouro </label>
								<div class="controls">
									<input type="text" class="span6" id="rua"
										value="${hospital.endereco.rua}" disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="numero">N&uacute;mero
								</label>
								<div class="controls">
									<input type="text" class="span6" id="numero"
										value="${hospital.endereco.numero}" disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="complemento">Complemento
								</label>
								<div class="controls">
									<input type="text" class="span6" id="complemento"
										value="${hospital.endereco.complemento}" disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="cep">CEP </label>
								<div class="controls">
									<input type="text" class="span6" id="cep"
										value="${hospital.endereco.cep}" disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="bairro">Bairro </label>
								<div class="controls">
									<input type="text" class="span6" id="bairro"
										value="${hospital.endereco.bairro}" disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="cidade">Cidade </label>
								<div class="controls">
									<input type="text" class="span6" id="cidade"
										value="${hospital.endereco.cidade.nome}" disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="estado">Estado </label>
								<div class="controls">
									<input type="text" class="span6" id="estado"
										value="${hospital.endereco.cidade.estado.nome} (${hospital.endereco.cidade.estado.sigla})"
										disabled="disabled">
								</div>
							</div>
							<legend>Detalhes do Diretor</legend>
							<div class="control-group">
								<label class="control-label" for="nome">Nome </label>
								<div class="controls">
									<input type="text" class="span6" id="nome"
										value="${hospital.diretor.pessoaFisica.nome}"
										disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="cpf">CPF </label>
								<div class="controls">
									<input type="text" class="span6" id="cpf"
										value="${hospital.diretor.pessoaFisica.cpf}"
										disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="telefone">Telefone </label>
								<div class="controls">
									<input type="text" class="span6" id="telefone"
										value="${hospital.diretor.pessoaFisica.telefone}"
										disabled="disabled">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="celular">Celular </label>
								<div class="controls">
									<input type="text" class="span6" id="celular"
										value="${hospital.diretor.pessoaFisica.celular}"
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