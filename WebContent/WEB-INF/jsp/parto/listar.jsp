<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:if test="${sessionComponent.logado != null}">
	<!DOCTYPE html>
	<html>
<head>
<title>Partos | Administra&ccedil;&atilde;o |
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
			<c:if test="${partos != null}">
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">Partos</div>
						<div class="pull-right">
							<span class="badge badge-info">${fn:length(partos)} partos
								encontrados</span>
						</div>
					</div>
					<div class="block-content collapse in">
						<table class="table table-striped">
							<thead>
								<tr>
									<th rowspan="2">#</th>
									<th rowspan="2">Data</th>
									<th rowspan="2">Hora</th>
									<th rowspan="2">Tipo</th>
									<th>M&eacute;dicos</th>
									<th>Enfermeiros</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="parto" items="${partos}">
									<tr>
										<td>${parto.id}</td>
										<td><fmt:formatDate value="${parto.data.time}"
												type="date" dateStyle="short" /></td>
										<td>${parto.hora}</td>
										<td>${parto.tipoParto}</td>
										<td><c:forEach var="medico"
												items="${parto.equipeMedica.medicos}">
												${medico.pessoaFisica.nome}; 
											</c:forEach></td>
										<td><c:forEach var="enfermeiro"
												items="${parto.equipeMedica.enfermeiros}">
												${enfermeiro.pessoaFisica.nome}; 
											</c:forEach></td>
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