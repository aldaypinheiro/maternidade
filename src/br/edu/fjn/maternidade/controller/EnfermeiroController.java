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
import br.edu.fjn.maternidade.application.EnderecoApplication;
import br.edu.fjn.maternidade.application.EnfermeiroApplication;
import br.edu.fjn.maternidade.application.EspecialidadeApplication;
import br.edu.fjn.maternidade.application.impl.EnderecoApplicationImpl;
import br.edu.fjn.maternidade.application.impl.EnfermeiroApplicationImpl;
import br.edu.fjn.maternidade.application.impl.EspecialidadeApplicationImpl;
import br.edu.fjn.maternidade.domain.endereco.Cidade;
import br.edu.fjn.maternidade.domain.endereco.Estado;
import br.edu.fjn.maternidade.domain.enfermeiro.Enfermeiro;
import br.edu.fjn.maternidade.domain.especialidade.Especialidade;
import br.edu.fjn.maternidade.infraestructure.util.MaternidadeException;

@Resource
@Path("enfermeiro")
public class EnfermeiroController {

	private Result result;
	private Validator validator;
	private EnderecoApplication enderecoApplication;
	private EnfermeiroApplication enfermeiroApplication;
	private EspecialidadeApplication especialidadeApplication;

	public EnfermeiroController(Result result, Validator validator) {
		this.result = result;
		this.validator = validator;
		this.enderecoApplication = new EnderecoApplicationImpl();
		this.enfermeiroApplication = new EnfermeiroApplicationImpl();
		this.especialidadeApplication = new EspecialidadeApplicationImpl();
	}

	@Get
	@Path({ "", "/" })
	public void inicio() {

	}

	@Get
	@Path("listar")
	public void listar() {
		List<Enfermeiro> enfermeiros = null;

		try {
			enfermeiros = enfermeiroApplication.listar();
		} catch (MaternidadeException e) {
			e.printStackTrace();
			validator.add(new ValidationMessage(e.getMessage(), "enfermeiro"));
		}

		validator.onErrorUsePageOf(EnfermeiroController.class).listar();
		result.include("enfermeiros", enfermeiros);
	}

	@Get
	@Path("novo")
	public void novo() {
		List<Especialidade> especialidades = null;
		List<Estado> estados = null;

		estados = enderecoApplication.listarEstados();

		try {
			especialidades = especialidadeApplication.listar();
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Enfermeiro"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(EnfermeiroController.class).inicio();
		result.include("especialidades", especialidades);
		result.include("estados", estados);
	}

	@Post
	@Path("cadastrar")
	public void cadastrar(Enfermeiro enfermeiro, List<Integer> especialidades,
			Integer cidade) {
		Set<Especialidade> esps = new HashSet<>();
		Cidade cid = null;

		cid = enderecoApplication.buscarCidadePorId(cidade);

		if (especialidades != null) {
			for (Integer integer : especialidades) {
				try {
					esps.add(especialidadeApplication.buscarPorId(integer));
				} catch (MaternidadeException e) {
					validator.add(new ValidationMessage(e.getMessage(),
							"Médico"));
					e.printStackTrace();
				}
			}
			enfermeiro.setEspecialidades(esps);
		}
		enfermeiro.getPessoaFisica().getEndereco().setCidade(cid);

		enfermeiroApplication.inserir(enfermeiro);

		validator.onErrorUsePageOf(EnfermeiroController.class).novo();
		result.redirectTo(EnfermeiroController.class).inicio();
	}

	@Get
	@Path("visualizar/{id:[0-9]{1,15}}")
	public void visualizar(Integer id) {
		Enfermeiro enfermeiro = null;

		try {
			enfermeiro = enfermeiroApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Enfermeiro"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(EnfermeiroController.class).listar();
		result.include("enfermeiro", enfermeiro);
	}

	@Get
	@Path("apagar/{id:[0-9]{1,15}}")
	public void apagar(Integer id) {
		Enfermeiro enfermeiro = null;

		try {
			enfermeiro = enfermeiroApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Enfermeiro"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(EnfermeiroController.class).listar();
		enfermeiroApplication.apagar(enfermeiro);
		result.redirectTo(EnfermeiroController.class).listar();
	}

	@Get
	@Path("editar/{id:[0-9]{1,15}}")
	public void editar(Integer id) {
		List<Especialidade> especialidades = null;
		Enfermeiro enfermeiro = null;

		try {
			especialidades = especialidadeApplication.listar();
		} catch (MaternidadeException e1) {
			validator.add(new ValidationMessage(e1.getMessage(), "Enfermeiro"));
			e1.printStackTrace();
		}

		try {
			enfermeiro = enfermeiroApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Enfermeiro"));
			e.printStackTrace();
		}

		Estado estado = enderecoApplication.buscarEstadoPorId(enfermeiro
				.getPessoaFisica().getEndereco().getCidade().getEstado()
				.getId());

		validator.onErrorUsePageOf(EnfermeiroController.class).listar();
		result.include("enfermeiro", enfermeiro);
		result.include("cidades",
				enderecoApplication.listarCidadePorEstado(estado));
		result.include("estados", enderecoApplication.listarEstados());
		result.include("especialidades", especialidades);
	}

	@Post
	@Path("editar")
	public void alterar(Enfermeiro enfermeiro, Integer idEnfermeiro, Integer cidade,
			List<Integer> especialidades) {
		enfermeiro.setId(idEnfermeiro);
		
		Set<Especialidade> esps = new HashSet<>();
		
		Cidade cid = enderecoApplication.buscarCidadePorId(cidade);
		
		enfermeiro.getPessoaFisica().getEndereco().setCidade(cid);
		
		if (especialidades != null) {
			for (Integer integer : especialidades) {
				try {
					esps.add(especialidadeApplication.buscarPorId(integer));
				} catch (MaternidadeException e) {
					validator.add(new ValidationMessage(e.getMessage(),
							"Enfermeiro"));
					e.printStackTrace();
				}
			}
		}
		
		enfermeiro.setEspecialidades(esps);

		enfermeiroApplication.alterar(enfermeiro);

		validator.onErrorUsePageOf(EnfermeiroController.class).editar(
				idEnfermeiro);

		result.redirectTo(EnfermeiroController.class).listar();
	}
}
