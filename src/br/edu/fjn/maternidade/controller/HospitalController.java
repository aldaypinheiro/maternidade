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
import br.edu.fjn.maternidade.application.HospitalApplication;
import br.edu.fjn.maternidade.application.impl.DiretorApplicationImpl;
import br.edu.fjn.maternidade.application.impl.EnderecoApplicationImpl;
import br.edu.fjn.maternidade.application.impl.HospitalApplicationImpl;
import br.edu.fjn.maternidade.component.SessionComponent;
import br.edu.fjn.maternidade.domain.diretor.Diretor;
import br.edu.fjn.maternidade.domain.endereco.Cidade;
import br.edu.fjn.maternidade.domain.hospital.Hospital;
import br.edu.fjn.maternidade.infraestructure.util.MaternidadeException;

@Resource
@Path("hospital")
public class HospitalController {

	private Result result;
	private Validator validator;
	private SessionComponent sessionComponent;
	private DiretorApplication diretorApplication;
	private HospitalApplication hospitalApplication;
	private EnderecoApplication enderecoApplication;

	public HospitalController(Result result, Validator validator, SessionComponent sessionComponent) {
		this.result = result;
		this.validator = validator;
		this.sessionComponent = sessionComponent;
		this.diretorApplication = new DiretorApplicationImpl();
		this.hospitalApplication = new HospitalApplicationImpl();
		this.enderecoApplication = new EnderecoApplicationImpl();
	}

	@Get
	@Path({ "", "/" })
	public void inicio() {

	}

	@Get
	@Path("detalhes")
	public void detalhes() {
		Hospital hospital = null;

		hospital = hospitalApplication.getHospital();

		result.include("hospital", hospital);
	}

	@Get
	@Path("visualizar")
	public void visualizar() {
		result.include("hospital", hospitalApplication.getHospital());
	}

	@Get
	@Path("editar")
	public void editar() {
		List<Diretor> diretores = null;
		Hospital hospital = hospitalApplication.getHospital();

		try {
			diretores = diretorApplication.listar();
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Hospital"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(HospitalController.class).detalhes();
		result.include("hospital", hospital);
		result.include("diretores", diretores);
		result.include(
				"cidades",
				enderecoApplication.listarCidadePorEstado(hospital
						.getEndereco().getCidade().getEstado()));
		result.include("estados", enderecoApplication.listarEstados());
	}

	@Post
	@Path("editar")
	public void alterar(Hospital hospital, Integer cidade, Integer diretor) {
		hospital.setId(hospitalApplication.getHospital().getId());

		Cidade cid = enderecoApplication.buscarCidadePorId(cidade);

		Diretor dir = null;

		try {
			dir = diretorApplication.buscarPorId(diretor);
		} catch (MaternidadeException e1) {
			validator.add(new ValidationMessage(e1.getMessage(), "Hospital"));
			e1.printStackTrace();
		}

		hospital.getEndereco().setCidade(cid);
		hospital.setDiretor(dir);
		try {
			hospitalApplication.alterar(hospital);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Hospital"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(HospitalController.class).editar();
		sessionComponent.setHospital(hospital);	
		result.redirectTo(HospitalController.class).detalhes();
	}
}
