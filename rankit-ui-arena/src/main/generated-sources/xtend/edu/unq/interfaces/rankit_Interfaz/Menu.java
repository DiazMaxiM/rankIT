package edu.unq.interfaces.rankit_Interfaz;

import edu.unq.interfaces.rankit_Interfaz.AdmCalificacionWindow;
import edu.unq.interfaces.rankit_Interfaz.AdmLugarWindow;
import edu.unq.interfaces.rankit_Interfaz.AdmUsuarioWindow;
import edu.unq.interfaces.rankit_dominio.Lugar;
import edu.unq.interfaces.rankit_dominio.RankIT;
import edu.unq.interfaces.rankit_dominio.Usuario;
import java.util.List;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.lacar.ui.model.Action;
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
    Button _xblockexpression = null;
    {
      final Panel botoneraPanel = new Panel(mainPanel);
      ColumnLayout _columnLayout = new ColumnLayout(4);
      botoneraPanel.setLayout(_columnLayout);
      Button _button = new Button(botoneraPanel);
      final Procedure1<Button> _function = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Adm. Usuarios");
          final Action _function = new Action() {
            public void execute() {
              Usuario _usuario = new Usuario();
              AdmUsuarioWindow _admUsuarioWindow = new AdmUsuarioWindow(Menu.this, _usuario);
              _admUsuarioWindow.open();
            }
          };
          it.onClick(_function);
        }
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(botoneraPanel);
      final Procedure1<Button> _function_1 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Adm. Calificaciones");
          final Action _function = new Action() {
            public void execute() {
              AdmCalificacionWindow _admCalificacionWindow = new AdmCalificacionWindow(Menu.this, null);
              _admCalificacionWindow.open();
            }
          };
          it.onClick(_function);
        }
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
      Button _button_2 = new Button(botoneraPanel);
      final Procedure1<Button> _function_2 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Adm. Servicios");
        }
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_2);
      Button _button_3 = new Button(botoneraPanel);
      final Procedure1<Button> _function_3 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Adm. Lugares");
          final Action _function = new Action() {
            public void execute() {
              Lugar _lugar = new Lugar();
              AdmLugarWindow _admLugarWindow = new AdmLugarWindow(Menu.this, _lugar);
              _admLugarWindow.open();
            }
          };
          it.onClick(_function);
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_3, _function_3);
    }
    return _xblockexpression;
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
    final RankIT prueba = new RankIT();
    final Usuario usuario = new Usuario();
    usuario.setActivo(true);
    List<Usuario> _usuarios = prueba.getUsuarios();
    _usuarios.add(usuario);
    Menu _menu = new Menu(prueba);
    _menu.startApplication();
  }
}
