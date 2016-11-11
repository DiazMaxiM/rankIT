package grupo_5.unq.edu.ar.rankit_mobile;

import android.content.Intent;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.View;

import model.Calificacion;

public class CalificacionListActivity extends FragmentActivity implements CalificacionListFragment.Callbacks {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calificacion_list);
        Toolbar miActionBar=(Toolbar) findViewById(R.id.miActionBar);
    }


    public void nuevaCalificacion(View view){
        Intent intent=new Intent(this,CrearCalificacionActivity.class);
        startActivity(intent);
    }

    /**
     * Callback method from {@link CalificacionListFragment.Callbacks}
     * indicating that the item with the given ID was selected.
     */
    @Override
    public void onItemSelected(Calificacion calificacion) {

             Intent intent = new Intent(this,DetalleCalificacionActivity.class);
             intent.putExtra("nombre",calificacion.getEvaluado().getNombre());
             intent.putExtra("puntos",calificacion.getPuntos());
             intent.putExtra("motivo",calificacion.getDetalle());
             startActivity(intent);
        }





}
