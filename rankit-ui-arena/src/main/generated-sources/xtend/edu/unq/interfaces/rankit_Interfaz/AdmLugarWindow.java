package edu.unq.interfaces.rankit_Interfaz;

import edu.unq.interfaces.rankit_Interfaz.AdmCalificacionWindow;
import edu.unq.interfaces.rankit_dominio.AdmCalificaciones;
import edu.unq.interfaces.rankit_dominio.AdmPuntuables;
import edu.unq.interfaces.rankit_dominio.Calificacion;
import edu.unq.interfaces.rankit_dominio.CalificacionAppModel;
import edu.unq.interfaces.rankit_dominio.Puntuable;
import edu.unq.interfaces.rankit_dominio.PuntuableAppModel;
import edu.unq.interfaces.rankit_dominio.Usuario;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
public class AdmLugarWindow extends SimpleWindow<PuntuableAppModel> {
  public AdmLugarWindow(final WindowOwner parent, final PuntuableAppModel model) {
    super(parent, model);
    this.setTitle("Rank-IT -->Adm Servicios");
    this.setTaskDescription("Resumen de situación");
  }
  
  protected void createFormPanel(final Panel panelPrincipal) {
    final Panel panel = new Panel(panelPrincipal);
    this.resumenDeSituacion(panel);
    this.crearListadoDeServicios(panel);
    this.crearEdicionDeServicioSeleccionado(panel);
  }
  
  public Label resumenDeSituacion(final Panel panel) {
    Label _xblockexpression = null;
    {
      final Panel panelEstadisticas = new Panel(panel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      panelEstadisticas.setLayout(_horizontalLayout);
      this.puntuablesInscriptos(panelEstadisticas);
      this.puntuablesHabilitados(panelEstadisticas);
      _xblockexpression = this.puntuablesDesHabilitados(panelEstadisticas);
    }
    return _xblockexpression;
  }
  
  public Label puntuablesDesHabilitados(final Panel panel) {
    Label _xblockexpression = null;
    {
      Label _label = new Label(panel);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Deshabilitados: ");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      Label _label_1 = new Label(panel);
      final Procedure1<Label> _function_1 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("lugaresDeshabilitados");
        }
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
    }
    return _xblockexpression;
  }
  
