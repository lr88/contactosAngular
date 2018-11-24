package Parcial.uqbarAlgo3.Parcial.model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.xtrest.api.annotation.Controller

@Controller
@Accessors
@TransactionalAndObservable
class Contacto {
	
	String nombreApellido
	String email
	String telefono
	Boolean favorito = false
	
	def toggleFavorito() {
		favorito = !favorito
	}
	@Dependencies("nombreApellido", "email", "telefono")
	def getEnabledEditar(){
	 	validar(nombreApellido) && validar(telefono) && validar(email)
	 }
	
	 def boolean validar(String unString){
	 	unString !== null && unString !== ""
	 }
	
}
