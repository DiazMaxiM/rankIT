package grupo_5.unq.edu.ar.rankit_mobile;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.List;

import model.Calificacion;

/**
 * Created by estefaniamiguel on 17/6/15. Enjoy!
 */
public class CalificacionAdapter extends AbstractListAdapter<Calificacion> {

    public CalificacionAdapter(Context context, List<Calificacion> calificaciones) {
        super(context, calificaciones);
    }
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        Calificacion libro = (Calificacion) getItem(position);
        View row = generateRow(R.layout.calificacion_row, parent);
        setColumnTextView(row, R.id.nombreCalificado, libro.getEvaluado().getNombre());

        return row;
    }
}
