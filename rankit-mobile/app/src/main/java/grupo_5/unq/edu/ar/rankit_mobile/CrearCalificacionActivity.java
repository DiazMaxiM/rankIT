package grupo_5.unq.edu.ar.rankit_mobile;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.EditText;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import grupo_5.unq.edu.ar.rankit_mobile.service.CalificacionService;
import grupo_5.unq.edu.ar.rankit_mobile.service.EvaluadosService;
import model.Calificacion;
import model.IServiceFactory;
import model.PuntuablesBasico;
import model.UserException;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class CrearCalificacionActivity extends AppCompatActivity {
    Integer idUsuario;
    List<PuntuablesBasico>puntuablesBasicos=new ArrayList<>();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_crear_calificacion);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        Bundle parametros= getIntent().getExtras();
        if (null != parametros){
            idUsuario=parametros.getInt(CalificacionDetailFragment.IDUSUARIO);
        }
        //pide los puntuables basicos al servidor
        this.obtenerEvaluados();

    }

    @Override
    public boolean onSupportNavigateUp(){
        irALaPantallaCalificacionesDelUsuario();
        return false;
    }

    private void irALaPantallaCalificacionesDelUsuario() {
        Intent intent = new Intent(this, CalificacionListActivity.class);
        intent.putExtra(CalificacionDetailFragment.IDUSUARIO,getIdUsuario());
        startActivity(intent);
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setPuntuablesBasicos(List<PuntuablesBasico>puntuables){
        this.puntuablesBasicos=puntuables;
    }
    private  void obtenerEvaluados(){
        new IServiceFactory().getServiceFactoryFor(EvaluadosService.class).getEvaluados(new Callback<List<PuntuablesBasico>>() {
            @Override
            public void success(List<PuntuablesBasico> evaluados, Response response) {
                setPuntuablesBasicos(evaluados);
                agregarEvaluados(evaluados);
            }

            @Override
            public void failure(RetrofitError error) {
                Log.e("", error.getMessage());
                error.printStackTrace();
            }
        });
    }

    private  void agregarEvaluados(List<PuntuablesBasico>puntuablesBasicos){
        List<String> resultado=new ArrayList<String>();
        for(int i=0;i<puntuablesBasicos.size();i++){
            resultado.add(puntuablesBasicos.get(i).getNombre());
        }
        //Es como el autocomplete del segundo tp
        AutoCompleteTextView evaluados=(AutoCompleteTextView) findViewById(R.id.nombresAEvaluar);
        evaluados.setAdapter(this.getNombreEvaluados(this,resultado));


    }

    private ArrayAdapter<String>getNombreEvaluados(Context context,List<String>evaluados) {
       return new ArrayAdapter<String>(context,android.R.layout.simple_dropdown_item_1line,evaluados);
    }

    public void guardarCalificacionNueva(View view){
        Calificacion nuevaCalificacion = new Calificacion();
        AutoCompleteTextView nombreEvaluado= (AutoCompleteTextView)findViewById(R.id.nombresAEvaluar);
        PuntuablesBasico evaluado= devolverEvaluado(nombreEvaluado.getText().toString());
        nuevaCalificacion.setEvaluado(evaluado);


        EditText puntosText= (EditText)findViewById(R.id.puntos);
        String puntos= puntosText.getText().toString();
        nuevaCalificacion.setPuntos(puntos);

        EditText motivoText=(EditText) findViewById(R.id.detalle);
        String motivo=motivoText.getText().toString();
        nuevaCalificacion.setDetalle(motivo);

        nuevaCalificacion.setUsuario(getIdUsuario());
        enviarCalificacion(nuevaCalificacion);

    }

    private void enviarCalificacion(Calificacion calificacion){
        new IServiceFactory().getServiceFactoryFor(CalificacionService.class).getCalificacion(calificacion,new Callback<Response>() {

            @Override
            public void success(Response respuesta, Response response) {
                finish();

            }

            @Override
            public void failure(RetrofitError error) {
                Toast.makeText(getBaseContext(),new UserException().obtenerError(error), Toast.LENGTH_SHORT).show();
            }
        });
    }

    private PuntuablesBasico devolverEvaluado(String nombreEvaluado){
        PuntuablesBasico evaluado= new PuntuablesBasico();
        for(int i=0;i<this.puntuablesBasicos.size();i++){
            if(nombreEvaluado.equals(this.puntuablesBasicos.get(i).getNombre())){
                    evaluado=this.puntuablesBasicos.get(i);
            }
        }

        return evaluado;
    }
}
