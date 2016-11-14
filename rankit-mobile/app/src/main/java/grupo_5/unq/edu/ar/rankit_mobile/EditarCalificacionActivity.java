package grupo_5.unq.edu.ar.rankit_mobile;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import grupo_5.unq.edu.ar.rankit_mobile.service.CalificacionService;
import model.Calificacion;
import model.IServiceFactory;
import model.PuntuablesBasico;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class EditarCalificacionActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_editar_calificacion);;
        Bundle parametros= getIntent().getExtras();
        Integer puntos=parametros.getInt(CalificacionDetailFragment.PUNTOS);
        String motivo=parametros.getString(CalificacionDetailFragment.MOTIVO);
        TextView puntosAEditar=(TextView) findViewById(R.id.puntosAEditar);
        TextView detalleAEditar=(TextView) findViewById(R.id.detalleAEditar);
        puntosAEditar.setText(puntos.toString());
        detalleAEditar.setText(motivo);
    }
    public  void guardarCalificacionModificada(View view){
        Calificacion calificacionEditada = new Calificacion();

        TextView puntosAEditar=(TextView) findViewById(R.id.puntosAEditar);
        TextView detalleAEditar=(TextView) findViewById(R.id.detalleAEditar);


        Bundle parametros=getIntent().getExtras();
        calificacionEditada.setId(parametros.getInt(CalificacionDetailFragment.ID));
        String puntos =  puntosAEditar.getText().toString();

        calificacionEditada.setPuntos(new Integer(puntos));
        calificacionEditada.setDetalle(detalleAEditar.getText().toString());
        PuntuablesBasico evaluado = new PuntuablesBasico();
        evaluado.setNombre(parametros.getString(CalificacionDetailFragment.NOMBRE));
        calificacionEditada.setEvaluado(evaluado);

        new IServiceFactory().getServiceFactoryFor(CalificacionService.class).updateCalificacion(calificacionEditada,new Callback<Response>() {
            @Override
            public void success(Response calificaciones, Response response) {
                finish();
            }

            @Override
            public void failure(RetrofitError error) {
                Log.e("", error.getMessage());
                error.printStackTrace();
            }
        });
    }

}
