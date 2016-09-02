package edu.unq.interfaces.rankit_Interfaz;

import edu.unq.interfaces.rankit_dominio.Calificacion;
import edu.unq.interfaces.rankit_dominio.Puntuable;
import edu.unq.interfaces.rankit_dominio.Usuario;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.joda.time.DateTime;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class ResultadoCalificacion {
  private Calificacion calificacion;
  
  private Usuario usuario;
  
  private Puntuable evaluado;
  
  public String getNombre() {
    return this.evaluado.getNombre();
  }
  
  public int getPuntos() {
    return this.calificacion.getPuntos();
  }
  
  public DateTime getFecha() {
    return this.calificacion.getFecha();
  }
  
  public String getUser() {
    return this.usuario.getNombre();
  }
  
  public boolean getOfensiva() {
    return this.calificacion.esCalificacionOfensiva();
  }
  
  @Pure
  public Calificacion getCalificacion() {
    return this.calificacion;
  }
  
  public void setCalificacion(final Calificacion calificacion) {
    this.calificacion = calificacion;
  }
  
  @Pure
  public Usuario getUsuario() {
    return this.usuario;
  }
  
  public void setUsuario(final Usuario usuario) {
    this.usuario = usuario;
  }
  
  @Pure
  public Puntuable getEvaluado() {
    return this.evaluado;
  }
  
  public void setEvaluado(final Puntuable evaluado) {
    this.evaluado = evaluado;
  }
}
