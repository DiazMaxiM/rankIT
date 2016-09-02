package edu.unq.interfaces.rankit_Interfaz;

import edu.unq.interfaces.rankit_dominio.Usuario;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;

@SuppressWarnings("all")
public class AdmUsuarioWindow extends SimpleWindow<Usuario> {
  public AdmUsuarioWindow(final WindowOwner parent, final Usuario model) {
    super(parent, new Usuario());
  }
  
  public Label contenedorSituacion(final Panel mainPanel) {
    Label _xblockexpression = null;
    {
      final Panel SituacionTituloPanel = new Panel(mainPanel);
      final Panel SituacionEstadoSituacionPanel = new Panel(mainPanel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      SituacionTituloPanel.setLayout(_horizontalLayout);
      ColumnLayout _columnLayout = new ColumnLayout(8);
      SituacionEstadoSituacionPanel.setLayout(_columnLayout);
      Label _label = new Label(SituacionTituloPanel);
      final Procedure1<Label> _function = (Label it) -> {
        it.setText("Resumen de situación:");
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      Label _label_1 = new Label(SituacionEstadoSituacionPanel);
      final Procedure1<Label> _function_1 = (Label it) -> {
        it.setText("Usuarios Registrados:");
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
      Label _label_2 = new Label(SituacionEstadoSituacionPanel);
      final Procedure1<Label> _function_2 = (Label it) -> {
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_2, _function_2);
      Label _label_3 = new Label(SituacionEstadoSituacionPanel);
      final Procedure1<Label> _function_3 = (Label it) -> {
        it.setText("Resumen de situación:");
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_3, _function_3);
    }
    return _xblockexpression;
  }
  
  @Override
  protected void addActions(final Panel actionsPanel) {
  }
  
  @Override
  protected void createFormPanel(final Panel mainPanel) {
    this.setTitle("Rank-IT --> Adm Usuarios");
    this.contenedorSituacion(mainPanel);
  }
}
