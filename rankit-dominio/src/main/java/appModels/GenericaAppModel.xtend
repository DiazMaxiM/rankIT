package appModels

interface GenericaAppModel {

	def String getDescripcionDato1ResumenDeSituacion()

	def String getValorDato1ResumenDeSituacion()

	def String getDescripcionDato2ResumenDeSituacion()

	def String getValorDato2ResumenDeSituacion()

	def String getDescripcionDato3ResumenDeSituacion()

	def String getValorDato3ResumenDeSituacion()

	def String getDescripcionDato4ResumenDeSituacion()

	def String getValorDato4ResumenDeSituacion()

	def String tituloContenedorBusqueda()

	def String textoPrimerParametroDeBusqueda()

	def String getPrimerParametroDeBusqueda()

	def String textoSegundoParametroDeBusqueda()

	def String getSegundoParametroDeBusqueda()

	def void nuevo()

	def void eliminar()

	def CalificacionAppModel getElementosNecesariosParaAdmCalificacionWindow()

	def void blanquearContrasenha()

}
