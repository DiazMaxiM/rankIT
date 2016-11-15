package grupo_5.unq.edu.ar.rankit_mobile;

import android.content.Intent;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.TextView;

public class DetalleCalificacionActivity extends AppCompatActivity {
    String nombre;
    String puntos;
    String motivo;

        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_detalle_calificacion);
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            Bundle parametros=getIntent().getExtras();
             nombre=parametros.getString("nombre");
             puntos=parametros.getString("puntos");
             motivo=parametros.getString("motivo");
            TextView tvNombreCalificado=(TextView) findViewById(R.id.tvNombreCalificado);
            TextView tvPuntaje=(TextView) findViewById(R.id.tvPuntaje);
            TextView tvdetalle=(TextView) findViewById(R.id.tvDetalle);

            tvNombreCalificado.setText(nombre);
            tvPuntaje.setText(puntos);
            tvdetalle.setText(motivo);


        }

        public void editarCalificacion(View view){
            Intent intent=new Intent(this,EditarCalificacionActivity.class);
            intent.putExtra("puntos",puntos);
            intent.putExtra("motivo",motivo);
            startActivity(intent);
        }

    }
