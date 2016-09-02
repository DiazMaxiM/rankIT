package edu.unq.interfaces.rankit_dominio

import org.junit.Test
import static org.junit.Assert.* 
class RankITTest {
	
/**
 *  testeo de  Adminstracion de Lugares 
 * 
 */
 
	@Test
	def testAgregoUnLugarNuevoYLaCantidadDeLugaresDeshabilitadosEsUno(){

		var rankIt=new RankIT
		rankIt.agregarLugarNuevo()
		
		assertEquals(rankIt.lugaresDeshabilitados(),1)
		
		
	}

	@Test
	def testAgregoUnLugarNuevoLoHabilitoYLaCantidadDeLugareshabilitadosEsUno(){
		var rankIt=new RankIT
		rankIt.agregarLugarNuevo()
		//le asigno un nombre al lugar Nuevo y lo habilito 
		var lugar=rankIt.devolverLugarSinDatos()
		rankIt.asignarNombreAlLugar(lugar,"Jumbo")
		rankIt.habilitarLugar(lugar)
		
		assertEquals(rankIt.lugaresHabilitados(),1)
		
	}
	
	
	@Test
	def testAgregoDosLugaresNuevosYLaCantidadDeLugaresInscriptosEsDos(){
	    var rankIt=new RankIT
		rankIt.agregarLugarNuevo()
		rankIt.agregarLugarNuevo()
		rankIt.agregarLugarNuevo()
		
		assertEquals(rankIt.lugaresInscriptos(),3)
		
		
	}
	
     /**
     * En este test se quiere probar que cuando elimino un lugar la cantidad de lugares inscriptos disminuye
     * 
     * 
     */
   
    
    @Test
	def testAgregoDosLugarNuevosEliminoUnoYLaCantidadDeLugaresInscriptosEsUno(){
		var rankIt=new RankIT
		rankIt.agregarLugarNuevo()
		rankIt.agregarLugarNuevo()
		//le asigno un nombre a los lugares Nuevos  
		var lugar1=rankIt.devolverLugarSinDatos()
		var lugar2=rankIt.devolverLugarSinDatos()
		rankIt.asignarNombreAlLugar(lugar1,"Jumbo")
		rankIt.asignarNombreAlLugar(lugar2,"Hoyts")
		rankIt.eliminarLugar(lugar2)
		
		assertEquals(rankIt.lugaresInscriptos(),1)
		
		
	}	
	
	/**
	 * En este test pruebo que cuando agrego tres lugares nuevos, y habilitos dos tengo como resultado 
	 * tres lugares inscriptos, dos habilitados y uno deshabilitado 
	 * 
	 */
	@Test
	def testAgregoTresLugaresNuevosHabilitoDosYLaCantidadDeLugaresHabilitadosEsDos(){
	
		var rankIt=new RankIT
		rankIt.agregarLugarNuevo()
		rankIt.agregarLugarNuevo()
		rankIt.agregarLugarNuevo()
		
		//le asigno un nombre a los lugares Nuevos y habilito dos  
		var lugar1=rankIt.devolverLugarSinDatos()
		var lugar2=rankIt.devolverLugarSinDatos()
		rankIt.asignarNombreAlLugar(lugar1,"Jumbo")
		rankIt.asignarNombreAlLugar(lugar2,"Easy")
		
	    rankIt.habilitarLugar(lugar1)
	    rankIt.habilitarLugar(lugar2)
	
		assertEquals(rankIt.lugaresInscriptos(),3)
		assertEquals(rankIt.lugaresHabilitados(),2)
		assertEquals(rankIt.lugaresDeshabilitados(),1)
	}
	
