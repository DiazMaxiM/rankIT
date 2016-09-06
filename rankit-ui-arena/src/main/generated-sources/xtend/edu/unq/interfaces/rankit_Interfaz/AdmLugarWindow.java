package edu.unq.interfaces.rankit_Interfaz;

import edu.unq.interfaces.rankit_dominio.RankIT;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.CheckBox;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;

@SuppressWarnings("all")
public class AdmLugarWindow extends SimpleWindow<RankIT> {
  public AdmLugarWindow(final WindowOwner parent, final RankIT model) {
    super(parent, model);
    this.setTitle("Rank-IT -->Adm Servicios");
    this.setTaskDescription("Resumen de situación");
  }
  
  protected void createFormPanel(final Panel panelPrincipal) {
    this.resumenDeSituacion(panelPrincipal);
    this.crearListadoDeServicios(panelPrincipal);
    this.crearEdicionDeServicioSeleccionado(panelPrincipal);
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
  
  public Button crearListadoDeServicios(final Panel panel) {
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
      Button _button = new Button(servicioCompletaPanel);
      final Procedure1<Button> _function = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Edita la información");
        }
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Label _label_1 = new Label(servicioCompletaPanel);
      _label_1.setText("Nombre:");
      TextBox _textBox = new TextBox(servicioCompletaPanel);
      final Procedure1<TextBox> _function_1 = new Procedure1<TextBox>() {
        public void apply(final TextBox it) {
          it.setWidth(200);
        }
      };
      ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function_1);
      this.datosEnFormaHorizontal(servicioCompletaPanel);
      Label _label_2 = new Label(servicioCompletaPanel);
      _label_2.setText("Rankin promedio");
      Label _label_3 = new Label(servicioCompletaPanel);
      _label_3.setText("Calificaciones");
      Button _button_1 = new Button(servicioCompletaPanel);
      final Procedure1<Button> _function_2 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Revisar Publicaciones");
        }
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_2);
      Button _button_2 = new Button(servicioCompletaPanel);
      final Procedure1<Button> _function_3 = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Eliminar");
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_3);
    }
    return _xblockexpression;
  }
  
  public Label datosEnFormaHorizontal(final Panel panel) {
    Label _xblockexpression = null;
    {
      final Panel panelDatos = new Panel(panel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      panelDatos.setLayout(_horizontalLayout);
      new CheckBox(panelDatos);
      Label _label = new Label(panelDatos);
      _xblockexpression = _label.setText("Habilitado");
    }
    return _xblockexpression;
  }
  
  public Button panelIzquierdo(final Panel panel) {
    Button _xblockexpression = null;
    {
      final Panel panelDeListadoDeServicios = new Panel(panel);
      Button _button = new Button(panelDeListadoDeServicios);
      final Procedure1<Button> _function = new Procedure1<Button>() {
        public void apply(final Button it) {
          it.setCaption("Nuevo");
        }
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
    }
    return _xblockexpression;
  }
  
  protected void addActions(final Panel panel) {
  }
}
