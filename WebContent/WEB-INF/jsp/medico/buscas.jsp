<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionComponent.logado != null}">
	<!DOCTYPE html>
	<html class="no-js">
<head>
<title>M&eacute;dico | Administra&ccedil;&atilde;o |
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
		<c:forEach var="error" items="${errors}">
			<div class="alert alert-error">
				<button class="close" data-dismiss="alert">×</button>
				<i class="icon-warning-sign"></i> ${error.message}
			</div>
		</c:forEach>
		<!-- block -->
		<div class="block">
			<div class="navbar navbar-inner block-header">
				<div class="muted pull-left">Op&ccedil;&otilde;es</div>
			</div>
			<div class="block-content collapse in form-actions">
				<form class="form-horizontal"
					action="<c:url value='/medico/resultado'/>" method="post">
					<fieldset>
						<legend>Buscar m&eacute;dico por especialidade</legend>
						<div class="control-group">
							<label class="control-label" for="especialidade">Especialidade
							</label>
							<div class="controls">
								<select id="especialidade" name="id">
									<c:forEach var="especialidade" items="${especialidades}">
										<option value="${especialidade.id}">${especialidade.nome}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">
								<i class="icon-search"></i> Buscar
							</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<!-- /block -->
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