	@Test
	def testBuscoUnLugarPorSuNombre(){
	    var rankIt=new RankIT
		rankIt.agregarLugarNuevo()
		rankIt.agregarLugarNuevo()
		rankIt.agregarLugarNuevo()
		
		//le asigno un nombre a los lugares Nuevos 
		var lugar1=rankIt.devolverLugarSinDatos()
		var lugar2=rankIt.devolverLugarSinDatos()
		var lugar3=rankIt.devolverLugarSinDatos()
		rankIt.asignarNombreAlLugar(lugar1,"Jumbo")
		rankIt.asignarNombreAlLugar(lugar2,"Grido")
		rankIt.asignarNombreAlLugar(lugar3,"Panaderia San Cayetano")
        var panaderiaSanCayetano= rankIt.buscarLugarPorSuNombre("Panaderia San Cayetano")
		assertEquals(panaderiaSanCayetano,lugar3)
		
		
	}
	
	 /**
  * En este test se quiere probar que cuando elimino un lugar se actualiza
  * la cantidad de lugares inscriptos,habilitados y deshabilitados
  * 
  */	
	
	@Test
	def testEliminoLugarYSeActualizanLosDatos(){
		
	   var rankIt=new RankIT
		rankIt.agregarLugarNuevo()
		rankIt.agregarLugarNuevo()
		rankIt.agregarLugarNuevo()
		//le asigno un nombre a los lugares Nuevos  
		var lugar1=rankIt.devolverLugarSinDatos()
		var lugar2=rankIt.devolverLugarSinDatos()
		var lugar3=rankIt.devolverLugarSinDatos()
		
		rankIt.asignarNombreAlLugar(lugar1,"Jumbo")
		rankIt.asignarNombreAlLugar(lugar2,"Easy")
		rankIt.asignarNombreAlLugar(lugar3,"Grido")
		//habilito dos lugares
		rankIt.habilitarLugar(lugar1)
	    rankIt.habilitarLugar(lugar2)
	    //elimino lugar3 
	    rankIt.eliminarLugar(lugar3)
	 
		assertEquals(rankIt.lugaresInscriptos(),2)
		assertEquals(rankIt.lugaresHabilitados(),2)
		assertEquals(rankIt.lugaresDeshabilitados(),0)
		
	}
	/**
  * En este test se quiere probar que cuando baneo un lugar se actualiza
  * la cantidad de lugares inscriptos,habilitados y deshabilitados
  * 
  */		

	@Test
	def testBaneoUnLugarYEsteQuedaDeshabilitado(){
		
	   var rankIt=new RankIT
		rankIt.agregarLugarNuevo()
		rankIt.agregarLugarNuevo()
		rankIt.agregarLugarNuevo()
		//le asigno un nombre a los lugares Nuevos  
		var lugar1=rankIt.devolverLugarSinDatos()
		var lugar2=rankIt.devolverLugarSinDatos()
		var lugar3=rankIt.devolverLugarSinDatos()
		
		rankIt.asignarNombreAlLugar(lugar1,"Jumbo")
		rankIt.asignarNombreAlLugar(lugar2,"Easy")
		rankIt.asignarNombreAlLugar(lugar3,"Grido")
		//habilito dos lugares
		rankIt.habilitarLugar(lugar1)
	    rankIt.habilitarLugar(lugar2)
	    //Baneo un lugar
	    rankIt.deshabilitarLugar(lugar2)
	    
		assertEquals(rankIt.lugaresInscriptos(),3)
		assertEquals(rankIt.lugaresHabilitados(),1)
		assertEquals(rankIt.lugaresDeshabilitados(),2)
		
		
	}
	 /**
  * En este test se quiere probar que cuando se quiere eliminar un servicio
  * que no esta registrado se produce una excepcion 
  * 
  */
	
