package grupo_5.unq.edu.ar.rankit_mobile;

import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.widget.TextView;

public class EditarCalificacionActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_editar_calificacion);
        Toolbar miActionBar=(Toolbar) findViewById(R.id.miActionBar);
        setSupportActionBar(miActionBar);
        ActionBar actionBar=getSupportActionBar();
        actionBar.setDisplayHomeAsUpEnabled(true);
        Bundle parametros=getIntent().getExtras();
        String puntos=parametros.getString("puntos");
        String motivo=parametros.getString("motivo");
        TextView puntosAEditar=(TextView) findViewById(R.id.puntosAEditar);
        TextView detalleAEditar=(TextView) findViewById(R.id.detalleAEditar);
        puntosAEditar.setText(puntos);
        detalleAEditar.setText(motivo);
    }
}
