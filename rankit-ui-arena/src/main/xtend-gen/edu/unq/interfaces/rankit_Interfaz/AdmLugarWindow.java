package edu.unq.interfaces.rankit_Interfaz;

import edu.unq.interfaces.rankit_dominio.Lugar;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;

@SuppressWarnings("all")
public class AdmLugarWindow extends SimpleWindow<Lugar> {
  public AdmLugarWindow(final WindowOwner parent, final Lugar model) {
    super(parent, model);
    this.setTitle("Rank-IT -->Adm Servicios");
    this.setTaskDescription("Resumen de situación");
  }
  
  @Override
  protected void createFormPanel(final Panel panelPrincipal) {
    this.resumenDeSituacion(panelPrincipal);
    this.busqueda(panelPrincipal);
    this.datosYEdicion(panelPrincipal);
  }
  
  public void resumenDeSituacion(final Panel panel) {
    throw new Error("Unresolved compilation problems:"
      + "\nType mismatch: cannot convert from Panel to String");
  }
  
  public Object busqueda(final Panel panel) {
    return null;
  }
  
  public Object datosYEdicion(final Panel panel) {
    return null;
  }
  
  @Override
  protected void addActions(final Panel arg0) {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
}
