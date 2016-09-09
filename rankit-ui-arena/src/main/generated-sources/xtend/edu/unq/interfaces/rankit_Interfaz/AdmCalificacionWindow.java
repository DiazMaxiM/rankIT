package edu.unq.interfaces.rankit_Interfaz;

import edu.unq.interfaces.component.LabeledSelector;
import edu.unq.interfaces.rankit_dominio.AdmCalificaciones;
import edu.unq.interfaces.rankit_dominio.Calificacion;
import edu.unq.interfaces.rankit_dominio.CalificacionAppModel;
import edu.unq.interfaces.rankit_dominio.Puntuable;
import edu.unq.interfaces.rankit_dominio.Usuario;
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
public class AdmCalificacionWindow extends SimpleWindow<CalificacionAppModel> {
  public AdmCalificacionWindow(final WindowOwner parent, final CalificacionAppModel model) {
    super(parent, model);
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    this.setTitle("Rank-IT --> Adm Usuarios");
    final Panel panel = new Panel(mainPanel);
    VerticalLayout _verticalLayout = new VerticalLayout();
    panel.setLayout(_verticalLayout);
    this.contenedorSituacion(panel);
    this.contenedorBusqueda(panel);
    this.contenedorTablaYOpciones(panel);
  }
  
  public Label contenedorSituacion(final Panel mainPanel) {
    Label _xblockexpression = null;
    {
      final Panel SituacionTituloPanel = new Panel(mainPanel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      SituacionTituloPanel.setLayout(_horizontalLayout);
      Label _label = new Label(SituacionTituloPanel);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Resumen de situación:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      final Panel SituacionEstadoSituacionPanel = new Panel(mainPanel);
      ColumnLayout _columnLayout = new ColumnLayout(4);
      SituacionEstadoSituacionPanel.setLayout(_columnLayout);
      Label _label_1 = new Label(SituacionEstadoSituacionPanel);
      final Procedure1<Label> _function_1 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Calificaciones Registradas:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
      Label _label_2 = new Label(SituacionEstadoSituacionPanel);
      final Procedure1<Label> _function_2 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("calificacionesRegistradas");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_2, _function_2);
      Label _label_3 = new Label(SituacionEstadoSituacionPanel);
      final Procedure1<Label> _function_3 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Ofensivas:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_3, _function_3);
      Label _label_4 = new Label(SituacionEstadoSituacionPanel);
      final Procedure1<Label> _function_4 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("administradorCalificacion.calificacionesOfensivas");
        }
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_4, _function_4);
    }
    return _xblockexpression;
  }
  
  protected void addActions(final Panel actionsPanel) {
  }
  
  public void contenedorTablaYOpciones(final Panel mainPanel) {
    final Panel contenedorTablaYOpcionesPanel = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(2);
    contenedorTablaYOpcionesPanel.setLayout(_columnLayout);
    this.contenedorTabla(contenedorTablaYOpcionesPanel);
    this.contenedorOpciones(contenedorTablaYOpcionesPanel);
    new Label(contenedorTablaYOpcionesPanel);
  }
  
  public void contenedorTabla(final Panel mainPanel) {
    final Panel contenedorTabla = new Panel(mainPanel);
    Table<Calificacion> _table = new Table<Calificacion>(contenedorTabla, Calificacion.class);
    final Procedure1<Table<Calificacion>> _function = new Procedure1<Table<Calificacion>>() {
      public void apply(final Table<Calificacion> it) {
        ViewObservable<Table<Calificacion>, TableBuilder<Calificacion>> _items = it.items();
        ArenaXtendExtensions.operator_spaceship(_items, "administradorCalificacion.listaCalificaciones");
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "calificacionSeleccionada");
        it.setWidth(400);
        it.setHeight(400);
        Column<Calificacion> _column = new Column<Calificacion>(it);
        final Procedure1<Column<Calificacion>> _function = new Procedure1<Column<Calificacion>>() {
          public void apply(final Column<Calificacion> it) {
            it.setTitle("Evaluado");
            PropertyLabelProvider<Calificacion> _bindContentsToProperty = it.bindContentsToProperty("evaluado");
            final Transformer<Puntuable, String> _function = new Transformer<Puntuable, String>() {
              public String transform(final Puntuable puntuable) {
                return puntuable.getNombre();
              }
            };
            _bindContentsToProperty.setTransformer(_function);
          }
        };
        ObjectExtensions.<Column<Calificacion>>operator_doubleArrow(_column, _function);
        Column<Calificacion> _column_1 = new Column<Calificacion>(it);
        final Procedure1<Column<Calificacion>> _function_1 = new Procedure1<Column<Calificacion>>() {
          public void apply(final Column<Calificacion> it) {
            it.setTitle("Ptos");
            it.bindContentsToProperty("puntos");
          }
        };
        ObjectExtensions.<Column<Calificacion>>operator_doubleArrow(_column_1, _function_1);
        Column<Calificacion> _column_2 = new Column<Calificacion>(it);
        final Procedure1<Column<Calificacion>> _function_2 = new Procedure1<Column<Calificacion>>() {
          public void apply(final Column<Calificacion> it) {
            it.setTitle("Fecha");
            it.bindContentsToProperty("fecha");
          }
        };
        ObjectExtensions.<Column<Calificacion>>operator_doubleArrow(_column_2, _function_2);
        Column<Calificacion> _column_3 = new Column<Calificacion>(it);
        final Procedure1<Column<Calificacion>> _function_3 = new Procedure1<Column<Calificacion>>() {
          public void apply(final Column<Calificacion> it) {
            it.setTitle("User");
            PropertyLabelProvider<Calificacion> _bindContentsToProperty = it.bindContentsToProperty("usuario");
            final Transformer<Usuario, String> _function = new Transformer<Usuario, String>() {
              public String transform(final Usuario usuario) {
                return usuario.getNombre();
              }
            };
            _bindContentsToProperty.setTransformer(_function);
          }
        };
        ObjectExtensions.<Column<Calificacion>>operator_doubleArrow(_column_3, _function_3);
        Column<Calificacion> _column_4 = new Column<Calificacion>(it);
        final Procedure1<Column<Calificacion>> _function_4 = new Procedure1<Column<Calificacion>>() {
          public void apply(final Column<Calificacion> it) {
            it.setTitle("Es Ofensiva");
            PropertyLabelProvider<Calificacion> _bindContentsToProperty = it.bindContentsToProperty("contenidoOfensivo");
            final Transformer<Boolean, String> _function = new Transformer<Boolean, String>() {
              public String transform(final Boolean esOfensivo) {
                String _xifexpression = null;
                if ((esOfensivo).booleanValue()) {
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
        ObjectExtensions.<Column<Calificacion>>operator_doubleArrow(_column_4, _function_4);
      }
    };
    ObjectExtensions.<Table<Calificacion>>operator_doubleArrow(_table, _function);
    Button _button = new Button(contenedorTabla);
    final Procedure1<Button> _function_1 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Nuevo");
        final Action _function = new Action() {
          public void execute() {
            CalificacionAppModel _modelObject = AdmCalificacionWindow.this.getModelObject();
            AdmCalificaciones _administradorCalificacion = _modelObject.getAdministradorCalificacion();
            CalificacionAppModel _modelObject_1 = AdmCalificacionWindow.this.getModelObject();
            Usuario _usuarioLogeado = _modelObject_1.getUsuarioLogeado();
            Calificacion _calificacion = new Calificacion(_usuarioLogeado);
            _administradorCalificacion.agregarCalificacion(_calificacion);
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function_1);
  }
  
  public Button contenedorOpciones(final Panel panel) {
    Button _xblockexpression = null;
    {
      final Panel contenedorOpciones = new Panel(panel);
      VerticalLayout _verticalLayout = new VerticalLayout();
      contenedorOpciones.setLayout(_verticalLayout);
      new ErrorsPanel(contenedorOpciones, "");
      Label _label = new Label(contenedorOpciones);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Evaluado");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      LabeledSelector<Object> _labeledSelector = new LabeledSelector<Object>(contenedorOpciones);
      final Procedure1<LabeledSelector<Object>> _function_1 = new Procedure1<LabeledSelector<Object>>() {
        public void apply(final LabeledSelector<Object> it) {
          it.bindItemsToProperty("listaPuntuables");
          it.bindValueToProperty("calificacionSeleccionada.evaluado");
        }
      };
      ObjectExtensions.<LabeledSelector<Object>>operator_doubleArrow(_labeledSelector, _function_1);
      final Panel contenedorFechaYUsuario = new Panel(contenedorOpciones);
      VerticalLayout _verticalLayout_1 = new VerticalLayout();
      contenedorFechaYUsuario.setLayout(_verticalLayout_1);
      final Panel contenedorFecha = new Panel(contenedorFechaYUsuario);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      contenedorFecha.setLayout(_horizontalLayout);
      final Panel contenedorFechaColumna = new Panel(contenedorFecha);
      ColumnLayout _columnLayout = new ColumnLayout(2);
      contenedorFechaColumna.setLayout(_columnLayout);
      Label _label_1 = new Label(contenedorFechaColumna);
      final Procedure1<Label> _function_2 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Fecha:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_2);
      Label _label_2 = new Label(contenedorFechaColumna);
      final Procedure1<Label> _function_3 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("calificacionSeleccionada.evaluado.fechaDeRegistro");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_2, _function_3);
      final Panel contenedorUsuarioColumna = new Panel(contenedorFecha);
      ColumnLayout _columnLayout_1 = new ColumnLayout(2);
      contenedorUsuarioColumna.setLayout(_columnLayout_1);
      Label _label_3 = new Label(contenedorFechaColumna);
      final Procedure1<Label> _function_4 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Usuario:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_3, _function_4);
      Label _label_4 = new Label(contenedorFechaColumna);
      final Procedure1<Label> _function_5 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("calificacionSeleccionada.evaluado.nombre");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_4, _function_5);
      Label _label_5 = new Label(contenedorOpciones);
      final Procedure1<Label> _function_6 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Puntaje:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_5, _function_6);
      TextBox _textBox = new TextBox(contenedorOpciones);
      final Procedure1<TextBox> _function_7 = new Procedure1<TextBox>() {
        public void apply(final TextBox it) {
          it.<Object, ControlBuilder>bindValueToProperty("calificacionSeleccionada.puntos");
        }
      };
      ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function_7);
      Label _label_6 = new Label(contenedorOpciones);
      final Procedure1<Label> _function_8 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Detalle:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_6, _function_8);
      TextBox _textBox_1 = new TextBox(contenedorOpciones);
      final Procedure1<TextBox> _function_9 = new Procedure1<TextBox>() {
        public void apply(final TextBox it) {
          it.<Object, ControlBuilder>bindValueToProperty("calificacionSeleccionada.detalle");
          it.setHeight(50);
        }
      };
      ObjectExtensions.<TextBox>operator_doubleArrow(_textBox_1, _function_9);
      final Panel contenedorContOfensivo = new Panel(contenedorOpciones);
      VerticalLayout _verticalLayout_2 = new VerticalLayout();
      contenedorContOfensivo.setLayout(_verticalLayout_2);
      final Panel contenedorContOfensivoHorizontal = new Panel(contenedorContOfensivo);
      HorizontalLayout _horizontalLayout_1 = new HorizontalLayout();
      contenedorFecha.setLayout(_horizontalLayout_1);
      final Panel contenedorContOfensivoHorizontalColumna = new Panel(contenedorContOfensivoHorizontal);
      ColumnLayout _columnLayout_2 = new ColumnLayout(2);
      contenedorContOfensivoHorizontalColumna.setLayout(_columnLayout_2);
      CheckBox _checkBox = new CheckBox(contenedorContOfensivoHorizontalColumna);
      final Procedure1<CheckBox> _function_10 = new Procedure1<CheckBox>() {
        public void apply(final CheckBox it) {
          it.<Object, ControlBuilder>bindValueToProperty("calificacionSeleccionada.contenidoOfensivo");
        }
      };
      ObjectExtensions.<CheckBox>operator_doubleArrow(_checkBox, _function_10);
      Label _label_7 = new Label(contenedorContOfensivoHorizontalColumna);
      final Procedure1<Label> _function_11 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Contenido Ofensivo");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_7, _function_11);
      Button _button = new Button(contenedorOpciones);
      final Procedure1<Button> _function_12 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Eliminar");
          it.<ControlBuilder>bindEnabledToProperty("hayCalificacionSeleccionada");
          final Action _function = new Action() {
            public void execute() {
              CalificacionAppModel _modelObject = AdmCalificacionWindow.this.getModelObject();
              AdmCalificaciones _administradorCalificacion = _modelObject.getAdministradorCalificacion();
              CalificacionAppModel _modelObject_1 = AdmCalificacionWindow.this.getModelObject();
              Calificacion _calificacionSeleccionada = _modelObject_1.getCalificacionSeleccionada();
              _administradorCalificacion.eliminarCalificacion(_calificacionSeleccionada);
            }
          };
          it.onClick(_function);
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button, _function_12);
    }
    return _xblockexpression;
  }
  
  public Button contenedorBusqueda(final Panel mainPanel) {
    Button _xblockexpression = null;
    {
      final Panel contenedorTituloPanel = new Panel(mainPanel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      contenedorTituloPanel.setLayout(_horizontalLayout);
      Label _label = new Label(contenedorTituloPanel);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Calificaciones:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      final Panel contenedorParametrosPanel = new Panel(mainPanel);
      ColumnLayout _columnLayout = new ColumnLayout(5);
      contenedorParametrosPanel.setLayout(_columnLayout);
      Label _label_1 = new Label(contenedorParametrosPanel);
      final Procedure1<Label> _function_1 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Usuario:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
      TextBox _textBox = new TextBox(contenedorParametrosPanel);
      final Procedure1<TextBox> _function_2 = new Procedure1<TextBox>() {
        public void apply(final TextBox it) {
        }
      };
      ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function_2);
      Label _label_2 = new Label(contenedorParametrosPanel);
      final Procedure1<Label> _function_3 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Evaluado:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_2, _function_3);
      TextBox _textBox_1 = new TextBox(contenedorParametrosPanel);
      final Procedure1<TextBox> _function_4 = new Procedure1<TextBox>() {
        public void apply(final TextBox it) {
        }
      };
      ObjectExtensions.<TextBox>operator_doubleArrow(_textBox_1, _function_4);
      Button _button = new Button(contenedorParametrosPanel);
      final Procedure1<Button> _function_5 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Buscar");
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button, _function_5);
    }
    return _xblockexpression;
  }
}
