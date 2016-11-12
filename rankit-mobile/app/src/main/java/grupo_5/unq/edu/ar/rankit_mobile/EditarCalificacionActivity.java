package grupo_5.unq.edu.ar.rankit_mobile;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class EditarCalificacionActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_editar_calificacion);;
        Bundle parametros=getIntent().getExtras();
        Integer puntos=parametros.getInt(CalificacionDetailFragment.PUNTOS);
        String motivo=parametros.getString(CalificacionDetailFragment.MOTIVO);
        TextView puntosAEditar=(TextView) findViewById(R.id.puntosAEditar);
        TextView detalleAEditar=(TextView) findViewById(R.id.detalleAEditar);
        puntosAEditar.setText(puntos.toString());
        detalleAEditar.setText(motivo);
    }
}