	@Test(expected=NoSePuedeEliminarException)
	def testEliminoUnLugarQueNoEstaRegistrado(){
		
	    var rankIt=new RankIT
		rankIt.agregarLugarNuevo()
		rankIt.agregarLugarNuevo()
		//le asigno un nombre a los lugares Nuevos  
		var lugar1=rankIt.devolverLugarSinDatos()
		var lugar2=rankIt.devolverLugarSinDatos()
		
		rankIt.asignarNombreAlLugar(lugar1,"Jumbo")
		rankIt.asignarNombreAlLugar(lugar2,"Easy")
		//habilito dos lugares
		rankIt.habilitarLugar(lugar1)
	    rankIt.habilitarLugar(lugar2)
	    //Intento eliminar un lugar que no esta registrado
	    var lugar3=new Lugar 
	    rankIt.eliminarLugar(lugar3)
	    
		
	}	
	
/**
  *  Testeo La Adminstracion de Servivicios  
  */
  
  
    @Test
	def testAgregoUnServicioNuevoYLaCantidadDeServiciosDeshabilitadosEsUno(){

		var rankIt=new RankIT
		rankIt.agregarServicioNuevo()
		
		assertEquals(rankIt.serviciosDeshabilitados(),1)
		
		
	}
	
	@Test
	def testAgregoUnServicioHabilitadoYLaCantidadDeServiciosHabilitadosEsCero(){

		var rankIt=new RankIT
		rankIt.agregarServicioNuevo()
		
		assertEquals(rankIt.serviciosHabilitados(),0)
		
   }
   
   @Test
	def testAgregoUnServicioNuevoLoHabilitoYLaCantidadDeServiciosHabilitadosEsUno(){
	    var rankIt=new RankIT
		rankIt.agregarServicioNuevo()
		var servicio=rankIt.devolverServicioSinDatos()
		rankIt.asignarNombreAlServicio(servicio,"Edesur")
		rankIt.habilitarServicio(servicio)
		
		assertEquals(rankIt.serviciosHabilitados(),1)		
	}
	
	@Test
	def testAgregoDosServicioNuevosYLaCantidadDeServiciosInscriptosEsDos(){
		var rankIt=new RankIT
		rankIt.agregarServicioNuevo()
		rankIt.agregarServicioNuevo()
		var servicio1=rankIt.devolverServicioSinDatos()
		var servicio2=rankIt.devolverServicioSinDatos()
		rankIt.asignarNombreAlServicio(servicio1,"Edesur")
		rankIt.asignarNombreAlServicio(servicio2,"Metrogas")
		rankIt.habilitarServicio(servicio1)
		assertEquals(rankIt.serviciosInscriptos(),2)		
	}
	
	 /**
   * En este test se quiere probar que cuando se habilitan servicios, la cantidad de servicios deshabilitados disminuye 
   * 
   * 
   */
  
  
  @Test
	def testAgregoTresServiciosNuevosHabilitoDosYLaCantidadDeServiviosDeshabilitadosEsUno(){
		var rankIt=new RankIT
		rankIt.agregarServicioNuevo()
		rankIt.agregarServicioNuevo()
		rankIt.agregarServicioNuevo()
		var servicio1=rankIt.devolverServicioSinDatos()
		var servicio2=rankIt.devolverServicioSinDatos()
		rankIt.asignarNombreAlServicio(servicio1,"Edesur")
		rankIt.asignarNombreAlServicio(servicio2,"Metrogas")
		rankIt.habilitarServicio(servicio1)
	    rankIt.habilitarServicio(servicio2)
	    assertEquals(rankIt.serviciosInscriptos(),3)
		assertEquals(rankIt.serviciosHabilitados(),2)
		assertEquals(rankIt.serviciosDeshabilitados(),1)
		
		}
		
	
      /**
     * En este test se quiere probar que cuando elimino un servicio la cantidad de lugares inscriptos disminuye
     * 
     * 
     */
   
	
	@Test
	def testAgregoTresServiciosNuevosEliminoUnoYLaCantidadDeLugaresInscriptosEsDos(){
		var rankIt=new RankIT
		rankIt.agregarServicioNuevo()
		rankIt.agregarServicioNuevo()
		rankIt.agregarServicioNuevo()
		var servicio1=rankIt.devolverServicioSinDatos()
		var servicio2=rankIt.devolverServicioSinDatos()
		rankIt.asignarNombreAlServicio(servicio1,"Edesur")
		rankIt.asignarNombreAlServicio(servicio2,"Metrogas")
	    rankIt.eliminarServicio(servicio2)
	    assertEquals(rankIt.serviciosInscriptos(),2)
		
		}		
		
	
	 /**
  * En este test se quiere probar que cuando elimino un Servicio se actualiza
  * la cantidad de servicios inscriptos,habilitados y deshabilitados
  * 
  */	
	
