package grupo_5.unq.edu.ar.rankit_mobile;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import model.Calificacion;
import model.PuntuablesBasico;

/**
 * A fragment representing a single Libro detail screen.
 * This fragment is either contained in a {@link CalificacionListActivity}
 * in two-pane mode (on tablets) or a {@link CalificacionDetailActivity}
 * on handsets.
 */
public class CalificacionDetailFragment extends Fragment {
    /**
     * The fragment argument representing the item ID that this fragment
     * represents.
     */
    public Calificacion calificacionSeleccionada;
    public static final String ID = "id";
    public static final String PUNTOS = "puntos";
    public static final String MOTIVO = "motivo";
    public static final String NOMBRE = "nombre";

    /**
     * Mandatory empty constructor for the fragment manager to instantiate the
     * fragment (e.g. upon screen orientation changes).
     */
    public CalificacionDetailFragment() {
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Bundle parametros=this.getActivity().getIntent().getExtras();

        calificacionSeleccionada = new Calificacion();
        calificacionSeleccionada.setId(parametros.getInt(ID));
        calificacionSeleccionada.setDetalle(parametros.getString(MOTIVO));
        calificacionSeleccionada.setPuntos(parametros.getInt(PUNTOS));
        calificacionSeleccionada.setEvaluado(new PuntuablesBasico());
        calificacionSeleccionada.getEvaluado().setNombre(parametros.getString(NOMBRE));


    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_calificacion_detail, container, false);
        String puntos = this.calificacionSeleccionada.getPuntos().toString();
        ((TextView) rootView.findViewById(R.id.puntosDeLaCalifSeleccionada)).setText(puntos);
        ((TextView) rootView.findViewById(R.id.motivoDeLaCalifSeleccionada)).setText(this.calificacionSeleccionada.getDetalle());
        ((TextView) rootView.findViewById(R.id.nombreCalificacionSeleccionada)).setText(this.calificacionSeleccionada.getEvaluado().getNombre());
        return rootView;
    }
}
