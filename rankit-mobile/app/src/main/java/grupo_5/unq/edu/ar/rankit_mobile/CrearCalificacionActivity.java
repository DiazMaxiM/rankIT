package grupo_5.unq.edu.ar.rankit_mobile;

import android.content.Context;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import grupo_5.unq.edu.ar.rankit_mobile.service.CalificacionService;
import grupo_5.unq.edu.ar.rankit_mobile.service.EvaluadosService;
import grupo_5.unq.edu.ar.rankit_mobile.service.UsuarioService;
import model.Calificacion;
import model.IServiceFactory;
import model.PuntuableBasico;
import model.Usuario;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class CrearCalificacionActivity extends AppCompatActivity {
    List<String> nombreEvaluados=new ArrayList<>();
    List<PuntuableBasico>evaluados=new ArrayList<>();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_crear_calificacion);
        //pide los puntuables basicos al servidor
        obtenerEvaluados();
        //Es como el autocomplete del segundo tp
        AutoCompleteTextView evaluados=(AutoCompleteTextView) findViewById(R.id.nombresAEvaluar);
        evaluados.setAdapter(this.getNombreEvaluados(this,nombreEvaluados));
    }
    private  void obtenerEvaluados(){
        new IServiceFactory().getServiceFactoryFor(EvaluadosService.class).getEvaluados(new Callback<List<PuntuableBasico>>() {
            @Override
            public void success(List<PuntuableBasico> evaluados, Response response) {
                agregarEvaluados(evaluados);
            }

            @Override
            public void failure(RetrofitError error) {
                Log.e("", error.getMessage());
                error.printStackTrace();
            }
        });
    }

    private  void agregarEvaluados(List<PuntuableBasico>evaluados){
        List<String> resultado=new ArrayList<String>();
        for(int i=0;i<evaluados.size();i++){
            resultado.add(evaluados.get(i).getNombre());
        }
        this.evaluados=evaluados;
        this.nombreEvaluados=resultado;

    }

    private ArrayAdapter<String>getNombreEvaluados(Context context,List<String>evaluados) {
       return new ArrayAdapter<String>(context,android.R.layout.simple_dropdown_item_1line,evaluados);
    }

    public void calificar(View view){
        Calificacion nuevaCalificacion = new Calificacion();
        AutoCompleteTextView nombreEvaluado= (AutoCompleteTextView)findViewById(R.id.nombresAEvaluar);
        PuntuableBasico evaluado= devolverEvaluado(nombreEvaluado.getText().toString());
        nuevaCalificacion.setEvaluado(evaluado);

        EditText puntosText= (EditText)findViewById(R.id.puntos);
        nuevaCalificacion.setPuntos(puntosText.getInputType());

        EditText motivoText=(EditText) findViewById(R.id.detalle);
        nuevaCalificacion.setDetalle(motivoText.getText().toString());

        enviarCalificacion(nuevaCalificacion);
    }

    private void enviarCalificacion(Calificacion calificacion){
        new IServiceFactory().getServiceFactoryFor(CalificacionService.class).getCalificacion(calificacion,new Callback<Response>() {

            @Override
            public void success(Response respuesta, Response response) {
                Toast.makeText(getBaseContext(),"La calificacion fue agregada",Toast.LENGTH_SHORT);

            }

            @Override
            public void failure(RetrofitError error) {
                Toast.makeText(getBaseContext(),error.getMessage(),Toast.LENGTH_SHORT);
            }
        });
    }

    private PuntuableBasico devolverEvaluado(String nombreEvaluado){
        PuntuableBasico evaluado=null;
        for(int i=0;i<this.evaluados.size();i++){
            if(nombreEvaluado.equals(this.evaluados.get(i).getNombre())){
                    evaluado=this.evaluados.get(i);
            }
        }

        return evaluado;
    }
}
