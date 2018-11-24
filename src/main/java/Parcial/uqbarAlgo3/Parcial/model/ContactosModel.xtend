package Parcial.uqbarAlgo3.Parcial.model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.api.annotation.Body

@Controller
@Accessors
@TransactionalAndObservable
class ContactosModel{
	
	extension JSONUtils = new JSONUtils
	Contacto contactoSeleccionado
	String nombreApellidoNuevo 
	String telefonoNuevo 
	String emailNuevo 
	String stringBuscado = ""
	
	new() {
		Bootstrap.instance.run
	}
	
	def getContactos() {
		Bootstrap.instance.agenda.contactos
	}
	@Get("/contactos")
	def Result getFiltro(){
		try {
			val contactos = (getContactosFiltrados)
			ok(contactos.toJson) 
		} catch (Exception e) {
			internalServerError(e.message)
		}
	}
	
	
	def getContactosFiltrados(){
		return contactos.filter[cont | 
			cont.nombreApellido.contains(stringBuscado)||
			 cont.email.contains(stringBuscado) ||
			  cont.telefono == stringBuscado
		].toList
	}
	
	def agregarContacto(){
		Bootstrap.instance.agenda.agregarContacto(new Contacto =>[
			nombreApellido = nombreApellidoNuevo
			telefono = telefonoNuevo
			email = emailNuevo
		])
	}
	
	@Put('/cambiarFavorito')
	def Result cambiarFavorito(@Body String body){
		print(body)
		var contactoSeleccionado = getContactosFiltrados.filter[cont | cont.nombreApellido == body.getPropertyValue("nombreApellido")].get(0)
		contactoSeleccionado.toggleFavorito
		print(contactoSeleccionado.favorito)
		ok('{ "status" : "OK" }');
	}
	
	@Dependencies("contactoSeleccionado")
	 def getEneableCambiarFavorito(){
	 	contactoSeleccionado !== null
	 }
	 
	 @Dependencies("nombreApellidoNuevo","telefonoNuevo","emailNuevo")
	 def getEnabledAgregar(){
	 	validar(nombreApellidoNuevo) && validar(telefonoNuevo) && validar(emailNuevo)
	 }
	
	 def validar(String unString){
	 	unString !== null && unString !== ""
	 }
	
}
