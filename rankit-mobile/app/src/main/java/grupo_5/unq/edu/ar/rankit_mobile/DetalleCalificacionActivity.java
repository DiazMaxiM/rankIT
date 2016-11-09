package grupo_5.unq.edu.ar.rankit_mobile;

import android.content.Intent;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class DetalleCalificacionActivity extends AppCompatActivity {

        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_detalle_calificacion);
            ActionBar actionBar=getSupportActionBar();
            actionBar.setDisplayHomeAsUpEnabled(true);
            Bundle parametros=getIntent().getExtras();
            String nombre=parametros.getString(getResources().getString(R.string.pnombre));
            String puntos=parametros.getString(getResources().getString(R.string.ppuntos));
            String motivo=parametros.getString(getResources().getString(R.string.pdetalle));
            TextView tvNombreCalificado=(TextView) findViewById(R.id.tvNombreCalificado);
            TextView tvPuntaje=(TextView) findViewById(R.id.tvPuntaje);
            TextView tvdetalle=(TextView) findViewById(R.id.tvDetalle);

            tvNombreCalificado.setText(nombre);
            tvPuntaje.setText(puntos);
            tvdetalle.setText(motivo);


        }

        public void editarCalificacion(View view){
            Intent intent=new Intent(this,EditarCalificacionActivity.class);
            startActivity(intent);
        }

    }
