package grupo_5.unq.edu.ar.rankit_mobile;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.app.ActionBar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import grupo_5.unq.edu.ar.rankit_mobile.service.CalificacionService;
import model.Calificacion;
import model.PuntuableBasico;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

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
        calificacionSeleccionada.setEvaluado(new PuntuableBasico());
        calificacionSeleccionada.getEvaluado().setNombre(parametros.getString(NOMBRE));


    }

    private CalificacionService createCalificacionService() {
        //MMM código repetido, habría que modificar esto no?
        String SERVER_IP = "10.0.2.2"; //esta ip se usa para comunicarse con mi localhost en el emulador de Android Studio
        String SERVER_IP_GENY = "192.168.0.67";//esta ip se usa para comunicarse con mi localhost en el emulador de Genymotion
        String API_URL = "http://"+ SERVER_IP_GENY +":9001";

        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build();
        CalificacionService calificacionService = restAdapter.create(CalificacionService.class);
        return calificacionService;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_libro_detail, container, false);
        String puntos = this.calificacionSeleccionada.getPuntos().toString();
        ((TextView) rootView.findViewById(R.id.puntosDeLaCalifSeleccionada)).setText(puntos);
        ((TextView) rootView.findViewById(R.id.motivoDeLaCalifSeleccionada)).setText(this.calificacionSeleccionada.getDetalle());
        ((TextView) rootView.findViewById(R.id.nombreCalificacionSeleccionada)).setText(this.calificacionSeleccionada.getEvaluado().getNombre());
        return rootView;
    }
}
