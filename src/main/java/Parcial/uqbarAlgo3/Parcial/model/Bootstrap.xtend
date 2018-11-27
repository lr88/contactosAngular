package Parcial.uqbarAlgo3.Parcial.model

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Bootstrap extends CollectionBasedBootstrap{
	
	Agenda agenda = new Agenda
	
	static Bootstrap bootstrap

	def static Bootstrap getInstance() {
		if (bootstrap === null) {
			bootstrap = new Bootstrap
		}
		bootstrap
	}
	
	override run() {
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Rick Grimes"
			email = "rick@hotmail.com"
			telefono = "1523467980"
			favorito = false
		])
		
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Walter White"
			email = "White@gmail.com"
			telefono = "1523467981"
			favorito = true
		])
		
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Barry Allen"
			email = "Barry@yahoo.com"
			telefono = "1523467983"
			
		])
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Ortega  Allen"
			email = "Ortega@yahoo.com"
			telefono = "1521237983"
		])
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Jaime Mora Iglesias"
			email = "JaimeMoraIglesias@yahoo.com"
			telefono = "1555467983"
		])
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Samuel Fuentes Garcia"
			email = "SamuelFuentes@yahoo.com"
			telefono = "152356783"
		])
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Héctor Dominguez"
			email = "HéctorDominguez@yahoo.com"
			telefono = "1876543983"
		])
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Adam Cortes"
			email = "AdamCortes@yahoo.com"
			telefono = "151237953"
		])
		
	}
	
}
