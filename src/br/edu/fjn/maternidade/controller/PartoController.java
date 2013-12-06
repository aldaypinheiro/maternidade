package br.edu.fjn.maternidade.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.edu.fjn.maternidade.application.PartoApplication;
import br.edu.fjn.maternidade.application.impl.PartoApplicationImpl;
import br.edu.fjn.maternidade.domain.parto.Parto;
import br.edu.fjn.maternidade.domain.parto.TipoParto;
import br.edu.fjn.maternidade.infraestructure.util.MaternidadeException;

@Resource
@Path("parto")
public class PartoController {

	private Result result;
	private Validator validator;
	private PartoApplication partoApplication;

	public PartoController(Result result, Validator validator) {
		this.result = result;
		this.validator = validator;
		this.partoApplication = new PartoApplicationImpl();
	}

	@Get
	@Path({ "", "/" })
	public void inicio() {

	}

	@Get
	@Path("buscas")
	public void buscas() {

	}

	@Post
	@Path("resultado/dia")
	public void listar(String data) {
		DateFormat formatData = new SimpleDateFormat("yyyy-MM-dd");
		List<Parto> partos = null;

		Date dia = null;
		try {
			dia = formatData.parse(data);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(dia);

		try {
			partos = partoApplication.buscarPartosPorDia(calendar);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Parto"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(PartoController.class).buscas();
		result.include("partos", partos);
	}

	@Post
	@Path("resultado/dia/tipo")
	public void listar(String data, TipoParto tipoParto) {
		System.out.println(tipoParto);
		DateFormat formatData = new SimpleDateFormat("yyyy-MM-dd");
		List<Parto> partos = null;

		Date dia = null;

		try {
			dia = formatData.parse(data);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(dia);

		try {
			partos = partoApplication.buscarPartosPorDiaETipo(calendar,
					tipoParto);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Parto"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(PartoController.class).buscas();
		result.include("partos", partos);
	}

	@Post
	@Path("resultado/periodo")
	public void listar(String dataInicial, String dataFinal) {
		DateFormat formatData = new SimpleDateFormat("yyyy-MM-dd");
		List<Parto> partos = null;

		Date inicio = null, fim = null;

		try {
			inicio = formatData.parse(dataInicial);
			fim = formatData.parse(dataFinal);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Calendar calendarInicio = Calendar.getInstance();
		calendarInicio.setTime(inicio);

		Calendar calendarFim = Calendar.getInstance();
		calendarFim.setTime(fim);

		try {
			partos = partoApplication.buscarPartosPorMes(calendarInicio,
					calendarFim);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Parto"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(PartoController.class).buscas();
		result.include("partos", partos);
	}

	@Post
	@Path("resultado/periodo/tipo")
	public void listar(String dataInicial, String dataFinal, TipoParto tipoParto) {
		DateFormat formatData = new SimpleDateFormat("yyyy-MM-dd");
		List<Parto> partos = null;

		Date inicio = null, fim = null;

		try {
			inicio = formatData.parse(dataInicial);
			fim = formatData.parse(dataFinal);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Calendar calendarInicio = Calendar.getInstance();
		calendarInicio.setTime(inicio);

		Calendar calendarFim = Calendar.getInstance();
		calendarFim.setTime(fim);

		try {
			partos = partoApplication.buscarPartosPorMesETipo(calendarInicio,
					calendarFim, tipoParto);
		} catch (MaternidadeException e) {
			validator.add(new ValidationMessage(e.getMessage(), "Parto"));
			e.printStackTrace();
		}

		validator.onErrorUsePageOf(PartoController.class).buscas();
		result.include("partos", partos);
	}

}
