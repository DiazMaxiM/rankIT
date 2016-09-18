package test

import edu.unq.interfaces.rankit_dominio.PuntuableAppModel
import edu.unq.interfaces.rankit_dominio.Calificacion
import static org.junit.Assert.*;
import org.junit.Before
import org.junit.Test

import static org.mockito.Mockito.*
import edu.unq.interfaces.rankit_dominio.Puntuable
import edu.unq.interfaces.rankit_dominio.Usuario
import edu.unq.interfaces.rankit_dominio.AdmPuntuables
import edu.unq.interfaces.rankit_dominio.AdmCalificaciones
import edu.unq.interfaces.rankit_dominio.AdapterLugarAppModel

class AdpterLugarAppModelTest {
 
	var PuntuableAppModel puntuableAppModelMock
	var AdapterLugarAppModel adapterLugarAppModel

	@Before
	def void SetUp() {
		
        puntuableAppModelMock = mock(typeof(PuntuableAppModel))
        adapterLugarAppModel=new AdapterLugarAppModel(puntuableAppModelMock)
	}
	/**
	 * En este test quiero probar que cuando le pregunto a mi appModel 
	 * cuantos puntuables hay inscriptos, este me responde 5 
	 */
	@Test
	def testPuntuablesInscriptos(){
		when(puntuableAppModelMock.inscriptos).thenReturn(5);
        assertEquals(adapterLugarAppModel.labelValor1,"5")
        
	}
	
	@Test 
	def testPuntuablesHabilitados(){
		when(puntuableAppModelMock.habilitados).thenReturn(2);
		assertEquals(adapterLugarAppModel.labelValor2,"2")	
	}
}