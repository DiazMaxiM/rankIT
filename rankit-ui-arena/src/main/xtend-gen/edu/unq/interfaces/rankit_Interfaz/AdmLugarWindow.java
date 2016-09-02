package edu.unq.interfaces.rankit_Interfaz;

import edu.unq.interfaces.rankit_dominio.Lugar;
import org.uqbar.arena.layout.HorizontalLayout;
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
    this.primerLayout(panelPrincipal);
    this.segundoLayout(panelPrincipal);
    this.tercerLayout(panelPrincipal);
  }
  
  public Panel primerLayout(final Panel panel) {
    Panel _xblockexpression = null;
    {
      final Panel panelDeEdicion = new Panel(panel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      _xblockexpression = panelDeEdicion.setLayout(_horizontalLayout);
    }
    return _xblockexpression;
  }
  
  public Object segundoLayout(final Panel panel) {
    return null;
  }
  
  public Object tercerLayout(final Panel panel) {
    return null;
  }
  
  @Override
  protected void addActions(final Panel arg0) {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
}
