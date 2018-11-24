package Parcial.uqbarAlgo3.Parcial.window

import Parcial.uqbarAlgo3.Parcial.model.Contacto
import Parcial.uqbarAlgo3.Parcial.model.ContactosModel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.model.utils.ObservableUtils

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class ContactosWindow extends Window<ContactosModel> {

	new(WindowOwner parent) {
		super(parent, new ContactosModel)
	}

	override createContents(Panel mainPanel) {
		new Label(mainPanel).text = "Buscador de Contactos"
		var Panel buscador = new Panel(mainPanel)
		panelSuperior(buscador)
		var Panel contactos = new Panel(mainPanel)
		contactos.layout = new ColumnLayout(2)
		new Label(contactos).text = "Tabla de Contactos"
		new Label(contactos).text = "Nuevo Contacto"
		panelIzq(contactos)
		panelDer(contactos)
		new Label(contactos).text = ""
		new Label(contactos).text = ""
	}
	
	def panelSuperior(Panel panel) {
		panel.layout = new ColumnLayout(3)
		new TextBox(panel).value <=> "stringBuscado"
		new Button(panel) => [
			caption = "Buscar"
			onClick[this.actualizar]
			]
		new Button(panel) => [
			caption = "Limpiar Busqueda"
			onClick[modelObject.stringBuscado = ""
				this.actualizar
			]
			]
	}

	def panelDer(Panel panel) {
		var Panel PanelDerecho = new Panel(panel)
		PanelDerecho.layout = new ColumnLayout(2)
		new Label(PanelDerecho).text = "Nombre y Apellido"
		new TextBox(PanelDerecho).value <=> "nombreApellidoNuevo"
		new Label(PanelDerecho).text = "Telefono"
		new TextBox(PanelDerecho).value <=> "telefonoNuevo"
		new Label(PanelDerecho).text = "Email"
		new TextBox(PanelDerecho).value <=> "emailNuevo"

		new Button(PanelDerecho) => [
			bindEnabledToProperty("enabledAgregar")
			caption = "Agergar"
			onClick[
				modelObject.agregarContacto()
				this.actualizar
			]
		]
	}

	def actualizar() {
		ObservableUtils.firePropertyChanged(modelObject, "filtro")
	}

	def panelIzq(Panel panel) {
		var Panel PanelIzquierdo = new Panel(panel)
		var unaTabla = new Table<Contacto>(PanelIzquierdo, typeof(Contacto)) => [
			items <=> "filtro"
			value <=> "contactoSeleccionado"
			numberVisibleRows = 5
		]
		new Column(unaTabla) => [
			title = "Nombre y Apellido"
			bindContentsToProperty("nombreApellido")
		]
		new Column(unaTabla) => [
			title = "Favorito"
			bindContentsToProperty("favorito").transformer = [Boolean recibe|if(recibe) "SI" else "NO"]
		]

		new Button(PanelIzquierdo) => [
			caption = "Favorito"
			onClick[modelObject.cambiarFavorito]
			bindEnabledToProperty("eneableCambiarFavorito")
		]
		new Button(PanelIzquierdo) => [
			caption = "Editar"
			onClick[this.editarContactoEnVentana()]
			bindEnabledToProperty("eneableCambiarFavorito")
		]
	}

	def editarContactoEnVentana() {
		new EdicionContactoWindow(this, modelObject.contactoSeleccionado) => [open]
		modelObject.contactoSeleccionado = null
	}
}
