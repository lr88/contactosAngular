package iu

import org.uqbar.arena.Application
import Parcial.uqbarAlgo3.Parcial.model.Bootstrap
import Parcial.uqbarAlgo3.Parcial.window.ContactosWindow

class ContactosApplication extends Application {

	new(Bootstrap bootstrap){
		super(bootstrap)
	}

	static def void main(String[] args) {
		new ContactosApplication(new Bootstrap).start()
	}

	override protected createMainWindow() {
		return new ContactosWindow(this)
	}
}