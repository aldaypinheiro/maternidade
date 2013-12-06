package br.edu.fjn.maternidade.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import br.edu.fjn.maternidade.application.BebeApplication;
import br.edu.fjn.maternidade.application.EnfermeiroApplication;
import br.edu.fjn.maternidade.application.MedicoApplication;
import br.edu.fjn.maternidade.application.PartoApplication;
import br.edu.fjn.maternidade.application.impl.BebeApplicationImpl;
import br.edu.fjn.maternidade.application.impl.EnfermeiroApplicationImpl;
import br.edu.fjn.maternidade.application.impl.MedicoApplicationImpl;
import br.edu.fjn.maternidade.application.impl.PartoApplicationImpl;
import br.edu.fjn.maternidade.domain.bebe.Bebe;
import br.edu.fjn.maternidade.domain.enfermeiro.Enfermeiro;
import br.edu.fjn.maternidade.domain.equipemedica.EquipeMedica;
import br.edu.fjn.maternidade.domain.medico.Medico;
import br.edu.fjn.maternidade.domain.parto.Parto;
import br.edu.fjn.maternidade.infraestructure.util.MaternidadeException;

@Resource
@Path("bebe")
public class BebeController {

	private Result result;
	private Validator validator;
	private BebeApplication bebeApplication;
	private PartoApplication partoApplication;
	private MedicoApplication medicoApplication;
	private EnfermeiroApplication enfermeiroApplication;

	public BebeController(Result result, Validator validator) {
		this.result = result;
		this.validator = validator;
		this.bebeApplication = new BebeApplicationImpl();
		this.partoApplication = new PartoApplicationImpl();
		this.medicoApplication = new MedicoApplicationImpl();
		this.enfermeiroApplication = new EnfermeiroApplicationImpl();
	}

	@Get
	@Path({ "", "/" })
	public void inicio() {

	}

	@Get
	@Path("listar")
	public void listar() {
		List<Bebe> bebes = null;

		try {
			bebes = bebeApplication.listar();
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Bebê"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(BebeController.class).inicio();
		result.include("bebes", bebes);
	}

	@Get
	@Path("novo")
	public void novo() {
		List<Medico> medicos = null;
		List<Enfermeiro> enfermeiros = null;

		try {
			medicos = medicoApplication.listar();
			enfermeiros = enfermeiroApplication.listar();
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Bebê"));
			e.printStackTrace();
		}

		validator.onErrorForwardTo(BebeController.class).inicio();
		result.include("medicos", medicos);
		result.include("enfermeiros", enfermeiros);
	}

	@Post
	@Path("cadastrar")
	public void cadastrar(Bebe bebe, String nascimento, String dataParto,
			String horaParto, Parto parto, List<Integer> medicos,
			List<Integer> enfermeiros) {
		DateFormat formatData = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat formatHora = new SimpleDateFormat("hh:mm");

		Date dat = null, datParto = null, horParto = null;

		try {
			dat = formatData.parse(nascimento);
			datParto = formatData.parse(dataParto);
			horParto = formatHora.parse(horaParto);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Calendar cal = Calendar.getInstance();
		cal.setTime(dat);
		bebe.setNascimento(cal);

		cal = null;
		cal = Calendar.getInstance();
		cal.setTime(datParto);
		parto.setData(cal);
		parto.setHora(horParto);

		Set<Medico> meds = new HashSet<>();
		Set<Enfermeiro> enfs = new HashSet<>();

		for (Integer integer : medicos) {
			try {
				meds.add(medicoApplication.buscarPorId(integer));
			} catch (MaternidadeException e) {
				validator.add(new ValidationMessage(e.getMessage(), "Bebê"));
				e.printStackTrace();
			}
		}
		for (Integer integer : enfermeiros) {
			try {
				enfs.add(enfermeiroApplication.buscarPorId(integer));
			} catch (MaternidadeException e) {
				validator.add(new ValidationMessage(e.getMessage(), "Bebê"));
				e.printStackTrace();
			}
		}

		EquipeMedica equipeMedica = new EquipeMedica(enfs, meds);

		parto.setEquipeMedica(equipeMedica);

		bebe.setParto(parto);

		try {
			bebeApplication.inserir(bebe);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Bebê"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(BebeController.class).inicio();
		result.redirectTo(BebeController.class).inicio();
	}

	@Get
	@Path("apagar/{id:[0-9]{1,15}}")
	public void apagar(Integer id) {
		Bebe bebe = null;

		try {
			bebe = bebeApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Bebê"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(BebeController.class).listar();
		bebeApplication.apagar(bebe);
		result.redirectTo(BebeController.class).inicio();
	}
	
	@Get
	@Path("visualizar/{id:[0-9]{1,15}}")
	public void visualizar(Integer id) {
		Bebe bebe = null;
		
		try {
			bebe = bebeApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Bebê"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(BebeController.class).listar();
		result.include("bebe", bebe);
	}

	@Get
	@Path("editar/{id:[0-9]{1,15}}")
	public void editar(Integer id) {
		Bebe bebe = null;
		List<Medico> medicos = null;
		List<Enfermeiro> enfermeiros = null;
		
		try {
			bebe = bebeApplication.buscarPorId(id);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Bebê"));
			e.printStackTrace();
		}

		try {
			medicos = medicoApplication.listar();
			enfermeiros = enfermeiroApplication.listar();
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Bebê"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(BebeController.class).listar();
		result.include("bebe", bebe);
		result.include("medicos", medicos);
		result.include("enfermeiros", enfermeiros);
	}

	@Post
	@Path("editar")
	public void alterar(Integer id, Integer idParto, Bebe bebe, String nascimento, String dataParto,
			String horaParto, Parto parto, List<Integer> medicos,
			List<Integer> enfermeiros) {
		bebe.setId(id);
		
		DateFormat formatData = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat formatHora = new SimpleDateFormat("hh:mm");

		Date dat = null, datParto = null, horParto = null;

		try {
			dat = formatData.parse(nascimento);
			datParto = formatData.parse(dataParto);
			horParto = formatHora.parse(horaParto);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Calendar cal = Calendar.getInstance();
		cal.setTime(dat);
		bebe.setNascimento(cal);

		cal = null;
		cal = Calendar.getInstance();
		cal.setTime(datParto);
		parto.setData(cal);
		parto.setHora(horParto);

		Set<Medico> meds = new HashSet<>();
		Set<Enfermeiro> enfs = new HashSet<>();

		for (Integer integer : medicos) {
			try {
				meds.add(medicoApplication.buscarPorId(integer));
			} catch (MaternidadeException e) {
				validator.add(new ValidationMessage(e.getMessage(), "Bebê"));
				e.printStackTrace();
			}
		}
		for (Integer integer : enfermeiros) {
			try {
				enfs.add(enfermeiroApplication.buscarPorId(integer));
			} catch (MaternidadeException e) {
				validator.add(new ValidationMessage(e.getMessage(), "Bebê"));
				e.printStackTrace();
			}
		}

		EquipeMedica equipeMedica = new EquipeMedica(enfs, meds);

		parto.setEquipeMedica(equipeMedica);

		bebe.setParto(parto);
		
		try {
			bebeApplication.alterar(bebe);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Bebê"));
			e.printStackTrace();
		}
			
		validator.onErrorUsePageOf(BebeController.class).editar(id);;
		
		Parto p = null;
		
		try {
			p = partoApplication.buscarPorId(idParto);
		} catch (MaternidadeException e) {
			e.printStackTrace();
		}
		
		partoApplication.apagar(p);
		
		result.redirectTo(BebeController.class).inicio();
	}

}