	@Test
	def testEliminoUnServicio(){
		
	    var rankIt=new RankIT
		rankIt.agregarServicioNuevo()
		rankIt.agregarServicioNuevo()
		rankIt.agregarServicioNuevo()
		var servicio1=rankIt.devolverServicioSinDatos()
		var servicio2=rankIt.devolverServicioSinDatos()
		rankIt.asignarNombreAlServicio(servicio1,"Edesur")
		rankIt.asignarNombreAlServicio(servicio2,"Metrogas")
		rankIt.habilitarServicio(servicio1)
		rankIt.habilitarServicio(servicio2)
	    //Elimino un servicio 
	    
	    rankIt.eliminarServicio(servicio2)
	    
	    assertEquals(rankIt.serviciosInscriptos(),2)
		assertEquals(rankIt.serviciosHabilitados(),1)
		assertEquals(rankIt.serviciosDeshabilitados(),1)
				
	}
		
	/**
  * En este test se quiere probar que cuando se quiere eliminar un servicio
  * que no esta registrado se produce una excepcion 
  * 
  */
	
	@Test(expected=NoSePuedeEliminarException)
	def testEliminoUnServicioQueNoEstaRegistrado(){
		var rankIt=new RankIT
		rankIt.agregarServicioNuevo()
		rankIt.agregarServicioNuevo()
		rankIt.agregarServicioNuevo()
		var servicio1=rankIt.devolverServicioSinDatos()
		var servicio2=rankIt.devolverServicioSinDatos()
		rankIt.asignarNombreAlServicio(servicio1,"Edesur")
		rankIt.asignarNombreAlServicio(servicio2,"Metrogas")
		
        //intento eliminar un servicio que no esta registrado
        var antina=new Servicio
	    rankIt.eliminarServicio(antina)
	    
		
	}	
	
  /**
  * En este test se quiere probar que cuando baneo un servicio se actualiza
  * la cantidad de servicios habilitados y deshabilitados
  * 
  */		

	@Test
	def testBanneoUnServicioYEsteQuedaDeshabilitado(){
		
	    var rankIt=new RankIT
		rankIt.agregarServicioNuevo()
		rankIt.agregarServicioNuevo()
		rankIt.agregarServicioNuevo()
		var servicio1=rankIt.devolverServicioSinDatos()
		var servicio2=rankIt.devolverServicioSinDatos()
		rankIt.asignarNombreAlServicio(servicio1,"Edesur")
		rankIt.asignarNombreAlServicio(servicio2,"Metrogas")
		//habilito Dos Servicios 
		
		rankIt.habilitarServicio(servicio1)
	    rankIt.habilitarServicio(servicio2)
	    
	    //Baneo un servicio 
	    
	    rankIt.deshabilitarServicio(servicio2)
	    
	    assertEquals(rankIt.serviciosInscriptos(),3)
		assertEquals(rankIt.serviciosHabilitados(),1)
		assertEquals(rankIt.serviciosDeshabilitados(),2)
		
		
	}		
				
  @Test
	def testBuscoUnServicioPorSuNombre(){
		var rankIt=new RankIT
		rankIt.agregarServicioNuevo()
		rankIt.agregarServicioNuevo()
		var servicio1=rankIt.devolverServicioSinDatos()
		var servicio2=rankIt.devolverServicioSinDatos()
		rankIt.asignarNombreAlServicio(servicio1,"Edesur")
		rankIt.asignarNombreAlServicio(servicio2,"Metrogas")
		
        var metrogas= rankIt.buscarServicioPorSuNombre("Metrogas")
		assertEquals(metrogas,servicio2)
		
		
	}
	
  
 /**
 * Testeo Administracion de Usuarios
 */
  
