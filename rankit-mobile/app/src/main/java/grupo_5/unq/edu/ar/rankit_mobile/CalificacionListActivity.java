package grupo_5.unq.edu.ar.rankit_mobile;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v4.app.FragmentActivity;
import android.view.Menu;
import android.view.View;

import model.Calificacion;


/**
 * An activity representing a list of Libros. This activity
 * has different presentations for handset and tablet-size devices. On
 * handsets, the activity presents a list of items, which when touched,
 * lead to a {@link CalificacionDetailActivity} representing
 * item details. On tablets, the activity presents the list of items and
 * item details side-by-side using two vertical panes.
 * <p/>
 * The activity makes heavy use of fragments. The list of items is a
 * {@link CalificacionListFragment} and the item details
 * (if present) is a {@link CalificacionDetailFragment}.
 * <p/>
 * This activity also implements the required
 * {@link CalificacionListFragment.Callbacks} interface
 * to listen for item selections.
 */
public class CalificacionListActivity extends FragmentActivity
        implements CalificacionListFragment.Callbacks {

    /**
     * Whether or not the activity is in two-pane mode, i.e. running on a tablet
     * device.
     */
    private boolean mTwoPane;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_libro_list);
        this.crearNuevaCalificacion();

        if (findViewById(R.id.calificacion_detail_container) != null) {
            // The detail container view will be present only in the
            // large-screen layouts (res/values-large and
            // res/values-sw600dp). If this view is present, then the
            // activity should be in two-pane mode.
            mTwoPane = true;

            // In two-pane mode, list items should be given the
            // 'activated' state when touched.
            ((CalificacionListFragment) getSupportFragmentManager()
                    .findFragmentById(R.id.libro_list))
                    .setActivateOnItemClick(true);
        }

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu){
        getMenuInflater().inflate(R.menu.menu_opciones,menu);
        return  true;
    }

    /**
     * Callback method from {@link CalificacionListFragment.Callbacks}
     * indicating that the item with the given ID was selected.
     */
    @Override
    public void onItemSelected(Calificacion id) {
        if (mTwoPane) {
            // In two-pane mode, show the detail view in this activity by
            // adding or replacing the detail fragment using a
            // fragment transaction.
            Bundle arguments = new Bundle();
            CalificacionDetailFragment fragment = new CalificacionDetailFragment();
            fragment.setArguments(arguments);
            arguments.putString(CalificacionDetailFragment.MOTIVO, id.getDetalle());
            arguments.putInt(CalificacionDetailFragment.PUNTOS, id.getPuntos());
            arguments.putInt(CalificacionDetailFragment.ID, id.getId());
            arguments.putString(CalificacionDetailFragment.NOMBRE, id.getEvaluado().getNombre());
            getSupportFragmentManager().beginTransaction()
                    .replace(R.id.calificacion_detail_container, fragment)
                    .commit();

        } else {
            // In single-pane mode, simply start the detail activity
            // for the selected item ID.
            Intent detailIntent = new Intent(this, CalificacionDetailActivity.class);
            detailIntent.putExtra(CalificacionDetailFragment.NOMBRE, id.getEvaluado().getNombre());
            detailIntent.putExtra(CalificacionDetailFragment.ID, id.getId());
            detailIntent.putExtra(CalificacionDetailFragment.PUNTOS, id.getPuntos());
            detailIntent.putExtra(CalificacionDetailFragment.MOTIVO, id.getDetalle());
            startActivity(detailIntent);
        }
    }

    public void crearNuevaCalificacion(){
        FloatingActionButton botonCrearCalificacion=(FloatingActionButton) findViewById(R.id.ccc);
        botonCrearCalificacion.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
               nuevaCalificacion();
            }
        });

    }

    public void nuevaCalificacion(){
        Intent intent=new Intent(this,CrearCalificacionActivity.class);
        startActivity(intent);
    }
}
