package Parcial.uqbarAlgo3.Parcial.window

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EdicionContactoWindow extends TransactionalDialog<Contacto> {///////

	new(WindowOwner owner, Contacto model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {
		var edicionPanel = new Panel(mainPanel)
		edicionPanel.layout = new ColumnLayout(2)
		new Label(edicionPanel).text = "Nombre y Apellido"
		new TextBox(edicionPanel).value <=> "nombreApellido"
		new Label(edicionPanel).text = "Telefono"
		new TextBox(edicionPanel).value <=> "telefono"
		new Label(edicionPanel).text = "Email"
		new TextBox(edicionPanel).value <=> "email"
	}

	override protected void addActions(Panel actions) { 
		new Button(actions) => [
			enabled <=> "enabledEditar"
			caption = "Aceptar"
			onClick [|this.accept]
		]
	}
}
