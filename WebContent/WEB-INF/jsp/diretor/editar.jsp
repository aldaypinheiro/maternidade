<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionComponent.logado != null}">
	<!DOCTYPE html>
	<html>
<head>
<title>Diretor | Administra&ccedil;&atilde;o |
	${sessionComponent.hospital.nomeFantasia}</title>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/vendors/datepicker.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/vendors/uniform.default.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/vendors/wysiwyg/bootstrap-wysihtml5.css"
	rel="stylesheet" media="screen">
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/vendors/chosen.min.css"
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
				<div class="muted pull-left">Diretor</div>
			</div>
			<div class="block-content collapse in">
				<div class="span12">
					<form class="form-horizontal" method="post"
						action="<c:url value='/diretor/editar'/>">
						<fieldset>
							<legend>Alterar</legend>
							<legend>Dados Pessoais</legend>
							<input type="hidden" name="id" value="${diretor.id}">
							<input type="hidden" name="idUsuario" value="${diretor.idUsuario}">
							<div class="control-group">
								<label class="control-label" for="nome">Nome </label>
								<div class="controls">
									<input type="text" class="span6"
										name="diretor.pessoaFisica.nome" value="${diretor.pessoaFisica.nome}" id="nome">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="sexo">Sexo </label>
								<div class="controls">
									<select class="span6" name="diretor.pessoaFisica.sexo" id="sexo">
										<option selected="selected" value="${diretor.pessoaFisica.sexo}">${diretor.pessoaFisica.sexo}</option>
										<option value="MASCULINO">Masculino</option>
										<option value="FEMININO">Feminino</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="cpf">CPF </label>
								<div class="controls">
									<input type="text" class="span6 cpf"
										name="diretor.pessoaFisica.cpf" value="${diretor.pessoaFisica.cpf}" id="cpf">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="telefone">Telefone </label>
								<div class="controls">
									<input type="text" class="span6 telefone"
										name="diretor.pessoaFisica.telefone" value="${diretor.pessoaFisica.telefone}" id="telefone">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="celular">Celular </label>
								<div class="controls">
									<input type="text" class="span6 telefone"
										name="diretor.pessoaFisica.celular" value="${diretor.pessoaFisica.celular}" id="celular">
								</div>
							</div>
							<legend>Dados de Moradia</legend>
							<div class="control-group">
								<label class="control-label" for="logradouro">Logradouro
								</label>
								<div class="controls">
									<input type="text" class="span6"
										name="diretor.pessoaFisica.endereco.rua" value="${diretor.pessoaFisica.endereco.rua}" id="logradouro">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="numero">N&uacute;mero
								</label>
								<div class="controls">
									<input type="text" class="span6"
										name="diretor.pessoaFisica.endereco.numero" value="${diretor.pessoaFisica.endereco.numero}" id="numero">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="complemento">Complemento
								</label>
								<div class="controls">
									<input type="text" class="span6"
										name="diretor.pessoaFisica.endereco.complemento"
										value="${diretor.pessoaFisica.endereco.complemento}" id="complmento">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="cep">CEP </label>
								<div class="controls">
									<input type="text" class="span6 cep"
										name="diretor.pessoaFisica.endereco.cep" value="${diretor.pessoaFisica.endereco.cep}" id="cep">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="bairro">Bairro </label>
								<div class="controls">
									<input type="text" class="span6"
										name="diretor.pessoaFisica.endereco.bairro" value="${diretor.pessoaFisica.endereco.bairro}" id="bairro">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="estado">Estado </label>
								<div class="controls">
									<select class="span6" name="estado" id="estado">
									<option value="${diretor.pessoaFisica.endereco.cidade.estado.id}" selected="selected">${diretor.pessoaFisica.endereco.cidade.estado.nome}
											(${diretor.pessoaFisica.endereco.cidade.estado.sigla})</option>
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
									<option value="${diretor.pessoaFisica.endereco.cidade.id}"
											selected="selected">${diretor.pessoaFisica.endereco.cidade.nome}</option>
										<c:forEach var="cidade" items="${cidades}">
											<option value="${cidade.id}">${cidade.nome}
												</option>
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
		src="${pageContext.request.contextPath}/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/jquery-1.9.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/jquery.uniform.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/chosen.jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/wysiwyg/bootstrap-wysihtml5.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/wizard/jquery.bootstrap.wizard.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/scripts.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.mask.min.js" /></script>
	<script>
		$(document).ready(function() {
			$(".cpf").mask("999.999.999-99");
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
		$(function() {
			$(".datepicker").datepicker();
			$(".uniform_on").uniform();
			$(".chzn-select").chosen();
			$('.textarea').wysihtml5();

			$('#rootwizard').bootstrapWizard(
					{
						onTabShow : function(tab, navigation, index) {
							var $total = navigation.find('li').length;
							var $current = index + 1;
							var $percent = ($current / $total) * 100;
							$('#rootwizard').find('.bar').css({
								width : $percent + '%'
							});
							// If it's the last tab then hide the last button and show the finish instead
							if ($current >= $total) {
								$('#rootwizard').find('.pager .next').hide();
								$('#rootwizard').find('.pager .finish').show();
								$('#rootwizard').find('.pager .finish')
										.removeClass('disabled');
							} else {
								$('#rootwizard').find('.pager .next').show();
								$('#rootwizard').find('.pager .finish').hide();
							}
						}
					});
			$('#rootwizard .finish').click(function() {

				$('#rootwizard').find("a[href*='tab1']").trigger('click');
			});
		});

		$(function() {
			$('.tooltip').tooltip();
			$('.tooltip-left').tooltip({
				placement : 'left'
			});
			$('.tooltip-right').tooltip({
				placement : 'right'
			});
			$('.tooltip-top').tooltip({
				placement : 'top'
			});
			$('.tooltip-bottom').tooltip({
				placement : 'bottom'
			});

			$('.popover-left').popover({
				placement : 'left',
				trigger : 'hover'
			});
			$('.popover-right').popover({
				placement : 'right',
				trigger : 'hover'
			});
			$('.popover-top').popover({
				placement : 'top',
				trigger : 'hover'
			});
			$('.popover-bottom').popover({
				placement : 'bottom',
				trigger : 'hover'
			});
		});
	</script>
</body>
	</html>
</c:if>
<c:if test="${sessionComponent.logado == null}">
	<c:redirect url="/usuario/login"></c:redirect>
</c:if>