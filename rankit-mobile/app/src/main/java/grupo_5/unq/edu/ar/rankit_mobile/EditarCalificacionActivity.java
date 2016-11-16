package grupo_5.unq.edu.ar.rankit_mobile;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import grupo_5.unq.edu.ar.rankit_mobile.service.CalificacionService;
import model.Calificacion;
import model.IServiceFactory;
import model.PuntuablesBasico;
import model.UserException;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class EditarCalificacionActivity extends AppCompatActivity {
    String puntos;
    String detalle;
    PuntuablesBasico evaluado;
    int idUsuario;
    int ID;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_editar_calificacion);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        Bundle parametros= getIntent().getExtras();
        String puntos=parametros.getString(CalificacionDetailFragment.PUNTOS);
        String motivo=parametros.getString(CalificacionDetailFragment.MOTIVO);
        this.ID =parametros.getInt(CalificacionDetailFragment.ID);
        this.idUsuario=parametros.getInt(CalificacionDetailFragment.IDUSUARIO);
        TextView puntosAEditar=(TextView) findViewById(R.id.puntosAEditar);
        TextView detalleAEditar=(TextView) findViewById(R.id.detalleAEditar);
        puntosAEditar.setText(puntos);
        detalleAEditar.setText(motivo);
    }
    public  void guardarCalificacionModificada(View view){
        Calificacion calificacionEditada = new Calificacion();

        TextView puntosAEditar=(TextView) findViewById(R.id.puntosAEditar);
        TextView detalleAEditar=(TextView) findViewById(R.id.detalleAEditar);


        Bundle parametros=getIntent().getExtras();
        calificacionEditada.setId(parametros.getInt(CalificacionDetailFragment.ID));
        this.puntos =  puntosAEditar.getText().toString();

        calificacionEditada.setPuntos(this.puntos);
        this.detalle=detalleAEditar.getText().toString();
        calificacionEditada.setDetalle(this.detalle);
        this.evaluado = new PuntuablesBasico();
        this.evaluado.setNombre(parametros.getString(CalificacionDetailFragment.NOMBRE));
        calificacionEditada.setEvaluado(this.evaluado);

        new IServiceFactory().getServiceFactoryFor(CalificacionService.class).updateCalificacion(calificacionEditada,new Callback<Response>() {
            @Override
            public void success(Response calificaciones, Response response) {
                //volverALaPantallaDetalleCalificacion();
                irALaPantallaCalificacionesDelUsuario();
            }

            @Override
            public void failure(RetrofitError error) {
                Toast.makeText(getBaseContext(),new UserException().obtenerError(error), Toast.LENGTH_SHORT).show();

            }
        });
    }

    @Override
    public boolean onSupportNavigateUp(){
        // irALaPantallaCalificacionesDelUsuario();
        finish();
        return false;
    }

    private void irALaPantallaCalificacionesDelUsuario() {
        Intent intent = new Intent(this, CalificacionListActivity.class);
        intent.putExtra(CalificacionDetailFragment.IDUSUARIO,idUsuario);
        startActivity(intent);
    }

    public void volverALaPantallaDetalleCalificacion(){
        Intent intent = new Intent(this, CalificacionDetailActivity.class);
        intent.putExtra(CalificacionDetailFragment.NOMBRE,this.evaluado.getNombre());
        intent.putExtra(CalificacionDetailFragment.MOTIVO,this.detalle);
        intent.putExtra(CalificacionDetailFragment.PUNTOS,this.puntos);
        intent.putExtra(CalificacionDetailFragment.ID,this.ID);


        startActivity(intent);
    }
}
