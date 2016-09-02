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
  
  protected void createFormPanel(final Panel panelPrincipal) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method primerLayout(Panel) is undefined for the type AdmLugarWindow"
      + "\nThe method segundoLayout(Panel) is undefined for the type AdmLugarWindow"
      + "\nThe method tercerLayout(Panel) is undefined for the type AdmLugarWindow");
  }
  
  protected void addActions(final Panel arg0) {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
}