   @Test
   def testRegistroTresUsuariosNuevosSiendoTresLaCantidadDeUsuariosRegistrados(){
   	
   	var rankIt=new RankIT
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
   	
   	
   	
   	assertEquals(rankIt.usuariosRegistrados(),3)
   }
   
   /**
    * En este test se quiere probar que al activar usuarios, la cantidad de usuarios inactivos disminuye 
    * 
    */
   
   
   @Test
   def testRegistroTresUsuariosNuevosActivoDosYLaCantidadDeUsuariosActivosEsDos(){
   	
   	var rankIt=new RankIT
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
   	
   	//cambio sus nombres
   	var usuario1= rankIt.devolverUsuarioSinDatos()
   	var usuario2= rankIt.devolverUsuarioSinDatos()
   	var usuario3= rankIt.devolverUsuarioSinDatos()

   	
   	rankIt.cambiarNombreDelUsuario(usuario1,"Rosali")
   	rankIt.cambiarNombreDelUsuario(usuario2,"Liza")
   	rankIt.cambiarNombreDelUsuario(usuario3,"Maxi")
   	
   	
   	rankIt.activarUsuario(usuario1)
   	rankIt.activarUsuario(usuario2)
   	
   	assertEquals(rankIt.usuariosActivos(),2)
   	assertEquals(rankIt.usuariosInactivos(),1)
  }

    @Test
   def testRegistroTresUsuariosNuevosSiendoTresLaCantidadDeUsuariosInactivos(){
   	
   	var rankIt=new RankIT
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
   	
   	
   	assertEquals(rankIt.usuariosInactivos(),3)
   }
   
/**
 * En este test se quiere probar que cuando se activan tres usuarios de cuatro, pero luego 
 * se banean dos,tengo como resultados dos baneados, tres inactivos y un activo  
 * 
 */   
   @Test
   def testRegistroCuatroUsuariosNuevosYBaneoDos(){
   	
   	var rankIt=new RankIT
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
    //cambio sus nombres
   	var usuario1= rankIt.devolverUsuarioSinDatos()
   	var usuario2= rankIt.devolverUsuarioSinDatos()
   	var usuario3= rankIt.devolverUsuarioSinDatos()
   	var usuario4= rankIt.devolverUsuarioSinDatos()
   	
   	rankIt.cambiarNombreDelUsuario(usuario1,"Rosali")
   	rankIt.cambiarNombreDelUsuario(usuario2,"Liza")
   	rankIt.cambiarNombreDelUsuario(usuario3,"Maxi")
   	rankIt.cambiarNombreDelUsuario(usuario4,"Julieta")
   	//activo los usuarios
   	rankIt.activarUsuario(usuario1)
   	rankIt.activarUsuario(usuario2)
   	rankIt.activarUsuario(usuario3)
   	//pero luego baneo dos 
   	rankIt.banearUsuario(usuario1)
   	rankIt.banearUsuario(usuario3)
   	
   	assertEquals(rankIt.usuariosRegistrados(),4)
   	assertEquals(rankIt.usuariosBaneados(),2)
   	assertEquals(rankIt.usuariosInactivos(),3)
    assertEquals(rankIt.usuariosActivos(),1)
   }
   