  public Label puntuablesHabilitados(final Panel panel) {
    Label _xblockexpression = null;
    {
      Label _label = new Label(panel);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Habilitados: ");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      Label _label_1 = new Label(panel);
      final Procedure1<Label> _function_1 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("lugaresHabilitados");
        }
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
    }
    return _xblockexpression;
  }
  
  public Label puntuablesInscriptos(final Panel panel) {
    Label _xblockexpression = null;
    {
      Label _label = new Label(panel);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Lugares Inscriptos: ");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      Label _label_1 = new Label(panel);
      final Procedure1<Label> _function_1 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("lugaresInscriptos");
        }
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
    }
    return _xblockexpression;
  }
  
  public Button crearListadoDeServicios(final Panel panel) {
    Button _xblockexpression = null;
    {
      Panel panelBusqueda = new Panel(panel);
      this.titulo(panelBusqueda);
      _xblockexpression = this.ingresarDatosYBuscar(panelBusqueda);
    }
    return _xblockexpression;
  }
  
  public Label titulo(final Panel panel) {
    Label _xblockexpression = null;
    {
      Panel panelTitulo = new Panel(panel);
      ColumnLayout _columnLayout = new ColumnLayout(2);
      panelTitulo.setLayout(_columnLayout);
      Label _label = new Label(panelTitulo);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Lugares");
          it.setFontSize(15);
        }
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
    }
    return _xblockexpression;
  }
  
  public Button ingresarDatosYBuscar(final Panel panel) {
    Button _xblockexpression = null;
    {
      Panel panelDatos = new Panel(panel);
      ColumnLayout _columnLayout = new ColumnLayout(3);
      panelDatos.setLayout(_columnLayout);
      Label _label = new Label(panelDatos);
      _label.setText("Buscar por nombre de Lugar:");
      TextBox _textBox = new TextBox(panelDatos);
      final Procedure1<TextBox> _function = new Procedure1<TextBox>() {
        public void apply(final TextBox it) {
          it.<Object, ControlBuilder>bindValueToProperty("nombreDelLugarBuscado");
          it.setWidth(100);
        }
      };
      ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function);
      Button _button = new Button(panelDatos);
      final Procedure1<Button> _function_1 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Buscar");
          it.setWidth(100);
          final Action _function = new Action() {
            public void execute() {
              PuntuableAppModel _modelObject = AdmLugarWindow.this.getModelObject();
              _modelObject.buscarPorNombreDeLugar();
            }
          };
          Button _onClick = it.onClick(_function);
          Button _setAsDefault = _onClick.setAsDefault();
          _setAsDefault.disableOnError();
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button, _function_1);
    }
    return _xblockexpression;
  }
  
  public Button crearEdicionDeServicioSeleccionado(final Panel panel) {
    Button _xblockexpression = null;
    {
      final Panel panelDatos = new Panel(panel);
      ColumnLayout _columnLayout = new ColumnLayout(2);
      panelDatos.setLayout(_columnLayout);
      this.panelIzquierdo(panelDatos);
      _xblockexpression = this.panelDerecho(panelDatos);
    }
    return _xblockexpression;
  }
  
  public Button panelDerecho(final Panel panel) {
    Button _xblockexpression = null;
    {
      final Panel servicioCompletaPanel = new Panel(panel);
      VerticalLayout _verticalLayout = new VerticalLayout();
      servicioCompletaPanel.setLayout(_verticalLayout);
      this.mostrarNombre(servicioCompletaPanel);
      this.panelErrores(servicioCompletaPanel);
      this.editarNombre(servicioCompletaPanel);
      this.habilitarPuntuable(servicioCompletaPanel);
      this.calificacionesPuntuable(servicioCompletaPanel);
      _xblockexpression = this.botones(servicioCompletaPanel);
    }
    return _xblockexpression;
  }
  
  public Label mostrarNombre(final Panel panel) {
    Label _xblockexpression = null;
    {
      Panel panelNombre = new Panel(panel);
      ColumnLayout _columnLayout = new ColumnLayout(2);
      panelNombre.setLayout(_columnLayout);
      Label _label = new Label(panelNombre);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Nombre: ");
          it.setFontSize(13);
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      Label _label_1 = new Label(panelNombre);
      final Procedure1<Label> _function_1 = new Procedure1<Label>() {
        public void apply(final Label it) {
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "puntuableSeleccionado.nombre");
          it.setFontSize(13);
        }
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
    }
    return _xblockexpression;
  }
  
  public ErrorsPanel panelErrores(final Panel panel) {
    return new ErrorsPanel(panel, "Edita la información");
  }
  
  public TextBox editarNombre(final Panel panel) {
    TextBox _xblockexpression = null;
    {
      Label _label = new Label(panel);
      _label.setText("Nombre:");
      TextBox _textBox = new TextBox(panel);
      final Procedure1<TextBox> _function = new Procedure1<TextBox>() {
        public void apply(final TextBox it) {
          it.<ControlBuilder>bindEnabledToProperty("hayPuntuableSeleccionado");
          it.<Object, ControlBuilder>bindValueToProperty("nombre");
        }
      };
      _xblockexpression = ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function);
    }
    return _xblockexpression;
  }
  
  public Label habilitarPuntuable(final Panel panel) {
    Label _xblockexpression = null;
    {
      Panel panelHabilitar = new Panel(panel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      panelHabilitar.setLayout(_horizontalLayout);
      CheckBox _checkBox = new CheckBox(panel);
      final Procedure1<CheckBox> _function = new Procedure1<CheckBox>() {
        public void apply(final CheckBox it) {
          it.<ControlBuilder>bindEnabledToProperty("hayPuntuableSeleccionado");
          it.<Object, ControlBuilder>bindValueToProperty("habilitado");
        }
      };
      ObjectExtensions.<CheckBox>operator_doubleArrow(_checkBox, _function);
      Label _label = new Label(panel);
      _xblockexpression = _label.setText("Habilitado");
    }
    return _xblockexpression;
  }
  
  public Label calificacionesPuntuable(final Panel panel) {
    Label _xblockexpression = null;
    {
      this.rating(panel);
      _xblockexpression = this.calificaciones(panel);
    }
    return _xblockexpression;
  }
  
  public Label rating(final Panel panel) {
    Label _xblockexpression = null;
    {
      Panel panelRating = new Panel(panel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      panelRating.setLayout(_horizontalLayout);
      Label _label = new Label(panelRating);
      _label.setText("Ranting promedio:");
      Label _label_1 = new Label(panelRating);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<ControlBuilder>bindEnabledToProperty("hayPuntuableSeleccionado");
          it.<Object, ControlBuilder>bindValueToProperty("ratingPromedio");
        }
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function);
    }
    return _xblockexpression;
  }
  
  public Label calificaciones(final Panel panel) {
    Label _xblockexpression = null;
    {
      Panel panelCalificaciones = new Panel(panel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      panelCalificaciones.setLayout(_horizontalLayout);
      Label _label = new Label(panelCalificaciones);
      _label.setText("Calificaciones:");
      Label _label_1 = new Label(panelCalificaciones);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<ControlBuilder>bindEnabledToProperty("hayPuntuableSeleccionado");
          it.<Object, ControlBuilder>bindValueToProperty("cantidadDeCalificacionesDelPuntuable");
        }
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function);
    }
    return _xblockexpression;
  }
  
  public Button botones(final Panel panel) {
    Button _xblockexpression = null;
    {
      Button _button = new Button(panel);
      final Procedure1<Button> _function = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Revisar Publicaciones");
          it.<ControlBuilder>bindEnabledToProperty("hayPuntuableSeleccionado");
          final Action _function = new Action() {
            public void execute() {
              PuntuableAppModel _modelObject = AdmLugarWindow.this.getModelObject();
              List<Calificacion> _calificacionesDelPuntuable = _modelObject.getCalificacionesDelPuntuable();
              PuntuableAppModel _modelObject_1 = AdmLugarWindow.this.getModelObject();
              Puntuable _puntuableSeleccionado = _modelObject_1.getPuntuableSeleccionado();
              AdmLugarWindow.this.mostrarCalificacionesDelPuntuable(_calificacionesDelPuntuable, _puntuableSeleccionado);
            }
          };
          it.onClick(_function);
        }
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(panel);
      final Procedure1<Button> _function_1 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Eliminar");
          it.<ControlBuilder>bindEnabledToProperty("hayPuntuableSeleccionado");
          final Action _function = new Action() {
            public void execute() {
              PuntuableAppModel _modelObject = AdmLugarWindow.this.getModelObject();
              _modelObject.eliminarLugar();
            }
          };
          it.onClick(_function);
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
    }
    return _xblockexpression;
  }
  
  public Button panelIzquierdo(final Panel panel) {
    Button _xblockexpression = null;
    {
      final Panel panelDeListadoDeServicios = new Panel(panel);
      this.contenedorTabla(panelDeListadoDeServicios);
      _xblockexpression = this.panelBotones(panelDeListadoDeServicios);
    }
    return _xblockexpression;
  }
  
  public Table<Puntuable> contenedorTabla(final Panel panel) {
    Table<Puntuable> _xblockexpression = null;
    {
      final Panel panelTabla = new Panel(panel);
      Table<Puntuable> _table = new Table<Puntuable>(panelTabla, Puntuable.class);
      final Procedure1<Table<Puntuable>> _function = new Procedure1<Table<Puntuable>>() {
        public void apply(final Table<Puntuable> it) {
          ViewObservable<Table<Puntuable>, TableBuilder<Puntuable>> _items = it.items();
          ArenaXtendExtensions.operator_spaceship(_items, "administradorDePuntuables.lugares");
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "puntuableSeleccionado");
          it.setWidth(200);
          Column<Puntuable> _column = new Column<Puntuable>(it);
          final Procedure1<Column<Puntuable>> _function = new Procedure1<Column<Puntuable>>() {
            public void apply(final Column<Puntuable> it) {
              it.setTitle("Fecha De Registro");
              it.setFixedSize(150);
              PropertyLabelProvider<Puntuable> _bindContentsToProperty = it.bindContentsToProperty("fechaDeRegistro");
              final Transformer<Date, String> _function = new Transformer<Date, String>() {
                public String transform(final Date fecha) {
                  SimpleDateFormat _simpleDateFormat = new SimpleDateFormat("dd/MM/YYYY HH:mm");
                  return _simpleDateFormat.format(fecha);
                }
              };
              _bindContentsToProperty.setTransformer(_function);
            }
          };
          ObjectExtensions.<Column<Puntuable>>operator_doubleArrow(_column, _function);
          Column<Puntuable> _column_1 = new Column<Puntuable>(it);
          final Procedure1<Column<Puntuable>> _function_1 = new Procedure1<Column<Puntuable>>() {
            public void apply(final Column<Puntuable> it) {
              it.setTitle("Nombre");
              it.setFixedSize(150);
              it.bindContentsToProperty("nombre");
            }
          };
          ObjectExtensions.<Column<Puntuable>>operator_doubleArrow(_column_1, _function_1);
          Column<Puntuable> _column_2 = new Column<Puntuable>(it);
          final Procedure1<Column<Puntuable>> _function_2 = new Procedure1<Column<Puntuable>>() {
            public void apply(final Column<Puntuable> it) {
              it.setTitle("Habilitado");
              it.setFixedSize(150);
              PropertyLabelProvider<Puntuable> _bindContentsToProperty = it.bindContentsToProperty("habilitado");
              final Transformer<Boolean, String> _function = new Transformer<Boolean, String>() {
                public String transform(final Boolean isHabilitado) {
                  String _xifexpression = null;
                  if ((isHabilitado).booleanValue()) {
                    _xifexpression = "SI";
                  } else {
                    _xifexpression = "NO";
                  }
                  return _xifexpression;
                }
              };
              _bindContentsToProperty.setTransformer(_function);
            }
          };
          ObjectExtensions.<Column<Puntuable>>operator_doubleArrow(_column_2, _function_2);
        }
      };
      _xblockexpression = ObjectExtensions.<Table<Puntuable>>operator_doubleArrow(_table, _function);
    }
    return _xblockexpression;
  }
  
  public Button panelBotones(final Panel panel) {
    Button _xblockexpression = null;
    {
      final Panel panelBotones = new Panel(panel);
      Button _button = new Button(panelBotones);
      final Procedure1<Button> _function = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Nuevo");
          final Action _function = new Action() {
            public void execute() {
              PuntuableAppModel _modelObject = AdmLugarWindow.this.getModelObject();
              _modelObject.nuevoLugar();
            }
          };
          it.onClick(_function);
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
    }
    return _xblockexpression;
  }
  
  public AdmCalificacionWindow mostrarCalificacionesDelPuntuable(final List<Calificacion> calificacionesDelPuntuable, final Puntuable lugar) {
    AdmCalificacionWindow _xblockexpression = null;
    {
      AdmPuntuables admPuntuables = new AdmPuntuables();
      admPuntuables.agregarLugar(lugar);
      AdmCalificaciones admCalificaciones = new AdmCalificaciones();
      admCalificaciones.agregarTodasLasCalificaciones(calificacionesDelPuntuable);
      Usuario usuario = new Usuario();
      CalificacionAppModel appModel = new CalificacionAppModel(admCalificaciones, admPuntuables, usuario);
      AdmCalificacionWindow _admCalificacionWindow = new AdmCalificacionWindow(this, appModel);
      final Procedure1<AdmCalificacionWindow> _function = new Procedure1<AdmCalificacionWindow>() {
        public void apply(final AdmCalificacionWindow it) {
          it.open();
        }
      };
      _xblockexpression = ObjectExtensions.<AdmCalificacionWindow>operator_doubleArrow(_admCalificacionWindow, _function);
    }
    return _xblockexpression;
  }
  
  protected void addActions(final Panel panel) {
  }
}
