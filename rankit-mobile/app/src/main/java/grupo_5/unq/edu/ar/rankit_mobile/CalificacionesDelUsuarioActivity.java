package grupo_5.unq.edu.ar.rankit_mobile;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.View;

public class CalificacionesDelUsuarioActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calificaciones_del_usuario);
        Toolbar miActionBar=(Toolbar) findViewById(R.id.miActionBar);
        setSupportActionBar(miActionBar);
    }
    public void nuevaCalificacion(View view){
        Intent intent=new Intent(this,CrearCalificacionActivity.class);
        startActivity(intent);
    }
}
