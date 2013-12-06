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
					<form class="form-horizontal"
						action="<c:url value='/hospital/editar'/>" method="post">
						<fieldset>
							<legend>Alterar Hospital</legend>
							<legend>Dados do Hospital</legend>
							<div class="control-group">
								<label class="control-label" for="razao">Raz&atilde;o
									Social </label>
								<div class="controls">
									<input type="text" class="span6" name="hospital.razaoSocial"
										id="razao" value="${hospital.razaoSocial}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="fantasia">Nome
									Fantasia </label>
								<div class="controls">
									<input type="text" class="span6" name="hospital.nomeFantasia"
										id="fantasia" value="${hospital.nomeFantasia}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="cnpj">CNPJ </label>
								<div class="controls">
									<input type="text" class="span6 cnpj" name="hospital.cnpj" id="cnpj"
										value="${hospital.cnpj}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="telefone">Telefone </label>
								<div class="controls">
									<input type="text" class="span6 telefone" name="hospital.telefone"
										id="telefone" value="${hospital.telefone}">
								</div>
							</div>
							<legend>Dados do Endere&ccedil;o</legend>
							<div class="control-group">
								<label class="control-label" for="rua">Logradouro </label>
								<div class="controls">
									<input type="text" class="span6" name="hospital.endereco.rua"
										id="rua" value="${hospital.endereco.rua}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="numero">N&uacute;mero
								</label>
								<div class="controls">
									<input type="text" class="span6"
										name="hospital.endereco.numero" id="numero"
										value="${hospital.endereco.numero}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="complemento">Complemento
								</label>
								<div class="controls">
									<input type="text" class="span6"
										name="hospital.endereco.complemento" id="complemento"
										value="${hospital.endereco.complemento}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="cep">CEP </label>
								<div class="controls">
									<input type="text" class="span6 cep" name="hospital.endereco.cep"
										id="cep" value="${hospital.endereco.cep}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="bairro">Bairro </label>
								<div class="controls">
									<input type="text" class="span6"
										name="hospital.endereco.bairro" id="bairro"
										value="${hospital.endereco.bairro}">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="estado">Estado </label>
								<div class="controls">
									<select class="span6" name="estado" id="estado">
										<option value="${hospital.endereco.cidade.estado.id}"
											selected="selected">${hospital.endereco.cidade.estado.nome}
											(${hospital.endereco.cidade.estado.sigla})</option>
										<c:forEach var="estado" items="${estados}">
											<option value="${estado.id}">${estado.nome}
												(${estado.sigla})</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="cidade">Cidade </label>
								<div class="controls">
									<select class="span6" name="cidade" id="cidade">
										<option value="${hospital.endereco.cidade.id}"
											selected="selected">${hospital.endereco.cidade.nome}</option>
										<c:forEach var="cidade" items="${cidades}">
											<option value="${cidade.id}">${cidade.nome}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<legend>Diretor</legend>
							<div class="control-group">
								<label class="control-label" for="diretor">Diretor </label>
								<div class="controls">
									<select class="span6" name="diretor" id="diretor">
										<option value="${hospital.diretor.id}" selected="selected">${hospital.diretor.pessoaFisica.nome}</option>
										<c:forEach var="diretores" items="${diretores}">
											<option value="${diretor.id}">${diretor.pessoaFisica.nome}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">Alterar</button>
								<button type="reset" class="btn">Limpar</button>
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
	<script
		src="${pageContext.request.contextPath}/js/jquery.mask.min.js" /></script>
	<script>
		$(document).ready(function() {
			$(".cnpj").mask("99.999.999/9999-99");
			$(".telefone").mask("(99) 9999.9999");
			$(".cep").mask("99999-999");
		});
		$(document).ready(function() {
			$("#estado").change(function() {
				var idEstado = $("#estado").val();
				$.ajax({
					type: "post",
					url: "${pageContext.request.contextPath}/endereco/cidades",
					data: "id="+idEstado,
					cache: false,
				}).done(function(json) {
					var cidadeOpcoes = "";
					var cidadesTamanho = json.cidades.length;
					for (var i=0; i<cidadesTamanho; i++) {
						cidadeOpcoes += '<option value="'+json.cidades[i].id+'">'
						+json.cidades[i].nome+'</option>';
					}
					$("#cidade").html(cidadeOpcoes);					
				});
			}); 
		});
	</script>
</body>
	</html>
</c:if>
<c:if test="${sessionComponent.logado == null}">
	<c:redirect url="/usuario/login"></c:redirect>
</c:if>