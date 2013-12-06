<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionComponent.logado != null}">
	<!DOCTYPE html>
	<html>
<head>
<title>Enfermeiro | Administra&ccedil;&atilde;o |
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
				<div class="muted pull-left">Enfermeiro</div>
			</div>
			<div class="block-content collapse in">
				<div class="span12">
					<form class="form-horizontal" method="post"
						action="<c:url value='/enfermeiro/cadastrar'/>">
						<fieldset>
							<legend>Cadastrar novo enfermeiro</legend>
							<legend>Dados Pessoais</legend>
							<div class="control-group">
								<label class="control-label" for="nome">Nome </label>
								<div class="controls">
									<input type="text" class="span6"
										name="enfermeiro.pessoaFisica.nome" id="nome">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="sexo">Sexo </label>
								<div class="controls">
									<select class="span6" name="enfermeiro.pessoaFisica.sexo" id="sexo">
										<option value="MASCULINO">Masculino</option>
										<option value="FEMININO">Feminino</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="cpf">CPF </label>
								<div class="controls">
									<input type="text" class="span6 cpf"
										name="enfermeiro.pessoaFisica.cpf" id="cpf">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="telefone">Telefone </label>
								<div class="controls">
									<input type="text" class="span6 telefone"
										name="enfermeiro.pessoaFisica.telefone" id="telefone">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="celular">Celular </label>
								<div class="controls">
									<input type="text" class="span6 telefone"
										name="enfermeiro.pessoaFisica.celular" id="celular">
								</div>
							</div>
							<legend>Dados de Moradia</legend>
							<div class="control-group">
								<label class="control-label" for="logradouro">Logradouro
								</label>
								<div class="controls">
									<input type="text" class="span6"
										name="enfermeiro.pessoaFisica.endereco.rua" id="logradouro">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="numero">N&uacute;mero
								</label>
								<div class="controls">
									<input type="text" class="span6"
										name="enfermeiro.pessoaFisica.endereco.numero" id="numero">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="complemento">Complemento
								</label>
								<div class="controls">
									<input type="text" class="span6"
										name="enfermeiro.pessoaFisica.endereco.complemento"
										id="complmento">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="cep">CEP </label>
								<div class="controls">
									<input type="text" class="span6 cep"
										name="enfermeiro.pessoaFisica.endereco.cep" id="cep">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="bairro">Bairro </label>
								<div class="controls">
									<input type="text" class="span6"
										name="enfermeiro.pessoaFisica.endereco.bairro" id="bairro">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="estado">Estado </label>
								<div class="controls">
									<select class="span6" name="estado" id="estado">
									<option value="" selected="selected"></option>
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
									</select>
								</div>
							</div>
							<legend>Dados Profissionais</legend>
							<div class="control-group">
								<label class="control-label" for="enfermeiros">Especialidade(s)</label>
								<div class="controls">
									<c:forEach var="especialidade" items="${especialidades}">
										<input class="uniform_on" type="checkbox"
											name="especialidades" value="${especialidade.id}">
										<font class="tooltip-right"
											data-original-title="Descrição: ${especialidade.descricao}">${especialidade.nome}</font>
										<br>
									</c:forEach>
								</div>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">Cadastrar</button>
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