package br.edu.fjn.maternidade.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.edu.fjn.maternidade.application.EspecialidadeApplication;
import br.edu.fjn.maternidade.application.MedicoApplication;
import br.edu.fjn.maternidade.application.impl.EspecialidadeApplicationImpl;
import br.edu.fjn.maternidade.application.impl.MedicoApplicationImpl;
import br.edu.fjn.maternidade.domain.especialidade.Especialidade;
import br.edu.fjn.maternidade.domain.medico.Medico;
import br.edu.fjn.maternidade.infraestructure.util.MaternidadeException;

@Resource
@Path("medico")
public class MedicoController {

	private Result result;
	private Validator validator;
	private MedicoApplication medicoApplication;
	private EspecialidadeApplication especialidadeApplication;

	public MedicoController(Result result, Validator validator) {
		this.result = result;
		this.validator = validator;
		this.medicoApplication = new MedicoApplicationImpl();
		this.especialidadeApplication = new EspecialidadeApplicationImpl();
	}

	@Get
	@Path({ "", "/" })
	public void inicio() {

	}

	@Get
	@Path("listar")
	public void listar() {
		List<Medico> medicos = null;

		try {
			medicos = medicoApplication.listar();
		} catch (MaternidadeException e) {
			e.printStackTrace();
			validator.add(new ValidationMessage(e.getMessage(), "medico"));
		}

		System.out.println(medicos.size());

		validator.onErrorUsePageOf(MedicoController.class).inicio();
		result.include("medicos", medicos);
	}

	@Get
	@Path("novo")
	public void novo() {
		List<Especialidade> especialidades = null;

		try {
			especialidades = especialidadeApplication.listar();
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Médico"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(MedicoController.class).inicio();
		result.include("especialidades", especialidades);
	}

	@Post
	@Path("cadastrar")
	public void cadastrar(Medico medico, List<Integer> especialidades) {
		Set<Especialidade> esps = new HashSet<>();

		if (especialidades == null) {
			validator.add(new ValidationMessage(
					"É necessário informar pelo menos uma especialidade.",
					"Médico"));
		}
		
		for (Integer integer : especialidades) {
			try {
				esps.add(especialidadeApplication.buscarPorId(integer));
			} catch (MaternidadeException e) {
				validator.add(new ValidationMessage(e.getMessage(), "Médico"));
				e.printStackTrace();
			}
		}

		medico.setEspecialidades(esps);

		try {
			medicoApplication.inserir(medico);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Médico"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(MedicoController.class).novo();
		result.redirectTo(MedicoController.class).inicio();
	}

	@Get
	@Path("visualizar/{id:[0-9]{1,15}}")
	public void visualizar(Integer id) {
		Medico medico = null;

		try {
			medico = medicoApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Médico"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(MedicoController.class).listar();
		result.include("medico", medico);
	}

	@Get
	@Path("buscas")
	public void buscas() {
		List<Especialidade> especialidades = null;
		
		try {
			especialidades = especialidadeApplication.listar();
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Médico"));
			e.printStackTrace();
		}
		
		validator.onErrorUsePageOf(MedicoController.class).inicio();
		result.include("especialidades", especialidades);
	}

	@Post
	@Path("resultado")
	public void listar(Integer id) {
		List<Medico> medicos = null;

		Especialidade especialidade = null;
		
		try {
			especialidade = especialidadeApplication.buscarPorId(id);
		} catch (MaternidadeException e1) {
			validator.add(new ValidationMessage(e1.getMessage(), "Médico"));
			e1.printStackTrace();
		}
		
		try {
			medicos = medicoApplication.buscarMedicosPorEspecialidade(especialidade);
		} catch (MaternidadeException e) {
			e.printStackTrace();
			validator.add(new ValidationMessage(e.getMessage(), "Médico"));
		}

		validator.onErrorUsePageOf(MedicoController.class).buscas();
		result.include("medicos", medicos);
	}
	
	@Get
	@Path("apagar/{id:[0-9]{1,15}}")
	public void apagar(Integer id) {
		Medico medico = null;

		try {
			medico = medicoApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Médico"));
			e.printStackTrace();
		}

		medicoApplication.apagar(medico);

		validator.onErrorUsePageOf(MedicoController.class).listar();
		result.redirectTo(MedicoController.class).listar();
	}

	@Get
	@Path("editar/{id:[0-9]{1,15}}")
	public void editar(Integer id) {
		List<Especialidade> especialidades = null;
		Medico medico = null;

		try {
			medico = medicoApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Médico"));
			e.printStackTrace();
		}

		try {
			especialidades = especialidadeApplication.listar();
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Médico"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(MedicoController.class).listar();
		result.include("medico", medico);
		result.include("especialidades", especialidades);
	}

	@Post
	@Path("editar")
	public void alterar(Integer id, Medico medico, List<Integer> especialidades) {
		Set<Especialidade> esps = new HashSet<>();

		if (especialidades == null) {
			validator.add(new ValidationMessage(
					"É necessário informar pelo menos uma especialidade.",
					"Médico"));
		}

		validator.onErrorUsePageOf(MedicoController.class).editar(id);
		
		for (Integer integer : especialidades) {
			try {
				esps.add(especialidadeApplication.buscarPorId(integer));
			} catch (MaternidadeException e) {
				validator.add(new ValidationMessage(e.getMessage(), "Médico"));
				e.printStackTrace();
			}
		}

		medico.setId(id);
		medico.setEspecialidades(esps);

		try {
			medicoApplication.alterar(medico);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Médico"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(MedicoController.class).editar(id);;
		result.redirectTo(MedicoController.class).listar();
	}

}
