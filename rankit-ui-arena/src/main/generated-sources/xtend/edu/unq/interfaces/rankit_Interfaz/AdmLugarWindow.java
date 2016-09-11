package edu.unq.interfaces.rankit_Interfaz;

import edu.unq.interfaces.component.Titulo;
import edu.unq.interfaces.rankit_dominio.Lugar;
import edu.unq.interfaces.rankit_dominio.PuntuableAppModel;
import java.text.SimpleDateFormat;
import java.util.Date;
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
      Label _label = new Label(panelEstadisticas);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Lugares Inscriptos: ");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      Label _label_1 = new Label(panelEstadisticas);
      final Procedure1<Label> _function_1 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("administradorDePuntuables.lugaresInscriptos");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
      Label _label_2 = new Label(panelEstadisticas);
      final Procedure1<Label> _function_2 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Habilitados: ");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_2, _function_2);
      Label _label_3 = new Label(panelEstadisticas);
      final Procedure1<Label> _function_3 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("administradorDePuntuables.lugaresHabilitados");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_3, _function_3);
      Label _label_4 = new Label(panelEstadisticas);
      final Procedure1<Label> _function_4 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Deshabilitados: ");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_4, _function_4);
      Label _label_5 = new Label(panelEstadisticas);
      final Procedure1<Label> _function_5 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<Object, ControlBuilder>bindValueToProperty("administradorDePuntuables.lugaresDeshabilitados");
        }
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_5, _function_5);
    }
    return _xblockexpression;
  }
  
  public Button crearListadoDeServicios(final Panel panel) {
    Button _xblockexpression = null;
    {
      new Titulo(panel, "Servicios");
      final Panel panelBusqueda = new Panel(panel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      panelBusqueda.setLayout(_horizontalLayout);
      Label _label = new Label(panelBusqueda);
      _label.setText("Buscar por nombre de servicio");
      TextBox _textBox = new TextBox(panelBusqueda);
      final Procedure1<TextBox> _function = new Procedure1<TextBox>() {
        public void apply(final TextBox it) {
          it.<Object, ControlBuilder>bindValueToProperty("nombreDelPuntuableBuscado");
          it.setWidth(200);
        }
      };
      ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function);
      Button _button = new Button(panelBusqueda);
      final Procedure1<Button> _function_1 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Buscar");
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
      Label _label = new Label(servicioCompletaPanel);
      _label.setText("Nombre:");
      Label _label_1 = new Label(servicioCompletaPanel);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "puntuableSeleccionado.nombre");
          it.setFontSize(13);
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function);
      new ErrorsPanel(servicioCompletaPanel, "Edita la información");
      Label _label_2 = new Label(servicioCompletaPanel);
      _label_2.setText("Nombre:");
      TextBox _textBox = new TextBox(servicioCompletaPanel);
      final Procedure1<TextBox> _function_1 = new Procedure1<TextBox>() {
        public void apply(final TextBox it) {
          it.<ControlBuilder>bindEnabledToProperty("hayPuntuableSeleccionado");
          it.<Object, ControlBuilder>bindValueToProperty("nombrePuntuable");
        }
      };
      ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function_1);
      Label _label_3 = new Label(servicioCompletaPanel);
      _label_3.setText("Habilitado");
      CheckBox _checkBox = new CheckBox(servicioCompletaPanel);
      final Procedure1<CheckBox> _function_2 = new Procedure1<CheckBox>() {
        public void apply(final CheckBox it) {
          it.<ControlBuilder>bindEnabledToProperty("hayPuntuableSeleccionado");
          it.<Object, ControlBuilder>bindValueToProperty("habilitado");
        }
      };
      ObjectExtensions.<CheckBox>operator_doubleArrow(_checkBox, _function_2);
      Label _label_4 = new Label(servicioCompletaPanel);
      _label_4.setText("Ranting promedio:");
      Label _label_5 = new Label(servicioCompletaPanel);
      final Procedure1<Label> _function_3 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<ControlBuilder>bindEnabledToProperty("hayPuntuableSeleccionado");
          it.<Object, ControlBuilder>bindValueToProperty("ratingPromedio");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_5, _function_3);
      Label _label_6 = new Label(servicioCompletaPanel);
      _label_6.setText("Calificaciones:");
      Label _label_7 = new Label(servicioCompletaPanel);
      final Procedure1<Label> _function_4 = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.<ControlBuilder>bindEnabledToProperty("hayPuntuableSeleccionado");
          it.<Object, ControlBuilder>bindValueToProperty("cantidadDeCalificacionesDelPuntuable");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_7, _function_4);
      Button _button = new Button(servicioCompletaPanel);
      final Procedure1<Button> _function_5 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Revisar Publicaciones");
          it.<ControlBuilder>bindEnabledToProperty("hayPuntuableSeleccionado");
        }
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function_5);
      Button _button_1 = new Button(servicioCompletaPanel);
      final Procedure1<Button> _function_6 = new Procedure1<Button>() {
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
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_6);
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
  
  public Table<Lugar> contenedorTabla(final Panel panel) {
    Table<Lugar> _xblockexpression = null;
    {
      final Panel panelTabla = new Panel(panel);
      Table<Lugar> _table = new Table<Lugar>(panelTabla, Lugar.class);
      final Procedure1<Table<Lugar>> _function = new Procedure1<Table<Lugar>>() {
        public void apply(final Table<Lugar> it) {
          ViewObservable<Table<Lugar>, TableBuilder<Lugar>> _items = it.items();
          ArenaXtendExtensions.operator_spaceship(_items, "administradorDePuntuables.lugares");
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "puntuableSeleccionado");
          it.setWidth(200);
          Column<Lugar> _column = new Column<Lugar>(it);
          final Procedure1<Column<Lugar>> _function = new Procedure1<Column<Lugar>>() {
            public void apply(final Column<Lugar> it) {
              it.setTitle("Fecha De Registro");
              it.setFixedSize(150);
              PropertyLabelProvider<Lugar> _bindContentsToProperty = it.bindContentsToProperty("fechaDeRegistro");
              final Transformer<Date, String> _function = new Transformer<Date, String>() {
                public String transform(final Date fecha) {
                  SimpleDateFormat _simpleDateFormat = new SimpleDateFormat("dd/MM/YYYY HH:mm");
                  return _simpleDateFormat.format(fecha);
                }
              };
              _bindContentsToProperty.setTransformer(_function);
            }
          };
          ObjectExtensions.<Column<Lugar>>operator_doubleArrow(_column, _function);
          Column<Lugar> _column_1 = new Column<Lugar>(it);
          final Procedure1<Column<Lugar>> _function_1 = new Procedure1<Column<Lugar>>() {
            public void apply(final Column<Lugar> it) {
              it.setTitle("Nombre");
              it.setFixedSize(150);
              it.bindContentsToProperty("nombre");
            }
          };
          ObjectExtensions.<Column<Lugar>>operator_doubleArrow(_column_1, _function_1);
          Column<Lugar> _column_2 = new Column<Lugar>(it);
          final Procedure1<Column<Lugar>> _function_2 = new Procedure1<Column<Lugar>>() {
            public void apply(final Column<Lugar> it) {
              it.setTitle("Habilitado");
              it.setFixedSize(150);
              PropertyLabelProvider<Lugar> _bindContentsToProperty = it.bindContentsToProperty("habilitado");
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
          ObjectExtensions.<Column<Lugar>>operator_doubleArrow(_column_2, _function_2);
        }
      };
      _xblockexpression = ObjectExtensions.<Table<Lugar>>operator_doubleArrow(_table, _function);
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
  
  protected void addActions(final Panel panel) {
  }
}
