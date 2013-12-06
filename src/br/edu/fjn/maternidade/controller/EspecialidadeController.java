package br.edu.fjn.maternidade.controller;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.edu.fjn.maternidade.application.EspecialidadeApplication;
import br.edu.fjn.maternidade.application.impl.EspecialidadeApplicationImpl;
import br.edu.fjn.maternidade.domain.especialidade.Especialidade;
import br.edu.fjn.maternidade.infraestructure.util.MaternidadeException;

@Resource
@Path("especialidade")
public class EspecialidadeController {

	private Result result;
	private Validator validator;
	private EspecialidadeApplication especialidadeApplication;

	public EspecialidadeController(Result result, Validator validator) {
		this.result = result;
		this.validator = validator;
		this.especialidadeApplication = new EspecialidadeApplicationImpl();
	}

	@Get
	@Path({ "", "/" })
	public void inicio() {

	}

	@Get
	@Path("listar")
	public void listar() {
		List<Especialidade> especialidades = null;

		try {
			especialidades = especialidadeApplication.listar();
		} catch (MaternidadeException e) {
			e.printStackTrace();
			validator
					.add(new ValidationMessage(e.getMessage(), "especialidade"));
		}

		validator.onErrorUsePageOf(EspecialidadeController.class).inicio();
		result.include("especialidades", especialidades);
	}

	@Get
	@Path("novo")
	public void novo() {

	}

	@Post
	@Path("cadastrar")
	public void cadastrar(Especialidade especialidade) {
		especialidadeApplication.inserir(especialidade);

		result.redirectTo(EspecialidadeController.class).inicio();
	}

	@Get
	@Path("apagar/{id:[0-9]{1,15}}")
	public void apagar(Integer id) {
		Especialidade esp = null;

		try {
			esp = especialidadeApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator
					.add(new ValidationMessage(e.getMessage(), "Especialidade"));
			e.printStackTrace();
		}

		especialidadeApplication.apagar(esp);

		validator.onErrorUsePageOf(EspecialidadeController.class).listar();
		result.redirectTo(EspecialidadeController.class).listar();
	}

	@Get
	@Path("visualizar/{id:[0-9]{1,15}}")
	public void visualizar(Integer id) {
		Especialidade especialidade = null;

		try {
			especialidade = especialidadeApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator
					.add(new ValidationMessage(e.getMessage(), "Especialidade"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(EspecialidadeController.class).listar();
		result.include("especialidade", especialidade);
	}
	
	@Get
	@Path("editar/{id:[0-9]{1,15}}")
	public void editar(Integer id) {
		Especialidade especialidade = null;

		try {
			especialidade = especialidadeApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator
					.add(new ValidationMessage(e.getMessage(), "Especialidade"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(EspecialidadeController.class).listar();
		result.include("especialidade", especialidade);
	}

	@Post
	@Path("editar")
	public void alterar(Integer id, Especialidade especialidade) {
		especialidade.setId(id);

		especialidadeApplication.alterar(especialidade);

		result.redirectTo(EspecialidadeController.class).listar();
	}
}
