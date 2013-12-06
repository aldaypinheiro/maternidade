<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a> <a class="brand" href="#">${sessionComponent.hospital.nomeFantasia}</a>
			<div class="nav-collapse collapse">
				<ul class="nav pull-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <i class="icon-user"></i>
							${sessionComponent.funcionario.pessoaFisica.nome} <i
							class="caret"></i>
					</a>
						<ul class="dropdown-menu">
							<li><a tabindex="-1"
								href="${pageContext.request.contextPath}/usuario/perfil">Perfil</a></li>
							<li class="divider"></li>
							<li><a tabindex="-1"
								href="${pageContext.request.contextPath}/usuario/logout">Logout</a></li>
						</ul></li>
				</ul>
				<ul class="nav">
					<li><a href="${pageContext.request.contextPath}">In&iacute;cio</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Beb&ecirc; <i class="caret"></i></a>
						<ul class="dropdown-menu">
							<li><a tabindex="-1"
								href="${pageContext.request.contextPath}/bebe/novo">Cadastrar
									novo</a></li>
							<li><a tabindex="-1"
								href="${pageContext.request.contextPath}/bebe/listar">Listar</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Parto <i class="caret"></i></a>
						<ul class="dropdown-menu">
							<li><a tabindex="-1"
								href="${pageContext.request.contextPath}/parto/buscas">Busca
									avan&ccedil;ada</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">M&eacute;dico <i class="caret"></i></a>
						<ul class="dropdown-menu">
							<li><a tabindex="-1"
								href="${pageContext.request.contextPath}/medico/novo">Cadastrar
									novo</a></li>
							<li><a tabindex="-1"
								href="${pageContext.request.contextPath}/medico/listar">Listar</a></li>
							<li class="divider"></li>
							<li><a tabindex="-1"
								href="${pageContext.request.contextPath}/medico/buscas">Busca
									avan&ccedil;ada</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Enfermeiro <i class="caret"></i></a>
						<ul class="dropdown-menu">
							<li><a tabindex="-1"
								href="${pageContext.request.contextPath}/enfermeiro/novo">Cadastrar
									novo</a></li>
							<li><a tabindex="-1"
								href="${pageContext.request.contextPath}/enfermeiro/listar">Listar</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Especialidade <i class="caret"></i></a>
						<ul class="dropdown-menu">
							<li><a tabindex="-1"
								href="${pageContext.request.contextPath}/especialidade/novo">Cadastrar
									novo</a></li>
							<li><a tabindex="-1"
								href="${pageContext.request.contextPath}/especialidade/listar">Listar</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Hospital <i class="caret"></i></a>
						<ul class="dropdown-menu">
							<li><a tabindex="-1"
								href="${pageContext.request.contextPath}/hospital/detalhes">Detalhes</a></li>
						</ul></li>
					<c:if test="${sessionComponent.logado.tipoUsuario == 'SECRETARIO'}">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Diretor <i class="caret"></i></a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1"
									href="${pageContext.request.contextPath}/diretor/novo">Cadastrar
										novo</a></li>
								<li><a tabindex="-1"
									href="${pageContext.request.contextPath}/diretor/listar">Listar</a></li>
							</ul></li>
					</c:if>
					<c:if test="${sessionComponent.logado.tipoUsuario == 'DIRETOR'}">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Secret&aacute;rio <i class="caret"></i></a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1"
									href="${pageContext.request.contextPath}/secretario/novo">Cadastrar
										novo</a></li>
								<li><a tabindex="-1"
									href="${pageContext.request.contextPath}/secretario/listar">Listar</a></li>
							</ul></li>
					</c:if>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
</div>