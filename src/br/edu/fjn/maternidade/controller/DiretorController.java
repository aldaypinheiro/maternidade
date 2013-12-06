package br.edu.fjn.maternidade.controller;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.edu.fjn.maternidade.application.DiretorApplication;
import br.edu.fjn.maternidade.application.EnderecoApplication;
import br.edu.fjn.maternidade.application.UsuarioApplication;
import br.edu.fjn.maternidade.application.impl.DiretorApplicationImpl;
import br.edu.fjn.maternidade.application.impl.EnderecoApplicationImpl;
import br.edu.fjn.maternidade.application.impl.UsuarioApplicationImpl;
import br.edu.fjn.maternidade.domain.diretor.Diretor;
import br.edu.fjn.maternidade.domain.endereco.Cidade;
import br.edu.fjn.maternidade.domain.usuario.TipoUsuario;
import br.edu.fjn.maternidade.domain.usuario.Usuario;
import br.edu.fjn.maternidade.infraestructure.util.MaternidadeException;

@Resource
@Path("diretor")
public class DiretorController {

	private Result result;
	private Validator validator;
	private UsuarioApplication usuarioApplication;
	private DiretorApplication diretorApplication;
	private EnderecoApplication enderecoApplication;

	public DiretorController(Result result, Validator validator) {
		this.result = result;
		this.validator = validator;
		this.usuarioApplication = new UsuarioApplicationImpl();
		this.diretorApplication = new DiretorApplicationImpl();
		this.enderecoApplication = new EnderecoApplicationImpl();
	}

	@Get
	@Path({ "", "/" })
	public void inicio() {

	}

	@Get
	@Path("listar")
	public void listar() {
		List<Diretor> diretores = null;

		try {
			diretores = diretorApplication.listar();
		} catch (MaternidadeException e) {
			e.printStackTrace();
			validator.add(new ValidationMessage(e.getMessage(), "diretor"));
		}

		validator.onErrorUsePageOf(DiretorController.class).inicio();
		result.include("diretores", diretores);
	}

	@Get
	@Path("novo")
	public void novo() {
		result.include("estados", enderecoApplication.listarEstados());
	}

	@Post
	@Path("cadastrar")
	public void cadastrar(Diretor diretor, Usuario usuario, Integer cidade) {
		Cidade cid = enderecoApplication.buscarCidadePorId(cidade);
		Usuario user = null;
		
		usuario.setTipoUsuario(TipoUsuario.DIRETOR);
		
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

		validator.onErrorUsePageOf(DiretorController.class).novo();
		
		diretor.getPessoaFisica().getEndereco().setCidade(cid);
		diretor.setIdUsuario(user.getId());
		
		diretorApplication.inserir(diretor);

		result.redirectTo(DiretorController.class).inicio();
	}

	@Get
	@Path("apagar/{id:[0-9]{1,15}}")
	public void apagar(Integer id) {
		Diretor diretor = null;

		try {
			diretor = diretorApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Diretor"));
			e.printStackTrace();
		}

		try {
			Usuario usuario = usuarioApplication.buscarPorId(diretor.getIdUsuario());
			usuarioApplication.apagar(usuario);
		} catch (MaternidadeException e1) {
			validator.add(new ValidationMessage(e1.getMessage(), "Secretário"));
			e1.printStackTrace();
		}
		
		try {
			diretorApplication.apagar(diretor);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Diretor"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(DiretorController.class).listar();
		result.redirectTo(DiretorController.class).inicio();
	}

	@Get
	@Path("editar/{id:[0-9]{1,15}}")
	public void editar(Integer id) {
		Diretor diretor = null;

		try {
			diretor = diretorApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Diretor"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(DiretorController.class).listar();
		result.include("diretor", diretor);
		result.include("estados", enderecoApplication.listarEstados());
		result.include(
				"cidades",
				enderecoApplication.listarCidadePorEstado(diretor
						.getPessoaFisica().getEndereco().getCidade()
						.getEstado()));
	}

	@Post
	@Path("editar")
	public void alterar(Diretor diretor, Integer id, Integer idUsuario, Integer cidade) {
		Cidade cid = enderecoApplication.buscarCidadePorId(cidade);

		diretor.setId(id);
		diretor.setIdUsuario(idUsuario);
		diretor.getPessoaFisica().getEndereco().setCidade(cid);

		diretorApplication.alterar(diretor);

		validator.onErrorUsePageOf(DiretorController.class).listar();
		result.redirectTo(DiretorController.class).inicio();
	}

	@Get
	@Path("visualizar/{id:[0-9]{1,15}}")
	public void visualizar(Integer id) {
		Diretor diretor = null;

		try {
			diretor = diretorApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Diretor"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(DiretorController.class).listar();
		result.include("diretor", diretor);
	}
}
