package Parcial.uqbarAlgo3.Parcial.model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Agenda {
	
	List<Contacto> contactos = newArrayList
	
	def agregarContacto(Contacto contacto) {
		contacto.id = contactos.size
		contactos.add(contacto)
	}
	
}
