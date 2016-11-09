package grupo_5.unq.edu.ar.rankit_mobile;


import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

import java.util.ArrayList;

import calificaciones.Calificacion;
import calificaciones.CalificacionesAdapter;
import calificaciones.PuntuableBasico;


/**
 * A simple {@link Fragment} subclass.
 */
public class RVCalificacionesFragment extends Fragment {
    ArrayList<Calificacion> calificaciones;
    private RecyclerView listaCalificaciones;

    public RVCalificacionesFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View v=inflater.inflate(R.layout.fragment_rvcalificaciones, container, false);
        listaCalificaciones=(RecyclerView) v.findViewById(R.id.rvCalificaciones);
        LinearLayoutManager llm=new LinearLayoutManager(getActivity());
        llm.setOrientation(LinearLayout.VERTICAL);
        listaCalificaciones.setLayoutManager(llm);
        inicializaListaDeCalificaciones();
        inicializarAdaptador();
        // Inflate the layout for this fragment
        return v;
    }

    public void inicializaListaDeCalificaciones(){
        calificaciones=new ArrayList<Calificacion>();
        calificaciones.add(new Calificacion(new PuntuableBasico("Freddo","LUGAR"),"5","helado feo"));
        calificaciones.add(new Calificacion(new PuntuableBasico("Abasto","LUGAR"),"5","caro"));
        calificaciones.add(new Calificacion(new PuntuableBasico("Speddy","LUGAR"),"0","una mierda"));
        calificaciones.add(new Calificacion(new PuntuableBasico("Metrogas","LUGAR"),"1","malo"));
    }

    public void inicializarAdaptador(){
        CalificacionesAdapter adaptador=new CalificacionesAdapter(calificaciones,getActivity());
        listaCalificaciones.setAdapter(adaptador);
    }

}
