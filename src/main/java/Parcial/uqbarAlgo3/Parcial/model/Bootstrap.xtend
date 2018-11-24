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
		])
		
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Walter White"
			email = "awdsxc@gmail.com"
			telefono = "1523467981"
			favorito = true
		])
		
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "Barry Allen"
			email = "tdhgthjynd@yahoo.com"
			telefono = "1523467983"
		])
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "asdrg Allen"
			email = "sgfasdrg@yahoo.com"
			telefono = "1521237983"
		])
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "uuuuuuuuu"
			email = "vbnvbnrtn@yahoo.com"
			telefono = "1555467983"
		])
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "rtyrtyrty"
			email = "ghjghj@yahoo.com"
			telefono = "152356783"
		])
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "oooooooooo"
			email = "erteert@yahoo.com"
			telefono = "1876543983"
		])
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "iuiuiuiuii"
			email = "qweqweqwe@yahoo.com"
			telefono = "151237953"
		])
		agenda.agregarContacto(new Contacto() => [
			nombreApellido = "jkhljkl"
			email = "tyutyu@yahoo.com"
			telefono = "156821846"
		])
		
	}
	
}