   @Test
   def testBuscoUsuarioPorSuNombre(){
   	
   	var rankIt=new RankIT
   	//creo cuatro usuarios nuevos 
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
   	//cambio sus nombres
   	var usuario1= rankIt.devolverUsuarioSinDatos()
   	var usuario2= rankIt.devolverUsuarioSinDatos()
   	var usuario3= rankIt.devolverUsuarioSinDatos()
   	
   	rankIt.cambiarNombreDelUsuario(usuario1,"Rosali")
   	rankIt.cambiarNombreDelUsuario(usuario2,"Liza")
   	rankIt.cambiarNombreDelUsuario(usuario3,"Maxi")
   	
   	var maxi=rankIt.buscarUsuarioPorSuNombre("Maxi")
   	
   	assertEquals(maxi,usuario3)
   }
/**
 * En este test pruebo que cuando elimino un usuario, se actualiza los 
 * valores de las personas registradas 
 * 
 */
   @Test
   def testEliminoUnUsuario(){
   	
   	var rankIt=new RankIT
   	//agrego los usuarios
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
   	rankIt.agregarUsuario()
   	//cambio los nombres de los Usuarios
    var usuario1= rankIt.devolverUsuarioSinDatos()
   	var usuario2= rankIt.devolverUsuarioSinDatos()
   	var usuario3= rankIt.devolverUsuarioSinDatos()
   	
   	rankIt.cambiarNombreDelUsuario(usuario1,"Rosali")
   	rankIt.cambiarNombreDelUsuario(usuario2,"Liza")
   	rankIt.cambiarNombreDelUsuario(usuario3,"Maxi")
   	
   	//elimino al usuario 3 
   	rankIt.eliminarUsuario(usuario3)
   	
   	assertEquals(rankIt.usuariosRegistrados(),3)
   
   }
   
   /**
    * Test Admisitracion de Calificaciones 
    */
    
    @Test 
    def testAgregoTresCalificacionesNuevasYTengoTresCalificacionesRegistradas(){
        var rankIt=new RankIT
        rankIt.crearCalificacionNueva()
        rankIt.crearCalificacionNueva()
        rankIt.crearCalificacionNueva()	
    	
    	assertEquals(rankIt.cantidadDeCalificacionesRegistradas(),3)
    	
    }
   
    @Test 
    def testAgregoDosCalicacionesNuevasYlasCalificoComoOfensivasDosSiendoDosLaCntidadDeCalificaciosOfensivas(){
    	var rankIt=new RankIT
        rankIt.crearCalificacionNueva()
        rankIt.crearCalificacionNueva()
        var calificacion1=rankIt.devolverCalificacionSinDatos()
        var calificacion2=rankIt.devolverCalificacionSinDatos()
        //le agrego un usuario a las calificaciones 
        var usuario1=new Usuario("Florencia","flor23")
        rankIt.cambiarNombreDeUsuarioDeLaCalificacion(calificacion1,usuario1)
        rankIt.cambiarNombreDeUsuarioDeLaCalificacion(calificacion2,usuario1)
        //las califico como ofensivas 
        rankIt.calificarCalificacionComoOfensiva(calificacion1)
        rankIt.calificarCalificacionComoOfensiva(calificacion2)
        
        assertEquals(rankIt.cantidadDeCalificacionesOfensivas(),2)
        
    }
	
