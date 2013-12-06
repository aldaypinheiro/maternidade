<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionComponent.logado != null}">
	<!DOCTYPE html>
	<html class="no-js">
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
		<div class="row-fluid">
			<c:forEach var="error" items="${errors}">
				<div class="alert alert-error">
					<button class="close" data-dismiss="alert">×</button>
					<i class="icon-warning-sign"></i> ${error.message}
				</div>
			</c:forEach>
			<!-- block -->
			<div class="block">
				<div class="navbar navbar-inner block-header">
					<div class="muted pull-left">Detalhes do hospital</div>
				</div>
				<div class="block-content collapse in">
					<table class="table">
						<thead>
							<tr>
								<th>Nome Fantasia</th>
								<th>CNPJ</th>
								<th>Telefone</th>
								<th>Diretor</th>
								<th>Endere&ccedil;o</th>
								<th>Cidade</th>
								<th>Estado</th>
								<th>Op&ccedil;&otilde;es</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${hospital.nomeFantasia}</td>
								<td>${hospital.cnpj}</td>
								<td>${hospital.telefone}</td>
								<td>${hospital.diretor.pessoaFisica.nome}</td>
								<td>${hospital.endereco.rua},${hospital.endereco.numero}</td>
								<td>${hospital.endereco.cidade.nome}</td>
								<td>${hospital.endereco.cidade.estado.nome}
									(${hospital.endereco.cidade.estado.sigla})</td>
								<td><a
									href="${pageContext.request.contextPath}/hospital/visualizar"
									class="btn"><i class="icon-eye-open"></i> Visualizar</a> <a
									href="${pageContext.request.contextPath}/hospital/editar"
									class="btn btn-primary"><i class="icon-pencil icon-white"></i>
										Editar</a></td>
							</tr>
						</tbody>
					</table>
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