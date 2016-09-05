package edu.unq.interfaces.rankit_Interfaz;

import edu.unq.interfaces.rankit_dominio.Lugar;
import edu.unq.interfaces.rankit_dominio.RankIT;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.TableBuilder;
import org.uqbar.lacar.ui.model.bindings.ViewObservable;

@SuppressWarnings("all")
public class AdmLugarWindow extends SimpleWindow<RankIT> {
  public AdmLugarWindow(final WindowOwner parent, final RankIT model) {
    super(parent, model);
    this.setTitle("Rank-IT -->Adm Servicios");
    this.setTaskDescription("Resumen de situación");
  }
  
  protected void createFormPanel(final Panel panelPrincipal) {
    this.resumenDeSituacion(panelPrincipal);
    this.busqueda(panelPrincipal);
    this.resultadosYEdicion(panelPrincipal);
  }
  
  public Label resumenDeSituacion(final Panel panel) {
    Label _xblockexpression = null;
    {
      final Panel panelEstadisticas = new Panel(panel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      panelEstadisticas.setLayout(_horizontalLayout);
      Label _label = new Label(panelEstadisticas);
      _label.setText("Lugares inscriptos:");
      Label _label_1 = new Label(panelEstadisticas);
      _label_1.setText("Habilitados:");
      Label _label_2 = new Label(panelEstadisticas);
      _xblockexpression = _label_2.setText("Deshabilitados:");
    }
    return _xblockexpression;
  }
  
  public Button busqueda(final Panel panel) {
    Button _xblockexpression = null;
    {
      final Panel panelBusqueda = new Panel(panel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      panelBusqueda.setLayout(_horizontalLayout);
      Label _label = new Label(panelBusqueda);
      _label.setText("Servicios");
      Label _label_1 = new Label(panelBusqueda);
      _label_1.setText("Buscar por nombre de servicio");
      TextBox _textBox = new TextBox(panelBusqueda);
      final Procedure1<TextBox> _function = new Procedure1<TextBox>() {
        public void apply(final TextBox it) {
          it.setWidth(200);
        }
      };
      ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function);
      Button _button = new Button(panelBusqueda);
      final Procedure1<Button> _function_1 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Buscar");
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button, _function_1);
    }
    return _xblockexpression;
  }
  
  public Label resultadosYEdicion(final Panel panel) {
    Label _xblockexpression = null;
    {
      final Panel panelDatos = new Panel(panel);
      ColumnLayout _columnLayout = new ColumnLayout(2);
      panelDatos.setLayout(_columnLayout);
      this.panelIzquierdo(panelDatos);
      _xblockexpression = this.panelDerecho(panelDatos);
    }
    return _xblockexpression;
  }
  
  public Label panelDerecho(final Panel panel) {
    Label _label = new Label(panel);
    return _label.setText("PanelDerecho");
  }
  
  public Column<Lugar> panelIzquierdo(final Panel panel) {
    Column<Lugar> _xblockexpression = null;
    {
      Table<Lugar> _table = new Table<Lugar>(panel, Lugar.class);
      final Procedure1<Table<Lugar>> _function = new Procedure1<Table<Lugar>>() {
        public void apply(final Table<Lugar> it) {
          ViewObservable<Table<Lugar>, TableBuilder<Lugar>> _items = it.items();
          ArenaXtendExtensions.operator_spaceship(_items, "lugares");
        }
      };
      final Table<Lugar> table = ObjectExtensions.<Table<Lugar>>operator_doubleArrow(_table, _function);
      Column<Lugar> _column = new Column<Lugar>(table);
      final Procedure1<Column<Lugar>> _function_1 = new Procedure1<Column<Lugar>>() {
        public void apply(final Column<Lugar> it) {
          it.setTitle("Nombre");
          it.setFixedSize(200);
        }
      };
      _xblockexpression = ObjectExtensions.<Column<Lugar>>operator_doubleArrow(_column, _function_1);
    }
    return _xblockexpression;
  }
  
  protected void addActions(final Panel arg0) {
  }
}
