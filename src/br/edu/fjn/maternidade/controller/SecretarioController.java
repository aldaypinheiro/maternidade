package br.edu.fjn.maternidade.controller;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.edu.fjn.maternidade.application.EnderecoApplication;
import br.edu.fjn.maternidade.application.SecretarioApplication;
import br.edu.fjn.maternidade.application.UsuarioApplication;
import br.edu.fjn.maternidade.application.impl.EnderecoApplicationImpl;
import br.edu.fjn.maternidade.application.impl.SecretarioApplicationImpl;
import br.edu.fjn.maternidade.application.impl.UsuarioApplicationImpl;
import br.edu.fjn.maternidade.domain.endereco.Cidade;
import br.edu.fjn.maternidade.domain.secretario.Secretario;
import br.edu.fjn.maternidade.domain.usuario.TipoUsuario;
import br.edu.fjn.maternidade.domain.usuario.Usuario;
import br.edu.fjn.maternidade.infraestructure.util.MaternidadeException;

@Resource
@Path("secretario")
public class SecretarioController {

	private Result result;
	private Validator validator;
	private UsuarioApplication usuarioApplication;
	private EnderecoApplication enderecoApplication;
	private SecretarioApplication secretarioApplication;

	public SecretarioController(Result result, Validator validator) {
		this.result = result;
		this.validator = validator;
		this.usuarioApplication = new UsuarioApplicationImpl();
		this.enderecoApplication = new EnderecoApplicationImpl();
		this.secretarioApplication = new SecretarioApplicationImpl();
	}

	@Get
	@Path({ "", "/" })
	public void inicio() {

	}

	@Get
	@Path("listar")
	public void listar() {
		List<Secretario> secretarios = null;

		try {
			secretarios = secretarioApplication.listar();
		} catch (MaternidadeException e) {
			e.printStackTrace();
			validator.add(new ValidationMessage(e.getMessage(), "secretario"));
		}

		validator.onErrorUsePageOf(SecretarioController.class).inicio();
		result.include("secretarios", secretarios);
	}

	@Get
	@Path("novo")
	public void novo() {
		result.include("estados", enderecoApplication.listarEstados());
	}

	@Post
	@Path("cadastrar")
	public void cadastrar(Secretario secretario, Usuario usuario, Integer cidade) {
		Cidade cid = enderecoApplication.buscarCidadePorId(cidade);
		Usuario user = null;
		
		usuario.setTipoUsuario(TipoUsuario.SECRETARIO);
		
		try {
			usuarioApplication.inserir(usuario);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Secretário"));
			e.printStackTrace();
		}

		try {
			user = usuarioApplication.buscarPorUsuarioESenha(
					usuario.getUsuario(), usuario.getSenha());
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Secretário"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(SecretarioController.class).novo();

		secretario.getPessoaFisica().getEndereco().setCidade(cid);
		secretario.setIdUsuario(user.getId());

		secretarioApplication.inserir(secretario);

		result.redirectTo(SecretarioController.class).inicio();
	}

	@Get
	@Path("apagar/{id:[0-9]{1,15}}")
	public void apagar(Integer id) {
		Secretario secretario = null;

		try {
			secretario = secretarioApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Secretário"));
			e.printStackTrace();
		}

		
		try {
			Usuario usuario = usuarioApplication.buscarPorId(secretario.getIdUsuario());
			usuarioApplication.apagar(usuario);
		} catch (MaternidadeException e1) {
			validator.add(new ValidationMessage(e1.getMessage(), "Secretário"));
			e1.printStackTrace();
		}
		
		try {
			secretarioApplication.apagar(secretario);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Secretário"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(SecretarioController.class).listar();
		result.redirectTo(SecretarioController.class).inicio();
	}

	@Get
	@Path("editar/{id:[0-9]{1,15}}")
	public void editar(Integer id) {
		Secretario secretario = null;

		try {
			secretario = secretarioApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Secretário"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(SecretarioController.class).listar();
		result.include("secretario", secretario);
		result.include("estados", enderecoApplication.listarEstados());
		result.include(
				"cidades",
				enderecoApplication.listarCidadePorEstado(secretario
						.getPessoaFisica().getEndereco().getCidade()
						.getEstado()));
	}

	@Post
	@Path("editar")
	public void alterar(Secretario secretario, Integer id, Integer idUsuario,
			Integer cidade) {
		Cidade cid = enderecoApplication.buscarCidadePorId(cidade);

		secretario.setId(id);
		secretario.setIdUsuario(idUsuario);
		secretario.getPessoaFisica().getEndereco().setCidade(cid);

		secretarioApplication.alterar(secretario);

		validator.onErrorUsePageOf(SecretarioController.class).listar();
		result.redirectTo(SecretarioController.class).inicio();
	}

	@Get
	@Path("visualizar/{id:[0-9]{1,15}}")
	public void visualizar(Integer id) {
		Secretario secretario = null;

		try {
			secretario = secretarioApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Secretário"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(SecretarioController.class).listar();
		result.include("secretario", secretario);
	}

}
