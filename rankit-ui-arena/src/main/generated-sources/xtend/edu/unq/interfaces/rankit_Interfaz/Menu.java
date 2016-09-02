package edu.unq.interfaces.rankit_Interfaz;

import edu.unq.interfaces.rankit_dominio.RankIT;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class Menu extends MainWindow<RankIT> {
  public Menu() {
    super(new RankIT());
  }
  
  public Menu(final RankIT rankit) {
    super(rankit);
  }
  
  public void createContents(final Panel mainPanel) {
    this.setTitle("Rank-IT");
    this.contenedorMensaje(mainPanel);
    this.contenedorBotonera(mainPanel);
    this.contenedorEstado(mainPanel);
  }
  
  public Label contenedorEstado(final Panel mainPanel) {
    Label _xblockexpression = null;
    {
      final Panel botoneraPanel = new Panel(mainPanel);
      ColumnLayout _columnLayout = new ColumnLayout(4);
      botoneraPanel.setLayout(_columnLayout);
      Label _label = new Label(botoneraPanel);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("estadoUsuario");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      Label _label_1 = new Label(botoneraPanel);
      final Procedure1<Label> _function_1 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("estadoCalificacion");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
      Label _label_2 = new Label(botoneraPanel);
      final Procedure1<Label> _function_2 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("estadoServicio");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_2, _function_2);
      Label _label_3 = new Label(botoneraPanel);
      final Procedure1<Label> _function_3 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("estadoLugar");
        }
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_3, _function_3);
    }
    return _xblockexpression;
  }
  
  private Button contenedorBotonera(final Panel mainPanel) {
    throw new Error("Unresolved compilation problems:"
      + "\nLugar cannot be resolved.");
  }
  
  private Label contenedorMensaje(final Panel mainPanel) {
    Label _xblockexpression = null;
    {
      final Panel labelPanel = new Panel(mainPanel);
      VerticalLayout _verticalLayout = new VerticalLayout();
      labelPanel.setLayout(_verticalLayout);
      Label _label = new Label(labelPanel);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Rank-IT! Módulo de administración");
          it.setFontSize(14);
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      Label _label_1 = new Label(labelPanel);
      final Procedure1<Label> _function_1 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Desde este modulo vas a poder gestionar los datos y opciones de la aplicacion,");
          it.setFontSize(14);
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
      Label _label_2 = new Label(labelPanel);
      final Procedure1<Label> _function_2 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("como sos una persona de confianza vas a tener acceso a todo!");
          it.setFontSize(14);
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_2, _function_2);
      Label _label_3 = new Label(labelPanel);
      final Procedure1<Label> _function_3 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Siempre acordate: Con un gran poder viene una gran responsabilidad ");
          it.setFontSize(14);
        }
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_3, _function_3);
    }
    return _xblockexpression;
  }
  
  public static void main(final String[] args) {
    Menu _menu = new Menu();
    _menu.startApplication();
  }
}
