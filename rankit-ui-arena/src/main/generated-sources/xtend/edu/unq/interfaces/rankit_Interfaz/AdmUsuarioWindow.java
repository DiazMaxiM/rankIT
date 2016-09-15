package edu.unq.interfaces.rankit_Interfaz;

import edu.unq.interfaces.rankit_Interfaz.AdmCalificacionWindow;
import edu.unq.interfaces.rankit_dominio.CalificacionAppModel;
import edu.unq.interfaces.rankit_dominio.Usuario;
import edu.unq.interfaces.rankit_dominio.UsuarioAppModel;
import org.apache.commons.collections15.Transformer;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.CheckBox;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.widgets.tables.labelprovider.PropertyLabelProvider;
import org.uqbar.arena.windows.ErrorsPanel;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.TableBuilder;
import org.uqbar.lacar.ui.model.bindings.ViewObservable;

@SuppressWarnings("all")
public class AdmUsuarioWindow extends SimpleWindow<UsuarioAppModel> {
  public AdmUsuarioWindow(final WindowOwner parent, final UsuarioAppModel modelo) {
    super(parent, modelo);
  }
  
  protected void createFormPanel(final Panel panelPrincipal) {
    this.setTitle("Rank-IT --> Adm Usuarios");
    final Panel panel = new Panel(panelPrincipal);
    VerticalLayout _verticalLayout = new VerticalLayout();
    panel.setLayout(_verticalLayout);
    this.panelDeSituacionActual(panel);
    this.panelDeBusqueda(panel);
    this.panelDeTablaYOpciones(panel);
  }
  
  public Label panelDeTablaYOpciones(final Panel panelPrincipal) {
    Label _xblockexpression = null;
    {
      final Panel tablaYOpciones = new Panel(panelPrincipal);
      ColumnLayout _columnLayout = new ColumnLayout(2);
      tablaYOpciones.setLayout(_columnLayout);
      this.panelConTablaDeResultado(tablaYOpciones);
      this.panelConOpcionesDeEdicion(tablaYOpciones);
      _xblockexpression = new Label(tablaYOpciones);
    }
    return _xblockexpression;
  }
  
