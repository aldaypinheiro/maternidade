package br.edu.fjn.maternidade.controller;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.edu.fjn.maternidade.application.EnderecoApplication;
import br.edu.fjn.maternidade.application.impl.EnderecoApplicationImpl;
import br.edu.fjn.maternidade.domain.endereco.Cidade;

@Resource
@Path("endereco")
public class EnderecoController {

	private Result result;
	private EnderecoApplication enderecoApplication;
	
	public EnderecoController(Result result) {
		this.result = result;
		this.enderecoApplication = new EnderecoApplicationImpl();
	}
	
	@Get
	@Path({"", "/"})
	public void inicio() {
		result.redirectTo(IndexController.class).index();
	}
	
	@Post
	@Path("cidades")
	public void buscaCidadePorEstado(Integer id) {
		List<Cidade> cidades;
		
		cidades = enderecoApplication.listarCidadePorEstado(enderecoApplication.buscarEstadoPorId(id));
		
		result.use(Results.json()).from(cidades, "cidades").serialize();
		result.nothing();
	}
}
