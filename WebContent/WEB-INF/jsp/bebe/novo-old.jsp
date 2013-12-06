<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionComponent.logado != null}">
	<!DOCTYPE html>
	<html>
<head>
<title>Beb&ecirc; | Administra&ccedil;&atilde;o |
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
<script
	src="${pageContext.request.contextPath}/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
		<div class="block">
			<div class="navbar navbar-inner block-header">
				<div class="muted pull-left">Cadastrar Beb&ecirc;</div>
			</div>
			<div class="block-content collapse in">
				<div class="span12">
					<div id="rootwizard">
						<div class="navbar">
							<div class="navbar-inner">
								<div class="container">
									<ul class="nav nav-pills">
										<li class="active"><a href="#tab1" data-toggle="tab">Passo
												1</a></li>
										<li><a href="#tab2" data-toggle="tab">Passo 2</a></li>
										<li><a href="#tab3" data-toggle="tab">Passo 3</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div id="bar" class="progress progress-striped active">
							<div class="bar" style="width: 33.33333333333333%;"></div>
						</div>
						<div class="tab-content">
							<div class="tab-pane active" id="tab1">
								<form class="form-horizontal">
									<fieldset>
										<div class="control-group">
											<label class="control-label" for="bebe.nome">Nome do
												beb&ecirc;</label>
											<div class="controls">
												<input class="input-xlarge focused" id="bebe.nome"
													type="text" name="bebe.nome" value="">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="bebe.nascimento">Data
												de Nascimento</label>
											<div class="controls">
												<input class="input-xlarge focused" id="bebe.nascimento"
													type="date" name="bebe.nascimento" value="">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="bebe.peso">Peso</label>
											<div class="controls">
												<input class="input-xlarge focused" id="bebe.peso"
													type="text" name="bebe.peso" value="">
											</div>
										</div>
										<div class="control-group">
											<label class="tooltip-right control-label" for="bebe.altura"
												data-original-title="Tooltip in right">Altura</label>
											<div class="controls">
												<input class="input-xlarge focused" id="bebe.altura"
													type="text" name="bebe.altura" value="">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="bebe.sexo">Sexo</label>
											<div class="controls">
												<select class="input-xlarge focused" name="bebe.sexo"
													id="bebe.sexo">
													<option value="MASCULINO">Masculino</option>
													<option value="FEMININO">Feminino</option>
												</select>
											</div>
										</div>
									</fieldset>
								</form>
							</div>
							<div class="tab-pane" id="tab2">
								<form class="form-horizontal">
									<fieldset>
										<div class="control-group">
											<label class="control-label" for="bebe.genitor1.nome">Pai/M&atilde;e</label>
											<div class="controls">
												<input class="input-xlarge focused" id="bebe.genitor1.nome"
													type="text" name="bebe.genitor1.nome" value="">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="bebe.genitor1.cpf">CPF</label>
											<div class="controls">
												<input class="input-xlarge focused" id="bebe.genitor1.cpf"
													type="text" name="bebe.genitor1.cpf" value="">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="bebe.genitor1.celular">Celular</label>
											<div class="controls">
												<input class="input-xlarge focused"
													id="bebe.genitor1.celular" type="text"
													name="bebe.genitor1.celular" value="">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="bebe.genitor2.nome">Pai/M&atilde;e</label>
											<div class="controls">
												<input class="input-xlarge focused" id="bebe.genitor2.nome"
													type="text" name="bebe.genitor2.nome" value="">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="bebe.genitor2.cpf">CPF</label>
											<div class="controls">
												<input class="input-xlarge focused" id="bebe.genitor2.cpf"
													type="text" name="bebe.genitor2.cpf" value="">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="bebe.genitor2.celular">Celular</label>
											<div class="controls">
												<input class="input-xlarge focused"
													id="bebe.genitor2.celular" type="text"
													name="bebe.genitor2.celular" value="">
											</div>
										</div>
									</fieldset>
								</form>
							</div>
							<div class="tab-pane" id="tab3">
								<form class="form-horizontal">
									<fieldset>
										<div class="control-group">
											<label class="control-label" for="multiSelect">M&eacute;dicos</label>
											<div class="controls">
												<c:forEach var="medico" items="${medicos}">
													<input class="uniform_on" type="checkbox" name="medicos"
														value="${medico.id}">${medico.pessoaFisica.nome} <br>
												</c:forEach>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="enfermeiros">Enfermeiros</label>
											<div class="controls">
												<c:forEach var="enfermeiro" items="${enfermeiros}">
													<input class="uniform_on" type="checkbox" name="enfermeiros"
														value="${enfermeiro.id}">${enfermeiro.pessoaFisica.nome} <br>
												</c:forEach>
											</div>
										</div>
									</fieldset>
								</form>
							</div>
							<ul class="pager wizard">
								<li class="previous first disabled" style="display: none;"><a
									href="javascript:void(0);">First</a></li>
								<li class="previous disabled"><a href="javascript:void(0);">Previous</a></li>
								<li class="next last" style=""><a
									href="javascript:void(0);">Last</a></li>
								<li class="next"><a href="javascript:void(0);">Next</a></li>
								<li class="next finish" style="display: none;"><a
									href="javascript:;">Finish</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/.fluid-container-->
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
	<script>
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