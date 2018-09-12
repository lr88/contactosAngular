package Parcial.uqbarAlgo3.Parcial.window

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox

class ContactosWindow extends MainWindow<ContactosModel> {//////////

	new(ContactosModel model) {
		super(model)
	}

	override createContents(Panel mainPanel) {
		mainPanel.layout = new ColumnLayout(2)
		new Label(mainPanel).text = "Tabla de Contactos"
		new Label(mainPanel).text = "Nuevo Contacto"
		panelIzq(mainPanel)
		panelDer(mainPanel)
		new Label(mainPanel).text = ""
		new Label(mainPanel).text = ""

	}

	def panelDer(Panel panel) {
		var PanelDerecho = new Panel(panel)
		PanelDerecho.layout = new ColumnLayout(2)
		new Label(PanelDerecho).text = "Nombre y Apellido"
		new TextBox(PanelDerecho).value <=> "contactoNuevo.nombreApellido"
		new Label(PanelDerecho).text = "Telefono"
		new TextBox(PanelDerecho).value <=> "contactoNuevo.telefono"
		new Label(PanelDerecho).text = "Email"
		new TextBox(PanelDerecho).value <=> "contactoNuevo.email"
		new Button(PanelDerecho) => [
			enabled <=> "enabledAgregar"
			caption = "Agergar"
			onClick[modelObject.agregarContacto()]
		]
	}

	def panelIzq(Panel panel) {
		new Table(panel, typeof(Contacto)) => [
			numberVisibleRows = 5
			items <=> "contactos"
			value <=> "contactoSeleccionado"
			new Column(it) => [
				title = "Nombre y Apellido"
				fixedSize = 100
				bindContentsToProperty("nombreApellido")
			]
			new Column(it) => [
				title = "Favorito"
				fixedSize = 100
				bindContentsToProperty("favorito").transformer = [Boolean recibe|if(recibe) "SI" else "NO"]
			]
		]
		new Button(panel) => [
			caption = "Favorito"
			onClick[modelObject.cambiarFavorito]
			bindEnabledToProperty("eneableCambiarFavorito")
		]
		new Button(panel) => [
			caption = "Editar"
			onClick[this.editarContactoEnVentana()]
			bindEnabledToProperty("eneableCambiarFavorito")
		]
		
	}
	//new EdicionContactoWindow(this,)
	def editarContactoEnVentana() {
		new EdicionContactoWindow(this,modelObject.contactoSeleccionado)=>[open]
	}

	static def void main(String[] args) {
		new EventosApplication(new Bootstrap).start()
	}

}
