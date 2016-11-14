package grupo_5.unq.edu.ar.rankit_mobile;

import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;


/**
 * A simple {@link android.app.Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link ConfirmacionEliminarCalificacion.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link ConfirmacionEliminarCalificacion#newInstance} factory method to
 * create an instance of this fragment.
 */
public class ConfirmacionEliminarCalificacion extends DialogFragment {

    private DialogFragment miDialog= this;

    private OnFragmentInteractionListener mListener;

    public ConfirmacionEliminarCalificacion() {
        // Required empty public constructor
    }

    public static ConfirmacionEliminarCalificacion newInstance(String param1, String param2) {
        ConfirmacionEliminarCalificacion fragment = new ConfirmacionEliminarCalificacion();
        Bundle args = new Bundle();
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment

        return inflater.inflate(R.layout.activity_eliminar_calificacion, container, false);
    }

    @Override
    public void onResume() {
        super.onResume();

        ((Button) getView().findViewById(R.id.cancelarEliminacionDialog)).setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
               getDialog().dismiss();

            }
        });
        ((Button) getView().findViewById(R.id.aceptarEliminacionDialog)).setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {

                CalificacionDetailActivity miActivity= (CalificacionDetailActivity) getActivity();
                 miActivity.eliminarCalificacionActual();
            }
        });
    }
    // TODO: Rename method, update argument and hook method into UI event
    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
            mListener.onFragmentInteraction(uri);
        }
    }



    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    public interface OnFragmentInteractionListener {
        void onFragmentInteraction(Uri uri);
    }
}
