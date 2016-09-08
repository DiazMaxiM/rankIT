package edu.unq.interfaces.rankit_Interfaz;

import edu.unq.interfaces.rankit_dominio.Calificacion;
import edu.unq.interfaces.rankit_dominio.CalificacionAppModel;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.TableBuilder;
import org.uqbar.lacar.ui.model.bindings.ViewObservable;

@SuppressWarnings("all")
public class AdmCalificacionWindow extends SimpleWindow<CalificacionAppModel> {
  public AdmCalificacionWindow(final WindowOwner parent, final CalificacionAppModel model) {
    super(parent, model);
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
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Resumen de situación:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
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
        }
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_4, _function_4);
    }
    return _xblockexpression;
  }
  
  protected void addActions(final Panel actionsPanel) {
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    this.setTitle("Rank-IT --> Adm Usuarios");
    this.contenedorSituacion(mainPanel);
    this.contenedorBusqueda(mainPanel);
    this.contenedorTablaYOpciones(mainPanel);
  }
  
  public void contenedorTablaYOpciones(final Panel mainPanel) {
    final Panel contenedorTablaYOpcionesPanel = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout = new HorizontalLayout();
    contenedorTablaYOpcionesPanel.setLayout(_horizontalLayout);
    this.contenedorTabla(contenedorTablaYOpcionesPanel);
  }
  
  public void contenedorTabla(final Panel mainPanel) {
    Table<Calificacion> _table = new Table<Calificacion>(mainPanel, Calificacion.class);
    final Procedure1<Table<Calificacion>> _function = new Procedure1<Table<Calificacion>>() {
      public void apply(final Table<Calificacion> it) {
        ViewObservable<Table<Calificacion>, TableBuilder<Calificacion>> _items = it.items();
        ArenaXtendExtensions.operator_spaceship(_items, "administradorCalificacion.listaCalificaciones");
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "calificacionSeleccionada");
        it.setWidth(200);
        Column<Calificacion> _column = new Column<Calificacion>(it);
        final Procedure1<Column<Calificacion>> _function = new Procedure1<Column<Calificacion>>() {
          public void apply(final Column<Calificacion> it) {
            it.setTitle("Evaluado");
            it.setFixedSize(150);
            it.bindContentsToProperty("evaluado");
          }
        };
        ObjectExtensions.<Column<Calificacion>>operator_doubleArrow(_column, _function);
        Column<Calificacion> _column_1 = new Column<Calificacion>(it);
        final Procedure1<Column<Calificacion>> _function_1 = new Procedure1<Column<Calificacion>>() {
          public void apply(final Column<Calificacion> it) {
            it.setTitle("Ptos");
            it.setFixedSize(150);
            it.bindContentsToProperty("puntos");
          }
        };
        ObjectExtensions.<Column<Calificacion>>operator_doubleArrow(_column_1, _function_1);
        Column<Calificacion> _column_2 = new Column<Calificacion>(it);
        final Procedure1<Column<Calificacion>> _function_2 = new Procedure1<Column<Calificacion>>() {
          public void apply(final Column<Calificacion> it) {
            it.setTitle("Fecha");
            it.setFixedSize(150);
            it.bindContentsToProperty("fecha");
          }
        };
        ObjectExtensions.<Column<Calificacion>>operator_doubleArrow(_column_2, _function_2);
        Column<Calificacion> _column_3 = new Column<Calificacion>(it);
        final Procedure1<Column<Calificacion>> _function_3 = new Procedure1<Column<Calificacion>>() {
          public void apply(final Column<Calificacion> it) {
            it.setTitle("User");
            it.setFixedSize(150);
            it.bindContentsToProperty("usuario");
          }
        };
        ObjectExtensions.<Column<Calificacion>>operator_doubleArrow(_column_3, _function_3);
        Column<Calificacion> _column_4 = new Column<Calificacion>(it);
        final Procedure1<Column<Calificacion>> _function_4 = new Procedure1<Column<Calificacion>>() {
          public void apply(final Column<Calificacion> it) {
            it.setTitle("Es Ofensiva");
            it.setFixedSize(150);
            it.bindContentsToProperty("contenidoOfensivo");
          }
        };
        ObjectExtensions.<Column<Calificacion>>operator_doubleArrow(_column_4, _function_4);
      }
    };
    ObjectExtensions.<Table<Calificacion>>operator_doubleArrow(_table, _function);
  }
  
  public Object contenedorOpciones(final Panel panel) {
    return null;
  }
  
  public Button contenedorBusqueda(final Panel mainPanel) {
    Button _xblockexpression = null;
    {
      final Panel contenedorTituloPanel = new Panel(mainPanel);
      final Panel contenedorParametrosPanel = new Panel(mainPanel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      contenedorTituloPanel.setLayout(_horizontalLayout);
      ColumnLayout _columnLayout = new ColumnLayout(5);
      contenedorParametrosPanel.setLayout(_columnLayout);
      Label _label = new Label(contenedorTituloPanel);
      final Procedure1<Label> _function = new Procedure1<Label>() {
        public void apply(final Label it) {
          it.setText("Calificaciones:");
        }
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
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
