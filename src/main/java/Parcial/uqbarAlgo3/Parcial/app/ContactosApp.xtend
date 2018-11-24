package Parcial.uqbarAlgo3.Parcial.app

import Parcial.uqbarAlgo3.Parcial.model.Contacto
import Parcial.uqbarAlgo3.Parcial.model.ContactosModel
import org.uqbar.xtrest.api.XTRest

class ContactosApp {


def static void main(String[] args) {
	
		XTRest.start(9000, Contacto, ContactosModel)
	}	
}