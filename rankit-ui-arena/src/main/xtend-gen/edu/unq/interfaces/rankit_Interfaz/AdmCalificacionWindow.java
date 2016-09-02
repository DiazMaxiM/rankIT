package edu.unq.interfaces.rankit_Interfaz;

import edu.unq.interfaces.rankit_Interfaz.ResultadoCalificacion;
import edu.unq.interfaces.rankit_dominio.Calificacion;
import edu.unq.interfaces.rankit_dominio.Usuario;
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

@SuppressWarnings("all")
public class AdmCalificacionWindow extends SimpleWindow<Calificacion> {
  public AdmCalificacionWindow(final WindowOwner parent, final Calificacion model) {
    super(parent, new Calificacion(new Usuario()));
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
        it.setText("Calificaciones Registradas:");
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
      Label _label_2 = new Label(SituacionEstadoSituacionPanel);
      final Procedure1<Label> _function_2 = (Label it) -> {
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_2, _function_2);
      Label _label_3 = new Label(SituacionEstadoSituacionPanel);
      final Procedure1<Label> _function_3 = (Label it) -> {
        it.setText("Ofensivas:");
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_3, _function_3);
      Label _label_4 = new Label(SituacionEstadoSituacionPanel);
      final Procedure1<Label> _function_4 = (Label it) -> {
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_4, _function_4);
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
    this.contenedorBusqueda(mainPanel);
    this.contenedorTablaYOpciones(mainPanel);
  }
  
  public void contenedorTablaYOpciones(final Panel mainPanel) {
    final Panel contenedorTablaYOpcionesPanel = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(2);
    contenedorTablaYOpcionesPanel.setLayout(_columnLayout);
    this.contenedorTabla(contenedorTablaYOpcionesPanel);
  }
  
  public void contenedorTabla(final Panel mainPanel) {
    Table<ResultadoCalificacion> _table = new Table<ResultadoCalificacion>(mainPanel, ResultadoCalificacion.class);
    final Procedure1<Table<ResultadoCalificacion>> _function = (Table<ResultadoCalificacion> it) -> {
      it.setHeight(200);
      Column<ResultadoCalificacion> _column = new Column<ResultadoCalificacion>(it);
      final Procedure1<Column<ResultadoCalificacion>> _function_1 = (Column<ResultadoCalificacion> it_1) -> {
        it_1.setTitle("Lotería");
        it_1.setFixedSize(150);
      };
      ObjectExtensions.<Column<ResultadoCalificacion>>operator_doubleArrow(_column, _function_1);
      Column<ResultadoCalificacion> _column_1 = new Column<ResultadoCalificacion>(it);
      final Procedure1<Column<ResultadoCalificacion>> _function_2 = (Column<ResultadoCalificacion> it_1) -> {
        it_1.setTitle("Ganador");
        it_1.setFixedSize(150);
      };
      ObjectExtensions.<Column<ResultadoCalificacion>>operator_doubleArrow(_column_1, _function_2);
    };
    ObjectExtensions.<Table<ResultadoCalificacion>>operator_doubleArrow(_table, _function);
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
      final Procedure1<Label> _function = (Label it) -> {
        it.setText("Calificaciones:");
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      Label _label_1 = new Label(contenedorParametrosPanel);
      final Procedure1<Label> _function_1 = (Label it) -> {
        it.setText("Usuario:");
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
      TextBox _textBox = new TextBox(contenedorParametrosPanel);
      final Procedure1<TextBox> _function_2 = (TextBox it) -> {
      };
      ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function_2);
      Label _label_2 = new Label(contenedorParametrosPanel);
      final Procedure1<Label> _function_3 = (Label it) -> {
        it.setText("Evaluado:");
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_2, _function_3);
      TextBox _textBox_1 = new TextBox(contenedorParametrosPanel);
      final Procedure1<TextBox> _function_4 = (TextBox it) -> {
      };
      ObjectExtensions.<TextBox>operator_doubleArrow(_textBox_1, _function_4);
      Button _button = new Button(contenedorParametrosPanel);
      final Procedure1<Button> _function_5 = (Button it) -> {
        it.setCaption("Buscar");
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button, _function_5);
    }
    return _xblockexpression;
  }
}