	@Test
	def testUnUsuarioConCincoCalificacionesOfensivasQuedaInhabilitado(){
	    //creo las calificaciones y los usuarios	
		var rankIt=new RankIT
        rankIt.crearCalificacionNueva()
        rankIt.crearCalificacionNueva()
        rankIt.crearCalificacionNueva()
        rankIt.crearCalificacionNueva()
        rankIt.crearCalificacionNueva()
        rankIt.crearCalificacionNueva()
       
        rankIt.agregarUsuario()
   	    rankIt.agregarUsuario()
        //cambio sus nombres
      	var usuario1= rankIt.devolverUsuarioSinDatos()
   	    var usuario2= rankIt.devolverUsuarioSinDatos() 	
   	    rankIt.cambiarNombreDelUsuario(usuario1,"Florencia")
   	    rankIt.cambiarNombreDelUsuario(usuario2,"Carla")     
        
        //activo los usuarios
   	    rankIt.activarUsuario(usuario1)
   	    rankIt.activarUsuario(usuario2)
   	     
        //tengo las calificaciones sin calificar 
        var calificacion1=rankIt.devolverCalificacionSinDatos()
        var calificacion2=rankIt.devolverCalificacionSinDatos()
        var calificacion3=rankIt.devolverCalificacionSinDatos()
        var calificacion4=rankIt.devolverCalificacionSinDatos()
        var calificacion5=rankIt.devolverCalificacionSinDatos()
        var calificacion6=rankIt.devolverCalificacionSinDatos()
        
        //cambia el usuario en las calificaciones 
        rankIt.cambiarNombreDeUsuarioDeLaCalificacion(calificacion1,usuario1)
        rankIt.cambiarNombreDeUsuarioDeLaCalificacion(calificacion2,usuario1)
        rankIt.cambiarNombreDeUsuarioDeLaCalificacion(calificacion3,usuario1)
        rankIt.cambiarNombreDeUsuarioDeLaCalificacion(calificacion4,usuario1)
        rankIt.cambiarNombreDeUsuarioDeLaCalificacion(calificacion5,usuario1)
         rankIt.cambiarNombreDeUsuarioDeLaCalificacion(calificacion6,usuario2)
        //las califico como ofensivas 
        rankIt.calificarCalificacionComoOfensiva(calificacion1)
        rankIt.calificarCalificacionComoOfensiva(calificacion2)
        rankIt.calificarCalificacionComoOfensiva(calificacion3)
        rankIt.calificarCalificacionComoOfensiva(calificacion4)
        rankIt.calificarCalificacionComoOfensiva(calificacion5)
        rankIt.calificarCalificacionComoOfensiva(calificacion6)
        
        assertEquals(rankIt.usuariosRegistrados(),2)
        assertEquals(rankIt.usuariosActivos(),1)
        assertEquals(rankIt.usuariosBaneados(),1)
        assertEquals(rankIt.calificacionesRegistradas(),6)
		
	}
   /**
    * En este test se quiere probar que cuando elimino una calificacion 
    * ofensiva se actualizan los datos 
    */	
   @Test 
   def testEliminoUnaCalificacionOfensivaYSeActualizanLosDatos(){
   	    var rankIt=new RankIT
        rankIt.crearCalificacionNueva()
        rankIt.crearCalificacionNueva()
        var calificacion1=rankIt.devolverCalificacionSinDatos()
        var calificacion2=rankIt.devolverCalificacionSinDatos()
        //le agrego un usuario a las calificaciones 
        var usuario1=new Usuario("Florencia","flor23")
        rankIt.cambiarNombreDeUsuarioDeLaCalificacion(calificacion1,usuario1)
        rankIt.cambiarNombreDeUsuarioDeLaCalificacion(calificacion2,usuario1)
        //las califico como ofensivas 
        rankIt.calificarCalificacionComoOfensiva(calificacion1)
        rankIt.calificarCalificacionComoOfensiva(calificacion2)
        //elimino una calificacion
        rankIt.eliminarCalificacion(calificacion1)
        
        assertEquals(rankIt.calificacionesRegistradas(),1)
        assertEquals(rankIt.calificacionesOfensivas(),1)
   } 
   
   @Test 
   def testBuscoLasCalificacionDeUnUsuario(){
   	
   	    var rankIt=new RankIT
        rankIt.crearCalificacionNueva()
        rankIt.crearCalificacionNueva()
        var calificacion1=rankIt.devolverCalificacionSinDatos()
        var calificacion2=rankIt.devolverCalificacionSinDatos()
        //le agrego un usuario a las calificaciones 
        var usuario1=new Usuario("Florencia","flor23")
        rankIt.cambiarNombreDeUsuarioDeLaCalificacion(calificacion1,usuario1)
        rankIt.cambiarNombreDeUsuarioDeLaCalificacion(calificacion2,usuario1)
   	    var cantidadDeCalificacionesDelUsuario=rankIt.devolverCalificacionPorNombre(usuario1)
   	    assertEquals(cantidadDeCalificacionesDelUsuario.size,2)
   	   
   	
   	
   }


}
   