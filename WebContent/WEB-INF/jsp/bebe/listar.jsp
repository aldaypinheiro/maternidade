<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:if test="${sessionComponent.logado != null}">
	<!DOCTYPE html>
	<html>
<head>
<title>Beb&ecirc; | Administra&ccedil;&atilde;o |
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
			<c:if test="${bebes != null}">
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">Beb&ecirc;s</div>
						<div class="pull-right">
							<span class="badge badge-info">${fn:length(bebes)}
								beb&ecirc;s encontrados</span>
						</div>
					</div>
					<div class="block-content collapse in">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>#</th>
									<th>Nome</th>
									<th>Nascimento</th>
									<th>Sexo</th>
									<th colspan="2">Pais</th>
									<th>Parto (Data - Hora)</th>
									<th>Op&ccedil;&otilde;es</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bebe" items="${bebes}">
									<tr>
										<td>${bebe.id}</td>
										<td>${bebe.nome}</td>
										<td><fmt:formatDate value="${bebe.nascimento.time}"
												pattern="dd/MM/yyyy" /></td>
										<td>${bebe.sexo}</td>
										<td>${bebe.genitor1.nome}</td>
										<td>${bebe.genitor2.nome}</td>
										<td><fmt:formatDate value="${bebe.parto.data.time}"
												type="date" dateStyle="short" /> - ${bebe.parto.hora}</td>
										<td><a
											href="${pageContext.request.contextPath}/bebe/visualizar/${bebe.id}"
											class="btn"><i class="icon-eye-open"></i> Visualizar</a> <a
											href="${pageContext.request.contextPath}/bebe/editar/${bebe.id}"
											class="btn btn-primary"><i class="icon-pencil icon-white"></i>
												Editar</a> <a
											href="${pageContext.request.contextPath}/bebe/apagar/${bebe.id}"
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