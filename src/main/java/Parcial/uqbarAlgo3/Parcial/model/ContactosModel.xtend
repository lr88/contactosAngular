package Parcial.uqbarAlgo3.Parcial.model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.applicationContext.ApplicationContext

@Accessors
@TransactionalAndObservable
class ContactosModel{
	
	Contacto contactoSeleccionado
	String nombreApellidoNuevo 
	String telefonoNuevo 
	String emailNuevo 
	
	def getContactos() {
		agenda.contactos
	}
	
	def Agenda getAgenda(){
		ApplicationContext.instance.getSingleton(typeof(Contacto))
	}
	
	def agregarContacto(){
		agenda.agregarContacto(new Contacto =>[
			nombreApellido = nombreApellidoNuevo
			telefono = telefonoNuevo
			email = emailNuevo
		])
		nombreApellidoNuevo = null
		telefonoNuevo = null
		emailNuevo = null
	}
	
	def cambiarFavorito(){
		contactoSeleccionado.toggleFavorito
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
