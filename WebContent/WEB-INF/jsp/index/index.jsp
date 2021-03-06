<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionComponent.logado != null}">
	<!DOCTYPE html>
	<html class="no-js">
<head>
<title>Administra&ccedil;&atilde;o |
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
		<c:forEach var="error" items="${errors}">
			<div class="alert alert-error">
				<button class="close" data-dismiss="alert">×</button>
				<i class="icon-warning-sign"></i> ${error.message}
			</div>
		</c:forEach>
		<div class="row-fluid">
			<div class="span6">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">
							<strong>Beb&ecirc;</strong>
						</div>
					</div>
					<div class="block-content collapse in form-actions">
						<a href="${pageContext.request.contextPath}/bebe/novo"
							class="btn btn-primary"><i class="icon-file"></i> Cadastrar
							novo beb&ecirc;</a> <a
							href="${pageContext.request.contextPath}/bebe/listar"
							class="btn btn-primary"><i class="icon-list"></i> Listar</a>
					</div>
				</div>
				<!-- /block -->
			</div>
			<div class="span6">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">
							<strong>Especialidade</strong>
						</div>
					</div>
					<div class="block-content collapse in form-actions">
						<a href="${pageContext.request.contextPath}/especialidade/novo"
							class="btn btn-primary"><i class="icon-file"></i> Cadastrar
							nova especialidade</a> <a
							href="${pageContext.request.contextPath}/especialidade/listar"
							class="btn btn-primary"><i class="icon-list"></i> Listar</a>
					</div>
				</div>
				<!-- /block -->
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">
							<strong>M&eacute;dico</strong>
						</div>
					</div>
					<div class="block-content collapse in form-actions">
						<a href="${pageContext.request.contextPath}/medico/novo"
							class="btn btn-primary"><i class="icon-file"></i> Cadastrar
							novo M&eacute;dico</a> <a
							href="${pageContext.request.contextPath}/medico/listar"
							class="btn btn-primary"><i class="icon-list"></i> Listar</a> <a
							href="${pageContext.request.contextPath}/medico/buscas"
							class="btn btn-primary"><i class="icon-search"></i> Busca
							avan&ccedil;ada</a>
					</div>
				</div>
				<!-- /block -->
			</div>
			<div class="span6">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">
							<strong>Enfermeiro</strong>
						</div>
					</div>
					<div class="block-content collapse in form-actions">
						<a href="${pageContext.request.contextPath}/enfermeiro/novo"
							class="btn btn-primary"><i class="icon-file"></i> Cadastrar
							novo enfermeiro</a> <a
							href="${pageContext.request.contextPath}/enfermeiro/listar"
							class="btn btn-primary"><i class="icon-list"></i> Listar</a>
					</div>
				</div>
				<!-- /block -->
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