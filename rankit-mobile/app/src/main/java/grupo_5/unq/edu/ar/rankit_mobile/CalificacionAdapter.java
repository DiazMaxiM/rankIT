package grupo_5.unq.edu.ar.rankit_mobile;

import java.util.List;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import model.Calificacion;

/**
 * Created by Yo on 10/11/2016.
 */

public class CalificacionAdapter extends AbstractListAdapter<Calificacion> {

    public CalificacionAdapter(Context context, List<Calificacion> calificaciones) {
        super(context, calificaciones);
    }
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        Calificacion calificacion = (Calificacion) getItem(position);
        View row = generateRow(R.layout.calificacion_row, parent);
        TextView nombreCalificado=(TextView) convertView.findViewById(R.id.nombreCalificado);
        return row;
    }
}