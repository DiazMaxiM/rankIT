package grupo_5.unq.edu.ar.rankit_mobile;

import android.content.Context;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;

import java.util.ArrayList;

public class CrearCalificacionActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_crear_calificacion);
        AutoCompleteTextView nombreEvaluados=(AutoCompleteTextView) findViewById(R.id.nombresAEvaluar);
        nombreEvaluados.setAdapter(this.getNombreEvaluados(this));
    }

    private ArrayAdapter<String>getNombreEvaluados(Context context) {
        ArrayList<String> nombreEvaluados=new ArrayList<>();
        nombreEvaluados.add("Metrogas");
        nombreEvaluados.add("Freddo");
       return new ArrayAdapter<String>(context,android.R.layout.simple_dropdown_item_1line,nombreEvaluados);
    }
}
