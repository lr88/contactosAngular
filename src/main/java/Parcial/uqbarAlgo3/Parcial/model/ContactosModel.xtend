package Parcial.uqbarAlgo3.Parcial.model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors//////////
@TransactionalAndObservable
class ContactosModel{
	Bootstrap bootstrap = new Bootstrap
	Agenda agenda = new Agenda
	Contacto contactoSeleccionado
	Contacto contactoNuevo = new Contacto()
	
	
	def getContactos(){
		agenda
	}
	
	def agregarContacto(){
		agenda.agregarContacto(contactoSeleccionado)
		contactoSeleccionado = null
	}

	def cambiarFavorito(){
		contactoSeleccionado.toggleFavorito
	}
	
	@Dependencies("contactoSeleccionado")
	 def getEneableCambiarFavorito(){
	 	contactoSeleccionado !== null
	 }
	 
	 @Dependencies("contactoNuevo")
	 def boolean getEnabledAgregar(){
	 	validar(contactoNuevo.nombreApellido) && validar(contactoNuevo.telefono) && validar(contactoNuevo.email)
	 }
	
	 def boolean validar(String unString){
	 	unString !== null && unString !== ""
	 }
	
	
}
