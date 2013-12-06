<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:if test="${sessionComponent.logado != null}">
	<!DOCTYPE html>
	<html class="no-js">
<head>
<title>Diretor | Administra&ccedil;&atilde;o |
	${sessionComponent.hospital.nomeFantasia}</title>
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/vendors/easypiechart/jquery.easy-pie-chart.css"
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
			<c:if test="${diretores != null}">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">Diretores</div>
						<div class="pull-right">
							<span class="badge badge-info">${fn:length(diretores)}
								diretores encontrados</span>
						</div>
					</div>
					<div class="block-content collapse in">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>#</th>
									<th>Nome</th>
									<th>C.P.F</th>
									<th>Telefone</th>
									<th>Celular</th>
									<th>Sexo</th>
									<th>Op&ccedil;&otilde;es</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="diretor" items="${diretores}">
									<tr>
										<td>${diretor.id}</td>
										<td>${diretor.pessoaFisica.nome}</td>
										<td>${diretor.pessoaFisica.cpf}</td>
										<td>${diretor.pessoaFisica.telefone}</td>
										<td>${diretor.pessoaFisica.celular}</td>
										<td>${diretor.pessoaFisica.sexo}</td>
										<td><a
											href="${pageContext.request.contextPath}/diretor/visualizar/${diretor.id}"
											class="btn"><i class="icon-eye-open"></i> Visualizar</a> <a
											href="${pageContext.request.contextPath}/diretor/editar/${diretor.id}"
											class="btn btn-primary"><i class="icon-pencil icon-white"></i>
												Editar</a> <a
											href="${pageContext.request.contextPath}/diretor/apagar/${diretor.id}"
											class="btn btn-danger"><i class="icon-remove icon-white"></i>
												Apagar</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- /block -->
			</c:if>
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
