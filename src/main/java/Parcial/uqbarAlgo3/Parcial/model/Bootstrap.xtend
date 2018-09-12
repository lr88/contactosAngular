package Parcial.uqbarAlgo3.Parcial.model

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.annotations.Dependencies

class Bootstrap {/////////
	
	static def getAgenda() {
		var agenda = new Agenda
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Rick Grimes"
			email = "rick@hotmail.com"
			telefono = "1523467980"
		])
		
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Walter White"
			email = "wally@gmail.com"
			telefono = "1523467981"
			favorito = true
		])
		
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Barry Allen"
			email = "barry@yahoo.com"
			telefono = "1523467983"
			
		])
		
		return agenda
	}
	
}
@Accessors
@Observable
class Contacto {
	
	String nombreApellido
	String email
	String telefono
	boolean favorito = false
	
	def toggleFavorito() {
		favorito = !favorito
	}
	@Dependencies(#["nombreApellido", "email", "telefono"])
	def getEnabledEditar(){
	 	validar(nombreApellido) && validar(telefono) && validar(email)
	 }
	
	 def boolean validar(String unString){
	 	unString !== null && unString !== ""
	 }
	
}

@Accessors
@Observable
class Agenda {
	
	List<Contacto> contactos = new ArrayList
	
	def agregarContacto(Contacto contacto) {
		contactos.add(contacto)
	}
	
	
	
}
