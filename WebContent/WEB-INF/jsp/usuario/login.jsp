<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Login | Administra&ccedil;&atilde;o |
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
<script
	src="${pageContext.request.contextPath}/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>
<body id="login">
	<div class="container">
		<form class="form-signin" method="post"
			action="${pageContext.request.contextPath}/usuario/valida">
			<h2 class="form-signin-heading">Login</h2>
			<input name="usuario.usuario" type="text" class="input-block-level"
				placeholder="Usuário"> <input name="usuario.senha"
				type="password" class="input-block-level" placeholder="Senha">
			<c:forEach var="error" items="${errors}">
				<div class="alert alert-error">
					<button class="close" data-dismiss="alert">×</button>
					<i class="icon-warning-sign"></i> ${error.message}
				</div>
			</c:forEach>
			<button class="btn btn-large btn-primary" type="submit">Entrar</button>
		</form>

	</div>
	<!-- /container -->
	<script
		src="${pageContext.request.contextPath}/vendors/jquery-1.9.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>