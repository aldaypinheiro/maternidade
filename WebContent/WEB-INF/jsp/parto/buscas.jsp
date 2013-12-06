<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionComponent.logado != null}">
	<!DOCTYPE html>
	<html class="no-js">
<head>
<title>Parto | Administra&ccedil;&atilde;o |
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
		<div class="row-fluid">
			<div class="span6">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">Op&ccedil;&otilde;es</div>
					</div>
					<div class="block-content collapse in form-actions">
						<form class="form-horizontal"
							action="<c:url value='/parto/resultado/dia'/>" method="post">
							<fieldset>
								<legend>Buscar Parto por dia</legend>
								<div class="control-group">
									<label class="control-label" for="parto.data">Data </label>
									<div class="controls">
										<input class="input-xlarge focused" id="parto.data"
											type="date" name="data" value="">
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
			</div>
			<div class="span6">
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">Op&ccedil;&otilde;es</div>
					</div>
					<div class="block-content collapse in form-actions">
						<form class="form-horizontal"
							action="<c:url value='/parto/resultado/dia/tipo'/>" method="post">
							<fieldset>
								<legend>Buscar Parto por dia e tipo</legend>
								<div class="control-group">
									<label class="control-label" for="parto.tipoParto">Tipo
										do Parto </label>
									<div class="controls">
										<select id="parto.tipoParto" name="tipoParto">
											<option value="NORMAL">Normal</option>
											<option value="CESARIO">Ces&aacute;rio</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="parto.data">Data </label>
									<div class="controls">
										<input class="input-xlarge focused" id="parto.data"
											type="date" name="data" value="">
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
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">Op&ccedil;&otilde;es</div>
					</div>
					<div class="block-content collapse in form-actions">
						<form class="form-horizontal"
							action="<c:url value='/parto/resultado/periodo'/>" method="post">
							<fieldset>
								<legend>Buscar Parto por m&ecirc;s/per&iacute;odo</legend>
								<div class="control-group">
									<label class="control-label" for="dataInicial">Data
										Inicial </label>
									<div class="controls">
										<input class="input-xlarge focused" id="dataInicial"
											type="date" name="dataInicial" value="">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="dataFinal">Data Final
									</label>
									<div class="controls">
										<input class="input-xlarge focused" id="dataFinal" type="date"
											name="dataFinal" value="">
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
			</div>
			<div class="span6">
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">Op&ccedil;&otilde;es</div>
					</div>
					<div class="block-content collapse in form-actions">
						<form class="form-horizontal"
							action="<c:url value='/parto/resultado/periodo/tipo'/>" method="post">
							<fieldset>
								<legend>Buscar Parto por m&ecirc;s/per&iacute;odo e
									tipo</legend>
								<div class="control-group">
									<label class="control-label" for="parto.tipoParto">Tipo
										do Parto </label>
									<div class="controls">
										<select id="parto.tipoParto" name="tipoParto">
											<option value="NORMAL">Normal</option>
											<option value="CESARIO">Ces&aacute;rio</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="dataInicial">Data
										Inicial </label>
									<div class="controls">
										<input class="input-xlarge focused" id="dataInicial"
											type="date" name="dataInicial" value="">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="dataFinal">Data Final
									</label>
									<div class="controls">
										<input class="input-xlarge focused" id="dataFinal" type="date"
											name="dataFinal" value="">
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