package edu.unq.interfaces.rankit_Interfaz;

import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;

@SuppressWarnings("all")
public class AdmLugarWindow /* extends /* SimpleWindow<Lugar> */  */{
  public AdmLugarWindow(final WindowOwner parent, final /* Lugar */Object model) {
    super(parent, model);
    this.setTitle("Rank-IT -->Adm Servicios");
    this.setTaskDescription("Resumen de situación");
  }
  
  protected void createFormPanel(final Panel panelPrincipal) {
    this.resumenDeSituacion(panelPrincipal);
    this.busqueda(panelPrincipal);
    this.datosYEdicion(panelPrincipal);
  }
  
  public Label resumenDeSituacion(final Panel panel) {
    Label _xblockexpression = null;
    {
      final Panel panelEstadisticas = new Panel(panel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      panelEstadisticas.setLayout(_horizontalLayout);
      Label _label = new Label(panelEstadisticas);
      _xblockexpression = _label.setText("");
    }
    return _xblockexpression;
  }
  
  public Object busqueda(final Panel panel) {
    return null;
  }
  
  public Object datosYEdicion(final Panel panel) {
    return null;
  }
  
  protected void addActions(final Panel arg0) {
  }
}
