package br.edu.fjn.maternidade.controller;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.edu.fjn.maternidade.application.UsuarioApplication;
import br.edu.fjn.maternidade.application.impl.UsuarioApplicationImpl;
import br.edu.fjn.maternidade.component.SessionComponent;
import br.edu.fjn.maternidade.domain.hospital.Funcionario;
import br.edu.fjn.maternidade.domain.usuario.Usuario;

@Resource
@Path("usuario")
public class UsuarioController {

	private UsuarioApplication usuarioApplication;
	private SessionComponent sessionComponent;
	private Validator validator;
	private Result result;

	public UsuarioController(Validator validator, SessionComponent component,
			Result result) {
		this.usuarioApplication = new UsuarioApplicationImpl();
		this.result = result;
		this.validator = validator;
		this.sessionComponent = component;
	}

	@Path("login")
	public void login() {

	}

	@Path("valida")
	public void validaLogin(Usuario usuario) {
		Funcionario funcionario = null;

		Usuario carregado = null;
		try {
			carregado = usuarioApplication.buscarPorUsuarioESenha(
					usuario.getUsuario(), usuario.getSenha());
			funcionario = usuarioApplication
					.buscarFuncionarioPorUsuario(carregado);
		} catch (Exception e) {
			validator.add(new ValidationMessage(e.getMessage(), "Login"));
		}

		validator.onErrorUsePageOf(UsuarioController.class).login();
		sessionComponent.login(carregado);
		sessionComponent.setFuncionario(funcionario);
		result.redirectTo(IndexController.class).index();
	}

	@Path("logout")
	public void logout() {
		sessionComponent.logout();
		result.redirectTo(UsuarioController.class).login();
	}

	@Get
	@Path({ "", "/", "perfil" })
	public void detalhes() {
		result.include("funcionario", sessionComponent.getFuncionario());
		result.include("usuario", sessionComponent.getLogado());
	}

	@Get
	@Path("visualizar")
	public void visualizar() {
		result.include("funcionario", sessionComponent.getFuncionario());
		result.include("usuario", sessionComponent.getLogado());
	}

	@Get
	@Path("editar")
	public void editar() {
		result.include("funcionario", sessionComponent.getFuncionario());
		result.include("usuario", sessionComponent.getLogado());
	}

	@Post
	@Path("editar")
	public void editar(Usuario usuario) {
		usuario.setId(sessionComponent.getLogado().getId());
		usuario.setTipoUsuario(sessionComponent.getLogado().getTipoUsuario());
		usuario.setUsuario(sessionComponent.getLogado().getUsuario());
		
		usuarioApplication.alterar(usuario);
		sessionComponent.setLogado(usuario);

		result.redirectTo(UsuarioController.class).detalhes();
	}
}
