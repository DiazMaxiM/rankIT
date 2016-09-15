package edu.unq.interfaces.rankit_Interfaz;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class ResultadoCalificacion {
  private /* Calificacion */Object calificacion;
  
  private /* Usuario */Object usuario;
  
  private /* Puntuable */Object evaluado;
  
  public Object getNombre() {
    throw new Error("Unresolved compilation problems:"
      + "\nnombre cannot be resolved");
  }
  
  public Object getPuntos() {
    throw new Error("Unresolved compilation problems:"
      + "\npuntos cannot be resolved");
  }
  
  public Object getFecha() {
    throw new Error("Unresolved compilation problems:"
      + "\nfecha cannot be resolved");
  }
  
  public Object getUser() {
    throw new Error("Unresolved compilation problems:"
      + "\nnombre cannot be resolved");
  }
  
  public Object getOfensiva() {
    throw new Error("Unresolved compilation problems:"
      + "\nesCalificacionOfensiva cannot be resolved");
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
