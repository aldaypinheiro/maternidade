package br.edu.fjn.maternidade.component;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;
import br.edu.fjn.maternidade.application.HospitalApplication;
import br.edu.fjn.maternidade.application.impl.HospitalApplicationImpl;
import br.edu.fjn.maternidade.domain.hospital.Funcionario;
import br.edu.fjn.maternidade.domain.hospital.Hospital;
import br.edu.fjn.maternidade.domain.usuario.Usuario;

@Component
@SessionScoped
public class SessionComponent {

	private Usuario logado = null;
	private Funcionario funcionario = null;
	private Hospital hospital;
	private HospitalApplication hospitalApplication;
	
	public SessionComponent() {
		hospitalApplication = new HospitalApplicationImpl();
		hospital = hospitalApplication.getHospital();
	}
	
	public Hospital getHospital() {
		return hospital;
	}
	
	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}
	
	public Funcionario getFuncionario() {
		return funcionario;
	}
	
	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}
	
	public Usuario getLogado() {
		return logado;
	}
	
	public void setLogado(Usuario usuario) {
		this.logado = usuario;
	}
	
	public void login(Usuario usuario) {
		this.logado = usuario;
	}
	
	public void logout() {
		this.logado = null;
		this.funcionario = null;
	}
	
}