  public Button panelConOpcionesDeEdicion(final Panel panelPrincipal) {
    Button _xblockexpression = null;
    {
      final Panel opcionesDeEdicion = new Panel(panelPrincipal);
      VerticalLayout _verticalLayout = new VerticalLayout();
      opcionesDeEdicion.setLayout(_verticalLayout);
      Label _label = new Label(opcionesDeEdicion);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Nombre:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      new ErrorsPanel(opcionesDeEdicion, "");
      Label _label_1 = new Label(opcionesDeEdicion);
      final Procedure1<Label> _function_1 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Fecha de registro:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
      Label _label_2 = new Label(opcionesDeEdicion);
      final Procedure1<Label> _function_2 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("usuarioSeleccionado.getFechaDeRegistro");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_2, _function_2);
      CheckBox _checkBox = new CheckBox(opcionesDeEdicion);
      final Procedure1<CheckBox> _function_3 = new Procedure1<CheckBox>() {
        public void apply(final CheckBox it) {
          it.<Object, ControlBuilder>bindValueToProperty("usuarioSeleccionado.isActivo");
        }
      };
      ObjectExtensions.<CheckBox>operator_doubleArrow(_checkBox, _function_3);
      Label _label_3 = new Label(opcionesDeEdicion);
      final Procedure1<Label> _function_4 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Activo");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_3, _function_4);
      CheckBox _checkBox_1 = new CheckBox(opcionesDeEdicion);
      final Procedure1<CheckBox> _function_5 = new Procedure1<CheckBox>() {
        public void apply(final CheckBox it) {
          it.<Object, ControlBuilder>bindValueToProperty("usuarioSeleccionado.isBaneado");
        }
      };
      ObjectExtensions.<CheckBox>operator_doubleArrow(_checkBox_1, _function_5);
      Label _label_4 = new Label(opcionesDeEdicion);
      final Procedure1<Label> _function_6 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Baneado");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_4, _function_6);
      Label _label_5 = new Label(opcionesDeEdicion);
      final Procedure1<Label> _function_7 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Ultima publicacion");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_5, _function_7);
      Label _label_6 = new Label(opcionesDeEdicion);
      final Procedure1<Label> _function_8 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("usuarioSeleccionado.ultimaPublicacion.getFecha");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_6, _function_8);
      Button _button = new Button(opcionesDeEdicion);
      final Procedure1<Button> _function_9 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Revisar Publicaciones");
          final Action _function = new Action() {
            public void execute() {
              AdmUsuarioWindow.this.revisarPublicaciones();
            }
          };
          it.onClick(_function);
        }
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function_9);
      Button _button_1 = new Button(opcionesDeEdicion);
      final Procedure1<Button> _function_10 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Blanquear clave");
          it.<ControlBuilder>bindEnabledToProperty("usuarioSeleccionado");
          final Action _function = new Action() {
            public void execute() {
              UsuarioAppModel _modelObject = AdmUsuarioWindow.this.getModelObject();
              _modelObject.blanquearContrasenha();
            }
          };
          it.onClick(_function);
        }
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_10);
      Button _button_2 = new Button(opcionesDeEdicion);
      final Procedure1<Button> _function_11 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Eliminar");
          it.<ControlBuilder>bindEnabledToProperty("usuarioSeleccionado");
          final Action _function = new Action() {
            public void execute() {
              UsuarioAppModel _modelObject = AdmUsuarioWindow.this.getModelObject();
              _modelObject.eliminarUsuario();
            }
          };
          it.onClick(_function);
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_11);
    }
    return _xblockexpression;
  }
  
  public Button panelConTablaDeResultado(final Panel panelPrincipal) {
    Button _xblockexpression = null;
    {
      final Panel tablaDeResultado = new Panel(panelPrincipal);
      Table<Usuario> _table = new Table<Usuario>(tablaDeResultado, Usuario.class);
      final Procedure1<Table<Usuario>> _function = new Procedure1<Table<Usuario>>() {
        public void apply(final Table<Usuario> it) {
          ViewObservable<Table<Usuario>, TableBuilder<Usuario>> _items = it.items();
          ArenaXtendExtensions.operator_spaceship(_items, "todosLosUsuarios.getUsuarios");
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "usuarioSeleccionado");
          it.setWidth(400);
          it.setHeight(400);
          Column<Usuario> _column = new Column<Usuario>(it);
          final Procedure1<Column<Usuario>> _function = new Procedure1<Column<Usuario>>() {
            public void apply(final Column<Usuario> it) {
              it.setTitle("Fecha de Registro");
              it.setFixedSize(100);
              it.bindContentsToProperty("getFechaDeRegistro");
            }
          };
          ObjectExtensions.<Column<Usuario>>operator_doubleArrow(_column, _function);
          Column<Usuario> _column_1 = new Column<Usuario>(it);
          final Procedure1<Column<Usuario>> _function_1 = new Procedure1<Column<Usuario>>() {
            public void apply(final Column<Usuario> it) {
              it.setTitle("Nombre");
              it.setFixedSize(100);
              it.bindContentsToProperty("nombre");
            }
          };
          ObjectExtensions.<Column<Usuario>>operator_doubleArrow(_column_1, _function_1);
          Column<Usuario> _column_2 = new Column<Usuario>(it);
          final Procedure1<Column<Usuario>> _function_2 = new Procedure1<Column<Usuario>>() {
            public void apply(final Column<Usuario> it) {
              it.setTitle("Activo");
              it.setFixedSize(100);
              PropertyLabelProvider<Usuario> _bindContentsToProperty = it.bindContentsToProperty("activo");
              final Transformer<Boolean, String> _function = new Transformer<Boolean, String>() {
                public String transform(final Boolean getActivo) {
                  String _xifexpression = null;
                  if ((getActivo).booleanValue()) {
                    _xifexpression = "Si";
                  } else {
                    _xifexpression = "No";
                  }
                  return _xifexpression;
                }
              };
              _bindContentsToProperty.setTransformer(_function);
            }
          };
          ObjectExtensions.<Column<Usuario>>operator_doubleArrow(_column_2, _function_2);
          Column<Usuario> _column_3 = new Column<Usuario>(it);
          final Procedure1<Column<Usuario>> _function_3 = new Procedure1<Column<Usuario>>() {
            public void apply(final Column<Usuario> it) {
              it.setTitle("Baneado");
              it.setFixedSize(100);
              PropertyLabelProvider<Usuario> _bindContentsToProperty = it.bindContentsToProperty("baneado");
              final Transformer<Boolean, String> _function = new Transformer<Boolean, String>() {
                public String transform(final Boolean getBaneado) {
                  String _xifexpression = null;
                  if ((getBaneado).booleanValue()) {
                    _xifexpression = "Si";
                  } else {
                    _xifexpression = "-";
                  }
                  return _xifexpression;
                }
              };
              _bindContentsToProperty.setTransformer(_function);
            }
          };
          ObjectExtensions.<Column<Usuario>>operator_doubleArrow(_column_3, _function_3);
        }
      };
      ObjectExtensions.<Table<Usuario>>operator_doubleArrow(_table, _function);
      Button _button = new Button(tablaDeResultado);
      final Procedure1<Button> _function_1 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Nuevo");
          final Action _function = new Action() {
            public void execute() {
              UsuarioAppModel _modelObject = AdmUsuarioWindow.this.getModelObject();
              Usuario _usuario = new Usuario();
              _modelObject.agregarUsuario(_usuario);
            }
          };
          it.onClick(_function);
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button, _function_1);
    }
    return _xblockexpression;
  }
  
  public Button panelDeBusqueda(final Panel panelPrincipal) {
    Button _xblockexpression = null;
    {
      final Panel titulo = new Panel(panelPrincipal);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      titulo.setLayout(_horizontalLayout);
      Label _label = new Label(titulo);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Usuarios");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      final Panel buscador = new Panel(panelPrincipal);
      ColumnLayout _columnLayout = new ColumnLayout(3);
      buscador.setLayout(_columnLayout);
      Label _label_1 = new Label(buscador);
      final Procedure1<Label> _function_1 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Buscar por nombre de usuario");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
      TextBox _textBox = new TextBox(buscador);
      final Procedure1<TextBox> _function_2 = new Procedure1<TextBox>() {
        public void apply(final TextBox it) {
        }
      };
      ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function_2);
      Button _button = new Button(buscador);
      final Procedure1<Button> _function_3 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Buscar");
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button, _function_3);
    }
    return _xblockexpression;
  }
  
  public Label panelDeSituacionActual(final Panel panelPrincipal) {
    Label _xblockexpression = null;
    {
      final Panel titulo = new Panel(panelPrincipal);
      final Panel situacion = new Panel(panelPrincipal);
      Label _label = new Label(titulo);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Resumen de situación:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      ColumnLayout _columnLayout = new ColumnLayout(8);
      situacion.setLayout(_columnLayout);
      Label _label_1 = new Label(situacion);
      final Procedure1<Label> _function_1 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Usuarios Registrados:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
      Label _label_2 = new Label(situacion);
      final Procedure1<Label> _function_2 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("cantidadDeUsuariosRegistrados");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_2, _function_2);
      Label _label_3 = new Label(situacion);
      final Procedure1<Label> _function_3 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Activos:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_3, _function_3);
      Label _label_4 = new Label(situacion);
      final Procedure1<Label> _function_4 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("cantidadDeUsuariosActivos");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_4, _function_4);
      Label _label_5 = new Label(situacion);
      final Procedure1<Label> _function_5 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Inactivos:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_5, _function_5);
      Label _label_6 = new Label(situacion);
      final Procedure1<Label> _function_6 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("cantidadDeUsuariosInactivos");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_6, _function_6);
      Label _label_7 = new Label(situacion);
      final Procedure1<Label> _function_7 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Baneados:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_7, _function_7);
      Label _label_8 = new Label(situacion);
      final Procedure1<Label> _function_8 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("cantidadDeUsuariosBaneados");
        }
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_8, _function_8);
    }
    return _xblockexpression;
  }
  
  public AdmCalificacionWindow revisarPublicaciones() {
    UsuarioAppModel _modelObject = this.getModelObject();
    CalificacionAppModel _administradorDeCalificaciones = _modelObject.getAdministradorDeCalificaciones();
    return new AdmCalificacionWindow(this, _administradorDeCalificaciones);
  }
  
  protected void addActions(final Panel actionsPanel) {
  }
}
