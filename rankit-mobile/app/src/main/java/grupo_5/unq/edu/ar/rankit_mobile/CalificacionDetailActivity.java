package grupo_5.unq.edu.ar.rankit_mobile;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.NavUtils;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.support.v4.app.DialogFragment;
import grupo_5.unq.edu.ar.rankit_mobile.service.CalificacionService;
import model.IServiceFactory;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

/**
 * An activity representing a single Libro detail screen. This
 * activity is only used on handset devices. On tablet-size devices,
 * item details are presented side-by-side with a list of items
 * in a {@link CalificacionListActivity}.
 * <p/>
 * This activity is mostly just a 'shell' activity containing nothing
 * more than a {@link CalificacionDetailFragment}.
 */
public class CalificacionDetailActivity extends AppCompatActivity {

    Integer idUsuario;
    CalificacionDetailFragment fragment;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calificacion_detail);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        Bundle parametros= getIntent().getExtras();
        if (null != parametros){
            idUsuario=parametros.getInt(CalificacionDetailFragment.IDUSUARIO);
        }


        if (savedInstanceState == null) {
            // Create the detail fragment and add it to the activity
            // using a fragment transaction.
            Bundle arguments = new Bundle();
            arguments.putString(CalificacionDetailFragment.ID,
                    getIntent().getStringExtra(CalificacionDetailFragment.ID));
             fragment = new CalificacionDetailFragment();
            fragment.setArguments(arguments);
            getSupportFragmentManager().beginTransaction()
                    .add(R.id.calificacion_detail_container, fragment)
                    .commit();
        }
    }

    @Override
    public boolean onSupportNavigateUp(){
        irALaPantallaCalificacionesDelUsuario();
        return false;
    }

    private void irALaPantallaCalificacionesDelUsuario() {
        Intent intent = new Intent(this, CalificacionListActivity.class);
        intent.putExtra(CalificacionDetailFragment.IDUSUARIO,this.idUsuario);
        startActivity(intent);
    }



    @Override
    public boolean onCreateOptionsMenu(Menu menu){
        getMenuInflater().inflate(R.menu.menu_opciones,menu);
        return  true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case R.id.home:
                //NavUtils.navigateUpTo(this, new Intent(this, CalificacionListActivity.class));
                break;
            case R.id.editarCalificacion:
                this.editarCalificacionSeleccionada();
                break;
            case R.id.eliminarCalificacion:
                this.ConfirmacionEliminar();
                break;

        }
       /* int id = item.getItemId();
        if (id == android.R.id.home) {
            // This ID represents the Home or Up button. In the case of this
            // activity, the Up button is shown. Use NavUtils to allow users
            // to navigate up one level in the application structure. For
            // more details, see the Navigation pattern on Android Design:
            //
            // http://developer.android.com/design/patterns/navigation.html#up-vs-back
            //
            NavUtils.navigateUpTo(this, new Intent(this, CalificacionListActivity.class));
            return true;
        }
        */
        return super.onOptionsItemSelected(item);
    }

    private void ConfirmacionEliminar() {
            DialogFragment newFragment = new ConfirmacionEliminarCalificacion();
            newFragment.show(getSupportFragmentManager(), "missiles");

    }


    public void editarCalificacionSeleccionada(){


        Intent detailIntent = new Intent(this, EditarCalificacionActivity.class);
        detailIntent.putExtra(CalificacionDetailFragment.IDUSUARIO,idUsuario);
        detailIntent.putExtra(CalificacionDetailFragment.NOMBRE, fragment.calificacionSeleccionada.getEvaluado().getNombre());
        detailIntent.putExtra(CalificacionDetailFragment.ID, fragment.calificacionSeleccionada.getId());
        detailIntent.putExtra(CalificacionDetailFragment.PUNTOS, fragment.calificacionSeleccionada.getPuntos());
        detailIntent.putExtra(CalificacionDetailFragment.MOTIVO, fragment.calificacionSeleccionada.getDetalle());
        startActivity(detailIntent);
    }
    public void eliminarCalificacionActual(){
       new IServiceFactory().getServiceFactoryFor(CalificacionService.class).deleteCalificacion(fragment.calificacionSeleccionada.getId(), new Callback<Response>() {
            @Override
            public void success(Response response, Response response2) {
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
