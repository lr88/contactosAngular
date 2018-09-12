package Parcial.uqbarAlgo3.Parcial.model

import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap

class Bootstrap extends CollectionBasedBootstrap{
	
	var Agenda agenda
	
	new (){
		ApplicationContext.instance.configureSingleton(typeof(Contacto), new Agenda)
		agenda = ApplicationContext.instance.getSingleton(typeof(Contacto)) as Agenda
	}
	
	override run() {
		
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
	}
	
}
