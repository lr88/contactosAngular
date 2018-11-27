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
	
	@Put('/buscar')
	def Result buscar(@Body String body){
		stringBuscado = body.getPropertyValue("stringBuscado")
		ok('{ "status" : "OK" }');
	}
	
	def getContactosFiltrados(){
		return contactos.filter[cont | 
			cont.nombreApellido.contains(stringBuscado)||
			 cont.email.contains(stringBuscado) ||
			  cont.telefono == stringBuscado
		].toList
	}
	
	
	@Put('/agregarContacto')
	def Result agregarContacto(@Body String body){
		Bootstrap.instance.agenda.agregarContacto(body.fromJson(Contacto))
		ok('{ "status" : "OK" }');
	}
	
	@Put('/cambiarFavorito')
	def Result cambiarFavorito(@Body String body){
		contactoSeleccionado.toggleFavorito
		ok('{ "status" : "OK" }');
	}
	
	@Put('/contactoSeleccionado')
	def Result contactoSeleccionado(@Body String body){
		contactoSeleccionado = encontrarContacto(body)
		ok('{ "status" : "OK" }');
	}
	@Get("/contactoSeleccionado")
	def Result contactoSeleccionado(){
		try {
			print(contactoSeleccionado.nombreApellido + "s")
			ok(contactoSeleccionado.toJson) 
		} catch (Exception e) {
			internalServerError(e.message)
		}
	}
	
	def parsearANumero(String body) {
		return Integer.parseInt(body.getPropertyValue("id"))
	}
	
	@Put('/editarContacto')
	def Result editarContacto(@Body String body){
		contactoSeleccionado.nombreApellido = body.getPropertyValue("nombreApellido")
		contactoSeleccionado.email = body.getPropertyValue("email")
		contactoSeleccionado.telefono = body.getPropertyValue("telefono")
		ok('{ "status" : "OK" }');
	}
	
	def encontrarContacto(String body){
		return getContactosFiltrados.filter[cont | cont.id == parsearANumero(body)].get(0)
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
