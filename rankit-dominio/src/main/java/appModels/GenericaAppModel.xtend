package appModels

interface GenericaAppModel {
	def String getLabelNombre1()

	def String getLabelValor1()
    
	def String getLabelNombre2()

	def String getLabelValor2()

	def String getLabelNombre3()

	def String getLabelValor3()
    
	def String getLabelNombre4()

	def String getLabelValor4()
	  
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
